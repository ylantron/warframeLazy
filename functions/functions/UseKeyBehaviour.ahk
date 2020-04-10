FunctionsTab.classes.Push(UseKeyBehaviour)

class UseKeyBehaviour {
    static className := "Use Key Behaviour"
    static enabled := 0
    static key := "x"
    static values = ["Spammed", "Store in Operator", "Auto Cipher"]

    include() {
        this.label := FunctionsTab.controls.useKeyBehaviourLabel
        this.button := FunctionsTab.controls.useKeyBehaviourButton
        this.slider := FunctionsTab.controls.useKeyBehaviourSlider
        this.valueLabel := FunctionsTab.controls.useKeyBehaviourValueLabel

        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "tutorial")
        guiControl, % Gui.hwnd ":+g", % this.label.getHwnd(), % function

        function := ObjBindMethod(this, "setState", "toggle")
        guiControl, % Gui.hwnd ":+g", % this.button.getHwnd(), % function

        function := ObjBindMethod(this, "refreshValueLabel")
        guiControl, % Gui.hwnd ":+g", % this.slider.getHwnd(), % function
    }

    tutorial() {
        new Message("The ""Use Key Behaviour"" Function enables the use of some special functions.`nFor istance the automatic use of a Cipher when starting an hack")
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
        switch this.slider.getContent() {
            case 1:     
                while getKeyState(this.key, "p") {
                    Send % "{Blind}{" WarframeValues.keys.use "}"
                    sleep, 50
                }
            case 2:
				send % "{blind}{" WarframeValues.keys.use "}"
                send % "{blind}{" WarframeValues.keys.abilities[5] "}"

            case 3:
                Send % "{Blind}{" WarframeValues.keys.use "}"
                sleep, 120
                Send % "{Blind}{y}"
                sleep, 80
                Send % "{Blind}{esc}"

            default:
                msgbox % "Action not yet programmed"
        }
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