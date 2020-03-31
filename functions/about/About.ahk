class About {
    include() {
        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "showChangelog")
        guiControl, % Gui.hwnd ":+g", % AboutTab.controls.changelogButton, % function
    }

    showChangelog() {
        changelog := ""

        loop, read, % Ini.pathChangelog
        {
            changelog .= A_LoopReadLine "`n"
        }

        new Message(changelog)
    }
}