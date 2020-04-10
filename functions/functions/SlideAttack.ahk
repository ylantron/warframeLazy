FunctionsTab.classes.Push(SlideAttack)

class SlideAttack {
    static className := "Slide Attack"
    static enabled := 0
    static key := "e"
    static values = ["Normal", "Automatic"]

    include() {
        this.label := FunctionsTab.controls.slideAttackLabel
        this.button := FunctionsTab.controls.slideAttackButton
        this.valueLabel := FunctionsTab.controls.slideAttackValueLabel

        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "tutorial")
        guiControl, % Gui.hwnd ":+g", % this.label.getHwnd(), % function

        function := ObjBindMethod(this, "setState", "toggle")
        guiControl, % Gui.hwnd ":+g", % this.button.getHwnd(), % function

        function := ObjBindMethod(this, "refreshValueLabel")
        guiControl, % Gui.hwnd ":+g", % this.slider.getHwnd() , % function
    }

    tutorial() {
        new Message("The ""Slide Attack"" Function will enable the use of automatic slide attacks all with a button`nYou'll become a spinning wheel of death, eh?")
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
    }

    doAction() {
        Send, % "{Lctrl down}{" WarframeValues.keys.meleeAttack "}{lctrl up}"
        sleep, 100
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