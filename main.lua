local physics = require("physics")
local widget = require("widget")
local c = require("Comida")
physics.start()
physics.setDrawMode("hybrid")
physics.setGravity(0, 0)

local dir

local cabeca = display.newRect(100, 100, 17, 17)
cabeca.name = "cabeca"

local corpo = {}

local comida = c:criar(100, 150)

function play()

	if(dir == 'up') then
		cabeca.y = cabeca.y - 17		
	elseif(dir == 'left') then
		cabeca.x = cabeca.x - 17		
	elseif(dir == 'down') then
		cabeca.y = cabeca.y + 17		
	elseif(dir == 'right') then
		cabeca.x = cabeca.x + 17		
	end

	local ultimoX = cabeca.x
	local ultimoY = cabeca.y
	
	local xPos = {}
	local yPos = {}
	
	for i = 1, #corpo do
				
		xPos[i] = corpo[i].x
		yPos[i] = corpo[i].y
		
		if(corpo[i-1] == nil) then
			corpo[i].x = ultimoX
			corpo[i].y = ultimoY
		else
			corpo[i].x = xPos[i-1]
			corpo[i].y = yPos[i-1]
		end
	end	

	if (cabeca.y <= 0 or cabeca.x <= 0) then 
		print("GAME-OVER")
		print(cabeca.y)
	end

end	

local move = function(event)
	if event.phase == "began" then
		dir = event.target.id
		print(dir)
	end
end

local up = widget.newButton(
    {
        shape = "roundedRect",
        width = 80,
        height = 30,
        id = "up",
        label = "UP",
        onEvent = move
    }
)

local down = widget.newButton(
    {
        shape = "roundedRect",
        width = 80,
        height = 30,
        id = "down",
        label = "DOWN",
        onEvent = move
    }
)

local left = widget.newButton(
    {
        shape = "roundedRect",
        width = 80,
        height = 30,
        id = "left",
        label = "LEFT",
        onEvent = move        
    }
)

local right = widget.newButton(
    {
        --[[left = 100,
        top = 50,--]]
        shape = "roundedRect",
        width = 80,
        height = 30,  
        id = "right",
        label = "RIGHT",
        onEvent = move
        
        
    }
)

up.y = display.contentCenterY + 200
up.x = display.contentCenterX

down.y = display.contentCenterY + 250
down.x = display.contentCenterX

left.y = display.contentCenterY + 225
left.x = display.contentCenterX - 100

right.y = display.contentCenterY + 225
right.x = display.contentCenterX + 100

local timer = timer.performWithDelay(100, play, 0)
--display.newRect(display.contentCenterX, display.contentCenterY + 230, 400, 110)

