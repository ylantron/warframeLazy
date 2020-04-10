Gui.ownedClasses.Push(AboutTab)

class AboutTab {
    static controls := {}

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "About"

        gui, % Gui.hwnd ":tab", % "About"

        gui, % Gui.hwnd ":add", picture, % "x10 y12", % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\icon.png"

        gui, % Gui.hwnd ":font", % "s14 w500"
        gui, % Gui.hwnd ":add", text, % "x+14 yp20", % "Warframe Lazy"
        gui, % Gui.hwnd ":font", % "s10 w350"
        gui, % Gui.hwnd ":add", text, % "y+4", % "Version " MacroValues.release "." MacroValues.version "." MacroValues.revision
        gui, font
        gui, % Gui.hwnd ":add", button, % "y+4 hwnd" "changelogButton", % "What's new?"



        gui, % Gui.hwnd ":add", picture, % "x10 y" Gui.properties.height - 75, % substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\Ylantron.png"

        gui, font, % "s11 w100"
        gui, % Gui.hwnd ":add", text, % "x+10 yp12", % "By Ylan Anderson"
        gui, font

        ; - - - - - - - - - -

        this.controls.changelogButton := changelogButton

        ; - - - - - - - - - -

        About.include()
    }
}