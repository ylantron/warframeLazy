class Ini {
    static path := substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\settings.ini"
    static pathChat := substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\chatMessages.dat"
    static pathChangelog := substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\changelog.txt"
    static pathRandomPhrases := substr(A_AppData, 1, strlen(A_AppData)-8) "\Local\warframeLazy\randomPhrases.dat"

    loadSettings() {
        classes := [Gui, SlideAttack, FireMode, UseKeyBehaviour, QuickAbilityUse, AutomaticAbilities, AutomaticChat, Settings]

        loop, % classes.Length() {
            classes[A_Index].loadSettings()
        }
    }

    readIni(section, key) {
        iniRead, value, % this.path, % section, % key
        return value
    }
}