class AutomaticChatTab {
    static controls := {}

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Automatic Chat"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Automatic Chat"

        gui, % Gui.hwnd ":add", button, % "x6 y28 w22 h22 section hwnd" "infoButton", % "i"
        gui, % Gui.hwnd ":add", edit, % "x+10 yp1 w206 -wantReturn hwnd" "addEditItemTextbox"
        gui, % Gui.hwnd ":add", button, % "x+5 yp-1 w44 h22 disabled +default hwnd" "addItemButton", % "Add"
        gui, % Gui.hwnd ":add", button, % "x+5 w44 h22 disabled hwnd" "editItemButton", % "Edit"

        gui, % Gui.hwnd ":add", listbox, % "xs0 y+10 w239 r11 +vscroll +hscroll hwnd" "messagesListbox"

        gui, % Gui.hwnd ":add", checkbox, % "x+5 checked1 hwnd" "autoSortCheckbox", % "Automatic Sort"

        gui, % Gui.hwnd ":add", button, % "y+5 w93 section hwnd" "refreshItemsButton", % "Refresh list"
        gui, % Gui.hwnd ":add", button, % "y+5 w93 disabled hwnd" "moveUpItemButton", % "Move up"
        gui, % Gui.hwnd ":add", button, % "y+5 w93 disabled hwnd" "moveDownItemButton", % "Move down"
        gui, % Gui.hwnd ":add", button, % "y+5 w45 disabled hwnd" "deleteItemButton", % "Delete"
        gui, % Gui.hwnd ":add", button, % "x+3 w45 disabled hwnd" "deleteItemsButton", % "Empty"

        gui, % Gui.hwnd ":add", text, % "xs0 y+11 w97 0x10" ; horizontal line

        gui, % Gui.hwnd ":add", button, % "y+-2 w93 disabled hwnd" "startButton", % "Start"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.controls.infoButton := infoButton
        this.controls.addEditItemTextbox := addEditItemTextbox
        this.controls.addItemButton := addItemButton
        this.controls.editItemButton := editItemButton

        this.controls.messagesListbox := messagesListbox

        this.controls.autoSortCheckbox := autoSortCheckbox

        this.controls.refreshItemsButton := refreshItemsButton
        this.controls.moveUpItemButton := moveUpItemButton
        this.controls.moveDownItemButton := moveDownItemButton
        this.controls.deleteItemButton := deleteItemButton
        this.controls.deleteItemsButton := deleteItemsButton
        this.controls.startButton := startButton
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        AutomaticChat.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }
}