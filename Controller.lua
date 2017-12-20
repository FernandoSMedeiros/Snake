local comida = require("Comida")

local Controller = {
	comida = nil
}

function Controller:criar()
	self.comida = comida:criar()
	return self
end

function Controller:novaComida()
	self.comida = comida:criar()	
end

return Controller
