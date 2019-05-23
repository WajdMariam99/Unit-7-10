-----------------------------------------------------------------------------------------
--
-- Created By: Wajd Mariam
-- Created On: May 23rd, 2019
-----------------------------------------------------------------------------------------
display.setDefault  ("background", 53/255 , 240/255 , 242/255 )

local physics = require ("physics")


physics.start ()
physics.setGravity (0,25) 

local theGround = display.newImage ( "assets/sprites/land.png", 150,200)
theGround.x = display.contentCenterX
theGround.y = 450
theGround.id = "The Ground"
physics.addBody ( theGround, "static", {
    
    friction = 0.5,
    bounce = 0.3
   } )

scrollSpeed = 3

display.setStatusBar (display.HiddenStatusBar)

centerX = 160
centerY = 100

local sheetOptionsIdle = 
{
	width = 587,
	height = 707,
	numFrames = 10, 
}

local sheetIdleKnight = graphics.newImageSheet ("assets/spriteSheets/knightIdle.png", sheetOptionsIdle)


local sheetOptionsWalk = 
{
   width = 587,
   height = 707,
   numFrames = 10,
}


local sheetWalkingKnight = graphics.newImageSheet ("assets/spriteSheets/knightWalking.png", sheetOptionsWalk)


local sequence_data = {

     {
	name = "idle",
	start = 1,
	count = 10,
	time = 800,
	loopCount = 2,
	sheet = sheetIdleKnight
     
     },

     {
	name = "walk",
	start = 1, 
	count = 10, 
	time = 800,
	loopCount = 2,
	sheet = sheetWalkingKnight

     }	

}

local knight = display.newSprite (sheetIdleKnight,sequence_data)
knight.x = 10
knight.y = 325
knight.xScale = 117.4/587
knight.yScale = 141.4/707

knight:play ()

local function swapSheet( )
   knight:setSequence ("walk")
   knight:play()
   print("walk")


local function MoveImage1 ( event )
	timer.performWithDelay( 2000, function ()
	knight.x = knight.x + scrollSpeed
	knight.y = 350

end
)

end

timer.performWithDelay( 2000, swapSheet )

end






Runtime:addEventListener("enterFrame", MoveImage1)