local physics = require("physics")
local comida = require("Comida")



local Snake = {cabeca, corpo = {}}

function Snake:criar()
	self.cabeca = display.newRect(50, 50, 12, 12)
	self.cabeca.type = "cabeca"
	self.cabeca.collision = Snake.mordida
	self.cabeca:addEventListener("collision", self.cabeca)
	physics.addBody(self.cabeca, "dynamic")
	return self
end

function Snake:comer()
	table.insert(self.corpo, display.newRect(-20, -20, 12, 12))
end

function Snake:tamanho()
	tamanho = 0
	for i = 1, #self.corpo do
		tamanho = tamanho + 1
	end
	return tamanho
end	

function Snake.mordida(self, event)
	local began = event.phase == "began"
	
	if began then
		Snake:comer()
		print(Snake:tamanho())		
	end



end



return Snake