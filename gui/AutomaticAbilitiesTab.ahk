class AutomaticAbilitiesTab {
    static controls = {}
    static properties = { spacing:34 }
    static dropDownListValues := ["Normal", "Automatic", "Repeated", "Timed", "Delayed"]

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Automatic Abilities"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Automatic Abilities"

        gui, % Gui.hwnd ":add", text, % "x12 y40 hwnd" "firstAbilityLabel", % "First Ability"
        gui, % Gui.hwnd ":add", dropDownList, % "x90 yp-4 section w80 altSubmit choose1 hwnd" "firstAbilityModeDropDownList", % this.Values.toString()
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit4 number right hwnd" "firstAbilityAutomaticTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-9999 hwnd" "firstAbilityAutomaticUpDown", % AutomaticAbilities.delay
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "firstAbilityAutomaticLabel", % "delay (ms)"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit2 number right hwnd" "firstAbilityRepeatTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-99 hwnd" "firstAbilityRepeatUpDown", % "2"
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "firstAbilityRepeatLabel", % "times"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit6 number right hwnd" "firstAbilityTimeTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-999000 hwnd" "firstAbilityTimeUpDown", % "1000"
        gui, % Gui.hwnd ":add", dropDownList, % "xp70 w85 altSubmit choose1 hwnd" "firstAbilityTimeDropDownList", % "Milliseconds|Seconds"



        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "secondAbilityLabel", % "Second Ability"
        gui, % Gui.hwnd ":add", dropDownList, % "xs0 yp-4 section w80 altSubmit choose1 hwnd" "secondAbilityModeDropDownList", % this.Values.toString()
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit4 number right hwnd" "secondAbilityAutomaticTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-9999 hwnd" "secondAbilityAutomaticUpDown", % AutomaticAbilities.delay
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "secondAbilityAutomaticLabel", % "delay (ms)"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit2 number right hwnd" "secondAbilityRepeatTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-99 hwnd" "secondAbilityRepeatUpDown", % "2"
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "secondAbilityRepeatLabel", % "times"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit6 number right hwnd" "secondAbilityTimeTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-999000 hwnd" "secondAbilityTimeUpDown", % "1000"
        gui, % Gui.hwnd ":add", dropDownList, % "xp70 w85 altSubmit choose1 hwnd" "secondAbilityTimeDropDownList", % "Milliseconds|Seconds"



        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "thirdAbilityLabel", % "Third Ability"
        gui, % Gui.hwnd ":add", dropDownList, % "xs0 yp-4 section w80 altSubmit choose1 hwnd" "thirdAbilityModeDropDownList", % this.Values.toString()
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit4 number right hwnd" "thirdAbilityAutomaticTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-9999 hwnd" "thirdAbilityAutomaticUpDown", % AutomaticAbilities.delay
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "thirdAbilityAutomaticLabel", % "delay (ms)"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit2 number right hwnd" "thirdAbilityRepeatTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-99 hwnd" "thirdAbilityRepeatUpDown", % "2"
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "thirdAbilityRepeatLabel", % "times"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit6 number right hwnd" "thirdAbilityTimeTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-999000 hwnd" "thirdAbilityTimeUpDown", % "1000"
        gui, % Gui.hwnd ":add", dropDownList, % "xp70 w85 altSubmit choose1 hwnd" "thirdAbilityTimeDropDownList", % "Milliseconds|Seconds"



        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "fourthAbilityLabel", % "Fourth Ability"
        gui, % Gui.hwnd ":add", dropDownList, % "xs0 yp-4 section w80 altSubmit choose1 hwnd" "fourthAbilityModeDropDownList", % this.Values.toString()
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit4 number right hwnd" "fourthAbilityAutomaticTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-9999 hwnd" "fourthAbilityAutomaticUpDown", % AutomaticAbilities.delay
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "fourthAbilityAutomaticLabel", % "delay (ms)"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit2 number right hwnd" "fourthAbilityRepeatTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-99 hwnd" "fourthAbilityRepeatUpDown", % "2"
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "fourthAbilityRepeatLabel", % "times"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit6 number right hwnd" "fourthAbilityTimeTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-999000 hwnd" "fourthAbilityTimeUpDown", % "1000"
        gui, % Gui.hwnd ":add", dropDownList, % "xp70 w85 altSubmit choose1 hwnd" "fourthAbilityTimeDropDownList", % "Milliseconds|Seconds"



        gui, % Gui.hwnd ":add", text, % "x12 yp" this.properties.spacing " hwnd" "fifthAbilityLabel", % "Operator"
        gui, % Gui.hwnd ":add", dropDownList, % "xs0 yp-4 section w80 altSubmit choose1 hwnd" "fifthAbilityModeDropDownList", % this.Values.toString()
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit4 number right hwnd" "fifthAbilityAutomaticTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-9999 hwnd" "fifthAbilityAutomaticUpDown", % AutomaticAbilities.delay
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "fifthAbilityAutomaticLabel", % "delay (ms)"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit2 number right hwnd" "fifthAbilityRepeatTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-99 hwnd" "fifthAbilityRepeatUpDown", % "2"
        gui, % Gui.hwnd ":add", text, % "xp70 yp+2 hwnd" "fifthAbilityRepeatLabel", % "times"
        ; - - - - - - - - - -
        gui, % Gui.hwnd ":add", edit, % "xs90 ys0 h20 w60 limit6 number right hwnd" "fifthAbilityTimeTextbox"
        gui, % Gui.hwnd ":add", upDown, % "range1-999000 hwnd" "fifthAbilityTimeUpDown", % "1000"
        gui, % Gui.hwnd ":add", dropDownList, % "xp70 w85 altSubmit choose1 hwnd" "fifthAbilityTimeDropDownList", % "Milliseconds|Seconds"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.modeControls := []
        this.automaticControls := []
        this.repeatControls := []
        this.timeControls := []

        loop, 5 {
            this.automaticControls[A_Index] := {}
            this.repeatControls[A_Index] := {}
            this.timeControls[A_Index] := {}
        }

        this.controls.firstAbilityLabel := firstAbilityLabel
        this.controls.firstAbilityModeDropDownList := this.modeControls[1] := firstAbilityModeDropDownList
        ; - - - - - - - - - -
        this.controls.firstAbilityAutomaticTextbox := this.automaticControls[1].automaticTextbox := firstAbilityAutomaticTextbox
        this.controls.firstAbilityAutomaticUpDown := this.automaticControls[1].automaticUpDown := firstAbilityAutomaticUpDown
        this.controls.firstAbilityAutomaticLabel := this.automaticControls[1].automaticLabel := firstAbilityAutomaticLabel
        ; - - - - - - - - - -
        this.controls.firstAbilityRepeatTextbox := this.repeatControls[1].repeatTextbox := firstAbilityRepeatTextbox
        this.controls.firstAbilityRepeatUpDown := this.repeatControls[1].repeatUpDown := firstAbilityRepeatUpDown
        this.controls.firstAbilityRepeatLabel := this.repeatControls[1].repeatLabel := firstAbilityRepeatLabel
        ; - - - - - - - - - -
        this.controls.firstAbilityTimeTextbox := this.timeControls[1].timeTextbox := firstAbilityTimeTextbox
        this.controls.firstAbilityTimeUpDown := this.timeControls[1].timeUpDown := firstAbilityTimeUpDown
        this.controls.firstAbilityTimeDropDownList := this.timeControls[1].timeDropDownList := firstAbilityTimeDropDownList



        this.controls.secondAbilityLabel := secondAbilityLabel
        this.controls.secondAbilityModeDropDownList := this.modeControls[2] := secondAbilityModeDropDownList
        ; - - - - - - - - - -
        this.controls.secondAbilityAutomaticTextbox := this.automaticControls[2].automaticTextbox := secondAbilityAutomaticTextbox
        this.controls.secondAbilityAutomaticUpDown := this.automaticControls[2].automaticUpDown := secondAbilityAutomaticUpDown
        this.controls.secondAbilityAutomaticLabel := this.automaticControls[2].automaticLabel := secondAbilityAutomaticLabel
        ; - - - - - - - - - -
        this.controls.secondAbilityRepeatTextbox := this.repeatControls[2].repeatTextbox := secondAbilityRepeatTextbox
        this.controls.secondAbilityRepeatUpDown := this.repeatControls[2].repeatUpDown := secondAbilityRepeatUpDown
        this.controls.secondAbilityRepeatLabel := this.repeatControls[2].repeatLabel := secondAbilityRepeatLabel
        ; - - - - - - - - - -
        this.controls.secondAbilityTimeTextbox := this.timeControls[2].timeTextbox := secondAbilityTimeTextbox
        this.controls.secondAbilityTimeUpDown := this.timeControls[2].timeUpDown := secondAbilityTimeUpDown
        this.controls.secondAbilityTimeDropDownList := this.timeControls[2].timeDropDownList := secondAbilityTimeDropDownList



        this.controls.thirdAbilityLabel := thirdAbilityLabel
        this.controls.thirdAbilityModeDropDownList := this.modeControls[3] := thirdAbilityModeDropDownList
        ; - - - - - - - - - -
        this.controls.thirdAbilityAutomaticTextbox := this.automaticControls[3].automaticTextbox := thirdAbilityAutomaticTextbox
        this.controls.thirdAbilityAutomaticUpDown := this.automaticControls[3].automaticUpDown := thirdAbilityAutomaticUpDown
        this.controls.thirdAbilityAutomaticLabel := this.automaticControls[3].automaticLabel := thirdAbilityAutomaticLabel
        ; - - - - - - - - - -
        this.controls.thirdAbilityRepeatTextbox := this.repeatControls[3].repeatTextbox := thirdAbilityRepeatTextbox
        this.controls.thirdAbilityRepeatUpDown := this.repeatControls[3].repeatUpDown := thirdAbilityRepeatUpDown
        this.controls.thirdAbilityRepeatLabel := this.repeatControls[3].repeatLabel := thirdAbilityRepeatLabel
        ; - - - - - - - - - -
        this.controls.thirdAbilityTimeTextbox := this.timeControls[3].timeTextbox := thirdAbilityTimeTextbox
        this.controls.thirdAbilityTimeUpDown := this.timeControls[3].timeUpDown := thirdAbilityTimeUpDown
        this.controls.thirdAbilityTimeDropDownList := this.timeControls[3].timeDropDownList := thirdAbilityTimeDropDownList



        this.controls.fourthAbilityLabel := fourthAbilityLabel
        this.controls.fourthAbilityModeDropDownList := this.modeControls[4] := fourthAbilityModeDropDownList
        ; - - - - - - - - - -
        this.controls.fourthAbilityAutomaticTextbox := this.automaticControls[4].automaticTextbox := fourthAbilityAutomaticTextbox
        this.controls.fourthAbilityAutomaticUpDown := this.automaticControls[4].automaticUpDown := fourthAbilityAutomaticUpDown
        this.controls.fourthAbilityAutomaticLabel := this.automaticControls[4].automaticLabel := fourthAbilityAutomaticLabel
        ; - - - - - - - - - -
        this.controls.fourthAbilityRepeatTextbox := this.repeatControls[4].repeatTextbox := fourthAbilityRepeatTextbox
        this.controls.fourthAbilityRepeatUpDown := this.repeatControls[4].repeatUpDown := fourthAbilityRepeatUpDown
        this.controls.fourthAbilityRepeatLabel := this.repeatControls[4].repeatLabel := fourthAbilityRepeatLabel
        ; - - - - - - - - - -
        this.controls.fourthAbilityTimeTextbox := this.timeControls[4].timeTextbox := fourthAbilityTimeTextbox
        this.controls.fourthAbilityTimeUpDown := this.timeControls[4].timeUpDown := fourthAbilityTimeUpDown
        this.controls.fourthAbilityTimeDropDownList := this.timeControls[4].timeDropDownList := fourthAbilityTimeDropDownList



        this.controls.fifthAbilityLabel := fifthAbilityLabel
        this.controls.fifthAbilityModeDropDownList := this.modeControls[5] := fifthAbilityModeDropDownList
        ; - - - - - - - - - -
        this.controls.fifthAbilityAutomaticTextbox := this.automaticControls[5].automaticTextbox := fifthAbilityAutomaticTextbox
        this.controls.fifthAbilityAutomaticUpDown := this.automaticControls[5].automaticUpDown := fifthAbilityAutomaticUpDown
        this.controls.fifthAbilityAutomaticLabel := this.automaticControls[5].automaticLabel := fifthAbilityAutomaticLabel
        ; - - - - - - - - - -
        this.controls.fifthAbilityRepeatTextbox := this.repeatControls[5].repeatTextbox := fifthAbilityRepeatTextbox
        this.controls.fifthAbilityRepeatUpDown := this.repeatControls[5].repeatUpDown := fifthAbilityRepeatUpDown
        this.controls.fifthAbilityRepeatLabel := this.repeatControls[5].repeatLabel := fifthAbilityRepeatLabel
        ; - - - - - - - - - -
        this.controls.fifthAbilityTimeTextbox := this.timeControls[5].timeTextbox := fifthAbilityTimeTextbox
        this.controls.fifthAbilityTimeUpDown := this.timeControls[5].timeUpDown := fifthAbilityTimeUpDown
        this.controls.fifthAbilityTimeDropDownList := this.timeControls[5].timeDropDownList := fifthAbilityTimeDropDownList
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Hide all automatic, repeat and time controls |:. - - -
        Control.setVisibilities(this.automaticControls.MaxIndex(), this.automaticControls, "off")
        Control.setVisibilities(this.repeatControls.MaxIndex(), this.repeatControls, "off")
        Control.setVisibilities(this.timeControls.MaxIndex(), this.timeControls, "off")
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        AutomaticAbilities.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }

    class Values {
        toString(separator := "|") {
            str := ""

            for i, val in AutomaticAbilitiesTab.dropDownListValues {
                str .= val separator
            }

            return str
        }
    }
}