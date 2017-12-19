local physics = require("physics")

local Comida = {comida}

function Comida:criar(x, y)
	self.comida = display.newRect(x, y, 17, 17)
	physics.addBody(self.comida)
	return self
end

return Comida