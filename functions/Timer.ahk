class Timer {

    __New(time, byref object, functionName, functionParameter, autoStart := 0) {
        if time is not integer
        {
            msgbox % "Error! Time is not a valid number"
            return
        } else if (time = 0) {
            msgbox % "Error! Time is 0"
            return
        }

        if (object = "" || functionName = "") {
            msgbox % "Error`n`n" (object = "" ? "No object`n") (functionName = "" ? "No function`n")
            return
        }

        this.time := time
        this.object := object
        this.functionName := functionName
        this.functionParameter := functionParameter

        this.active := 0
        this.funcObject := ObjBindMethod(this, "toggle")
        this.doAction := ObjBindMethod(this.object, this.functionName, this.functionParameter)
        this.sendKey := ObjBindMethod(this, "sendKeyTimer", this.functionParameter)

        if (autoStart = 1) {
            this.start()
        }
    }

    __Delete() {
        this.stop()
        
        this.object := ""
        this.functionName := ""
        this.functionParameter := ""

        this.funcObject := ""
        this.sendKey := ""
    }

    start() {
        if (!this.active) {
            function := (this.functionName != "sendKey" ? this.doAction : this.sendKey)
            SetTimer, % function, % this.time
            function := ""

            this.active := 1
        }
    }

    stop() {
         if (this.active) {
            function := (this.functionName != "sendKey" ? this.doAction : this.sendKey)
            SetTimer, % function, off
            function := ""

            this.active := 0
        }
    }

    toggle() {
        if (this.active = 0) {
            this.start()
        } else {
            this.stop()
        }
    }

    sendKeyTimer(ability) {
        if (winActive("ahk_exe Warframe.x64.exe") or winActive("ahk_exe Warframe.exe"))
            Send, % "{Blind}{" WarframeValues.keys.abilities[ability] "}"
    }

    changeTime(time) {
        if time is not integer
        {
            msgbox % "Error! Time is not a valid number"
            return
        } else if (time = 0) {
            msgbox % "Error! Time is 0"
            return
        }

        if (this.active = 1) {
            this.stop()
        }

        this.time := time
    }

    isActive() {
        return this.active
    }

    equals(secondTimer) {
        if !(this.object = secondTimer.object) 
            return 0
        if !(this.functionName = secondTimer.functionName)
            return 0
        if !(this.functionParameter = secondTimer.functionParameter)
            return 0

        return 1
    }
}