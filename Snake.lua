local physics = require("physics")

local Snake = {cabeca, corpo = {}}

function Snake:criar()
	self.cabeca = display.newRect(50, 50, 12, 12)
	physics.addBody(self.cabeca)
	return self
end

function Snake:comer()
	table.insert(self.corpo, display.newRect(50, 50, 12, 12))
end

function Snake:tamanho()
	tamanho = 0
	for i = 1, #self.corpo do
		tamanho = tamanho + 1
	end
	return tamanho
end	

return Snake