class CustomTeleport {
    static className := "Custom Teleport"
    static enabled := 0
    static key := "5"
    static values = ["Disabled", "Enabled"]

    include() {
        this.button := FunctionsTab.controls.customTeleportButton
        this.valueLabel := FunctionsTab.controls.customTeleportValueLabel

        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "setState", "toggle")
        guiControl, % Gui.hwnd ":+g", % this.button.getHwnd(), % function

        function := ObjBindMethod(this, "refreshValueLabel")
        guiControl, % Gui.hwnd ":+g", % this.slider.getHwnd() , % function
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

        this.button.setText(this.enabled ? "On" : "Off")
        this.valueLabel.setTextColor(this.enabled ? " cDefault " : " cGray ")

        this.refreshValueLabel()
        this.setAction()
    }

    refreshValueLabel() {
        this.valueLabel.setText(this.values[this.enabled + 1])
    }

    setAction() {
        if (this.enabled = 0) {
            this.disableHotkeys()
        } else {
            this.enableHotkeys()
        }

        iniWrite, % this.key, % Ini.path, % this.className, % "key"
    }

    disableHotkeys() {
        function := ObjBindMethod(this, "doAction")
        normalFunction := ObjBindMethod(this, "doActionNormal")

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" this.key, % function, off
        hotkey, % "+" this.key, % normalFunction, off

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" this.key, % function, off
        hotkey, % "+" this.key, % normalFunction, off
    }

    enableHotkeys() {
        function := ObjBindMethod(this, "doAction")
        normalFunction := ObjBindMethod(this, "doActionNormal")

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" this.key, % function, on
        hotkey, % "+" this.key, % normalFunction, on

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" this.key, % function, on
        hotkey, % "+" this.key, % normalFunction, on
    }

    doAction() {
        Send, % "{Blind}{" WarframeValues.keys.abilities[5] "}"
        sleep, 100
        send, % "{" WarframeValues.keys.chat "}"
        sleep, 100
        send, % "/unstuck"
        sleep, 100
        send, % "{enter}"
    }

    doActionNormal() {
        Send, % "{Blind}{" WarframeValues.keys.abilities[5] "}"
    }

    loadSettings() {
        valLoaded := Ini.readIni(this.className, "enabled")
        if !(valLoaded = 0 OR valLoaded = 1) {
            valLoaded := 0
        }
        this.enabled := valLoaded
        
        valLoaded := Ini.readIni(this.className, "key")
        this.key := (Settings.checkKeyValidity(valLoaded) = 1 ? valLoaded : this.key)

        
        this.setState(this.enabled)
    }
}