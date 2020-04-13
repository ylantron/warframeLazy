Gui.ownedClasses.Push(SettingsTab)

class SettingsTab {
    static controls := {}
    static labelControls := []
    static keyControls := []
    static properties = { spacing:32 }

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Settings"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Settings"

        gui, % Gui.hwnd ":add", text, % "x12 y36 section hwnd" "showHideGuiKeyLabel", % "Show/Hide Macro Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "showHideGuiKeyTextbox", % Gui.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "slideAttackKeyLabel", % "Slide Attack Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "slideAttackKeyTextbox", % SlideAttack.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "fireModeKeyLabel", % "Fire Mode Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "fireModeKeyTextbox", % FireMode.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "autoMeleeKeyLabel", % "Melee Fire Rate Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "autoMeleeKeyTextbox", % AutomaticMelee.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "useKeyBehaviourKeyLabel", % "Use Key Behaviour Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "useKeyBehaviourKeyTextbox", % UseKeyBehaviour.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "quickAbilityUseKeyLabel", % "Quick Ability Use Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "quickAbilityUseKeyTextbox", % QuickAbilityUse.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "customTeleportLabel", % "Custom Teleport Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "customTeleportTextbox", % CustomTeleport.key

        gui, % Gui.hwnd ":add", button, % "xs0 y+6 w201 h22 hwnd" "changeKeysButton", % "Change keys"

        ; - - - - - - - - - - -
        gui, % Gui.hwnd ":add", text, % "x220 ys-4 h161 0x11"  ;Vertical Line
        ; - - - - - - - - - - -

        gui, % Gui.hwnd ":add", checkbox, % "xp10 ys-5 checked0 hwnd" "guiAlwaysOnTopCheckbox", % "Macro always" "`non top"
        gui, % Gui.hwnd ":add", checkbox, % "xp0 yp32 checked1 hwnd" "showEmailCheckbox", % "Show account" "`nemail in status bar"
        gui, % Gui.hwnd ":add", checkbox, % "xp0 yp32 disabled checked1 hwnd" "showPhraseCheckbox", % "Show random" "`nphrases in status bar"
        gui, % Gui.hwnd ":add", checkbox, % "xp0 yp32 checked1 hwnd" "showWelcomeCheckbox", % "Show welcome" "`non startup"
        gui, % Gui.hwnd ":add", button, % "xp0 y+6 w110 h22 hwnd" "showWelcomeButton", % "Show Welcome"

        gui, % Gui.hwnd ":add", text, % "xp-10 y+8 w126 0x10" ; horizontal line

        gui, % Gui.hwnd ":add", text, % "xp0 y+1 hwnd" "customTeleportDelayLabel", % "Delay (ms)"
        gui, % Gui.hwnd ":add", edit, % "x+5 yp-4 w53 limit3 number hwnd" "customTeleportDelayTextbox", % ""
        gui, % Gui.hwnd ":add", upDown, % "range50-999 hwnd" "customTeleportDelayUpDown", % "50"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.controls.showHideGuiKeyLabel := this.labelControls[1] := new Label(showHideGuiKeyLabel)
        this.controls.showHideGuiKeyTextbox := this.keyControls[1] := new Textbox(showHideGuiKeyTextbox)

        this.controls.slideAttackKeyLabel := this.labelControls[2] := new Label(slideAttackKeyLabel)
        this.controls.slideAttackKeyTextbox := this.keyControls[2] := new Textbox(slideAttackKeyTextbox)

        this.controls.fireModeKeyLabel := this.labelControls[3] := new Label(fireModeKeyLabel)
        this.controls.fireModeKeyTextbox := this.keyControls[3] := new Textbox(fireModeKeyTextbox)

        this.controls.autoMeleeKeyLabel := this.labelControls[4] := new Label(autoMeleeKeyLabel)
        this.controls.autoMeleeKeyTextbox := this.keyControls[4] := new Textbox(autoMeleeKeyTextbox)

        this.controls.useKeyBehaviourKeyLabel := this.labelControls[5] := new Label(useKeyBehaviourKeyLabel)
        this.controls.useKeyBehaviourKeyTextbox := this.keyControls[5] := new Textbox(useKeyBehaviourKeyTextbox)

        this.controls.quickAbilityUseKeyLabel := this.labelControls[6] := new Label(quickAbilityUseKeyLabel)
        this.controls.quickAbilityUseKeyTextbox := this.keyControls[6] := new Textbox(quickAbilityUseKeyTextbox)

        this.controls.quickAbilityUseKeyLabel := this.labelControls[7] := new Label(customTeleportLabel)
        this.controls.quickAbilityUseKeyTextbox := this.keyControls[7] := new Textbox(customTeleportTextbox)

        this.controls.changeKeysButton := new Button(changeKeysButton)
        ; - - - - - - - - - - -

        this.controls.guiAlwaysOnTopCheckbox := new Checkbox(guiAlwaysOnTopCheckbox)
        this.controls.showEmailCheckbox := new Checkbox(showEmailCheckbox)
        this.controls.showPhraseCheckbox := new Checkbox(showPhraseCheckbox)
        this.controls.showWelcomeCheckbox := new Checkbox(showWelcomeCheckbox)
        this.controls.showWelcomeButton := new Button(showWelcomeButton)

        this.controls.customTeleportDelayLabel := new Label(customTeleportDelayLabel)
        this.controls.customTeleportDelayTextbox := new Textbox(customTeleportDelayTextbox)
        this.controls.customTeleportDelayUpDown := new UpDown(customTeleportDelayUpDown)
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        Settings.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }
}