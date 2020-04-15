class AutomaticAbilities {
    static delay := 50 ; used for slowing down automatic function
    static maxDelay := 9999
    static timeMax := 999000
    static className := "Automatic Abilities"
    static controlsName
    static timers := []

    include() {
        loop, % AutomaticAbilitiesTab.modeControls.Length() { ; create timers
            this.timers[A_Index] := new Timer(1000, this, "sendKey", A_Index)
        }

        this.controlsName := {textbox:1, updown:2, dropdownlist:3}

        this.bindFunctions()
    }

    bindFunctions() {
        loop, % AutomaticAbilitiesTab.modeControls.Length() { ; for every ability (5)
            function := ObjBindMethod(this, "setState", A_Index)
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.modeControls[A_Index].getHwnd(), % function
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.automaticControls[A_Index].getControl(this.controlsName.textbox).getHwnd(), % function
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.repeatControls[A_Index].getControl(this.controlsName.textbox).getHwnd(), % function
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.timeControls[A_Index].getControl(this.controlsName.textbox).getHwnd(), % function


            function := ObjBindMethod(this, "switchTime", A_Index)
            guiControl, % Gui.hwnd ":+g", % AutomaticAbilitiesTab.timeControls[A_Index].getControl(this.controlsName.dropdownlist).getHwnd(), % function
        }


        function := ""
    }

    setState(ability) {
        switch AutomaticAbilitiesTab.modeControls[ability].getContent() { ; mode selection
            case 1: ; 1 disabled
                AutomaticAbilitiesTab.automaticControls[ability].setVisibility("off")
                AutomaticAbilitiesTab.repeatControls[ability].setVisibility("off")
                AutomaticAbilitiesTab.timeControls[ability].setVisibility("off")

            case 2: ; automatic
                AutomaticAbilitiesTab.automaticControls[ability].setVisibility("on")
                AutomaticAbilitiesTab.repeatControls[ability].setVisibility("off")
                AutomaticAbilitiesTab.timeControls[ability].setVisibility("off")
            
            case 3: ; 3 repeated
                AutomaticAbilitiesTab.automaticControls[ability].setVisibility("off")
                AutomaticAbilitiesTab.repeatControls[ability].setVisibility("on")
                AutomaticAbilitiesTab.timeControls[ability].setVisibility("off")

            case 4, case 5: ; 4 timed, 5 delayed
                AutomaticAbilitiesTab.automaticControls[ability].setVisibility("off")
                AutomaticAbilitiesTab.repeatControls[ability].setVisibility("off")
                AutomaticAbilitiesTab.timeControls[ability].setVisibility("on")
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

        iniWrite, % AutomaticAbilitiesTab.modeControls[ability].getContent(), % Ini.path, % this.className, % iniKey "AbilityMode"
        iniWrite, % AutomaticAbilitiesTab.automaticControls[ability].getControl(this.controlsName.updown).getContent(), % Ini.path, % this.className, % iniKey "AbilityAutomaticDelay"
        iniWrite, % AutomaticAbilitiesTab.repeatControls[ability].getControl(this.controlsName.updown).getContent(), % Ini.path, % this.className, % iniKey "AbilityRepeatCount"
        iniWrite, % AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.dropdownlist).getContent(), % Ini.path, % this.className, % iniKey "AbilityTimeMode"
        iniWrite, % AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getContent(), % Ini.path, % this.className, % iniKey "AbilityTime"

        ; - - - - - - - - - - -

        this.setAction(ability)
    }

    switchTime(ability) {
        switch AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.dropdownlist).getContent() {
            case 1: ; milliseconds (first expand range and limit, then change value)
                guiControl, % "+range1-" this.timeMax, % AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getHwnd() ;AutomaticAbilitiesTab.timeControls[ability].timeUpDown
                guiControl, +limit6, % AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.textbox).getHwnd() ;AutomaticAbilitiesTab.timeControls[ability].timeTextbox

                AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).setText(AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName["updown"]).getContent() * 1000)

            case 2: ; seconds (first change value, then reduce range and limit)
                AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).setText(AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName["updown"]).getContent() / 1000)

                guiControl, % "+range1-" this.timeMax/1000, % AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getHwnd()  ;AutomaticAbilitiesTab.timeControls[ability].timeUpDown
                guiControl, +limit3, % AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.textbox).getHwnd() ;AutomaticAbilitiesTab.timeControls[ability].timeTextbox
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

        if (AutomaticAbilitiesTab.modeControls[ability].getContent() = 1) { ; if disabled
            return
        }

        hotkey, ifWinActive, ahk_exe Warframe.x64.exe
        hotkey, % "*" WarframeValues.keys.abilities[ability], % function, on

        hotkey, ifWinActive, ahk_exe Warframe.exe
        hotkey, % "*" WarframeValues.keys.abilities[ability], % function, on

        function := ""
    }

    doAction(ability) {
        switch AutomaticAbilitiesTab.modeControls[ability].getContent() {
            case 2: ; automatic
                while (GetKeyState(WarframeValues.keys.abilities[ability], "P")) {
                    this.sendKey(ability)
                    sleep % AutomaticAbilitiesTab.automaticControls[ability].getControl(this.controlsName.updown).getContent()
                }

            case 3: ; repeated
                loop, % AutomaticAbilitiesTab.repeatControls[ability].getControl(this.controlsName.updown).getContent() { ;Control.getContent(AutomaticAbilitiesTab.repeatControls[ability].repeatUpDown) {
                    this.sendKey(ability)
                }

            case 4: ; timed
                if (!this.timers[ability].isActive()) {
                    this.timers[ability].changeTime(AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.dropdownlist).getContent() = 1
                                                    ? AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getContent()
                                                    : AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getContent() * 1000)
                    
                    this.sendKey(ability)
                }

                this.timers[ability].toggle()

            case 5: ; delayed
                new Timer(  (AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.dropdownlist).getContent() = 1
                            ? AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getContent()
                            : AutomaticAbilitiesTab.timeControls[ability].getControl(this.controlsName.updown).getContent() * 1000) * -1, this, "sendKey", ability, 1)

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
            AutomaticAbilitiesTab.modeControls[A_Index].setSelectedItem(valLoaded)

            
            valLoaded := Ini.readIni(this.className, iniKey "AbilityAutomaticDelay")
            if (valLoaded < 1 OR valLoaded > 9999) {
                iniWrite, % "50", % Ini.path, % this.className, % iniKey "AbilityAutomaticDelay"
                valLoaded := 50
            }
            AutomaticAbilitiesTab.automaticControls[A_Index].getControl(this.controlsName.updown).setText(valLoaded)


            valLoaded := Ini.readIni(this.className, iniKey "AbilityRepeatCount")
            if (valLoaded < 1 OR valLoaded > 99) {
                iniWrite, % "2", % Ini.path, % this.className, % iniKey "AbilityRepeatCount"
                valLoaded := 2
            }
            AutomaticAbilitiesTab.repeatControls[A_Index].getControl(this.controlsName.updown).setText(valLoaded)


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

            AutomaticAbilitiesTab.timeControls[A_Index].getControl(this.controlsName.dropdownlist).setSelectedItem(timeModeLoaded) ;guiControl, choose, % AutomaticAbilitiesTab.timeControls[A_Index].timeDropDownList, % timeModeLoaded
            this.switchTime(A_Index)
            AutomaticAbilitiesTab.timeControls[A_Index].getControl(this.controlsName.updown).setText(timeLoaded)

            this.setState(A_Index)
        }
    }
}