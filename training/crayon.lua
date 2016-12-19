--[[--------------------------------------------------------------------------------------
	Cray-On Torch Interface: 
	--------------------------------------------------------------------------------------
	Main utility class for the Cray-On Convolutional Network Processor. 
	It is used to constraint the possiblities of the Torch 'nn' environement to what  
	can be emulated by the hardware architecture.
	For example the only supported transfer functions are: 'Linear', 'ReLu' and 'TanH' 
	It also proposes some utility functions such as one to train the net threw MB-SGD, 
	or tools to compile the µ-program read by the co-processor and to organize the weights
	into a proper '.coe' file.
	--------------------------------------------------------------------------------------
]]

require 'torch'
require 'nn'
require 'cutorch'
require 'cunn'

local CrayOn = torch.class('CrayOn')

function CrayOn:__init(alu_width, ca_size)
	self.a_w = alu_width		-- number of vectorial units
	self.c_s = ca_size			-- size of the convolution arrays
	self.net = nn.Sequential()	-- net emulated by the architecture
	self.arch = {}				-- normalized Co-Ray network architecture
	self.use_gpu = true    		-- use (or not) the GPU for training
	self.net:evaluate()			-- set the net to evaluate mode (by default)
end

function CrayOn:useGPU(b)
	self.use_gpu = b or true
end
	
function CrayOn:addStage(m, n, w, d, f, p)
	self.net:add(nn.SpatialConvolution(m,n,w,w)) 
	-- transfer function
	local tr = {Linear = 0, ReLU = 1, TanH = 2}
	if tr[f] == 1 then self.net:add(nn.ReLU());
	elseif tr[f] == 2 then self.net:add(nn.Tanh()) 
	elseif (tr[f] == nil) then 
		error('Unsupported transfer function !') 
	end
	-- dropout and max-pooling  
	if (d ~= 0) then self.net:add(nn.SpatialDropout(d)) end 
	if (p ~= 0) then self.net:add(nn.SpatialMaxPooling(2,2,2,2)) end
	-- architecure storage
	table.insert(self.arch, {sub_size=w, drop=d, actv=tr[f], pool=p})            
end

function CrayOn:addOut(m, n)      
	self.net:add(nn.SpatialConvolution(m, n, 1, 1))
	table.insert(self.arch, {sub_size=1, drop=0, actv=0, pool=0})    
end

-- Training convenience method:
function CrayOn:train(train_set, cfg, state)

	-- Init
	local cfg = cfg or {}
	local state = state or cfg
	local criterion = nn.MSECriterion(false) 
	local rp = torch.randperm(train_set:size())
	
	-- Push everything to the GPU
	if (self.use_gpu) then 
		self.net:cuda()
		criterion:cuda()
		train_set.data = train_set.data:cuda()  
		train_set.label = train_set.label:cuda()
	end

	-- Perform a training epoch
	self.net:training()	
	for i=1,train_set:size() do

		-- init
		self.net:zeroGradParameters()
		local input = train_set.data[rp[i]]
		local target = train_set.label[rp[i]]
				
		-- forward-prop -> backward-prop
		local output = self.net:forward(input)
		local errGrad = criterion:backward(output, target)
		self.net:backward(input, errGrad)

		-- norm based regularizations
		local parameters,paramGrad = self.net:getParameters()
		if cfg.l1Penality ~= 0 then 
			paramGrad:add(torch.sign(parameters) * cfg.l1Penality)
		elseif cfg.l2Penality ~= 0 then
			paramGrad:add(parameters:clone() * cfg.l2Penality) 
		end

		-- momentum
		if not state.velocity then
			state.velocity = paramGrad:clone()--:fill(0)
		else
			state.velocity:mul(cfg.momentum)
			state.velocity:add(1-cfg.momentum, paramGrad)
		end
		-- step update of the parameters
		parameters:add(-cfg.learningRate, state.velocity)
	end 
	
	self.net:evaluate()	

	-- Recall the net into CPU
	if (self.use_gpu) then 
		self.net:double()
		criterion:double()
	end

end

function CrayOn:score(data_set)

	-- Push everything to the GPU
	if (self.use_gpu) then 
		self.net:cuda()
		data_set.data = data_set.data:cuda()  
		data_set.label = data_set.label:cuda()
	end

	local nb_class = self.net:get(#self.net).nOutputPlane
	local score_vec = torch.Tensor(nb_class):zero()
	for i=1,data_set:size() do
		local output = self.net:forward(data_set.data[i])
		for j=1,nb_class do
			local guess  = (output[j][1][1] > 0.5) and 1 or 0 
			if data_set.label[i][j] == guess then
				score_vec[j] = score_vec[j] + 1
			end
		end
	end
	
	-- Recall the net into CPU
	if (self.use_gpu) then self.net:double() end
	return score_vec/data_set:size()
end

function CrayOn:getBakedParameters()
    local layer = 1;
	local kernels = {}
	local biases  = {}
	local kernel = torch.Tensor(self.c_s, self.c_s)

    for stage = 1,#self.arch do
		local nInPlane  = self.net:get(layer).nInputPlane
		local nOutPlane = self.net:get(layer).nOutputPlane

        for p=1,nInPlane do
	        for q=1,nOutPlane do
				-- insert the kernel inside the array
				kernel:zero()
				local sub_size = self.arch[stage].sub_size
				local alias = self.net:get(layer).weight[q][p]
				local stride = self.c_s-sub_size+1
				kernel[{ {stride,self.c_s} , {stride,self.c_s} }]:add(alias)

				-- push the kernel and its bias
				table.insert(kernels, kernel:clone())
				local bias = (p==1) and self.net:get(layer).bias[q] or 0
				table.insert(biases, bias)
			end
			
			-- complete with a blank kernels up to a multiple of the ALU width
		    kernel:zero()
		    for l=1,(self.a_w - ((nOutPlane-1) % self.a_w + 1)) do
		    	table.insert(kernels, kernel:clone())
				table.insert(biases, 0)
			end
		end

		-- jump to the next Spatial Convolution layer
		layer = layer + 1 
		      + (self.arch[stage].actv ~= 0 and 1 or 0)
			  + (self.arch[stage].drop ~= 0 and 1 or 0)
			  + (self.arch[stage].pool ~= 0 and 1 or 0)
	end

	return kernels, biases
end 

function CrayOn:toHexa(num, exp)
	num = num*(2^exp) 
	return string.format("%04x", num):sub(-4)
end

function CrayOn:saveBakedParameters(path)
	local file = io.open(path, 'w+')
	io.output(file)

	io.write('memory_initialization_radix=2;\n')
	io.write('memory_initialization_vector=\n')

	local kernels, biases = self:getBakedParameters()
	for k = 1,#kernels do
	    local kernel = kernels[k]:clone();
	    io.write('; # KERNEL N°' .. k .. '\n')
 		-- this loop reverse the order ! (hardware requirements)
	    for i=self.c_s,1,-1 do
			for j=self.c_s,1,-1 do
				io.write(self:toHexa(kernel[i][j],10) .. ',') 
			end
			io.write('\n')
		end
		io.write('; # BIAS IS :\n' .. self:toHexa(biases[k],10) .. ',\n')
	end
	io.close(file)
end

function CrayOn:compile(path)
	local file = io.open(path, 'w+')
	io.output(file)
	io.write('; # Program Initialisation\n')
	io.write('memory_initialization_radix=16;\n')
	io.write('memory_initialization_vector=\n')

	local index = 0
	local payload = 7
	local layer = 1

	local function eq(a,b) return ((a==b) and 1 or 0) end

	for stage=1,#self.arch do
		io.write('; # Stage n-' .. stage .. '\n')
		local vm = self.net:get(layer).nInputPlane
		local vn = self.net:get(layer).nOutputPlane
		io.write('; # Convolve\n')
        for i=0,vm-1 do
            for j=0,(vn+self.a_w-1)/self.a_w-1 do
                io.write('1' .. eq(stage,1) .. payload)
		  		io.write(string.format('%X,', i%self.a_w))
                io.write('2' .. string.format('%03X,', index))
                io.write('3' .. 1-eq(i,0) .. math.floor(i/self.a_w))
				io.write(j .. ',\n')
                index = index + self.a_w;
            end
       	end
        if (stage ~= #self.arch) then
            io.write('; #  Activate\n')
            for j=0,(vn+self.a_w-1)/self.a_w-1 do
            	local cfg = 8*self.arch[stage].pool+self.arch[stage].actv
                io.write('4' ..  string.format('%X', cfg))
				io.write(string.format('%X0,\n', j));  --HERE!!!
			end
            if (self.arch[stage].pool == 1) then
				payload = payload - 1
			end
        end
		-- jump to the next Spatial Convolution layer
		layer = layer + 1 
				+ (self.arch[stage].actv ~= 0 and 1 or 0) 
				+ (self.arch[stage].drop ~= 0 and 1 or 0) 
				+ (self.arch[stage].pool ~= 0 and 1 or 0)
	end
	io.write('; # Store, Jump\n')
    for i=0,self.net:get(layer-1).nOutputPlane-1 do
           io.write(string.format('5%X%02X,',i,i))
    end
	io.write('\n0000;\n')
	io.close(file)
end

function CrayOn:infer(path)
	local input = image.load(path, 1, double) * 2 - 1
	if (self.use_gpu) then 
		self.net:cuda()
		input = input:cuda()
	end
	local output = self.net:forward(input)
	if (self.use_gpu) then
		self.net:double()
		output = output:double() 
	end
	return output
end 

function CrayOn:saveNet(path)
	self.net:clearState()
	torch.save(path, self.net, 'binary')
end

