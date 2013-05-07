-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Debug the smart way with Cider!
--start coding and press the debug button

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require "widget"

local function onButtonStartRelease()  
  storyboard.gotoScene( "game", "fade", 500 )
  return true
end


function scene:createScene( event )
  local group = self.view  
  
  local buttonStart = widget.newButton{
    label = "スタート",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonStartRelease
  }
  buttonStart.x = display.contentCenterX
  buttonStart.y = display.contentCenterY
  group:insert( buttonStart )
end


scene:addEventListener( "createScene", scene )

return scene
