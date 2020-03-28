class WarframeValues {
    static keys = {     jump:"Space"
                    ,   moveForward:"w"
                    ,   moveLeft:"a"
                    ,   moveBackward:"s"
                    ,   moveRight:"d"
                    ,   moveUpArchwing:"Space"
                    ,   moveDownArchwing:"LCtrl"
                    ,   fireWeapon:"LButton"
                    ,   aimWeapon:"RButton"
                    ,   secondaryFire:"MButton"
                    ,   reload:"c"
                    ,   crouchToggle:"v"
                    ,   crouchHold:"LCtrl"
                    ,   sprintRoll:"LShift"
                    ,   sprint:""
                    ,   roll:""
                    ,   use:"x"
                    ,   meleeAttack:"e"
                    ,   meleeAttackHeavy:"MButton"
                    ,   switchWeapon:"f"
                    ,   switchGun:""
                    ,   gearWheel:"q"
                    ,   chat:"t"
                    ,   abilities:["1","2","3","4","5"]
                    ,   nextPower:"WheelUp"
                    ,   previousPower:"WheelDown"
                    ,   useSelectedPower:""
                    ,   placeMarker:"g"
                    ,   reverseCamera:"h"
                    ,   spectateNextPlayer:""
                    ,   spectatePreviousPlayer:"o"
                    ,   showPlayerList:"z"
                    ,   pushToTalk:"c"
                    ,   inspect:"i"
                    ,   gears:[]
                    ,   emotes:[]
                    ,   showLevelMap:"m"
                    ,   viewMissionProgress:"p"
                    ,   quickMissionProgress:"Tab"
                    ,   subGears:["1","2","3"]
                    
                    ,   railjackMoveForward:"w"
                    ,   railjackMoveLeft:"a"
                    ,   railjackMoveBackward:"s"
                    ,   railjackMoveRight:"d"
                    ,   railjackMoveUp:"Space"
                    ,   railjackMoveDown:"LCtrl"
                    ,   railjackBankLeft:"q"
                    ,   railjackBankRight:"e"
                    ,   railjackBoostManeuver:"LShift"
                    ,   railjackBoost:"e"
                    ,   railjackManeuver:"e"
                    ,   railjackDismount:"x"
                    ,   railjackPrimaryFire:"LButton"
                    ,   railjackAimWeapon:"RButton"
                    ,   railjackOrdnance:"MButton"
                    ,   railjackTacticalMenu:"l"
                    ,   railjackRailjackCamera:"RCtrl"
                    ,   railjackPushToTalk:"c"
                    
                    ,   shawzinFirstString:"1"
                    ,   shawzinSecondString:"2"
                    ,   shawzinThirdString:"3"
                    ,   shawzinWhammy:"Space"
                    ,   shawzinSkyFret:"Left"
                    ,   shawzinEarthFret:"Down"
                    ,   shawzinWaterFret:"Right"
                    ,   shawzinScale:"Tab"
                    ,   shawzinSongs:"w"
                    ,   shawzinChangeInstrument:"a"}

    static email

    assignKey(command = "", key = "") {
        switch command
        {
            case "JUMP":                    this.keys.jump := this.wfKeyToItaKey(key)
            ;case move w
            ;case move a
            ;case move s
            ;case move d
            ;case move up archwing
            ;case move down archwing
            case "PRE_ATTACK":              this.keys.fireWeapon := this.wfKeyToItaKey(key)
            case "AIM_WEAPON":              this.keys.aimWeapon := this.wfKeyToItaKey(key)
            case "SECONDARY_FIRE":          this.keys.secondaryFire := this.wfKeyToItaKey(key)
            case "RELOAD":                  this.keys.reload := this.wfKeyToItaKey(key)
            case "CROUCH":                  this.keys.crouchToggle := this.wfKeyToItaKey(key)
            case "HOLD_CROUCH":             this.keys.crouchHold := this.wfKeyToItaKey(key)
            case "PRE_RUN":                 this.keys.sprintRoll := this.wfKeyToItaKey(key)
            case "RUN":                     this.keys.sprint := this.wfKeyToItaKey(key)
            case "ACTION":                  this.keys.roll := this.wfKeyToItaKey(key)
            case "USE":                     this.keys.use := this.wfKeyToItaKey(key)
            case "MELEE":                   this.keys.meleeAttack := this.wfKeyToItaKey(key)
            case "MELEE_CHANNEL":           this.keys.meleeAttackHeavy := this.wfKeyToItaKey(key)
            case "NEXT_INV":                this.keys.switchWeapon := this.wfKeyToItaKey(key)
            case "SWITCH_GUN":              this.keys.switchGun := this.wfKeyToItaKey(key)
            case "MINI_INVENTORY_HOLD":     this.keys.gearWheel := this.wfKeyToItaKey(key)
            case "TOGGLE_CHAT_WINDOW":      this.keys.chat := this.wfKeyToItaKey(key)
            case "ACTIVATE_ABILITY_0":      this.keys.abilities[1] := this.wfKeyToItaKey(key)
            case "ACTIVATE_ABILITY_1":      this.keys.abilities[2] := this.wfKeyToItaKey(key)
            case "ACTIVATE_ABILITY_2":      this.keys.abilities[3] := this.wfKeyToItaKey(key)
            case "ACTIVATE_ABILITY_3":      this.keys.abilities[4] := this.wfKeyToItaKey(key)
            case "ACTIVATE_ABILITY_4":      this.keys.abilities[5] := this.wfKeyToItaKey(key)
            case "CYCLE_POWER_NEXT":        this.keys.nextPower := this.wfKeyToItaKey(key)
            case "CYCLE_POWER_PREV":        this.keys.previousPower := this.wfKeyToItaKey(key)
            case "POWER_MODIFIER":          this.keys.useSelectedPower := this.wfKeyToItaKey(key)
            case "SHOW_SECRET_1":           this.keys.placeMarker := this.wfKeyToItaKey(key)
            case "REVERSE_CAMERA_OFFSET":   this.keys.reverseCamera := this.wfKeyToItaKey(key)
            case "CYCLE_CAMERA_NEXT":       this.keys.spectateNextPlayer := this.wfKeyToItaKey(key)
            case "CYCLE_CAMERA_PREV":       this.keys.spectatePreviousPlayer := this.wfKeyToItaKey(key)
            case "VIEW_HUMAN_PLAYERS":      this.keys.showPlayerList := this.wfKeyToItaKey(key)
            case "PUSH_TO_TALK":            this.keys.pushToTalk := this.wfKeyToItaKey(key)
            case "INSPECT":                 this.keys.inspect := this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_0":           this.keys.gears[1]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_1":           this.keys.gears[2]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_2":           this.keys.gears[3]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_3":           this.keys.gears[4]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_4":           this.keys.gears[5]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_5":           this.keys.gears[6]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_6":           this.keys.gears[7]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_7":           this.keys.gears[8]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_8":           this.keys.gears[9]:= this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_9":           this.keys.gears[10] := this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_10":          this.keys.gears[11] := this.wfKeyToItaKey(key)
            case "GEAR_HOTKEY_11":          this.keys.gears[12] := this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_0":          this.keys.emotes[1]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_1":          this.keys.emotes[2]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_2":          this.keys.emotes[3]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_3":          this.keys.emotes[4]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_4":          this.keys.emotes[5]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_5":          this.keys.emotes[6]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_6":          this.keys.emotes[7]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_7":          this.keys.emotes[8]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_8":          this.keys.emotes[9]:= this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_9":          this.keys.emotes[10] := this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_10":         this.keys.emotes[11] := this.wfKeyToItaKey(key)
            case "EMOTE_HOTKEY_11":         this.keys.emotes[12] := this.wfKeyToItaKey(key)
            case "SHOW_LEVEL_MAP":          this.keys.showLevelMap := this.wfKeyToItaKey(key)
            case "VIEW_MISSION_PROGRESS":   this.keys.viewMissionProgress := this.wfKeyToItaKey(key)
            case "VIEW_QUICK_PROGRESS":     this.keys.quickMissionProgress := this.wfKeyToItaKey(key)
            case "SELECT_SUB_GEAR_0":       this.keys.subGears[1] := this.wfKeyToItaKey(key)
            case "SELECT_SUB_GEAR_1":       this.keys.subGears[2] := this.wfKeyToItaKey(key)
            case "SELECT_SUB_GEAR_2":       this.keys.subGears[3] := this.wfKeyToItaKey(key)

            
            
            
            case "LEAN_LEFT":               this.keys.railjackBankLeft := this.wfKeyToItaKey(key)
            case "LEAN_RIGHT":              this.keys.railjackBankRight := this.wfKeyToItaKey(key)
            case "VIEW_RAILJACK_SYSTEMS":   this.keys.railjackTacticalMenu := this.wfKeyToItaKey(key)
            case "TOGGLE_RAILJACK_CAMERA":  this.keys.railjackRailjackCamera := this.wfKeyToItaKey(key)
        }
    }

    wfKeyToItaKey(key = "") {
        switch key
        {

            case "EN_GRAVE":    return "\"
            case "EN_1":        return "1"
            case "EN_2":        return "2"
            case "EN_3":        return "3"
            case "EN_4":        return "4"
            case "EN_5":        return "5"
            case "EN_6":        return "6"
            case "EN_7":        return "7"
            case "EN_8":        return "8"
            case "EN_9":        return "9"
            case "EN_0":        return "0"
            case "EN_MINUS":    return "'"
            case "EN_EQUALS":   return "ì"
            ;--------------------------------
            case "EN_Q":        return "q"
            case "EN_W":        return "w"
            case "EN_E":        return "e"
            case "EN_R":        return "r"
            case "EN_T":        return "t"
            case "EN_Y":        return "y"
            case "EN_U":        return "u"
            case "EN_I":        return "i"
            case "EN_O":        return "o"
            case "EN_P":        return "P"

            case "EN_LBRACKET": return "è"
            case "EN_RBRACKET": return "+"
            ;--------------------------------
            case "EN_A":        return "a"
            case "EN_S":        return "s"
            case "EN_D":        return "d"
            case "EN_F":        return "f"
            case "EN_G":        return "g"
            case "EN_H":        return "h"
            case "EN_J":        return "j"
            case "EN_K":        return "k"
            case "EN_L":        return "l"

            case "EN_SEMICOLON": return "ò"
            case "EN_APOSTROPHE": return "à"
            case "EN_BACKSLASH": return "ù"
            ;--------------------------------
            case "EN_LSHIFT":   return "LShift"

            case "EN_Z":        return "z"
            case "EN_X":        return "x"
            case "EN_C":        return "c"
            case "EN_V":        return "v"
            case "EN_B":        return "b"
            case "EN_N":        return "n"
            case "EN_M":        return "m"

            case "EN_COMMA":    return ","
            case "EN_PERIOD":   return "."
            case "EN_SLASH":    return "-"
            case "EN_RSHIFT":   return "RShift"
            ;--------------------------------
            case "EN_LCONTROL": return "LCltr"
            case "EN_LALT":     return "LAlt"
            case "EN_SPACE":    return "Space"
            case "EN_RALT":     return "RAlt"
            case "EN_RCONTROL": return "RCltr"
            ;--------------------------------
            case "EN_UP":       return "Up"
            case "EN_LEFT":     return "Left"
            case "EN_RIGHT":    return "Right"
            case "EN_DOWN":     return "Down"
            ;--------------------------------
            case "EN_KP_DIVIDE": return "NumpadDiv"
            case "EN_KP_MULTIPLY":   return "NumpadMult"

            case "EN_KP_7":     return "Numpad7"
            case "EN_KP_8":     return "Numpad8"
            case "EN_KP_9":     return "Numpad9"

            case "EN_KP_4":     return "Numpad4"
            case "EN_KP_5":     return "Numpad5"
            case "EN_KP_6":     return "Numpad6"

            case "EN_KP_1":     return "Numpad1"
            case "EN_KP_2":     return "Numpad2"
            case "EN_KP_3":     return "Numpad3"

            case "EN_KP_0":     return "Numpad0"
            case "EN_KP_DECIMAL":    return "NumpadDot"
            ;--------------------------------
            case "EN_MOUSE_B0": return "LButton"
            case "EN_MOUSE_B1": return "RButton"
            case "EN_MOUSE_B2": return "MButton"

            case "EN_MOUSE_WHEELUP":    return "WheelUp"
            case "EN_MOUSE_WHEELDOWN":  return "WheelDown"
        }
    }

    showValues() {
        msg := ""

        msg .= "secondaryFire`t`t" this.keys.secondaryFire "`n"


        guiControl, text, % controls.showValuesTextbox, % msg
    }

    parseConfigFile() {
        configFilePath := substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\Warframe\EE.cfg"
        currentCommand =
        oldCommand =

        loop, read, % configFilePath
        {

            if (substr(A_LoopReadLine, strlen(A_LoopReadLine)-1) = "={") {
                currentCommand := substr(A_LoopReadLine, 1, strlen(A_LoopReadLine) - 2)
            }
            
            if (foundPos := inStr(A_LoopReadLine, "key=")) { ; found key of command
                if (!inStr(A_LoopReadLine, "GAMEPAD")) { ; key is NOT from a controller
                    if (oldCommand != currentCommand){
                        this.assignKey(currentCommand, subStr(A_LoopReadLine, foundPos + 4))
                        oldCommand := currentCommand
                    }
                }
            } else if (foundPos := inStr(A_LoopReadLine, "slot=")) { ; found slot of command
                slot := subStr(A_LoopReadLine, foundPos + 5)
            } else if (foundPos := inStr(A_LoopReadLine, "Client.Email=")) { ; found email
                ;msgbox % subStr(A_LoopReadLine, strLen("Client.Email=") +1)
                this.email := subStr(A_LoopReadLine, strLen("Client.Email=") +1)
            }
        }
    }
}