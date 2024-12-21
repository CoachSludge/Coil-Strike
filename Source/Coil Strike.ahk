Run, lib\lib.ahk

; Load the background image and match the resolution to the window
Gui, Add, Picture, x0 y0 w489 h360 BackgroundTrans, img\back.jpg

; Use a better font (Arial) for the standalone title
Gui, Font, S12 CWhite Bold, Arial
Gui, Add, Text, x10 y10 w469 h30 +Center BackgroundTrans, Coil Strike

; Use a smaller font for the main interface
Gui, Font, S8 CBlack Bold, Arial
Gui, Add, Tab, x2 y50 w485 h300, Keybinds

; Adjusted group boxes for closer spacing
Gui, Add, GroupBox, x10 y70 w85 h40, M4A4
Gui, Add, GroupBox, x100 y70 w85 h40, M4A1
Gui, Add, GroupBox, x190 y70 w85 h40, AK
Gui, Add, GroupBox, x280 y70 w85 h40, Famas
Gui, Add, GroupBox, x370 y70 w85 h40, Galil
Gui, Add, GroupBox, x10 y120 w85 h40, AUG
Gui, Add, GroupBox, x100 y120 w85 h40, SG
Gui, Add, GroupBox, x190 y120 w85 h40, UMP
Gui, Add, GroupBox, x280 y120 w85 h40, Off
Gui, Add, GroupBox, x370 y120 w85 h40, ZoomSens
Gui, Add, GroupBox, x10 y170 w85 h40 CRed, Sens
Gui, Add, GroupBox, x100 y170 w85 h40, Hold Zoom

; Hotkeys
Gui, Add, Hotkey, x20 y85 w70 h20 vM4A4,
Gui, Add, Hotkey, x110 y85 w70 h20 vM4A1,
Gui, Add, Hotkey, x200 y85 w70 h20 vAK,
Gui, Add, Hotkey, x290 y85 w70 h20 vFamas,
Gui, Add, Hotkey, x380 y85 w70 h20 vGalil,
Gui, Add, Hotkey, x20 y135 w70 h20 vAUG,
Gui, Add, Hotkey, x110 y135 w70 h20 vSG,
Gui, Add, Hotkey, x200 y135 w70 h20 vUMP,
Gui, Add, Hotkey, x290 y135 w70 h20 vOff,
Gui, Add, Hotkey, x380 y135 w70 h20 vZoomSens,
Gui, Add, Hotkey, x110 y185 w70 h20 vHoldZoom, ; Hold Zoom hotkey added

; Edit fields for sensitivity
Gui, Add, Edit, x20 y185 w70 h20 vSenss

; Bottom standalone text
Gui, Font, S10 CWhite Bold, Arial
Gui, Add, Text, x10 y230 w469 h20 +Center BackgroundTrans, Important: Set your game sensitivity and change recoil keys
Gui, Font, S10 CWhite Bold, Arial
Gui, Add, Text, x10 y300 w469 h20 +Center BackgroundTrans, The libary wont close on its own. Manually close after use.

; Save button
Gui, Font, S8 CBlue Bold, Arial
Gui, Add, Button, x190 y250 w110 h20 gGenerateConfig, Save

; Load settings from the config file
IniFile := "config\config.ini"
GuiControl,, Senss, % GetIniValue(IniFile, "Settings", "Sens")
GuiControl,, ZoomSenss, % GetIniValue(IniFile, "Settings", "ZoomSens")
GuiControl,, M4A4, % GetIniValue(IniFile, "KeyBinds", "M4A4")
GuiControl,, AUG, % GetIniValue(IniFile, "KeyBinds", "AUG")
GuiControl,, SG, % GetIniValue(IniFile, "KeyBinds", "SG")
GuiControl,, Galil, % GetIniValue(IniFile, "KeyBinds", "Galil")
GuiControl,, M4A1, % GetIniValue(IniFile, "KeyBinds", "M4A1")
GuiControl,, AK, % GetIniValue(IniFile, "KeyBinds", "AK")
GuiControl,, UMP, % GetIniValue(IniFile, "KeyBinds", "UMP")
GuiControl,, Zoom, % GetIniValue(IniFile, "KeyBinds", "Zoom")
GuiControl,, Famas, % GetIniValue(IniFile, "KeyBinds", "Famas")
GuiControl,, Off, % GetIniValue(IniFile, "KeyBinds", "Off")
GuiControl,, HoldZoom, % GetIniValue(IniFile, "KeyBinds", "HoldZoom") ; Added Hold Zoom hotkey setting

Gui, Show, x599 y260 h340 w489, Coil Strike
Return

GenerateConfig:
Gui, Submit, NoHide
IniFile := "config\config.ini"
FileDelete, %IniFile%

FileAppend, [Settings]`nSens=%Senss%`nZoomSens=%ZoomSenss%`n, %IniFile%
FileAppend, [KeyBinds]`nM4A4=%M4A4%`nAUG=%AUG%`nSG=%SG%`nGalil=%Galil%`nM4A1=%M4A1%`nAK=%AK%`nUMP=%UMP%`nZoom=%Zoom%`nFamas=%Famas%`nOff=%Off%`nHoldZoom=%HoldZoom%`n, %IniFile% ; Hold Zoom saved

MsgBox, Settings have been saved!
Return

GetIniValue(file, section, key) {
    IniRead, value, %file%, %section%, %key%
    return value
}

GuiClose:
ExitApp
