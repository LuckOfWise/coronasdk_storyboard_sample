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

local function onButtonOtherRelease()  
  system.openURL("https://play.google.com/store/apps/developer?id=KICKHOST")
  return true
end

local function onButtonStartRelease()  
  storyboard.gotoScene( "game", "fade", 500 )
  return true
end


function scene:createScene( event )
  local group = self.view  
  
  local buttonOther = widget.newButton{
    label = "その他のアプリ",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonOtherRelease
  }
  buttonOther.x = display.contentCenterX
  buttonOther.y = 100
  
  local buttonStart = widget.newButton{
    label = "スタート",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonStartRelease
  }
  buttonStart.x = display.contentCenterX
  buttonStart.y = display.contentCenterY
  
  group:insert( buttonOther )
  group:insert( buttonStart )
end


scene:addEventListener( "createScene", scene )

return scene
