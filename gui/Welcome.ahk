class Welcome {
    static hwnd
    static properties := {width:470, height:430}
    static controls := {}
    static created := false

    createGui() {
        gui, new, % "-resize -minimizeBox -MaximizeBox hwnd" "welcomeHwnd", % "Welcome"
        this.hwnd := welcomeHwnd

        welcomeTxt :=   "Hello! Welcome to Warframe Lazy!" "`n`n"

                    .   "This is a macro for easing some task like spinning in slide attacks or automating abilities." "`n"
                    .   "Any use of this macro is not condoned for afk purposes" "`n`n"

                    .   "Once started the macro will run in the background;" "`n"
                    .   "To show or hide it you have to press the combinations:" "`n"
                    .   "- CTRL + SHIFT + Macro Key (currently """ Gui.key """)" "`t" "for every window outside warframe" "`n"
                    .   "- Macro Key (currently """ Gui.key """)" "`t`t`t" " when warframe or macro has the focus" "`n`n"

                    .   "When in warframe the function of the macro key is disabled (for instance if you bind ""h""" "`n"
                    .   "for showing the macro, when in warframe, pressing ""h"" will show/hide the macro and will not" "`n"
                    .   "write the character ""h""." "`n"
                    .   "To restore the original macro key function the combination ALT + Macro Key is used" "`n`n"

                    .   "You should use the Borderless Fullscreen or Windowed option of Warframe, otherwise" "`n"
                    .   "be ready for a lot of window switching" "`n`n"
                    
                    .   "Although this macro can prevent invalid key to be bound to functions it will not prevent" "`n"
                    .   "some weird behaviour. If this is the case (or if the macro goes crazy) you can panic exit" "`n"
                    .   "using the combination CTRL + SHIFT + ALT + F12 (I know it's a long combination but it" "`n"
                    .   "will prevent panic exit unintentionally)" "`n`n"

                    .   "Panic exiting will delete your saved settings so everything will be set to their default state" "`n`n"

                    .   "You can rebind keys in the Settings tab. Keys used are those from Autohotkey" "`n"
                    .   "Here's the <a href=""https://www.autohotkey.com/docs/KeyList.htm"">link for Autohotkey Keys</a>" "`n`n"

                    .   "Enjoy Tenno! :)"
        gui, % this.hwnd ":add", link, % "x12 y12 hwnd" "welcomeTextLabel", % welcomeTxt

        gui, % this.hwnd ":add", checkbox, % "x12 y" this.properties.height - 30 " checked" (SettingsTab.controls.showWelcomeCheckbox.getContent() = 0 ? 1 : 0) " hwnd" "hideWelcomeCheckbox", % "Hide welcome window at startup"
        gui, % this.hwnd ":add", button, % "x" this.properties.width - 180 " y" this.properties.height - 40 " w100 h30 hwnd" "showMacroButton", % "Show Macro"
        gui, % this.hwnd ":add", button, % "xp106 yp0 w60 h30 hwnd" "okButton", % "OK"

        ; - - - - - - -
        this.controls.welcomeTextLabel := new Label(welcomeTextLabel)

        this.controls.hideWelcomeCheckbox := new Checkbox(hideWelcomeCheckbox)
        this.controls.showMacroButton := new Button(showMacroButton)
        this.controls.okButton := new Button(okButton)
        ; - - - - - - -

        this.created := true

        ; handle window close
        function := ObjBindMethod(this, "onWindowClose")
        OnMessage(0x112, function)

        this.bindFunctions()
    }

    onWindowClose(wp, lp) {
        static SC_CLOSE := 0xF060
        if (A_Gui != this.hwnd)
        Return
        
        if (wp = SC_CLOSE) {
            this.destroyGui(0)
        }
    }

    showGui() {
        gui, % this.hwnd ":show", % "center w" this.properties.width " h" this.properties.height
    }

    bindFunctions() {
        function := ObjBindMethod(this, "destroyGui", "1")
        guiControl, % this.hwnd ":+g", % this.controls.showMacroButton.getHwnd(), % function

        function := ObjBindMethod(this, "destroyGui", "0")
        guiControl, % this.hwnd ":+g", % this.controls.okButton.getHwnd(), % function

        function := ObjBindMethod(this, "checkboxAction")
        guiControl, % this.hwnd ":+g", % this.controls.hideWelcomeCheckbox.getHwnd(), % function
    }

    destroyGui(showMacro) {
        if (    (showMacro = 1) 
            AND !(winexist("ahk_id" Gui.hwnd) or winactive("ahk_id" Gui.hwnd))){
            Gui.showHideGui()
        }

        this.created := false

        gui, % this.hwnd ":destroy"
        this.hwnd := ""
        this.controls := {}
    }

    checkboxAction() {
        SettingsTab.controls.showWelcomeCheckbox.setCheck(!this.controls.hideWelcomeCheckbox.getContent())
        iniWrite, % SettingsTab.controls.showWelcomeCheckbox.getContent(), % Ini.path, % "Macro", % "showWelcome"
    }

    isCreated() {
        return (this.created = true ? true : false)
    }
}