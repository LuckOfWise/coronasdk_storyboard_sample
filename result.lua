local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require "widget"

local function onButtonMenuRelease()  
  storyboard.gotoScene( "menu", "fade", 500 )
  return true
end

local function onButtonAgainRelease()  
  storyboard.gotoScene( "game", "fade", 500 )
  return true
end


function scene:createScene( event )
  local group = self.view  
  local params = event.params
  local buttonMenu = widget.newButton{
    label = "メニューへ",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonMenuRelease
  }
  buttonMenu.x = display.contentCenterX
  buttonMenu.y = display.contentCenterY
  
  local buttonAgain = widget.newButton{
    label = "もう１度遊ぶ",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonAgainRelease
  }
  buttonAgain.x = display.contentCenterX
  buttonAgain.y = 100
  
  local textPoint = display.newText(params.point,display.contentCenterX,300, "Helvetica", 20 )
  
  group:insert( buttonMenu )
  group:insert( buttonAgain )
  group:insert( textPoint )
end


scene:addEventListener( "createScene", scene )

return scene
