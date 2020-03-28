class MacroValues {
    static globalScope := 0

    getScope() {
        return  (MacroValues.globalScope = 1)
            OR  ((MacroValues.globalScope = 0) 
                AND (   (WinActive("ahk_exe Warframe.x64.exe"))
                    OR  (WinActive("ahk_exe Warframe.exe")) ) )
    }
}