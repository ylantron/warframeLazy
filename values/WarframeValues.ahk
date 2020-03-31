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
            case "JUMP":                    this.keys.jump := this.wfKeyToKey(key)
            ;case move w
            ;case move a
            ;case move s
            ;case move d
            ;case move up archwing
            ;case move down archwing
            case "PRE_ATTACK":              this.keys.fireWeapon := this.wfKeyToKey(key)
            case "AIM_WEAPON":              this.keys.aimWeapon := this.wfKeyToKey(key)
            case "SECONDARY_FIRE":          this.keys.secondaryFire := this.wfKeyToKey(key)
            case "RELOAD":                  this.keys.reload := this.wfKeyToKey(key)
            case "CROUCH":                  this.keys.crouchToggle := this.wfKeyToKey(key)
            case "HOLD_CROUCH":             this.keys.crouchHold := this.wfKeyToKey(key)
            case "PRE_RUN":                 this.keys.sprintRoll := this.wfKeyToKey(key)
            case "RUN":                     this.keys.sprint := this.wfKeyToKey(key)
            case "ACTION":                  this.keys.roll := this.wfKeyToKey(key)
            case "USE":                     this.keys.use := this.wfKeyToKey(key)
            case "MELEE":                   this.keys.meleeAttack := this.wfKeyToKey(key)
            case "MELEE_CHANNEL":           this.keys.meleeAttackHeavy := this.wfKeyToKey(key)
            case "NEXT_INV":                this.keys.switchWeapon := this.wfKeyToKey(key)
            case "SWITCH_GUN":              this.keys.switchGun := this.wfKeyToKey(key)
            case "MINI_INVENTORY_HOLD":     this.keys.gearWheel := this.wfKeyToKey(key)
            case "TOGGLE_CHAT_WINDOW":      this.keys.chat := this.wfKeyToKey(key)
            case "ACTIVATE_ABILITY_0":      this.keys.abilities[1] := this.wfKeyToKey(key)
            case "ACTIVATE_ABILITY_1":      this.keys.abilities[2] := this.wfKeyToKey(key)
            case "ACTIVATE_ABILITY_2":      this.keys.abilities[3] := this.wfKeyToKey(key)
            case "ACTIVATE_ABILITY_3":      this.keys.abilities[4] := this.wfKeyToKey(key)
            case "ACTIVATE_ABILITY_4":      this.keys.abilities[5] := this.wfKeyToKey(key)
            case "CYCLE_POWER_NEXT":        this.keys.nextPower := this.wfKeyToKey(key)
            case "CYCLE_POWER_PREV":        this.keys.previousPower := this.wfKeyToKey(key)
            case "POWER_MODIFIER":          this.keys.useSelectedPower := this.wfKeyToKey(key)
            case "SHOW_SECRET_1":           this.keys.placeMarker := this.wfKeyToKey(key)
            case "REVERSE_CAMERA_OFFSET":   this.keys.reverseCamera := this.wfKeyToKey(key)
            case "CYCLE_CAMERA_NEXT":       this.keys.spectateNextPlayer := this.wfKeyToKey(key)
            case "CYCLE_CAMERA_PREV":       this.keys.spectatePreviousPlayer := this.wfKeyToKey(key)
            case "VIEW_HUMAN_PLAYERS":      this.keys.showPlayerList := this.wfKeyToKey(key)
            case "PUSH_TO_TALK":            this.keys.pushToTalk := this.wfKeyToKey(key)
            case "INSPECT":                 this.keys.inspect := this.wfKeyToKey(key)
            case "GEAR_HOTKEY_0":           this.keys.gears[1]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_1":           this.keys.gears[2]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_2":           this.keys.gears[3]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_3":           this.keys.gears[4]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_4":           this.keys.gears[5]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_5":           this.keys.gears[6]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_6":           this.keys.gears[7]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_7":           this.keys.gears[8]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_8":           this.keys.gears[9]:= this.wfKeyToKey(key)
            case "GEAR_HOTKEY_9":           this.keys.gears[10] := this.wfKeyToKey(key)
            case "GEAR_HOTKEY_10":          this.keys.gears[11] := this.wfKeyToKey(key)
            case "GEAR_HOTKEY_11":          this.keys.gears[12] := this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_0":          this.keys.emotes[1]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_1":          this.keys.emotes[2]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_2":          this.keys.emotes[3]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_3":          this.keys.emotes[4]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_4":          this.keys.emotes[5]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_5":          this.keys.emotes[6]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_6":          this.keys.emotes[7]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_7":          this.keys.emotes[8]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_8":          this.keys.emotes[9]:= this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_9":          this.keys.emotes[10] := this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_10":         this.keys.emotes[11] := this.wfKeyToKey(key)
            case "EMOTE_HOTKEY_11":         this.keys.emotes[12] := this.wfKeyToKey(key)
            case "SHOW_LEVEL_MAP":          this.keys.showLevelMap := this.wfKeyToKey(key)
            case "VIEW_MISSION_PROGRESS":   this.keys.viewMissionProgress := this.wfKeyToKey(key)
            case "VIEW_QUICK_PROGRESS":     this.keys.quickMissionProgress := this.wfKeyToKey(key)
            case "SELECT_SUB_GEAR_0":       this.keys.subGears[1] := this.wfKeyToKey(key)
            case "SELECT_SUB_GEAR_1":       this.keys.subGears[2] := this.wfKeyToKey(key)
            case "SELECT_SUB_GEAR_2":       this.keys.subGears[3] := this.wfKeyToKey(key)

            
            
            
            case "LEAN_LEFT":               this.keys.railjackBankLeft := this.wfKeyToKey(key)
            case "LEAN_RIGHT":              this.keys.railjackBankRight := this.wfKeyToKey(key)
            case "VIEW_RAILJACK_SYSTEMS":   this.keys.railjackTacticalMenu := this.wfKeyToKey(key)
            case "TOGGLE_RAILJACK_CAMERA":  this.keys.railjackRailjackCamera := this.wfKeyToKey(key)
        }
    }

    wfKeyToKey(key = "") {
        switch key
        {

            case "EN_GRAVE":    return "sc029"
            case "EN_1":        return "sc002"
            case "EN_2":        return "sc003"
            case "EN_3":        return "sc004"
            case "EN_4":        return "sc005"
            case "EN_5":        return "sc006"
            case "EN_6":        return "sc007"
            case "EN_7":        return "sc008"
            case "EN_8":        return "sc009"
            case "EN_9":        return "sc00A"
            case "EN_0":        return "sc00B"
            case "EN_MINUS":    return "sc00C"
            case "EN_EQUALS":   return "sc00D"
            ;--------------------------------
            case "EN_Q":        return "sc010"
            case "EN_W":        return "sc011"
            case "EN_E":        return "sc012"
            case "EN_R":        return "sc013"
            case "EN_T":        return "sc014"
            case "EN_Y":        return "sc015"
            case "EN_U":        return "sc016"
            case "EN_I":        return "sc017"
            case "EN_O":        return "sc018"
            case "EN_P":        return "sc019"

            case "EN_LBRACKET": return "sc01A"
            case "EN_RBRACKET": return "sc01B"
            ;--------------------------------
            case "EN_A":        return "sc01E"
            case "EN_S":        return "sc01F"
            case "EN_D":        return "sc020"
            case "EN_F":        return "sc021"
            case "EN_G":        return "sc022"
            case "EN_H":        return "sc023"
            case "EN_J":        return "sc024"
            case "EN_K":        return "sc025"
            case "EN_L":        return "sc026"

            case "EN_SEMICOLON": return "sc027"
            case "EN_APOSTROPHE": return "sc028"
            case "EN_BACKSLASH": return "sc02B"
            ;--------------------------------
            case "EN_LSHIFT":   return "sc02A"

            case "EN_Z":        return "sc02C"
            case "EN_X":        return "sc02D"
            case "EN_C":        return "sc02E"
            case "EN_V":        return "sc02F"
            case "EN_B":        return "sc030"
            case "EN_N":        return "sc031"
            case "EN_M":        return "sc032"

            case "EN_COMMA":    return "sc033"
            case "EN_PERIOD":   return "sc034"
            case "EN_SLASH":    return "sc035"
            case "EN_RSHIFT":   return "sc136"
            ;--------------------------------
            case "EN_LCONTROL": return "sc01D"
            case "EN_LALT":     return "sc038"
            case "EN_SPACE":    return "sc039"
            case "EN_RALT":     return "sc138"
            case "EN_RCONTROL": return "sc11D"
            ;--------------------------------
            case "EN_UP":       return "sc148"
            case "EN_LEFT":     return "sc14B"
            case "EN_RIGHT":    return "sc14D"
            case "EN_DOWN":     return "sc150"
            ;--------------------------------
            case "EN_KP_DIVIDE": return "sc135"
            case "EN_KP_MULTIPLY":   return "sc037"
            case "EN_KP_SUBTRACT":   return "sc04A"
            case "EN_KP_ADD":   return "sc04E"

            case "EN_KP_7":     return "sc047"
            case "EN_KP_8":     return "sc048"
            case "EN_KP_9":     return "sc049"

            case "EN_KP_4":     return "sc04B"
            case "EN_KP_5":     return "sc04C"
            case "EN_KP_6":     return "sc04D"

            case "EN_KP_1":     return "sc04F"
            case "EN_KP_2":     return "sc050"
            case "EN_KP_3":     return "sc051"

            case "EN_KP_0":     return "sc052"
            case "EN_KP_DECIMAL":    return "sc053"
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