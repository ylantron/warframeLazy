class Control {
    isControlEnabled(hwnd) {
        guiControlGet, value, enabled, % hwnd
        return value
    }

    getControlText(hwnd) {
        guiControlGet, value, , % hwnd
        return value
    }

    getWidth(hwnd) {
        guiControlGet, value, pos, % hwnd
        return valuew
    }

    getHeight(hwnd) {
        guiControlGet, value, pos, % hwnd
        return valueh
    }

    getX(hwnd) {
        guiControlGet, value, pos, % hwnd
        return valuex
    }

    getY(hwnd) {
        guiControlGet, value, pos, % hwnd
        return valuey
    }

    getVisibility(hwnd) {
        GuiControlGet, value, Visible, % hwnd
        return value
    }

    setVisibility(control, state := "toggle") {
        switch state {
            case "on":      state := 1
            case "off":     state := 0
            case "toggle":  state := !this.getVisibility(control)

            case 1, case 0: ; do nothing

            default:
                msgbox % "Error! State is " state
        }

        GuiControl, % "Show" state, % control
    }

    setVisibilities(index, controls, state := "toggle") {
        switch state {
            case "on":      state := 1
            case "off":     state := 0
            case "toggle":  state := !this.getVisibility(control)

            case 1, case 0: ; do nothing

            default:
                msgbox % "Error! State is " state
        }

        loop % index {
            if (Object.isLinear(controls)) {
                for i, element in controls[A_Index] {
                    this.setVisibility(element, state)
                }
            } else {
                for i, element in controls {
                    this.setVisibility(element, state)
                }
            }
        }
    }
}