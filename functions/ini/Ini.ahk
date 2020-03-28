class Ini {
    static path := "warframeLazy.ini"

    ; write() {
    ;     classes := [SlideAttack, FireMode, UseKeyBehaviour, QuickAbilityUse, Settings]

    ;     SlideAttack.saveIni()
    ; }

    loadSettings() {
        classes := [Gui, SlideAttack, FireMode, UseKeyBehaviour, QuickAbilityUse, AutomaticAbilities, Settings]

        loop, % classes.Length() {
            classes[A_Index].loadSettings()
        }
    }

    readIni(section, key) {
        iniRead, value, % this.path, % section, % key
        return value
    }
}