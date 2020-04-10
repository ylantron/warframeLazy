class StatusBar {
    updateTime() {
        gui, % Gui.hwnd ":default"
        SB_SetText(A_Tab A_Hour ":" A_Min,2)
    }

    updateText() {
        gui, % Gui.hwnd ":default"

        if (SettingsTab.controls.showEmailCheckbox.getContent()) {
            SB_SetText((WarframeValues.email != "" ? WarframeValues.email : "Last warframe account not found") ,1)
        } else if ( (SettingsTab.controls.showEmailCheckbox.getContent() = 0)
                AND (SettingsTab.controls.showPhraseCheckbox.getContent() = 1)) {
            SB_SetText(this.getRandomPhrase() ,1)
        } else {
            SB_SetText("" ,1)
        }
    }

    getRandomPhrase() {
        phrases := []

        loop, read, % Ini.pathRandomPhrases
        {
            phrases.Push(A_LoopReadLine)
        }

        random, value, 1, % phrases.Length()
        return phrases[value]
    }
}