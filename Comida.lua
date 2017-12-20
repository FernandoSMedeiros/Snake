local physics = require("physics")

local Comida = {}

function Comida:criar()
	local x = math.random(310 - 3 + 1) + 3
	local y = math.random(386 - 3 + 1) + 3
	local comida = display.newRect(x, y, 12, 12)
	comida.type = "comida"
	comida.collision = Comida.ingerida
	comida:addEventListener("collision", comida)
	physics.addBody(comida)
	return self
end

function Comida.ingerida(self, event)
	local began = event.phase == "began"	
	if began then		
		print("BATEU")
	end
end



return Comida