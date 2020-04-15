class Tooltip {
    static whichTooltip := {    1:false
                            ,   2:false
                            ,   3:false
                            ,   4:false
                            ,   5:false
                            ,   6:false
                            ,   7:false
                            ,   8:false
                            ,   9:false
                            ,   10:false
                            ,   11:false
                            ,   12:false
                            ,   13:false
                            ,   14:false
                            ,   15:false
                            ,   16:false
                            ,   17:false
                            ,   18:false
                            ,   19:false
                            ,   20:false}
    properties := {}

    __New(text, x := "", y := "") {
        this.text := text

        if (x != "") {
            this.properties.x := x
        }

        if (y != "") {
            this.properties.y := y
        }

        for i, val in whichTooltip {
            if (val = false) {
                this.nTooltip := 
                this.whichTooltip[i] := true
                break
            }
        }
    }

    __Delete() {
        this.text := ""
        this.properties := ""
        this.whichTooltip[nTooltip] := false
    }

    show() {
        tooltip, % this.text, % this.properties.x, % this.properties.y, % this.nTooltip
    }

    hide() {
        tooltip, , , , % this.nTooltip
    }

    getText() {
        return this.text
    }

    setText(text) {
        this.text := text
    }

    getXPos() {
        return this.properties.x
    }

    setXPos(x) {
        this.properties.x := x
    }

    getYPos() {
        return this.properties.y
    }

    setYPos(y) {
        this.properties.y := y
    }
}