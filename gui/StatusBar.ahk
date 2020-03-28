class StatusBar {
    updateTime() {
        gui, % Gui.hwnd ":default"
        SB_SetText(A_Tab A_Hour ":" A_Min,2)
    }

    updateText() {
        gui, % Gui.hwnd ":default"

        if (Control.getControlText(SettingsTab.controls.showEmailCheckbox)) {
            SB_SetText((WarframeValues.email != "" ? WarframeValues.email : "Last warframe account not found") ,1)
        } else if ( (Control.getControlText(SettingsTab.controls.showEmailCheckbox) = 0)
                AND (Control.getControlText(SettingsTab.controls.showPhraseCheckbox) = 1)) {
            SB_SetText(this.getRandomPhrase() ,1)
        } else {
            SB_SetText("" ,1)
        }
    }

    getRandomPhrase() {
        phrases := [    "2035"
                    ,   "Did you really believe it would be this easy?"
                    ,   "Hydroid Prime Trailer: coming soon(tm)"
                    ,   """We rename 'warframes' in 'javelins'"" -cit Steve Sinclair"
                    ,   "RIP raids"
                    ,   "Tenno, on deck"
                    ,   "They come to this place when they know they are not pure"]

        random, value, 1, % phrases.Length()
        return phrases[value]
    }
}