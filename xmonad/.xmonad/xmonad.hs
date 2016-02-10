import XMonad
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Config.Gnome
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

-- import XMonad.Layout.Fullscreen
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import qualified XMonad.StackSet as W
import XMonad.Layout.NoBorders
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.ThreeColumns
import XMonad.Actions.CycleWS

import XMonad.Prompt
import XMonad.Prompt.Shell

import XMonad.Hooks.SetWMName

import XMonad.Layout.Gaps

import XMonad.Hooks.EwmhDesktops

myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#93c91d"

myManageHook :: [ManageHook]
myManageHook =
    [ resource  =? "Do"   --> doIgnore
    , className =? "MPlayer" --> doFloat
    , className =? "Gimp" --> doFloat
    , className =? "Skype" --> doShift "9"
    , isFullscreen --> doFullFloat
    , isDialog --> doCenterFloat
    , manageDocks
    ]

myLayout = gaps [(U, 24)] $ avoidStruts $ windowNavigation $ subTabbed (tiled ||| threeCol ||| Full)
    where
      tiled = ResizableTall nmaster delta ratio []
      threeCol = ThreeCol nmaster delta ratio
      nmaster = 1
      ratio = 50/100
      delta = 3/100

curLayout :: X String
curLayout = gets windowset >>= return . description . W.layout . W.workspace . W.current

myConfig = gnomeConfig
     { terminal             = "gnome-terminal"
     , normalBorderColor    = myNormalBorderColor
     , focusedBorderColor   = myFocusedBorderColor
     , modMask              = mod4Mask
     , workspaces           = myWorkspaces
     , borderWidth          = 2
     , handleEventHook      = handleEventHook defaultConfig <+> fullscreenEventHook
     , manageHook           = manageHook defaultConfig <+>  composeAll myManageHook
     , layoutHook           = smartBorders (myLayout)
     , focusFollowsMouse    = False
     , startupHook          = setWMName "LG3D"
     } `additionalKeysP` myKeys

promptConfig = defaultXPConfig {
             font = "xft:Ubuntu:size=10",
             position = Bottom
}

myKeys =
     [ ("M-C-b", sendMessage $ pullGroup L)
     , ("M-C-f", sendMessage $ pullGroup R)
     , ("M-C-p", sendMessage $ pullGroup U)
     , ("M-C-n", sendMessage $ pullGroup D)
     , ("M-C-m", withFocused (sendMessage . MergeAll))
     , ("M-C-u", withFocused (sendMessage . UnMerge))
     -- Cycle WS
     , ("M-<Left>",      moveTo Prev HiddenWS)
     , ("M-<Right>",     moveTo Next HiddenWS)
     , ("M-g",           moveTo Next HiddenNonEmptyWS)
     , ("M-S-<Right>",   shiftToNext >> nextWS)
     , ("M-S-<Left>",    shiftToPrev >> prevWS)
     , ("M-z",           toggleWS)
     , ("M-f",           moveTo Next EmptyWS) -- find a free workspace
     , ("M-c",           kill) -- Close the focused window
     , ("M-<Down>",      windows W.focusDown)
     , ("M-<Up>",        windows W.focusUp)
     , ("M-S-<Down>",    windows W.swapDown)
     , ("M-S-<Up>",      windows W.swapUp)
     , ("M-n",           nextScreen)
     , ("M-u",           focusUrgent)
     , ("M-p",           shellPrompt promptConfig)
     , ("M-S-h",         sendMessage MirrorExpand)
     , ("M-S-l",         sendMessage MirrorShrink)
     ]
     ++
     [ (otherModMasks ++ "M-" ++ [key], action tag)
       | (tag, key)  <- zip myWorkspaces "67890"
       , (otherModMasks, action) <- [ ("", windows . W.view) -- was W.greedyView
                                    , ("S-", windows . W.shift)]
     ]

    ++
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "wer" [1,0,2] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]

myWorkspaces = ["6","7","8","9","0"]

main =
  do
    xmonad $ withUrgencyHook dzenUrgencyHook { args = ["-bg", "red", "-xs", "1"] }
           $ myConfig
