--[[
	Utility class for loading a parsed view of the original 'Caltech Faces' 
	dataset. While the initial dataset proposed infos about the positioning of 
	the faces inside full pictures, this view is organized into 52 by 52 patches 
	three class: male, female and non-human entries. 
]]

require 'torch'

local field_size = 52
local data_path = 'caltech_faces/'

local Faces = torch.class('Faces')

function Faces:__init(train_size, test_size)
	local train_size = train_size or 16e3
	local test_size  = test_size  or 4e3
	print( '# Building the faces dataset ...' )
   	self.trainset = self:buildData(train_size, 0)
	self.testset  = self:buildData(test_size, train_size)
end

function Faces:loadSample(index, folder)
	local path = data_path .. folder .. string.format('/%04d.png', index)
	local sample = image.load(path, 1, 'double') * 2 - 1
	return sample
end

function Faces:buildData(size, offset)
	-- declare the chunk
	local chunk = {}
	chunk.data  = torch.Tensor(size, 1, field_size, field_size)
	chunk.label = torch.Tensor(size, 1) -- torch.Tensor(size, 3) 							-- HERE
	-- load the human faces
	for i=1,(0.25*size) do
		chunk.data[i][1] = self:loadSample(i + 0.25*offset, 'face') 
		chunk.label[i] = torch.Tensor({1}) --(i%2==0) and torch.Tensor({1,0,0}) or torch.Tensor({0,1,0}) -- HERE
		--chunk.label[i] = 								
	end
	-- load the negative patches
	local d = (0.25*size)
	for i=1,(0.125*size) do
		chunk.data[d+i][1] = self:loadSample(i + 0.125*offset, 'non-face')
		chunk.label[d+i] = torch.Tensor({0}) --torch.Tensor({0,0,1})						-- HERE
	end
	-- enrich the data by transposing the negative patches
	d = (0.125*size)
	for i=1+(0.25*size),1+(0.25*size)+d do
		chunk.data[d+i] = chunk.data[i]:transpose(2,3):clone()
		chunk.label[d+i] = chunk.label[i]
	end
	-- enrich the whole data with it's horizontal symmetry
	d = 0.5*size
	for i=1,(0.5 * size) do
		chunk.data[d+i] = self:hflip(chunk.data[i]):clone()
		chunk.label[d+i] = chunk.label[i]
	end
	-- shuffle the data (Fisher-Yates)
	for i = size,2,-1 do
		local j = torch.random(1, i)
		local data, label = chunk.data[i]:clone(), chunk.label[i]:clone()
		chunk.data[i], chunk.label[i] = chunk.data[j], chunk.label[j]
		chunk.data[j], chunk.label[j] = data, label
	end
	-- normalize the indexing
	setmetatable(chunk, 
		{__index = function(t, i) 
			return {t.data[i], t.label[i]} 
		end})
	function chunk:size() 
		return size 
	end
	return chunk
end

function Faces:hflip(instance)
	local result = torch.Tensor(instance:size())
	for i=1,instance:size(3) do
		result[{{}, {}, i}] = instance[{{}, {}, instance:size(3)-i+1}]:clone()
	end
	return result
end

function Faces:getData()
	return self.trainset, self.testset
end

