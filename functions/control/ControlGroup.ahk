class ControlGroup {
    __New() {
        this.controls := []
    }

    addControl(controlElement) {
        this.controls.Push(controlElement)
    }

    getControl(index) {
        return this.controls[index]
    }

    setVisibility(state := "toggle") {
        loop, % this.controls.Length() {
            this.controls[A_Index].setVisibility(state)
        }
    }
}