class SettingsTab {
    static controls := {}
    static labelControls := []
    static keyControls := []
    static properties = { spacing:36 }

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Settings"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Settings"

        gui, % Gui.hwnd ":add", text, % "x12 y40 section hwnd" "showHideGuiKeyLabel", % "Show/Hide Macro Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "showHideGuiKeyTextbox", % Gui.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "slideAttackKeyLabel", % "Slide Attack Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "slideAttackKeyTextbox", % SlideAttack.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "fireModeKeyLabel", % "Fire Mode Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "fireModeKeyTextbox", % FireMode.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "useKeyBehaviourKeyLabel", % "Use Key Behaviour Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "useKeyBehaviourKeyTextbox", % UseKeyBehaviour.key

        gui, % Gui.hwnd ":add", text, % "xs0 yp" this.properties.spacing " hwnd" "quickAbilityUseKeyLabel", % "Quick Ability Use Key"
        gui, % Gui.hwnd ":add", edit, % "xp120 yp-4 w80 hwnd" "quickAbilityUseKeyTextbox", % quickAbilityUse.key

        ; - - - - - - - - - - -
        gui, % Gui.hwnd ":add", text, % "x220 ys-4 h125 0x11"  ;Vertical Line
        ; - - - - - - - - - - -

        gui, % Gui.hwnd ":add", checkbox, % "xp10 ys-6 checked0 hwnd" "guiAlwaysOnTopCheckbox", % "Macro always" "`non top"
        gui, % Gui.hwnd ":add", checkbox, % "xp0 yp32 checked1 hwnd" "showEmailCheckbox", % "Show account" "`nemail in status bar"
        gui, % Gui.hwnd ":add", checkbox, % "xp0 yp32 disabled checked1 hwnd" "showPhraseCheckbox", % "Show random" "`nphrases in status bar"
        gui, % Gui.hwnd ":add", checkbox, % "xp0 yp32 checked1 hwnd" "showWelcomeCheckbox", % "Show welcome" "`non startup"

        gui, % Gui.hwnd ":add", button, % "xp0 ys123 w112 h22 hwnd" "changeKeysButton", % "Change keys"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.controls.showHideGuiKeyLabel := this.labelControls[1] := showHideGuiKeyLabel
        this.controls.showHideGuiKeyTextbox := this.keyControls[1] := showHideGuiKeyTextbox

        this.controls.slideAttackKeyLabel := this.labelControls[2] := slideAttackKeyLabel
        this.controls.slideAttackKeyTextbox := this.keyControls[2] := slideAttackKeyTextbox

        this.controls.fireModeKeyLabel := this.labelControls[3] := fireModeKeyLabel
        this.controls.fireModeKeyTextbox := this.keyControls[3] := fireModeKeyTextbox

        this.controls.useKeyBehaviourKeyLabel := this.labelControls[4] := useKeyBehaviourKeyLabel
        this.controls.useKeyBehaviourKeyTextbox := this.keyControls[4] := useKeyBehaviourKeyTextbox

        this.controls.quickAbilityUseKeyLabel := this.labelControls[5] := uickAbilityUseKeyLabel
        this.controls.quickAbilityUseKeyTextbox := this.keyControls[5] := quickAbilityUseKeyTextbox

        ; - - - - - - - - - - -

        this.controls.guiAlwaysOnTopCheckbox := guiAlwaysOnTopCheckbox
        this.controls.showEmailCheckbox := showEmailCheckbox
        this.controls.showPhraseCheckbox := showPhraseCheckbox
        this.controls.showWelcomeCheckbox := showWelcomeCheckbox

        this.controls.changeKeysButton := changeKeysButton
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        Settings.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }
}