class FireMode {
    static className := "Fire Mode"
    static enabled := 0
    static key := "LButton"
    static values = ["Auto", "Burst 3", "Semi-auto"]

    include() {
        this.button := FunctionsTab.controls.fireModeButton
        this.slider := FunctionsTab.controls.fireModeSlider
        this.valueLabel := FunctionsTab.controls.fireModeValueLabel

        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "setState", "toggle")
        guiControl, % Gui.hwnd ":+g", % this.button, % function

        function := ObjBindMethod(this, "refreshValueLabel")
        guiControl, % Gui.hwnd ":+g", % this.slider, % function
    }

    setState(state := "toggle") {
        switch state {
            case "on", case 1:      this.enabled := 1
            case "off", case 0:     this.enabled := 0
            case "toggle":          this.enabled := !this.enabled

            default:
                this.enabled := 0  
        }
        iniWrite, % this.enabled, % Ini.path, % this.className, % "enabled"

        guiControl, text, % this.button, % (this.enabled ? "On" : "Off")
        Gui, Font, % (this.enabled ? " cDefault " : " cGray ")
        GuiControl, Font, % this.valueLabel

        this.refreshValueLabel()
        this.setAction()
    }

    refreshValueLabel() {
        guiControl, text, % this.valueLabel, % this.values[Control.getContent(this.slider)]
        iniWrite, % Control.getContent(this.slider), % Ini.path, % this.className, % "value"
    }

    setAction() {
        function := ObjBindMethod(this, "doAction")

        if (this.enabled = 0) {
            this.disableHotkeys()
        } else {
            this.enableHotkeys()
        }

        iniWrite, % this.key, % Ini.path, % this.className, % "key"
    }

    disableHotkeys() {
        function := ObjBindMethod(this, "doAction")

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" this.key, % function, off
        
        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" this.key, % function, off

        function := ""
    }

    enableHotkeys() {
        function := ObjBindMethod(this, "doAction")

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" this.key, % function, on

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" this.key, % function, on

        function := ""
    }

    doAction() {
        switch Control.getContent(this.slider) {
            case 1:
                while getKeyState(this.key, "p") {
                    Send % "{Blind}{" WarframeValues.keys.fireWeapon "}"
                    sleep, 50
                }
            case 2:
                while getKeyState(this.key, "p") {
                    Send % "{Blind}{" WarframeValues.keys.fireWeapon "}"
                    sleep, 50
                    Send % "{Blind}{" WarframeValues.keys.fireWeapon "}"
                    sleep, 50
                    Send % "{Blind}{" WarframeValues.keys.fireWeapon "}"
                    sleep, 50
                    keyWait, % this.key
                }
            case 3:
                while getKeyState(this.key, "p") {
                    Send % "{Blind}{" WarframeValues.keys.fireWeapon "}"
                    sleep, 50
                    keyWait, % this.key
                }

            default:
                msgbox % "Action not yet programmed"
        }
    }

    loadSettings() {
        this.enabled := Ini.readIni(this.className, "enabled")
        
        valLoaded := Ini.readIni(this.className, "value")
        guiControl, text, % this.slider, % (valLoaded < 1 OR valLoaded > this.values.Length() ? 1 : valLoaded)

        valLoaded := Ini.readIni(this.className, "key")
        this.key := (Settings.checkKeyValidity(valLoaded) = 1 ? valLoaded : this.key)

        this.setState(this.enabled)
    }
}