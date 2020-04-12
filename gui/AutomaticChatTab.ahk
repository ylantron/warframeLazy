Gui.ownedClasses.Push(AutomaticChatTab)

class AutomaticChatTab {
    static controls := {}

    createGui() {
        guiControl, text, % Gui.controls.tabs, % "Automatic Chat"

        ; - - - .:| Adding controls to gui |:. - - -
        gui, % Gui.hwnd ":tab", % "Automatic Chat"

        gui, % Gui.hwnd ":add", button, % "x6 y28 w22 h22 hwnd" "infoButton", % "i"
        gui, % Gui.hwnd ":add", edit, % "x+10 yp1 w206 -wantReturn hwnd" "addEditItemTextbox"
        gui, % Gui.hwnd ":add", button, % "x+5 yp-1 w44 h22 disabled +default hwnd" "addItemButton", % "Add"
        gui, % Gui.hwnd ":add", button, % "x+5 w44 h22 disabled hwnd" "editItemButton", % "Edit"

        gui, % Gui.hwnd ":add", text, % "x6 y+9 hwnd" "filterLabel", % "Filter:"
        gui, % Gui.hwnd ":add", dropdownList, % "x+7 yp-4 w206 section hwnd" "filterDropDownList", % "All||Recruiting|Trading|Private Messages|Miscellaneous"
        gui, % Gui.hwnd ":add", listbox, % "x6 y+3 w239 r11 +vscroll +hscroll hwnd" "messagesListbox"

        gui, % Gui.hwnd ":add", checkbox, % "x+5 ys3 checked1 hwnd" "autoSortCheckbox", % "Automatic Sort"

        gui, % Gui.hwnd ":add", button, % "y+6 w93 section hwnd" "refreshItemsButton", % "Refresh list"
        gui, % Gui.hwnd ":add", button, % "y+5 w93 disabled hwnd" "moveUpItemButton", % "Move up"
        gui, % Gui.hwnd ":add", button, % "y+5 w93 disabled hwnd" "moveDownItemButton", % "Move down"
        gui, % Gui.hwnd ":add", button, % "y+5 w45 disabled hwnd" "deleteItemButton", % "Delete"
        gui, % Gui.hwnd ":add", button, % "x+3 w45 disabled hwnd" "deleteItemsButton", % "Empty"

        gui, % Gui.hwnd ":add", text, % "xs0 y+7 w97 0x10" ; horizontal line

        gui, % Gui.hwnd ":add", button, % "y+-6 w93 disabled hwnd" "sendButton", % "Send"
        gui, % Gui.hwnd ":add", button, % "y+5 w93 disabled hwnd" "startButton", % "Start"
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Storing controls hwnd |:. - - -
        this.controls.infoButton := new Button(infoButton)
        this.controls.addEditItemTextbox := new Textbox(addEditItemTextbox)
        this.controls.addItemButton := new Button(addItemButton)
        this.controls.editItemButton := new Button(editItemButton)

        this.controls.filterDropDownList := new Listbox(filterDropDownList)
        this.controls.messagesListbox := new Listbox(messagesListbox)

        this.controls.autoSortCheckbox := new Checkbox(autoSortCheckbox)

        this.controls.refreshItemsButton := new Button(refreshItemsButton)
        this.controls.moveUpItemButton := new Button(moveUpItemButton)
        this.controls.moveDownItemButton := new Button(moveDownItemButton)
        this.controls.deleteItemButton := new Button(deleteItemButton)
        this.controls.deleteItemsButton := new Button(deleteItemsButton)
        this.controls.sendButton := new Button(sendButton)
        this.controls.startButton := new Button(startButton)
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

        ; - - - .:| Including and binding functions to controls |:. - - -
        AutomaticChat.include()
        ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
    }
}