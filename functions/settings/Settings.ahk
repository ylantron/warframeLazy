class Settings {
    include() {
        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "changeKeys")
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.changeKeysButton, % function

        function := ObjBindMethod(this, "setCheckboxState")
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.guiAlwaysOnTopCheckbox, % function
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.showWelcomeCheckbox, % function
        
        function := ObjBindMethod(this, "setCheckboxState", "statusBar")
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.showEmailCheckbox, % function
        guiControl, % Gui.hwnd ":+g", % SettingsTab.controls.showPhraseCheckbox, % function

        function := ""
    }

    changeKeys() {
        loop, % SettingsTab.keyControls.Length() {
            guiControl, text, % SettingsTab.keyControls[A_Index], % StrReplace(Control.getControlText(SettingsTab.keyControls[A_Index]), " ", "")
        }

        guiControl, enable0, % SettingsTab.controls.changeKeysButton

        Gui.disableAllHotkeys()
        this.checkKeysValidity()
        Gui.enableAllHotkeys()

        guiControl, enable1, % SettingsTab.controls.changeKeysButton
    }

    checkKeysValidity() {
        classes := [Gui, SlideAttack, FireMode, UseKeyBehaviour, QuickAbilityUse]
        classesName := ["Show/Hide Macro", "Slide Attack", "Fire Mode", "Use Key Behaviour", "Quick Ability Use"]

        loop, % classes.Length() {
            currentClass := A_Index

            loop {
                validity := this.checkKeyValidity(Control.getControlText(SettingsTab.keyControls[currentClass]))

                if (validity != 1) {
                    new Message("Error while setting key of " classesName[currentClass] " (" Control.getControlText(SettingsTab.keyControls[currentClass]) ")" "`nRestoring original key (" classes[currentClass].key ")")
                    guiControl, text, % SettingsTab.keyControls[currentClass] , % classes[currentClass].key
                }
            } until (validity = 1)

            hotkey, % Control.getControlText(SettingsTab.keyControls[A_Index]), % checkKeysValidity, off
            classes[A_Index].key := Control.getControlText(SettingsTab.keyControls[A_Index])
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
        classes := [Gui, SlideAttack, FireMode, UseKeyBehaviour, QuickAbilityUse]

        Loop, % SettingsTab.keyControls.Length() {
            guiControl, text, % SettingsTab.keyControls[A_Index], % classes[A_Index].key
        }

        ; - - - - - - - -

        valLoaded := Ini.readIni("Macro", "alwaysOnTop")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "0", % Ini.path, % "Macro", % "alwaysOnTop"
            valLoaded := 0
        }
        guiControl, , % SettingsTab.controls.guiAlwaysOnTopCheckbox, % valLoaded

        valLoaded := Ini.readIni("Macro", "showEmail")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "1", % Ini.path, % "Macro", % "showEmail"
            valLoaded := 1
        }
        guiControl, , % SettingsTab.controls.showEmailCheckbox, % valLoaded

        valLoaded := Ini.readIni("Macro", "showRandomPhrases")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "1", % Ini.path, % "Macro", % "showRandomPhrases"
            valLoaded := 1
        }
        guiControl, , % SettingsTab.controls.showPhraseCheckbox, % valLoaded

        valLoaded := Ini.readIni("Macro", "showWelcome")
        if !(valLoaded = 0 OR valLoaded = 1) {
            iniWrite, % "1", % Ini.path, % "Macro", % "showWelcome"
            valLoaded := 1
        }
        guiControl, , % SettingsTab.controls.showWelcomeCheckbox, % valLoaded

        this.setCheckboxState()
    }

    setCheckboxState(target := "") {
        gui, % Gui.hwnd ": " (Control.getControlText(SettingsTab.controls.guiAlwaysOnTopCheckbox) ? "+" : "-") "alwaysOnTop"

        if (!Control.getControlText(SettingsTab.controls.showEmailCheckbox)) {
            guiControl, enable1, % SettingsTab.controls.showPhraseCheckbox
        } else {
            guiControl, enable0, % SettingsTab.controls.showPhraseCheckbox
        }

        if (target = "statusBar") {
            StatusBar.updateText()
        }

        iniWrite, % Control.getControlText(SettingsTab.controls.guiAlwaysOnTopCheckbox), % Ini.path, % "Macro", % "alwaysOnTop"
        iniWrite, % Control.getControlText(SettingsTab.controls.showEmailCheckbox), % Ini.path, % "Macro", % "showEmail"
        iniWrite, % Control.getControlText(SettingsTab.controls.showPhraseCheckbox), % Ini.path, % "Macro", % "showRandomPhrases"
        iniWrite, % Control.getControlText(SettingsTab.controls.showWelcomeCheckbox), % Ini.path, % "Macro", % "showWelcome"
    }
}