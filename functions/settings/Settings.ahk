class Settings {
    include() {
        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "changeKeys")
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.changeKeysButton.getHwnd(), % function

        function := ObjBindMethod(this, "setCheckboxState")
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.guiAlwaysOnTopCheckbox.getHwnd(), % function
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.showWelcomeCheckbox.getHwnd(), % function
        
        function := ObjBindMethod(this, "setCheckboxState", "statusBar")
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.showEmailCheckbox.getHwnd(), % function
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.showPhraseCheckbox.getHwnd(), % function

        function := ""
    }

    changeKeys() {
        loop, % SettingsTab.keyControls.Length() {
            SettingsTab.keyControls[A_Index].setText(StrReplace(SettingsTab.keyControls[A_Index].getContent(), " ", ""))
        }

        SettingsTab.controls.changeKeysButton.setEnable("off")

        Gui.disableAllHotkeys()
        this.checkKeysValidity()
        Gui.enableAllHotkeys()

        SettingsTab.controls.changeKeysButton.setEnable("on")
    }

    checkKeysValidity() {
        classes := [Gui]
        classesName := ["Show/Hide Macro"]

        loop, % FunctionsTab.classes.Length() {
            classes.Push(FunctionsTab.classes[A_Index])
            classesName.Push(FunctionsTab.classes[A_Index].className)
        }
        
        loop, % classes.Length() {
            currentClass := A_Index

            loop {
                validity := this.checkKeyValidity(SettingsTab.keyControls[currentClass].getContent())

                if (validity != 1) {
                    new Message("Error while setting key of " classesName[currentClass] " (" SettingsTab.keyControls[currentClass].getContent() ")" "`nRestoring original key (" classes[currentClass].key ")")
                    SettingsTab.keyControls[currentClass].setText(classes[currentClass].key)
                }
            } until (validity = 1)

            hotkey, % SettingsTab.keyControls[A_Index].getContent(), % checkKeysValidity, off
            classes[A_Index].key := SettingsTab.keyControls[A_Index].getContent()
        }
    }

    checkKeyValidity(newKey) {
        validity := 1
        checkKeyValidity := ObjBindMethod(this, "checkKeyValidity")

        hotkey, % newKey, % checkKeyValidity, on, useErrorLevel

        if (errorLevel != 0) {
            validity := 0
        } else {
            hotkey, % newKey, % checkKeyValidity, off
        }

        checkKeyValidity := ""
        return validity
    }

    loadSettings() {
        classes := [Gui]

        loop, % FunctionsTab.classes.Length() {
            classes.Push(FunctionsTab.classes[A_Index])
        }

        Loop, % SettingsTab.keyControls.Length() {
            SettingsTab.keyControls[A_Index].setText(classes[A_Index].key)
        }

        ; - - - - - - - -

        valLoaded := Ini.readIni("Macro", "alwaysOnTop")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "0", % Ini.path, % "Macro", % "alwaysOnTop"
            valLoaded := 0
        }
        SettingsTab.controls.guiAlwaysOnTopCheckbox.setCheck(valLoaded)

        valLoaded := Ini.readIni("Macro", "showEmail")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "1", % Ini.path, % "Macro", % "showEmail"
            valLoaded := 1
        }
        SettingsTab.controls.showEmailCheckbox.setCheck(valLoaded)

        valLoaded := Ini.readIni("Macro", "showRandomPhrases")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "1", % Ini.path, % "Macro", % "showRandomPhrases"
            valLoaded := 1
        }
        SettingsTab.controls.showPhraseCheckbox.setCheck(valLoaded)

        valLoaded := Ini.readIni("Macro", "showWelcome")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "1", % Ini.path, % "Macro", % "showWelcome"
            valLoaded := 1
        }
        SettingsTab.controls.showWelcomeCheckbox.setCheck(valLoaded)

        this.setCheckboxState()
    }

    setCheckboxState(target := "") {
        gui, % Gui.hwnd ": " (SettingsTab.controls.guiAlwaysOnTopCheckbox.getContent() ? "+" : "-") "alwaysOnTop"

        if (!SettingsTab.controls.showEmailCheckbox.getContent()) {
            SettingsTab.controls.showPhraseCheckbox.setEnable("on")
        } else {
            SettingsTab.controls.showPhraseCheckbox.setEnable("off")
        }

        if (target = "statusBar") {
            StatusBar.updateText()
        }

        iniWrite, % SettingsTab.controls.guiAlwaysOnTopCheckbox.getContent(), % Ini.path, % "Macro", % "alwaysOnTop"
        iniWrite, % SettingsTab.controls.showEmailCheckbox.getContent(), % Ini.path, % "Macro", % "showEmail"
        iniWrite, % SettingsTab.controls.showPhraseCheckbox.getContent(), % Ini.path, % "Macro", % "showRandomPhrases"
        iniWrite, % SettingsTab.controls.showWelcomeCheckbox.getContent(), % Ini.path, % "Macro", % "showWelcome"
    }
}