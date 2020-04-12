class MacroValues {
    static release := "1"
    static version := "2"
    static revision := "0"
    static build := "0"
    static beta := true

    isBeta() {
        return (this.beta = true ? true : false)
    }

    getVersion() {
        return this.release "." this.version "." this.revision (this.isBeta() = true ? " beta" : "")
    }

    getFullVersion() {
        return this.release "." this.version "." this.revision "." this.build (this.isBeta() = true ? "beta" : "")
    }
}