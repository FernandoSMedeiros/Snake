local physics = require("physics")

local Comida = {comida}

function Comida:criar()
	local x = math.random(310 - 3 + 1) + 3
	local y = math.random(386 - 3 + 1) + 3
	comida = display.newRect(x, y, 12, 12)
	physics.addBody(comida)
	return self
end

return Comida