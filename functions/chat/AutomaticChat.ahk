class AutomaticChat {
    static className := "Automatic Chat"
    static enabled := 0
    static key := "t"
    static messagesListboxItems := []
    static chatDelay := 120000
    static chatTimer
    static checkTimer

    include() {
        this.bindFunctions()
    }

    bindFunctions() {
        function := ObjBindMethod(this, "showInfo")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.infoButton, % function

        function := ObjBindMethod(this, "changeAddEditButtonsState")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.addEditItemTextbox, % function

        function := ObjBindMethod(this, "addItem", "")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.addItemButton, % function

        function := ObjBindMethod(this, "editItem", "")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.editItemButton, % function

        function := ObjBindMethod(this, "itemsListboxEvents")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.messagesListbox, % function

        function := ObjBindMethod(this, "sortCheckboxEvent")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.autoSortCheckbox, % function

        function := ObjBindMethod(this, "readChatFile")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.refreshItemsButton, % function

        function := ObjBindMethod(this, "moveItem", "up")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.moveUpItemButton, % function

        function := ObjBindMethod(this, "moveItem", "down")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.moveDownItemButton, % function

        function := ObjBindMethod(this, "deleteItem")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.deleteItemButton, % function

        function := ObjBindMethod(this, "emptyList", "1")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.deleteItemsButton, % function

        function := ObjBindMethod(this, "setAction", "1")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.startButton, % function
    }

    showInfo() {
        new Message(    "WARNING: these functions are not in sync with Warframe!"
                    .   "`nThat means some weird behaviour can happen."
                    
                    .   "`n`n1) In game select the channel where you want to automatically send messages (or use warframe chat commands to switch it) and close the chat."
                    .   "`n2) Select the message you want to automatically send from the list and press ""Start"" (if it doesn't exist you can add it typing it and clicking ""Add"""
                    .   "`n3) The macro will automatically open the chat, type and send the message 10 seconds after the chat cooldown ends"
                    
                    .   "`n`nAny key pressed while auto chat is on will disable it")
    }

    changeAddEditButtonsState() {
        if (Control.getControlText(AutomaticChatTab.controls.addEditItemTextbox) != "") {   ; if textbox is not empty
            guiControl, enable1, % AutomaticChatTab.controls.addItemButton

            if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) != "") { ; if an item of listbox is selected, enable edit button too
                guiControl, enable1, % AutomaticChatTab.controls.editItemButton
            }
            ;
        } else { ; if textbox is not empty
            guiControl, enable0, % AutomaticChatTab.controls.addItemButton
            guiControl, enable0, % AutomaticChatTab.controls.editItemButton
        }
    }

    changeListboxButtonsState() {
        ; MOVE AND START BUTTONS HANDLING
        if (Control.getControlText(AutomaticChatTab.controls.autoSortCheckbox) = 1) { ; if sort checkbox is checked
            guiControl, enable0, % AutomaticChatTab.controls.moveUpItemButton
            guiControl, enable0, % AutomaticChatTab.controls.moveDownItemButton
        } else { ; if sort checkbox is not checked
            if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) != "") { ; if an item is selected
                if (this.messagesListboxItems.Length() = 1) { ; if there's only one item in the list
                    guiControl, enable0, % AutomaticChatTab.controls.moveUpItemButton
                    guiControl, enable0, % AutomaticChatTab.controls.moveDownItemButton
                } else if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) = this.messagesListboxItems[1]) { ; if item selected is already first in the list
                    guiControl, enable0, % AutomaticChatTab.controls.moveUpItemButton
                    guiControl, enable1, % AutomaticChatTab.controls.moveDownItemButton
                } else if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) = this.messagesListboxItems[this.messagesListboxItems.Length()]) { ; if item selected is already last in the list
                    guiControl, enable1, % AutomaticChatTab.controls.moveUpItemButton
                    guiControl, enable0, % AutomaticChatTab.controls.moveDownItemButton
                } else {
                    guiControl, enable1, % AutomaticChatTab.controls.moveUpItemButton
                    guiControl, enable1, % AutomaticChatTab.controls.moveDownItemButton
                }
            } else { ; if an item is not selected
                guiControl, enable0, % AutomaticChatTab.controls.moveUpItemButton
                guiControl, enable0, % AutomaticChatTab.controls.moveDownItemButton
            }
        }

        ; DELETE BUTTONS HANDLING
        if (this.messagesListboxItems.Length() > 0) {
            guiControl, % "enable" (Control.getControlText(AutomaticChatTab.controls.messagesListbox) != "" ? 1 : 0), % AutomaticChatTab.controls.deleteItemButton
            guiControl, enable1, % AutomaticChatTab.controls.deleteItemsButton
        } else {
            guiControl, enable0, % AutomaticChatTab.controls.deleteItemButton
            guiControl, enable0, % AutomaticChatTab.controls.deleteItemsButton
        }

        ; START BUTTON HANDLING
        guiControl, % "enable" (Control.getControlText(AutomaticChatTab.controls.messagesListbox) != "" ? 1 : 0), % AutomaticChatTab.controls.startButton
    }

    addItem() {
        item := Control.getControlText(AutomaticChatTab.controls.addEditItemTextbox)

        for i, val in this.messagesListboxItems {
            if (item = val) { ; found a duplicate
                guiControl, , % AutomaticChatTab.controls.addEditItemTextbox, % ""
                guiControl, focus, % AutomaticChatTab.controls.addEditItemTextbox
                return
            }
        }

        this.messagesListboxItems.Push(item)

        if (Control.getControlText(AutomaticChatTab.controls.autoSortCheckbox) = 1) { ; 
            this.messagesListboxItems := this.sortArray(this.messagesListboxItems)
        }

        this.refreshItems()

        guiControl, , % AutomaticChatTab.controls.addEditItemTextbox, % ""
        guiControl, focus, % AutomaticChatTab.controls.addEditItemTextbox

        this.changeListboxButtonsState()
    }

    editItem() {
        loop, % this.messagesListboxItems.Length() {
            if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) = this.messagesListboxItems[A_Index]) {
                this.messagesListboxItems[A_Index] := (item = "" ? Control.getControlText(AutomaticChatTab.controls.addEditItemTextbox) : item)
                preselectItem :=  this.messagesListboxItems[A_Index]
                continue
            }
        }
        this.refreshItems(preselectItem)

        guiControl, , % AutomaticChatTab.controls.addEditItemTextbox, % ""
        guiControl, focus, % AutomaticChatTab.controls.addEditItemTextbox
    }

    deleteItem(item) {
        loop, % this.messagesListboxItems.Length() {
            if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) = this.messagesListboxItems[A_Index]) {
                this.messagesListboxItems.RemoveAt(A_Index)
                guiControl, choose , % AutomaticChatTab.controls.messagesListbox, % "0"
                preselectItem := this.messagesListboxItems[A_Index + 1]
                break
            }
        }

        this.refreshItems(preselectItem)
        this.changeListboxButtonsState()
    }

    emptyList(confirmPrompt := 0) {
        if (confirmPrompt = 1) {
            msgBox, 4, % "Warframe Lazy", % "Are you sure you want to delete all messages?"
            ifMsgBox, % "No"
            {
                return
            }
        }

        guiControl, , % AutomaticChatTab.controls.messagesListbox, % "|"
        this.messagesListboxItems := []
        fileDelete, % Ini.pathChat
        this.changeListboxButtonsState()
    }

    refreshItems(preselectItem := "") {
        str := "|"
        fileDelete, % Ini.pathChat

        loop, % this.messagesListboxItems.Length() {
            str .= this.messagesListboxItems[A_Index] (preselectItem != this.messagesListboxItems[A_Index] ? "|" : "||")
            fileAppend, % this.messagesListboxItems[A_Index] "`n", % Ini.pathChat
        }

        guiControl, , % AutomaticChatTab.controls.messagesListbox, % str
    }

    itemsListboxEvents() {
        if (A_GuiControlEvent = "Normal") { ; if user clicked an item
            this.changeListboxButtonsState()
        } else if (A_GuiControlEvent = "DoubleClick") { ; if user double clicked an item
            guiControl, , % AutomaticChatTab.controls.addEditItemTextbox, % Control.getControlText(AutomaticChatTab.controls.messagesListbox)
            guiControl, focus, % AutomaticChatTab.controls.addEditItemTextbox
        }
    }

    moveItem(direction) {
        item := ""
        tmp := ""

        loop, % this.messagesListboxItems.Length() {
            if (Control.getControlText(AutomaticChatTab.controls.messagesListbox) = this.messagesListboxItems[A_Index]) {
                item := this.messagesListboxItems[A_Index]
                if (direction = "up") {
                    tmp := this.messagesListboxItems[A_Index -1]
                    this.messagesListboxItems[A_Index -1] := this.messagesListboxItems[A_Index]
                    this.messagesListboxItems[A_Index] := tmp
                } else if (direction = "down") {
                    tmp := this.messagesListboxItems[A_Index +1]
                    this.messagesListboxItems[A_Index +1] := this.messagesListboxItems[A_Index]
                    this.messagesListboxItems[A_Index] := tmp
                }
                break
            }
        }

        this.refreshItems()

        guiControl, chooseString, % AutomaticChatTab.controls.messagesListbox, % item
        guiControl, focus, % AutomaticChatTab.controls.addEditItemTextbox
        this.changeListboxButtonsState()
    }

    sortCheckboxEvent() {
        this.sortArray(this.messagesListboxItems)
        this.refreshItems()
        this.changeListboxButtonsState()
        iniWrite, % Control.getControlText(AutomaticChatTab.controls.autoSortCheckbox), % Ini.path, % this.className, % "autoSort"
    }

    sortArray(array) {
        if (array.Length() <= 1) {
            return array
        }


        x := 1
        y := 2
        z := 1

        while (x < array.Length()) {
            y := x + 1

            while (y <= array.Length()) {
                length := array.Length()
                while ( (substr(array[x], z, 1) = substr(array[y], z, 1))
                    AND (z < Max(strLen(array[x]), strLen(array[y])))) {
                    z++
                }

                length := array.Length()
                firstLetter := substr(array[x], z, 1)
                secondLetter := substr(array[y], z, 1)
                length := array.Length()

                if (substr(array[x], z, 1) > substr(array[y], z, 1)) {
                    tmp := array[x]
                    array[x] := array[y]
                    array[y] := tmp
                }

                length := array.Length()

                z := 1
                y++
            }

            x++
        }

        return array
    }

    setAction() {
        if !(winExist("ahk_exe Warframe.x64.exe") or winExist("ahk_exe Warframe.exe")) {
            new Message("Warframe not found!")
            return
        }

        this.chatTimer := new Timer(this.chatDelay + 10000, this, "doAction", "")
        

        Gui.showHideGui() ;hide gui
        if (winexist("ahk_exe Warframe.exe")) {
            winActivate, % "ahk_exe Warframe.exe"
        } else if (winexist("ahk_exe Warframe.x64.exe")) {
            winActivate, % "ahk_exe Warframe.x64.exe"
        }

        sleep, 1000
        send, % "{" WarframeValues.keys.chat "}"
        sleep, 200
        this.doAction()
        this.chatTimer.start() 
        this.checkTimer := new Timer(-50, this, "checkButtonPressed", "", 1)
    }

    doAction() {
        send, % Control.getControlText(AutomaticChatTab.controls.messagesListbox)
        sleep, 500
        send, % "{enter}"
    }

    checkButtonPressed() {
        loop {
            input, val, l1 i
        } until (val != "")

        new Message("Automatic chat was disabled")

        this.chatTimer.stop()
        send, % "{esc}"

        this.chatTimer := ""
        this.checkTimer := ""
    }

    loadSettings() {
        guiControl, , % AutomaticChatTab.controls.autoSortCheckbox, % Ini.readIni(this.className, "autoSort")
        this.readChatFile()
    }

    readChatFile() {
        this.messagesListboxItems := []

        loop, read, % Ini.pathChat
        {
            if (A_LoopReadLine != "") {
                this.messagesListboxItems.Push(A_LoopReadLine)
            }
        }
        this.refreshItems()
        this.changeListboxButtonsState()
    }
}