#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
CoordMode, tooltip, screen

fileCreateDir, % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\"
fileInstall, resources\Icon128.png, % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\icon.png", 1
fileInstall, resources\Ylantron60.png, % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\Ylantron.png", 1
fileInstall, resources\changelog.txt, % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\changelog.txt", 1
fileInstall, resources\randomPhrases.dat, % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\randomPhrases.dat", 1

#include %A_ScriptDir%/functions/Object.ahk
#include %A_ScriptDir%/functions/Control.ahk
#include %A_ScriptDir%/functions/Timer.ahk
#include %A_ScriptDir%/values/MacroValues.ahk
#include %A_ScriptDir%/values/WarframeValues.ahk
#include %A_ScriptDir%/gui/Gui.ahk

WarframeValues.parseConfigFile()
Gui.createGui()
Gui.refreshValueLabels()
Gui.enableHotkey()

if (Control.getControlText(SettingsTab.controls.showWelcomeCheckbox)) {
    Welcome.createGui()
    Welcome.showGui()
}

^+!f12::
    fileDelete, % Ini.path
    ExitApp
return