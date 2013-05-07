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
