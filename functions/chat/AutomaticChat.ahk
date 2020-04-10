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
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.infoButton.getHwnd(), % function

        function := ObjBindMethod(this, "changeAddEditButtonsState")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.addEditItemTextbox.getHwnd(), % function

        function := ObjBindMethod(this, "addItem", "")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.addItemButton.getHwnd(), % function

        function := ObjBindMethod(this, "editItem", "")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.editItemButton.getHwnd(), % function

        function := ObjBindMethod(this, "itemsListboxEvents")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.messagesListbox.getHwnd(), % function

        function := ObjBindMethod(this, "sortCheckboxEvent")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.autoSortCheckbox.getHwnd(), % function

        function := ObjBindMethod(this, "readChatFile")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.refreshItemsButton.getHwnd(), % function

        function := ObjBindMethod(this, "moveItem", "up")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.moveUpItemButton.getHwnd(), % function

        function := ObjBindMethod(this, "moveItem", "down")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.moveDownItemButton.getHwnd(), % function

        function := ObjBindMethod(this, "deleteItem")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.deleteItemButton.getHwnd(), % function

        function := ObjBindMethod(this, "emptyList", "1")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.deleteItemsButton.getHwnd(), % function

        function := ObjBindMethod(this, "setAction", "1")
        guiControl, % Gui.hwnd ":+g", % AutomaticChatTab.controls.startButton.getHwnd(), % function
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
        if (AutomaticChatTab.controls.addEditItemTextbox.getContent() != "") {   ; if textbox is not empty
            AutomaticChatTab.controls.addItemButton.setEnable("on")

            if (AutomaticChatTab.controls.messagesListbox.getContent() != "") { ; if an item of listbox is selected, enable edit button too
                AutomaticChatTab.controls.editItemButton.setEnable("on")
            } else {
                AutomaticChatTab.controls.editItemButton.setEnable("off")
            }
        } else { ; if textbox is empty
            AutomaticChatTab.controls.addItemButton.setEnable("off")
            AutomaticChatTab.controls.editItemButton.setEnable("off")
        }
    }

    changeListboxButtonsState() {
        ; MOVE AND START BUTTONS HANDLING
        if (AutomaticChatTab.controls.autoSortCheckbox.getContent() = 1) { ; if sort checkbox is checked
            AutomaticChatTab.controls.moveUpItemButton.setEnable("off")
            AutomaticChatTab.controls.moveDownItemButton.setEnable("off")
        } else { ; if sort checkbox is not checked
            if (AutomaticChatTab.controls.messagesListbox.getContent() != "") { ; if an item is selected
                if (this.messagesListboxItems.Length() = 1) { ; if there's only one item in the list
                    AutomaticChatTab.controls.moveUpItemButton.setEnable("off")
                    AutomaticChatTab.controls.moveDownItemButton.setEnable("off")
                } else if (AutomaticChatTab.controls.messagesListbox.getContent() = this.messagesListboxItems[1]) { ; if item selected is already first in the list
                    AutomaticChatTab.controls.moveUpItemButton.setEnable("off")
                    AutomaticChatTab.controls.moveDownItemButton.setEnable("on")
                } else if (AutomaticChatTab.controls.messagesListbox.getContent() = this.messagesListboxItems[this.messagesListboxItems.Length()]) { ; if item selected is already last in the list
                    AutomaticChatTab.controls.moveUpItemButton.setEnable("on")
                    AutomaticChatTab.controls.moveDownItemButton.setEnable("off")
                } else {
                    AutomaticChatTab.controls.moveUpItemButton.setEnable("on")
                    AutomaticChatTab.controls.moveDownItemButton.setEnable("on")
                }
            } else { ; if an item is not selected
                AutomaticChatTab.controls.moveUpItemButton.setEnable("off")
                AutomaticChatTab.controls.moveDownItemButton.setEnable("off")
            }
        }

        ; DELETE BUTTONS HANDLING
        if (this.messagesListboxItems.Length() > 0) {
            AutomaticChatTab.controls.deleteItemButton.setEnable(AutomaticChatTab.controls.messagesListbox.getContent() != "" ? 1 : 0)
            AutomaticChatTab.controls.deleteItemsButton.setEnable("on")
        } else {
            AutomaticChatTab.controls.deleteItemButton.setEnable("off")
            AutomaticChatTab.controls.deleteItemsButton.setEnable("off")
        }

        ; START BUTTON HANDLING
        AutomaticChatTab.controls.startButton.setEnable(AutomaticChatTab.controls.messagesListbox.getContent() != "" ? 1 : 0)
    }

    addItem() {
        item := AutomaticChatTab.controls.addEditItemTextbox.getContent()

        for i, val in this.messagesListboxItems {
            if (item = val) { ; found a duplicate
                AutomaticChatTab.controls.addEditItemTextbox.clear()
                AutomaticChatTab.controls.addEditItemTextbox.setFocus()
                return
            }
        }

        this.messagesListboxItems.Push(item)

        if (AutomaticChatTab.controls.autoSortCheckbox.getContent() = 1) { ; 
            this.messagesListboxItems := this.sortArray(this.messagesListboxItems)
        }

        this.refreshItems()

        AutomaticChatTab.controls.addEditItemTextbox.clear()
        AutomaticChatTab.controls.addEditItemTextbox.setFocus()

        this.changeListboxButtonsState()
    }

    editItem() {
        loop, % this.messagesListboxItems.Length() {
            if (AutomaticChatTab.controls.messagesListbox.getContent() = this.messagesListboxItems[A_Index]) {
                this.messagesListboxItems[A_Index] := AutomaticChatTab.controls.addEditItemTextbox.getContent()
                preselectItem :=  this.messagesListboxItems[A_Index]
                break
            }
        }
        this.refreshItems(preselectItem)

        AutomaticChatTab.controls.addEditItemTextbox.clear()
        AutomaticChatTab.controls.addEditItemTextbox.setFocus()
    }

    deleteItem(item) {
        loop, % this.messagesListboxItems.Length() {
            if (AutomaticChatTab.controls.messagesListbox.getContent() = this.messagesListboxItems[A_Index]) {
                this.messagesListboxItems.RemoveAt(A_Index)
                preselectItem := this.messagesListboxItems[A_Index]
                break
            }
        }

        this.refreshItems(preselectItem)
        this.changeListboxButtonsState()
        this.changeAddEditButtonsState()
    }

    emptyList(confirmPrompt := 0) {
        if (confirmPrompt = 1) {
            msgBox, 4, % "Warframe Lazy", % "Are you sure you want to delete all messages?"
            ifMsgBox, % "No"
            {
                return
            }
        }

        AutomaticChatTab.controls.messagesListbox.clear()
        this.messagesListboxItems := []
        fileDelete, % Ini.pathChat
        this.changeListboxButtonsState()
        this.changeAddEditButtonsState()
    }

    refreshItems(preselectItem := "") {
        str := "|"
        fileDelete, % Ini.pathChat

        loop, % this.messagesListboxItems.Length() {
            str .= this.messagesListboxItems[A_Index] (preselectItem != this.messagesListboxItems[A_Index] ? "|" : "||")
            fileAppend, % this.messagesListboxItems[A_Index] "`n", % Ini.pathChat
        }

        AutomaticChatTab.controls.messagesListbox.setContent(str)
    }

    itemsListboxEvents() {
        if (A_GuiControlEvent = "Normal") { ; if user clicked an item
            this.changeListboxButtonsState()
        } else if (A_GuiControlEvent = "DoubleClick") { ; if user double clicked an item
            AutomaticChatTab.controls.addEditItemTextbox.setContent(AutomaticChatTab.controls.messagesListbox.getContent())
            AutomaticChatTab.controls.addEditItemTextbox.setFocus()
        }
    }

    moveItem(direction) {
        item := ""
        tmp := ""

        loop, % this.messagesListboxItems.Length() {
            if (AutomaticChatTab.controls.messagesListbox.getContent() = this.messagesListboxItems[A_Index]) {
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

        AutomaticChatTab.controls.messagesListbox.setSelectedItemByName(item)
        AutomaticChatTab.controls.addEditItemTextbox.setFocus()
        this.changeListboxButtonsState()
    }

    sortCheckboxEvent() {
        this.sortArray(this.messagesListboxItems)
        this.refreshItems()
        this.changeListboxButtonsState()
        iniWrite, % AutomaticChatTab.controls.autoSortCheckbox.getContent(), % Ini.path, % this.className, % "autoSort"
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
        send, % AutomaticChatTab.controls.messagesListbox.getContent()
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
        valLoaded := Ini.readIni(this.className, "autoSort")
        if (valLoaded != 0 AND valLoaded != 1) {
            valLoaded := 1
        }
        AutomaticChatTab.controls.autoSortCheckbox.setCheck(valLoaded)
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