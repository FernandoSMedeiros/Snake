local widget = require("widget")

local dir

local cabeca = display.newRect(100, 100, 17, 17)
local corpo = {display.newRect(50, 100, 17, 17), display.newRect(50, 100, 17, 17)}

local move = function(event)
	if event.phase == "began" then
		dir = event.target.id
		print(dir)
	end
end

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

		if cabeca.x == corpo[2].x and cabeca.y == corpo[2].y then
		print("Lascou")
		end	

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

timer.performWithDelay(100, play, 0)
