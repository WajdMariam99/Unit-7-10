-----------------------------------------------------------------------------------------
--
-- Created By: Wajd Mariam
-- Created On: May 23rd, 2019
-----------------------------------------------------------------------------------------



display.setDefault ( "background", 53/255, 235/255, 242/255)

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) 


local theGround = display.newImage( "assets/sprites/land.png" )
theGround.x = display.contentCenterX
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

scrollSpeed = 3

display.setStatusBar(display.HiddenStatusBar)

centerX = 120
centerY = 360


local sheetOptionsIdle =

{
    width = 587,
    height = 707,
    numFrames = 10
}

local sheetIdleKnight = graphics.newImageSheet( "assets/spriteSheets/knightIdle.png", sheetOptionsIdle )

local sheetOptionsWalk =

{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetWalkingKnight = graphics.newImageSheet( "assets/spriteSheets/knightWalking.png", sheetOptionsWalk )

local sequence_data = {
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleKnight
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingKnight
    }
}

local knight = display.newSprite( sheetIdleKnight, sequence_data )
knight.x = 150
knight.y = centerY
knight.xScale = 117.4/587
knight.yScale = 141.4/707


knight:play()

local function swapSheet()
    knight:setSequence( "walk" )
    knight:play()
    print("walk")
end


local function MoveImage1 ( event )
	timer.performWithDelay( 2000, function ()
	knight.x = knight.x + scrollSpeed
	knight.y = 350

end

)

end

timer.performWithDelay( 2000, swapSheet )


display.setStatusBar(display.HiddenStatusBar)


centerX = 100
centerY = 360

local sheetOptionsIdle =
{
    width = 232,
    height = 439,
    numFrames = 10
}

local sheetIdleNinja = graphics.newImageSheet( "assets/spriteSheets/ninjaBoyIdle.png", sheetOptionsIdle )


local sheetOptionsWalk =

{

    width = 363,
    height = 458,
    numFrames = 10


}


local sheetWalkingNinja = graphics.newImageSheet( "assets/spriteSheets/ninjaBoyRun.png", sheetOptionsWalk )


local sequence_data = {
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleninja
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingNinja
    }

}

local ninja = display.newSprite( sheetIdleNinja, sequence_data )
ninja.xScale = 117.4/363
ninja.yScale = 141.4/458
ninja.x = 50
ninja.y = 350

ninja:play()


local function swapSheet()
    ninja:setSequence( "walk" )
    ninja:play()
    print("walk")

end

timer.performWithDelay( 2000, swapSheet )

local function MoveImage2 ( event )
	timer.performWithDelay( 2000, function ()
	ninja.x = ninja.x + scrollSpeed
	ninja.y = 350
end

)

end

Runtime:addEventListener("enterFrame", MoveImage1)
Runtime:addEventListener("enterFrame", MoveImage2)
