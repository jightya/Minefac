shutDownModdedMinecraftServer() {
    Log("Shutting down minecraft server.")
    WinActivate, moddedMinecraftServer
    Sleep, 5000
    Send, say Server is going down to make an backup and restart in 1 minute. {enter}
    Sleep, 60000
    send, save-all{enter}
    Sleep, 60000
    Send, stop{enter}
    Sleep, 60000
    Log("Modded minecraft server down.")
    global moddedMinecraftServerDown := true
}

startModdedMinecraftServer() {
    Log("Starting modded minecraft server.") 
    run, C:\moddedminecraft\modded_minecraft_Server_Start.bat
    global moddedMinecraftServerStarted := true
}

isModdedMinecraftServerRunning() {
    if (winExist("moddedMinecraftServer")) {
        return true
    } else {
        return false
    }
}   