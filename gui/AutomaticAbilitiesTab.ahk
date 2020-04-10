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
        this.controls.firstAbilityLabel := new Label(firstAbilityLabel)
        this.controls.firstAbilityModeDropDownList := new DropDownList(firstAbilityModeDropDownList)
        ; - - - - - - - - - -
        this.controls.firstAbilityAutomaticTextbox := new Textbox(firstAbilityAutomaticTextbox)
        this.controls.firstAbilityAutomaticUpDown := new UpDown(firstAbilityAutomaticUpDown)
        this.controls.firstAbilityAutomaticLabel := new Label(firstAbilityAutomaticLabel)
        ; - - - - - - - - - -
        this.controls.firstAbilityRepeatTextbox := new Textbox(firstAbilityRepeatTextbox)
        this.controls.firstAbilityRepeatUpDown := new UpDown(firstAbilityRepeatUpDown)
        this.controls.firstAbilityRepeatLabel := new Label(firstAbilityRepeatLabel)
        ; - - - - - - - - - -
        this.controls.firstAbilityTimeTextbox := new Textbox(firstAbilityTimeTextbox)
        this.controls.firstAbilityTimeUpDown := new UpDown(firstAbilityTimeUpDown)
        this.controls.firstAbilityTimeDropDownList := new DropDownList(firstAbilityTimeDropDownList)



        this.controls.secondAbilityLabel := new Label(secondAbilityLabel)
        this.controls.secondAbilityModeDropDownList := new DropDownList(secondAbilityModeDropDownList)
        ; - - - - - - - - - -
        this.controls.secondAbilityAutomaticTextbox := new Textbox(secondAbilityAutomaticTextbox)
        this.controls.secondAbilityAutomaticUpDown := new UpDown(secondAbilityAutomaticUpDown)
        this.controls.secondAbilityAutomaticLabel := new Label(secondAbilityAutomaticLabel)
        ; - - - - - - - - - -
        this.controls.secondAbilityRepeatTextbox := new Textbox(secondAbilityRepeatTextbox)
        this.controls.secondAbilityRepeatUpDown := new UpDown(secondAbilityRepeatUpDown)
        this.controls.secondAbilityRepeatLabel := new Label(secondAbilityRepeatLabel)
        ; - - - - - - - - - -
        this.controls.secondAbilityTimeTextbox := new Textbox(secondAbilityTimeTextbox)
        this.controls.secondAbilityTimeUpDown := new UpDown(secondAbilityTimeUpDown)
        this.controls.secondAbilityTimeDropDownList := new DropDownList(secondAbilityTimeDropDownList)



        this.controls.thirdAbilityLabel := new Label(thirdAbilityLabel)
        this.controls.thirdAbilityModeDropDownList := new DropDownList(thirdAbilityModeDropDownList)
        ; - - - - - - - - - -
        this.controls.thirdAbilityAutomaticTextbox := new Textbox(thirdAbilityAutomaticTextbox)
        this.controls.thirdAbilityAutomaticUpDown := new UpDown(thirdAbilityAutomaticUpDown)
        this.controls.thirdAbilityAutomaticLabel := new Label(thirdAbilityAutomaticLabel)
        ; - - - - - - - - - -
        this.controls.thirdAbilityRepeatTextbox := new Textbox(thirdAbilityRepeatTextbox)
        this.controls.thirdAbilityRepeatUpDown := new UpDown(thirdAbilityRepeatUpDown)
        this.controls.thirdAbilityRepeatLabel := new Label(thirdAbilityRepeatLabel)
        ; - - - - - - - - - -
        this.controls.thirdAbilityTimeTextbox := new Textbox(thirdAbilityTimeTextbox)
        this.controls.thirdAbilityTimeUpDown := new UpDown(thirdAbilityTimeUpDown)
        this.controls.thirdAbilityTimeDropDownList := new DropDownList(thirdAbilityTimeDropDownList)



        this.controls.fourthAbilityLabel := new Label(fourthAbilityLabel)
        this.controls.fourthAbilityModeDropDownList := new DropDownList(fourthAbilityModeDropDownList)
        ; - - - - - - - - - -
        this.controls.fourthAbilityAutomaticTextbox := new Textbox(fourthAbilityAutomaticTextbox)
        this.controls.fourthAbilityAutomaticUpDown := new UpDown(fourthAbilityAutomaticUpDown)
        this.controls.fourthAbilityAutomaticLabel := new Label(fourthAbilityAutomaticLabel)
        ; - - - - - - - - - -
        this.controls.fourthAbilityRepeatTextbox := new Textbox(fourthAbilityRepeatTextbox)
        this.controls.fourthAbilityRepeatUpDown := new UpDown(fourthAbilityRepeatUpDown)
        this.controls.fourthAbilityRepeatLabel := new Label(fourthAbilityRepeatLabel)
        ; - - - - - - - - - -
        this.controls.fourthAbilityTimeTextbox := new Textbox(fourthAbilityTimeTextbox)
        this.controls.fourthAbilityTimeUpDown := new UpDown(fourthAbilityTimeUpDown)
        this.controls.fourthAbilityTimeDropDownList := new DropDownList(fourthAbilityTimeDropDownList)



        this.controls.fifthAbilityLabel := new Label(fifthAbilityLabel)
        this.controls.fifthAbilityModeDropDownList := new DropDownList(fifthAbilityModeDropDownList)
        ; - - - - - - - - - -
        this.controls.fifthAbilityAutomaticTextbox := new Textbox(fifthAbilityAutomaticTextbox)
        this.controls.fifthAbilityAutomaticUpDown := new UpDown(fifthAbilityAutomaticUpDown)
        this.controls.fifthAbilityAutomaticLabel := new Label(fifthAbilityAutomaticLabel)
        ; - - - - - - - - - -
        this.controls.fifthAbilityRepeatTextbox := new Textbox(fifthAbilityRepeatTextbox)
        this.controls.fifthAbilityRepeatUpDown := new UpDown(fifthAbilityRepeatUpDown)
        this.controls.fifthAbilityRepeatLabel := new Label(fifthAbilityRepeatLabel)
        ; - - - - - - - - - -
        this.controls.fifthAbilityTimeTextbox := new Textbox(fifthAbilityTimeTextbox)
        this.controls.fifthAbilityTimeUpDown := new UpDown(fifthAbilityTimeUpDown)
        this.controls.fifthAbilityTimeDropDownList := new DropDownList(fifthAbilityTimeDropDownList)

        ; =================================================================================

        this.modeControls[1] := this.controls.firstAbilityModeDropDownList
        this.modeControls[2] := this.controls.secondAbilityModeDropDownList
        this.modeControls[3] := this.controls.thirdAbilityModeDropDownList
        this.modeControls[4] := this.controls.fourthAbilityModeDropDownList
        this.modeControls[5] := this.controls.fifthAbilityModeDropDownList

        loop, 5 {
            this.automaticControls[A_Index] := new ControlGroup()
            this.repeatControls[A_Index] := new ControlGroup()
            this.timeControls[A_Index] := new ControlGroup()
        }

        this.automaticControls[1].addControl(this.controls.firstAbilityAutomaticTextbox)
        this.automaticControls[1].addControl(this.controls.firstAbilityAutomaticUpDown)
        this.automaticControls[1].addControl(this.controls.firstAbilityAutomaticLabel)

        this.repeatControls[1].addControl(this.controls.firstAbilityRepeatTextbox)
        this.repeatControls[1].addControl(this.controls.firstAbilityRepeatUpDown)
        this.repeatControls[1].addControl(this.controls.firstAbilityRepeatLabel)

        this.timeControls[1].addControl(this.controls.firstAbilityTimeTextbox)
        this.timeControls[1].addControl(this.controls.firstAbilityTimeUpDown)
        this.timeControls[1].addControl(this.controls.firstAbilityTimeDropDownList)



        this.automaticControls[2].addControl(this.controls.secondAbilityAutomaticTextbox)
        this.automaticControls[2].addControl(this.controls.secondAbilityAutomaticUpDown)
        this.automaticControls[2].addControl(this.controls.secondAbilityAutomaticLabel)

        this.repeatControls[2].addControl(this.controls.secondAbilityRepeatTextbox)
        this.repeatControls[2].addControl(this.controls.secondAbilityRepeatUpDown)
        this.repeatControls[2].addControl(this.controls.secondAbilityRepeatLabel)

        this.timeControls[2].addControl(this.controls.secondAbilityTimeTextbox)
        this.timeControls[2].addControl(this.controls.secondAbilityTimeUpDown)
        this.timeControls[2].addControl(this.controls.secondAbilityTimeDropDownList)



        this.automaticControls[3].addControl(this.controls.thirdAbilityAutomaticTextbox)
        this.automaticControls[3].addControl(this.controls.thirdAbilityAutomaticUpDown)
        this.automaticControls[3].addControl(this.controls.thirdAbilityAutomaticLabel)

        this.repeatControls[3].addControl(this.controls.thirdAbilityRepeatTextbox)
        this.repeatControls[3].addControl(this.controls.thirdAbilityRepeatUpDown)
        this.repeatControls[3].addControl(this.controls.thirdAbilityRepeatLabel)

        this.timeControls[3].addControl(this.controls.thirdAbilityTimeTextbox)
        this.timeControls[3].addControl(this.controls.thirdAbilityTimeUpDown)
        this.timeControls[3].addControl(this.controls.thirdAbilityTimeDropDownList)



        this.automaticControls[4].addControl(this.controls.fourthAbilityAutomaticTextbox)
        this.automaticControls[4].addControl(this.controls.fourthAbilityAutomaticUpDown)
        this.automaticControls[4].addControl(this.controls.fourthAbilityAutomaticLabel)

        this.repeatControls[4].addControl(this.controls.fourthAbilityRepeatTextbox)
        this.repeatControls[4].addControl(this.controls.fourthAbilityRepeatUpDown)
        this.repeatControls[4].addControl(this.controls.fourthAbilityRepeatLabel)

        this.timeControls[4].addControl(this.controls.fourthAbilityTimeTextbox)
        this.timeControls[4].addControl(this.controls.fourthAbilityTimeUpDown)
        this.timeControls[4].addControl(this.controls.fourthAbilityTimeDropDownList)



        this.automaticControls[5].addControl(this.controls.fifthAbilityAutomaticTextbox)
        this.automaticControls[5].addControl(this.controls.fifthAbilityAutomaticUpDown)
        this.automaticControls[5].addControl(this.controls.fifthAbilityAutomaticLabel)

        this.repeatControls[5].addControl(this.controls.fifthAbilityRepeatTextbox)
        this.repeatControls[5].addControl(this.controls.fifthAbilityRepeatUpDown)
        this.repeatControls[5].addControl(this.controls.fifthAbilityRepeatLabel)

        this.timeControls[5].addControl(this.controls.fifthAbilityTimeTextbox)
        this.timeControls[5].addControl(this.controls.fifthAbilityTimeUpDown)
        this.timeControls[5].addControl(this.controls.fifthAbilityTimeDropDownList)
       ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Hide all automatic, repeat and time controls |:. - - -
        Loop, 5 {
            this.automaticControls[A_Index].setVisibility("off")
            this.repeatControls[A_Index].setVisibility("off")
            this.timeControls[A_Index].setVisibility("off")
        }
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