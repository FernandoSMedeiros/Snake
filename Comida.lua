--local main = require("main")
local physics = require("physics")

local Comida = {comida}

function Comida:criar()
	local x = math.random(310 - 3 + 1) + 3
	local y = math.random(386 - 3 + 1) + 3
	self.comida = display.newRect(x, y, 12, 12)
	self.comida.type = "comida"
	self.comida.collision = Comida.ingerida
	self.comida:addEventListener("collision", comida)
	physics.addBody(self.comida)
	return self
end

function Comida.ingerida(self, event)
	local began = event.phase == "began"
	local ended = event.phase == "ended"	

	if began then		
		print("BATEU")
	elseif ended then
		--timer.performWithDelay(1, Comida.comida:removeSelf())				
	end
end

function Comida.remover()
	Comida:removeSelf()
end

return Comida