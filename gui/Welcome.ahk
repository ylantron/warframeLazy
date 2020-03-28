class Welcome {
    static hwnd
    static properties := {width:470, height:430}
    static controls := {}

    createGui() {
        gui, new, % "-resize -minimizeBox -MaximizeBox hwnd" "welcomeHwnd", % "Welcome"
        this.hwnd := welcomeHwnd

        welcomeTxt :=   "Hello! Welcome to Warframe Lazy!" "`n`n"

                    .   "This is a macro for easing some task like spinning in slide attacks or automating abilities." "`n"
                    .   "Any use of this macro is not condoned for afk purposes" "`n`n"

                    .   "Once started the macro will run in the background;" "`n"
                    .   "To show or hide it you have to press the combinations:" "`n"
                    .   "- CTRL + SHIFT + Macro Key (currently """ Gui.key """)" "`t" "for every window outside warframe" "`n"
                    .   "- Macro Key (currently """ Gui.key """)" "`t`t`t" "when warframe or macro has the focus" "`n`n"

                    .   "When in warframe the function of the macro key is disabled (for instance if you bind ""h""" "`n"
                    .   "for showing the macro, when in warframe, pressing ""h"" will show/hide the macro and will not" "`n"
                    .   "write the character ""h""." "`n"
                    .   "To restore the original macro key function the combination ALT + Macro Key is used" "`n`n"

                    .   "Settings of this macro are saved in the file ""warframeLazy.ini""" "`n"
                    .   "Deleting it will risult in the loss of your saved settings" "`n`n"

                    .   "Although this macro can prevent invalid key to be bound to functions it will not prevent" "`n"
                    .   "some weird behaviour. If this is the case (or if the macro goes crazy) you can panic exit" "`n"
                    .   "using the combination CTRL + SHIFT + ALT + F12 (I know it's a long combination but it" "`n"
                    .   "will prevent panic exit unintentionally)" "`n`n"

                    .   "Panic exiting will delete your saved settings so everything will be set to their default state" "`n`n"

                    .   "You can rebind keys in the Settings tab. Keys used are those from Autohotkey" "`n"
                    .   "Here's the <a href=""https://www.autohotkey.com/docs/KeyList.htm"">link for Autohotkey Keys</a>" "`n`n"

                    .   "Enjoy Tenno! :)"
        gui, % this.hwnd ":add", link, % "x12 y12 hwnd" "welcomeTextLabel", % welcomeTxt

        gui, % this.hwnd ":add", checkbox, % "x12 y" this.properties.height - 30 " checked0 hwnd" "hideWelcomeCheckbox", % "Hide welcome window at startup"
        gui, % this.hwnd ":add", button, % "x" this.properties.width - 180 " y" this.properties.height - 40 " w100 h30 hwnd" "showMacroButton", % "Show Macro"
        gui, % this.hwnd ":add", button, % "xp106 yp0 w60 h30 hwnd" "okButton", % "OK"

        ; - - - - - - -
        this.controls.welcomeTextLabel := welcomeTextLabel

        this.controls.hideWelcomeCheckbox := hideWelcomeCheckbox
        this.controls.showMacroButton := showMacroButton
        this.controls.okButton := okButton
        ; - - - - - - -
        this.bindFunctions()
    }

    showGui() {
        gui, % this.hwnd ":show", % "center w" this.properties.width " h" this.properties.height
    }

    bindFunctions() {
        function := ObjBindMethod(this, "destroyGui", "1")
        guiControl, % this.hwnd ":+g", % this.controls.showMacroButton, % function

        function := ObjBindMethod(this, "destroyGui", "0")
        guiControl, % this.hwnd ":+g", % this.controls.okButton, % function
    }

    destroyGui(showMacro) {
        if (Control.getControlText(this.controls.hideWelcomeCheckbox)) {
            guiControl, , % SettingsTab.controls.showWelcomeCheckbox, 0
            iniWrite, % Control.getControlText(SettingsTab.controls.showWelcomeCheckbox), % Ini.path, % "Macro", % "showWelcome"
        }

        if (showMacro = 1) {
            Gui.showHideGui()
        }

        gui, % this.hwnd ":destroy"
        this.hwnd := ""
        this.properties := ""
        this.controls := ""
    }
}