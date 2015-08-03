-- ~/.xmonad/xmonad.hs
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run                  -- spawnPipe, hPutStrLn

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
 
myTerminal = "urxvt"
colorRed       = "#F00060"
colorYellow    = "#FEA63C"
colorBlue      = "#857da9"
colorGreen     = "#B7CE42"
colorGray      = "#676767"
colorWhite     = "#BDE077"
colorGrayAlt   = "#313131"
colorNormalbg  = "#303030"
colorHeadbg  = "#444444"
main = do
    myStatusBar <- spawnPipe "xmobar"
    xmonad $ ewmh defaultConfig {
          modMask         = myModMask
        , terminal = myTerminal
        , layoutHook      = myLayoutHook
        , manageHook      = myManageHook
        , logHook         = myLogHook myStatusBar
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#888888"
        , startupHook = ewmhDesktopsStartup >> setWMName "LG3D"
        , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook 
        }
myModMask = mod4Mask

myLayoutHook = avoidStruts $ layoutHook defaultConfig
myManageHook = manageDocks <+> manageHook defaultConfig

myLogHook h = dynamicLogWithPP wsPP{
  ppOutput = hPutStrLn h
}
              
wsPP = xmobarPP { ppOrder               = \(ws:l:t:_)   -> [ws,t]
  , ppCurrent             = xmobarColor   colorRed         colorNormalbg
  , ppUrgent              = xmobarColor   colorWhite       colorNormalbg
  , ppVisible             = xmobarColor   colorYellow      colorNormalbg
  , ppHidden              = xmobarColor   colorWhite       colorNormalbg
  , ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg
  , ppTitle               = xmobarColor   colorGreen       colorNormalbg
  , ppWsSep               = "-"
  -- , ppSep                 = " <fc=#303030,#BCBCBC>⮀⮁</fc><fc=#BCBCBC,#303030>⮀</fc> "
  , ppSep                 = " ⮁⮁ "
}
