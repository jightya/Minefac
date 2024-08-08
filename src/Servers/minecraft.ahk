shutDownMinecraftServer() {
    Log("Shutting down minecraft server.")
    WinActivate, minecraftServer
    Sleep, 5000
    Send, say Server is going down to make an backup and restart in 1 minute. {enter}
    Sleep, 60000
    send, save-all {enter}
    Sleep, 60000
    Send, stop {enter}
    Sleep, 10000
    Log("Minecraft server down.")
    global minecraftServerDown := true
}

startMinecraftServer() {
    Log("Starting minecraft server.") 
    run, C:\minecraft\Minecraft_Server_Start.bat
    global minecraftServerStarted := true
}

isMinecraftServerRunning() {
    if (winExist("minecraftServer")) {
        return true
    } else {
        return false
    }
}   