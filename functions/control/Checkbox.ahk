class Checkbox extends Control {
    setCheck(state) {
        switch state {
            case "on":      state := 1
            case "off":     state := 0
            case "toggle":  state := !this.getContent()

            case 1, case 0: ; do nothing

            default:
                ;msgbox % "Error! State is " state
        }

        guiControl, , % this.hwnd, % state
    }
}