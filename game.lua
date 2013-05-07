local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require "widget"

local point
local textPoint
local function onButtonAddPointRelease()  
  point = point + 1
  textPoint.text = point
  return true
end

local function onButtonResultRelease()  
  local options =
  {
    effect = "fade",
    time = 500,
    params =
    {
      point=point
    }
  }
  storyboard.gotoScene( "result", options )
  return true
end


function scene:createScene( event )
  local group = self.view  
  point = 0
  local buttonAddPoint = widget.newButton{
    label = "連打",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonAddPointRelease
  }
  buttonAddPoint.x = display.contentCenterX
  buttonAddPoint.y = 400
  local buttonResult = widget.newButton{
    label = "結果画面",
    font = "HelveticaNeue-Bold",
    fontSize = 16,
    onRelease = onButtonResultRelease
  }
  buttonResult.x = display.contentCenterX
  buttonResult.y = display.contentCenterY
  
  textPoint = display.newText(point,display.contentCenterX,300)
  group:insert( buttonAddPoint )
  group:insert( buttonResult )
  group:insert( textPoint )
end


scene:addEventListener( "createScene", scene )

return scene
