local physics = require("physics")

local Comida = {comida}

function Comida:criar()
	local x = math.random(310 - 10 + 1) + 10
	local y = math.random(400 - 30 + 1) + 30
	comida = display.newRect(x, y, 17, 17)
	physics.addBody(comida)
	return self
end

return Comida