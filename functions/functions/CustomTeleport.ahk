FunctionsTab.classes.Push(CustomTeleport)

class CustomTeleport {
    static className := "Custom Teleport"
    static enabled := 0
    static key := "5"
    static values = ["Disabled", "Enabled"]

    include() {
        this.label := FunctionsTab.controls.customTeleportLabel
        this.button := FunctionsTab.controls.customTeleportButton
        this.valueLabel := FunctionsTab.controls.customTeleportValueLabel

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
        new Message("The ""Custom Teleport"" Function uses an exploit based on the last secure position.`nPlace the operator where you want to teleport, then from anywhere, jump in the air and press the key to teleport to the saved location`n`nWARNING:`n- you can't use the operator if you plan to use this function (use of operator will delete the saved position)`n- after teleporting you have to wait the cooldown for the /unstuck command`n- make sure nothing is wrote in the chat before using the function`n- this function may not work if ping is high (or operator spawns take a lot of time)")
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
        sleepVal := 100

        Send, % "{Blind}{" WarframeValues.keys.abilities[5] "}"
        sleep, % sleepVal

        send, % "{" WarframeValues.keys.chat "}"
        sleep, % sleepVal
        
        send, % "/unstuck"
        sleep, 600

        send, % "{enter}"
        sleep, % sleepVal

        Send, % "{Blind}{" WarframeValues.keys.abilities[5] "}"
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