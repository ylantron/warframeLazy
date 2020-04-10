#include %A_ScriptDir%/functions/control/ControlGroup.ahk

#include %A_ScriptDir%/functions/control/Button.ahk
#include %A_ScriptDir%/functions/control/Checkbox.ahk
#include %A_ScriptDir%/functions/control/DropDownList.ahk
#include %A_ScriptDir%/functions/control/Label.ahk
#include %A_ScriptDir%/functions/control/Listbox.ahk
#include %A_ScriptDir%/functions/control/Slider.ahk
#include %A_ScriptDir%/functions/control/Textbox.ahk
#include %A_ScriptDir%/functions/control/UpDown.ahk

class Control {
    __New(hwnd) {
        this.hwnd := hwnd
    }

    __Delete() {
        this.hwnd := ""
    }

    getHwnd() {
        return this.hwnd
    }

    getContent() {
        guiControlGet, value, , % this.hwnd
        return value
    }

    setContent(content) {
        guiControl, , % this.hwnd, % content
    }

    setText(text) {
        guiControl, text, % this.hwnd, % text
    }

    getWidth() {
        guiControlGet, value, pos, % this.hwnd
        return valuew
    }

    getHeight() {
        guiControlGet, value, pos, % this.hwnd
        return valueh
    }

    getX() {
        guiControlGet, value, pos, % this.hwnd
        return valuex
    }

    getY() {
        guiControlGet, value, pos, % this.hwnd
        return valuey
    }

    getVisibility() {
        GuiControlGet, value, Visible, % this.hwnd
        return value
    }

    setVisibility(state := "toggle") {
        switch state {
            case "on":      state := 1
            case "off":     state := 0
            case "toggle":  state := !this.getVisibility(this.hwnd)

            case 1, case 0: ; do nothing

            default:
                ;msgbox % "Error! State is " state
        }

        GuiControl, % "Show" state, % this.hwnd
    }

    setTextColor(color) {
        Gui, Font, % color
        GuiControl, Font, % this.hwnd
        Gui, Font
    }

    setFocus() {
        guiControl, focus, % this.hwnd
    }

    setEnable(state:= "toggle") {
        switch state {
            case "on":      state := 1
            case "off":     state := 0
            case "toggle":  state := !this.isEnabled(this.hwnd)

            case 1, case 0: ; do nothing

            default:
                ;msgbox % "Error! State is " state
        }

        guiControl, % "enable" state, % this.hwnd
    }

    isEnabled() {
        guiControlGet, value, enabled, % this.hwnd
        return value
    }

    clear() {
        guiControl, , % this.hwnd, % ""
    }
}