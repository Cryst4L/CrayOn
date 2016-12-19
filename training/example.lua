require 'crayon'
require 'image'
require 'faces'

-- Ensure repeatability
torch.manualSeed(1248) --9001

-- Load the datasets
local faces = Faces()
local train_set, test_set = faces:getData()

-- Make a ConvNet
local example = CrayOn(8, 9)
example:addStage(  1,  8,  9, .2, 'ReLU',  1)
example:addStage(  8, 16,  9, .2, 'ReLU',  1)
example:addStage( 16, 32,  7, .0, 'TanH',  0)
example:addOut(32, 1)

-- Train it threw MB-SGD
local train_cfg = {	
    learningRate = 1e-3,
    nbEpoch 	 = 50,
	l1Penality	 = 0,
	l2Penality	 = 1e-4,
	momentum	 = 0.8,
}

-- Train via MB-SGD
local timer = torch.Timer()
print('# Training starts here ...')
log = io.open('log.txt', "w+")

for ep=1,train_cfg.nbEpoch do 

	-- Perform an epoch of Back-Prop
	log:write('\n# Epoch ' .. ep .. ' : ' .. timer:time().real .. 'sec')
	example:train(train_set, train_cfg)
	
	-- Evaluate train error
	log:write('\n# Train Error : ')
	local train_score = example:score(train_set)
	for i=1,train_score:nElement() do
		log:write('[ ' .. string.format('%6.3f', 100*(1-train_score[i])) .. ' ] ')
	end

	-- Evaluate test error
	log:write('\n# Test Error  : ')
	local test_score = example:score(test_set)
	for i=1,test_score:nElement() do
		log:write('[ ' .. string.format('%6.3f', 100*(1-test_score[i])) .. ' ] ')
	end
	log:write('\n#')
	log:flush()
	
	-- Display pre-processed kernels
	local kernels,_=example:getBakedParameters()
	handle_1 = image.display{
		image=kernels, win=handle_1, 
		legend='weights', zoom=4, padding=1, nrow=32
	}

	-- Fool around !
	local heat_map = example:infer('data/qhsc.png')
	handle_2 = image.display{
		image=heat_map, win=handle_2, 
		legend='inference', zoom=6
	}

end

print('# Training completed !')

-- Compile the µ-program
example:compile('data/p_example.coe')

-- Save the convnet parameters
example:saveBakedParameters('data/k_example.coe')
;
-- Save the Model
example:saveNet('data/example.net')

os.execute('pause')
