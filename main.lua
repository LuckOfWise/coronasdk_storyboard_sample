require "CiderDebugger";-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Debug the smart way with Cider!
--start coding and press the debug button

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "storyboard" module
local storyboard = require "storyboard"
-- 以下の行を書いておくと勝手にメモり解放してくれる
storyboard.purgeOnSceneChange = true

-- load menu screen
storyboard.gotoScene( "menu" )

local adSpace
local isAndroid = "Android" == system.getInfo("platformName")

function showAd_Android(event)
  -- Is the url a remote call?
  if string.find(event.url, "android_ad.html", 1, false) or string.find(event.url, "android_ad15.html", 1, false) then
    return true
  else
    system.openURL(string.gsub (event.url, "Corona:", ""))
    -- Refresh ad
    RemoveAd(0)
    DisplayAd(0)
    return true
  end
end

local function showAd_Apple(event)
  -- Is the url a remote call?
  if string.find(event.url, "http://", 1, false) == 1 then
    -- Is it a call to the admob server?
    if string.find(event.url, "c.admob.com", 1, false) == nil then
      adSpace.url = event.url
    else
      -- an actual click on an ad, so open in Safari
      system.openURL(event.url)
      -- Refresh ad
      RemoveAd(0)
      DisplayAd(0)
    end
  else
    -- Feb 1, 2011: if using the old version of this code, remove the
    -- following line:
    -- adSpace.url = event.url
    -- and put in this line instead:
    return true
  end
end

function DisplayAd(t)
  native.cancelWebPopup()
  timer.performWithDelay(t, function()
    local adfile = "apple_ad.html"
    local sizeX = 320
    local sizeY = 48
    local scale = 1/display.contentScaleY
    
    if isAndroid then
      if scale > 1.5 then 
        adfile = "android_ad15.html"
        sizeX = sizeX*(1.5/scale) + 1
        sizeY = sizeY*(1.5/scale) + 1
      else
        adfile = "android_ad.html"
      end
      adSpace = native.showWebPopup((display.contentWidth - sizeX)/2, display.contentHeight - display.screenOriginY - sizeY, sizeX, sizeY, adfile, {baseUrl = system.ResourceDirectory, hasBackground = false, urlRequest = showAd_Android})
    elseif system.getInfo( "environment" ) == "simulator" then
      adSpace = display.newRect( (display.contentWidth - sizeX)/2, display.contentHeight - display.screenOriginY - sizeY, sizeX, sizeY )
      display.getCurrentStage():insert(adSpace, false)
    else
      if scale > 1.5 then 
        sizeX = sizeX*(1.5/scale) + 1
        sizeY = sizeY*(1.5/scale) + 1
      end
      adSpace = native.showWebPopup((display.contentWidth - sizeX)/2, display.contentHeight - display.screenOriginY - sizeY, sizeX, sizeY, adfile, {baseUrl = system.ResourceDirectory, hasBackground = false, urlRequest = showAd_Apple})
    end
  end
  )
end

function RemoveAd(t)
  timer.performWithDelay(t, native.cancelWebPopup)
  timer.performWithDelay(t, function() adSpace:removeSelf() end)
end

DisplayAd(0)