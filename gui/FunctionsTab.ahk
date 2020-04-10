Gui.ownedClasses.Push(FunctionsTab)

class FunctionsTab {
    static controls = {}
    static properties = { spacing:18 }
    static classes := []
    static classesName := []

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Functions"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Functions"

        gui, % Gui.hwnd ":add", text, % "x12 y28", % "Click on a function to know how to use it"

        gui, % Gui.hwnd ":add", text, % "x12 y60 hwnd" "slideAttackLabel", % "Slide attack"
        gui, % Gui.hwnd ":add", button, % "x120 yp-4 section w30 hwnd" "slideAttackButton", Off
        gui, % Gui.hwnd ":add", text, % "x+10 yp+4 w100 cGray hwnd" "slideAttackValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 y+" this.properties.spacing " hwnd" "fireModeLabel", % "Fire Mode"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "fireModeButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-3 tickInterval1 altSubmit hwnd" "fireModeSlider", 0
        gui, % Gui.hwnd ":add", text, % "x+10 yp+4 w100 cGray hwnd" "fireModeValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 y+" this.properties.spacing " hwnd" "autoMeleeLabel", % "Melee Fire Rate"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "autoMeleeButton", Off
        gui, % Gui.hwnd ":add", text, % "x+10 yp+4 w100 cGray hwnd" "autoMeleeValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 y+" this.properties.spacing " hwnd" "useKeyBehaviourLabel", % "Use Key Behaviour"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "useKeyBehaviourButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-3 tickInterval1 altSubmit hwnd" "useKeyBehaviourSlider", 0
        gui, % Gui.hwnd ":add", text, % "x+10 yp+4 w100 cGray hwnd" "useKeyBehaviourValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 y+" this.properties.spacing " hwnd" "quickAbilityUseLabel", % "Quick Ability Use"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "quickAbilityUseButton", Off
        gui, % Gui.hwnd ":add", slider, % "xp35 w80 range1-5 tickInterval1 altSubmit hwnd" "quickAbilityUseSlider", 0
        gui, % Gui.hwnd ":add", text, % "x+10 yp+4 w100 cGray hwnd" "quickAbilityUseValueLabel"

        gui, % Gui.hwnd ":add", text, % "x12 y+" this.properties.spacing " hwnd" "customTeleportLabel", % "Custom Teleport"
        gui, % Gui.hwnd ":add", button, % "xs0 yp-4 w30 hwnd" "customTeleportButton", Off
        gui, % Gui.hwnd ":add", text, % "x+10 yp+4 w100 cGray hwnd" "customTeleportValueLabel"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.controls.slideAttackLabel := new Label(slideAttackLabel)
        this.controls.slideAttackButton := new Button(slideAttackButton)
        this.controls.slideAttackValueLabel := new Label(slideAttackValueLabel)

        this.controls.fireModeLabel := new Label(fireModeLabel)
        this.controls.fireModeButton := new Button(fireModeButton)
        this.controls.fireModeSlider := new Slider(fireModeSlider)
        this.controls.fireModeValueLabel := new Label(fireModeValueLabel)

        this.controls.autoMeleeLabel := new Label(autoMeleeLabel)
        this.controls.autoMeleeButton := new Button(autoMeleeButton)
        this.controls.autoMeleeValueLabel := new Label(autoMeleeValueLabel)

        this.controls.useKeyBehaviourLabel := new Label(useKeyBehaviourLabel)
        this.controls.useKeyBehaviourButton := new Button(useKeyBehaviourButton)
        this.controls.useKeyBehaviourSlider := new Slider(useKeyBehaviourSlider)
        this.controls.useKeyBehaviourValueLabel := new Label(useKeyBehaviourValueLabel)

        this.controls.quickAbilityUseLabel := new Label(quickAbilityUseLabel)
        this.controls.quickAbilityUseButton := new Button(quickAbilityUseButton)
        this.controls.quickAbilityUseSlider := new Slider(quickAbilityUseSlider)
        this.controls.quickAbilityUseValueLabel := new Label(quickAbilityUseValueLabel)
        
        this.controls.customTeleportLabel := new Label(customTeleportLabel)
        this.controls.customTeleportButton := new Button(customTeleportButton)
        this.controls.customTeleportValueLabel := new Label(customTeleportValueLabel)
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        this.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }

    include() {
        loop, % this.classes.Length() {
            this.classes[A_Index].include()
        }
    }
}