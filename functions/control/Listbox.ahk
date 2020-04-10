class Listbox extends Control {
    clear() {
        guiControl, , % this.hwnd, % "|"
    }

    setSelectedItemByName(itemName) {
        guiControl, chooseString, % this.hwnd, % itemName
    }
}