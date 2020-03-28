class FunctionsTab {
    static controls = {}
    static properties = { spacing:34 }

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Functions"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Functions"

        gui, % Gui.hwnd ":add", text, % "x12 y45 hwnd" "slideAttackLabel", % "Slide attack"
        gui, % Gui.hwnd ":add", button, % "x120 yp-4 section w30 hwnd" "slideAttackButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-1 tickInterval1 altSubmit hwnd" "slideAttackSlider", 0
        gui, % Gui.hwnd ":add", text, % "xp90 yp+4 w100 cGray hwnd" "slideAttackValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "fireModeLabel", % "Fire Mode"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "fireModeButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-3 tickInterval1 altSubmit hwnd" "fireModeSlider", 0
        gui, % Gui.hwnd ":add", text, % "xp90 yp+4 w100 cGray hwnd" "fireModeValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "useKeyBehaviourLabel", % "Use Key Behaviour"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "useKeyBehaviourButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-3 tickInterval1 altSubmit hwnd" "useKeyBehaviourSlider", 0
        gui, % Gui.hwnd ":add", text, % "xp90 yp+4 w100 cGray hwnd" "useKeyBehaviourValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "quickAbilityUseLabel", % "Quick Ability Use"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "quickAbilityUseButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-5 tickInterval1 altSubmit hwnd" "quickAbilityUseSlider", 0
        gui, % Gui.hwnd ":add", text, % "xp90 yp+4 w100 cGray hwnd" "quickAbilityUseValueLabel"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.controls.slideAttackLabel := slideAttackLabel
        this.controls.slideAttackButton := slideAttackButton
        this.controls.slideAttackSlider := slideAttackSlider
        this.controls.slideAttackValueLabel := slideAttackValueLabel

        this.controls.fireModeLabel := fireModeLabel
        this.controls.fireModeButton := fireModeButton
        this.controls.fireModeSlider := fireModeSlider
        this.controls.fireModeValueLabel := fireModeValueLabel

        this.controls.useKeyBehaviourLabel := useKeyBehaviourLabel
        this.controls.useKeyBehaviourButton := useKeyBehaviourButton
        this.controls.useKeyBehaviourSlider := useKeyBehaviourSlider
        this.controls.useKeyBehaviourValueLabel := useKeyBehaviourValueLabel

        this.controls.quickAbilityUseLabel := quickAbilityUseLabel
        this.controls.quickAbilityUseButton := quickAbilityUseButton
        this.controls.quickAbilityUseSlider := quickAbilityUseSlider
        this.controls.quickAbilityUseValueLabel := quickAbilityUseValueLabel
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        Control.setVisibility(this.controls.slideAttackSlider, "off")
        this.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }

    include() {
        classes := [SlideAttack, FireMode, UseKeyBehaviour, QuickAbilityUse]

        loop, % classes.Length() {
            classes[A_Index].include()
        }
    }
}