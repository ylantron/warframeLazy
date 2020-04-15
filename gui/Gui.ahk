#include %A_ScriptDir%/gui/Message.ahk
#include %A_ScriptDir%/gui/Tooltip.ahk
#include %A_ScriptDir%/gui/Welcome.ahk
#include %A_ScriptDir%/gui/StatusBar.ahk
; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#include %A_ScriptDir%/gui/FunctionsTab.ahk
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#include %A_ScriptDir%/functions/functions/SlideAttack.ahk
#include %A_ScriptDir%/functions/functions/FireMode.ahk
#include %A_ScriptDir%/functions/functions/AutomaticMelee.ahk
#include %A_ScriptDir%/functions/functions/UseKeyBehaviour.ahk
#include %A_ScriptDir%/functions/functions/QuickAbilityUse.ahk
#include %A_ScriptDir%/functions/functions/CustomTeleport.ahk
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#include %A_ScriptDir%/gui/AutomaticAbilitiesTab.ahk
#include %A_ScriptDir%/gui/AutomaticChatTab.ahk
#include %A_ScriptDir%/gui/SettingsTab.ahk
#include %A_ScriptDir%/gui/AboutTab.ahk
#include %A_ScriptDir%/functions/automaticAbilities/AutomaticAbilities.ahk
#include %A_ScriptDir%/functions/chat/AutomaticChat.ahk
#include %A_ScriptDir%/functions/settings/Settings.ahk
#include %A_ScriptDir%/functions/about/About.ahk
#include %A_ScriptDir%/functions/ini/Ini.ahk

class Gui {
    static hwnd
    static properties := {width:350, height:280}
    static key := "capslock"
    static timeTimer

    static controls = {}
    static ownedClasses := []

    createGui() {
        gui, new, % "-resize -minimizeBox -MaximizeBox hwnd" "warframeLazyHwnd", % "Warframe Lazy"
        this.hwnd := warframeLazyHwnd

        gui, % this.hwnd ":add", tab3, % " w" Gui.properties.width " h" Gui.properties.height - 16 " x0 y0 hwnd" "tabs"
        this.controls.tabs := tabs

        ;ownedClasses := [FunctionsTab, AutomaticAbilitiesTab, AutomaticChatTab, SettingsTab, AboutTab]
        loop, % this.ownedClasses.Length() {
            this.ownedClasses[A_Index].createGui()
        }

        gui, % this.hwnd ":tab"

        Gui, % this.hwnd ":add", StatusBar, % "hwnd" "statusbarControl",
        SB_SetParts(this.properties.width*.90)
        StatusBar.updateText()

        this.timeTimer := new Timer(1000, StatusBar, "updateTime", "")

        Ini.loadSettings()

        function := ObjBindMethod(StatusBar, "updateText")
        guiControl, % this.hwnd ":+g", % statusbarControl, % function

        ; handle window close
        function := ObjBindMethod(this, "onWindowClose")
        OnMessage(0x112, function)
        

        ; prevent window from moving
        ;hSysMenu:=DllCall("GetSystemMenu","Int", this.hwnd ,"Int",FALSE) 
        ;nCnt:=DllCall("GetMenuItemCount","Int",hSysMenu) 
        ;DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-6,"Uint","0x400") 
        ;DllCall("DrawMenuBar","Int", this.hwnd) 
    }

    onWindowClose(wp, lp) {
        static SC_CLOSE := 0xF060
        if (A_Gui != this.hwnd)
        Return
        
        if (wp = SC_CLOSE) {
            this.showHideGui()
        }
    }

    showHideGui() {
        showTimeInStatusBar := ObjBindMethod(StatusBar, "updateTime")

        if !(winexist("ahk_id" this.hwnd) or winactive("ahk_id" this.hwnd)) {
            WarframeValues.parseConfigFile()
            StatusBar.updateTime()
            StatusBar.updateText()
            gui, % this.hwnd ":show", % "w" this.properties.width " h" this.properties.height " x" this.getExactRightPosition() " y0"
            mouseMove, % this.properties.width / 2, % this.properties.height / 2
        } else {
            gui, % this.hwnd ":hide"

            if (winexist("ahk_exe Warframe.exe")) {
                winActivate, % "ahk_exe Warframe.exe"
            } else if (winexist("ahk_exe Warframe.x64.exe")) {
                winActivate, % "ahk_exe Warframe.x64.exe"
            }
        }

        this.timeTimer.toggle()
    }

    getExactRightPosition() {
        return A_ScreenWidth - this.properties.width - ((1/4)*(this.properties.width - 320) + 84)
    }

    refreshValueLabels() {
        loop, % FunctionsTab.classes.Length() {
            FunctionsTab.classes[A_Index].refreshValueLabel()
        }
    }

    disableHotkey() {
        showHideGui := ObjBindMethod(this, "showHideGui")
        sendKey := ObjBindMethod(this, "sendKey")

        hotkey, ifWinActive, % "ahk_exe Warframe.x64.exe" ; release show hide key to wf 64 bit
        hotkey, % this.key, % showHideGui, off
        hotkey, % this.key, % showHideGui, off
        hotkey, % "!" this.key, % sendKey, off

        hotkey, ifWinActive, % "ahk_exe Warframe.exe" ; release show hide key to wf 32 bit
        hotkey, % this.key, % showHideGui, off
        hotkey, % "!" this.key, % sendKey, off

        hotkey, ifWinActive, % "ahk_id" this.hwnd  ; release show hide key to macro itself
        hotkey, % this.key, % showHideGui, off
        hotkey, % "!" this.key, % sendKey, off
        
        hotkey, ifWinActive  ; release show hide key to everything else
        hotkey, % "+^" this.key, % showHideGui, off
    }

    enableHotkey() {
        showHideGuiObject := ObjBindMethod(this, "showHideGui")
        sendKeyObject := ObjBindMethod(this, "sendKey")

        iniWrite, % this.key, % Ini.path, % "Macro", % "key"

        hotkey, ifWinActive, % "ahk_exe Warframe.x64.exe" ; bind show hide key to wf 64 bit
        hotkey, % this.key, % showHideGuiObject, on
        hotkey, % this.key, % showHideGuiObject, on
        hotkey, % "!" this.key, % sendKeyObject, on

        hotkey, ifWinActive, % "ahk_exe Warframe.exe" ; bind show hide key to wf 32 bit
        hotkey, % this.key, % showHideGuiObject, on
        hotkey, % "!" this.key, % sendKeyObject, on

        hotkey, ifWinActive, % "ahk_id" this.hwnd  ; bind show hide key to macro itself
        hotkey, % this.key, % showHideGuiObject, on
        hotkey, % "!" this.key, % sendKeyObject, on

        hotkey, ifWinActive  ; bind show hide key to everything else
        hotkey, % "+^" this.key, % showHideGuiObject, on
    }

    sendKey(key) {
        Send, % "{" key "}"
    }

    disableAllHotkeys() {
        local classes := [this]

        loop, % FunctionsTab.classes.Length() {
            classes.Push(FunctionsTab.classes[A_Index])
        }

        loop, % classes.Length() {
            classes[A_Index].disableHotkeys()
        }
    }

    enableAllHotkeys() {
        this.enableHotkey()

        loop, % FunctionsTab.classes.Length() {
            FunctionsTab.classes[A_Index].setAction()
        }
    }

    loadSettings() {
        valLoaded := Ini.readIni("Macro", "key")
        this.key := (Settings.checkKeyValidity(valLoaded) = 1 ? valLoaded : this.key)
    }
}