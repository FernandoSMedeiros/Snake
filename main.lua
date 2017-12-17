local widget = require("widget")
local physics = require("physics")

physics.start()

physics.setDrawMode( "hybrid" )

local dir

local cabeca = display.newRect(100, 100, 17, 17)
cabeca.name = "cabeca"
physics.addBody(cabeca, "dynamic")
physics.setGravity( 0, 0 )

local grupo = display.newGroup()

local comidaX = 200
local comidaY = 120

local corpo = {display.newRect(100, 100, 17, 17)}

local comida = display.newRect(comidaX, comidaY, 17, 17)

physics.addBody(comida, "static")

function comeu(event)
	if event.phase == "began" then
		timer.performWithDelay(1, comida:removeSelf( ), 1)
		table.insert(corpo, display.newRect(comidaX, comidaY, 17, 17))
		comida = display.newRect(50, 250, 17, 17)
		physics.addBody(comida, "static")
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
cabeca:addEventListener("collision", comeu )
--display.newRect(display.contentCenterX, display.contentCenterY + 230, 400, 110)

