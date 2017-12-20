local physics = require("physics")
local widget = require("widget")
local c = require("Comida")
local s = require("Snake")

local palco = display.newRect(display.contentCenterX, display.contentCenterY-42, 320, 410)
palco:setFillColor(0.32, 0.62, 0,38)

physics.start()
physics.setDrawMode("hybrid")
physics.setGravity(0, 0)

local dir

local snake = s:criar()

local cabeca = snake.cabeca
--cabeca.name = "cabeca"

for i = 1, 20 do
snake:comer()
c:criar()
end

--local corpo = {}

function play()

	if(dir == 'up') then
		cabeca.y = cabeca.y - 12		
	elseif(dir == 'left') then
		cabeca.x = cabeca.x - 12		
	elseif(dir == 'down') then
		cabeca.y = cabeca.y + 12		
	elseif(dir == 'right') then
		cabeca.x = cabeca.x + 12		
	end

	if cabeca.x <= 0 then
		cabeca.x = 310
	elseif cabeca.x >= 310 then
		cabeca.x = 0	
	end	

	if cabeca.y <= 0 then
		cabeca.y = 400
	elseif cabeca.y >= 400 then
		cabeca.y = 0	
	end	

	local ultimoX = cabeca.x
	local ultimoY = cabeca.y
	
	local xPos = {}
	local yPos = {}
	
	for i = 1, #snake.corpo do
				
		xPos[i] = snake.corpo[i].x
		yPos[i] = snake.corpo[i].y
		
		if(snake.corpo[i-1] == nil) then
			snake.corpo[i].x = ultimoX
			snake.corpo[i].y = ultimoY
		else
			snake.corpo[i].x = xPos[i-1]
			snake.corpo[i].y = yPos[i-1]
		end
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

