class AutomaticAbilities {
    static delay := 50 ; used for slowing down automatic function
    static maxDelay := 9999
    static timeMax := 999000
    static className := "Automatic Abilities"
    timers := []

    include() {
        loop, % AutomaticAbilitiesTab.modeControls.Length() { ; create timers
            this.timers[A_Index] := new Timer(1000, this, "sendKey", A_Index)
        }

        this.bindFunctions()
    }

    bindFunctions() {
        loop, % AutomaticAbilitiesTab.modeControls.Length() { ; for every ability (5)
            function := ObjBindMethod(this, "setState", A_Index)
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.modeControls[A_Index], % function

            function := ObjBindMethod(this, "switchTime", A_Index)
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.timeControls[A_Index].timeDropDownList, % function

            function := ObjBindMethod(this, "setAction", A_Index)
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.repeatControls[A_Index].repeatTextbox, % function
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.timeControls[A_Index].timeTextbox, % function
        }


        function := ""
    }

    setState(ability) {
        switch Control.getContent(AutomaticAbilitiesTab.modeControls[ability]) { ; mode selection
            case 1: ; 1 disabled
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.automaticControls[ability]), AutomaticAbilitiesTab.automaticControls[ability], "off")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.repeatControls[ability]), AutomaticAbilitiesTab.repeatControls[ability], "off")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.timeControls[ability]), AutomaticAbilitiesTab.timeControls[ability], "off")

            case 2: ; automatic
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.automaticControls[ability]), AutomaticAbilitiesTab.automaticControls[ability], "on")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.repeatControls[ability]), AutomaticAbilitiesTab.repeatControls[ability], "off")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.timeControls[ability]), AutomaticAbilitiesTab.timeControls[ability], "off")
            
            case 3: ; 3 repeated
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.automaticControls[ability]), AutomaticAbilitiesTab.automaticControls[ability], "off")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.repeatControls[ability]), AutomaticAbilitiesTab.repeatControls[ability], "on")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.timeControls[ability]), AutomaticAbilitiesTab.timeControls[ability], "off")

            case 4, case 5: ; 4 timed, 5 delayed
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.automaticControls[ability]), AutomaticAbilitiesTab.automaticControls[ability], "off")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.repeatControls[ability]), AutomaticAbilitiesTab.repeatControls[ability], "off")
                Control.setVisibilities(Object.getLength(AutomaticAbilitiesTab.timeControls[ability]), AutomaticAbilitiesTab.timeControls[ability], "on")
        }

        ; - - - - - - - - - - -
        ; INI SAVE

        switch ability {
            case 1: iniKey := "first"
            case 2: iniKey := "second"
            case 3: iniKey := "third"
            case 4: iniKey := "fourth"
            case 5: iniKey := "operator"
        }
        ;new Message(Control.getContent(AutomaticAbilitiesTab.modeControls[ability]) "`n" Ini.path "`n" this.className "`n" iniKey "AbilityMode")
        iniWrite, % Control.getContent(AutomaticAbilitiesTab.modeControls[ability]), % Ini.path, % this.className, % iniKey "AbilityMode"
        iniWrite, % Control.getContent(AutomaticAbilitiesTab.automaticControls[ability].automaticUpDown), % Ini.path, % this.className, % iniKey "AbilityAutomaticDelay"
        iniWrite, % Control.getContent(AutomaticAbilitiesTab.repeatControls[ability].repeatUpDown), % Ini.path, % this.className, % iniKey "AbilityRepeatCount"
        iniWrite, % Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeDropDownList), % Ini.path, % this.className, % iniKey "AbilityTimeMode"
        iniWrite, % Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown), % Ini.path, % this.className, % iniKey "AbilityTime"

        ; - - - - - - - - - - -

        this.setAction(ability)
    }

    switchTime(ability) {
        switch Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeDropDownList) {
            case 1: ; milliseconds (first expand range and limit, then change value)
                guiControl, % "+range1-" this.timeMax, % AutomaticAbilitiesTab.timeControls[ability].timeUpDown
                guiControl, +limit6, % AutomaticAbilitiesTab.timeControls[ability].timeTextbox

                guiControl, text, % AutomaticAbilitiesTab.timeControls[ability].timeUpDown, % Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown) * 1000

            case 2: ; seconds (first change value, then reduce range and limit)
                guiControl, text, % AutomaticAbilitiesTab.timeControls[ability].timeUpDown, % Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown) / 1000

                guiControl, % "+range1-" this.timeMax/1000, % AutomaticAbilitiesTab.timeControls[ability].timeUpDown
                guiControl, +limit3, % AutomaticAbilitiesTab.timeControls[ability].timeTextbox
        }

        this.setState(ability)
    }

    setAction(ability) {
        function := ObjBindMethod(this, "doAction", ability)

        ;remove current hotkey
        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" WarframeValues.keys.abilities[ability], % function, off

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" WarframeValues.keys.abilities[ability], % function, off

        ; stop timer
        this.timers[ability].stop()

        if (Control.getContent(AutomaticAbilitiesTab.modeControls[ability]) = 1) { ; if disabled
            return
        }

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" WarframeValues.keys.abilities[ability], % function, on

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" WarframeValues.keys.abilities[ability], % function, on

        function := ""
    }

    doAction(ability) {
        switch Control.getContent(AutomaticAbilitiesTab.modeControls[ability]) {
            case 2: ; automatic
                while (GetKeyState(WarframeValues.keys.abilities[ability], "P")) {
                    this.sendKey(ability)
                    sleep % Control.getContent(AutomaticAbilitiesTab.automaticControls[ability].automaticUpDown)
                }

            case 3: ; repeated
                loop, % Control.getContent(AutomaticAbilitiesTab.repeatControls[ability].repeatUpDown) {
                    this.sendKey(ability)
                }

            case 4: ; timed
                if (!this.timers[ability].isActive()) {
                    this.timers[ability].changeTime(Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeDropDownList) = 1 ? Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown) : Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown) * 1000)
                    this.sendKey(ability)
                }

                this.timers[ability].toggle()

            case 5: ; delayed
                new Timer((Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeDropDownList) = 1 ? Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown) : Control.getContent(AutomaticAbilitiesTab.timeControls[ability].timeUpDown) * 1000) * -1, this, "sendKey", ability, 1)

             default:
                msgbox % "Error! Function not programmed in automatic abilities"
        }
    }

    sendKey(ability) {
        if (winActive("ahk_exe Warframe.x64.exe") or winActive("ahk_exe Warframe.exe"))
            Send, % "{Blind}{" WarframeValues.keys.abilities[ability] "}"
    }

    loadSettings() {
        loop, % AutomaticAbilitiesTab.modeControls.Length() { ; for every ability (5)
            switch A_Index {
                case 1: iniKey := "first"
                case 2: iniKey := "second"
                case 3: iniKey := "third"
                case 4: iniKey := "fourth"
                case 5: iniKey := "operator"
            }

            valLoaded := Ini.readIni(this.className, iniKey "AbilityMode")
            if (valLoaded < 1 OR valLoaded > 5) {
                iniWrite, % "1", % Ini.path, % this.className, % iniKey "AbilityMode"
                valLoaded := 1
            }
            guiControl, choose, % AutomaticAbilitiesTab.modeControls[A_Index], % valLoaded

            
            valLoaded := Ini.readIni(this.className, iniKey "AbilityAutomaticDelay")
            if (valLoaded < 1 OR valLoaded > 9999) {
                iniWrite, % "50", % Ini.path, % this.className, % iniKey "AbilityAutomaticDelay"
                valLoaded := 50
            }
            guiControl, text, % AutomaticAbilitiesTab.automaticControls[A_Index].automaticUpDown, % valLoaded


            valLoaded := Ini.readIni(this.className, iniKey "AbilityRepeatCount")
            if (valLoaded < 1 OR valLoaded > 99) {
                iniWrite, % "2", % Ini.path, % this.className, % iniKey "AbilityRepeatCount"
                valLoaded := 2
            }
            guiControl, text, % AutomaticAbilitiesTab.repeatControls[A_Index].repeatUpDown, % valLoaded


            timeModeLoaded := Ini.readIni(this.className, iniKey "AbilityTimeMode")
            if (timeModeLoaded < 1 OR timeModeLoaded > 2) {
                iniWrite, % "1", % Ini.path, % this.className, % iniKey "AbilityTimeMode"
                timeModeLoaded := 1
            }
            

            timeLoaded := Ini.readIni(this.className, iniKey "AbilityTime")
            timeLoaded := (timeLoaded = "ERROR" ? "1000" : timeLoaded)
            if (timeLoaded < 1 OR timeLoaded > (timeModeLoaded = 1 ? 999000 : 999)) {
                iniWrite, % (timeModeLoaded = 1 ? "1000" : "1"), % Ini.path, % this.className, % iniKey "AbilityTime"
                timeLoaded := (timeModeLoaded = 1 ? "1000" : "1")
            }

            guiControl, choose, % AutomaticAbilitiesTab.timeControls[A_Index].timeDropDownList, % timeModeLoaded
            this.switchTime(A_Index)
            guiControl, text, % AutomaticAbilitiesTab.timeControls[A_Index].timeUpDown, % timeLoaded

            this.setState(A_Index)
        }
    }
}