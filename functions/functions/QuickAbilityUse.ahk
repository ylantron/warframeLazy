class QuickAbilityUse {
    static className := "Quick Ability Use"
    static enabled := 0
    static key := "MButton"
    static values = ["First Ability", "Second Ability", "Third Ability", "Fourth Ability", "Operator"]

    include() {
        this.button := FunctionsTab.controls.quickAbilityUseButton
        this.slider := FunctionsTab.controls.quickAbilityUseSlider
        this.valueLabel := FunctionsTab.controls.quickAbilityUseValueLabel

        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "setState", "toggle")
        guiControl, % Gui.hwnd ":+g", % this.button.getHwnd(), % function

        function := ObjBindMethod(this, "refreshValueLabel")
        guiControl, % Gui.hwnd ":+g", % this.slider.getHwnd(), % function
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
        this.valueLabel.setText(this.values[this.slider.getContent()])
        iniWrite, % this.slider.getContent(), % Ini.path, % this.className, % "value"
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
        press := ObjBindMethod(this, "doAction")
        release := ObjBindMethod(this, "doActionReleased")

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" this.key, % press, off
        hotkey, % "*" this.key " up", % release, off

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" this.key, % press, off
        hotkey, % "*" this.key " up", % release, off
    }

    enableHotkeys() {
        press := ObjBindMethod(this, "doAction")
        release := ObjBindMethod(this, "doActionReleased")

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" this.key, % press, on
        hotkey, % "*" this.key " up", % release, on

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" this.key, % press, on
        hotkey, % "*" this.key " up", % release, on
    }

    doAction() {
        Send, % "{Blind}{" WarframeValues.keys.abilities[this.slider.getContent()] " DownR}"
    }

    doActionReleased() {
        Send, % "{Blind}{" WarframeValues.keys.abilities[this.slider.getContent()] " Up}"
    }

    loadSettings() {
        valLoaded := Ini.readIni(this.className, "enabled")
        if !(valLoaded = 0 OR valLoaded = 1) {
            valLoaded := 0
        }
        this.enabled := valLoaded
        
        valLoaded := Ini.readIni(this.className, "value")
        this.slider.setText(valLoaded < 1 OR valLoaded > this.values.Length() ? 1 : valLoaded)

        valLoaded := Ini.readIni(this.className, "key")
        this.key := (Settings.checkKeyValidity(valLoaded) = 1 ? valLoaded : this.key)

        this.setState(this.enabled)
    }
}