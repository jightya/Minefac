shutDownFactorioServer() {
    Log("Shutting down factorio server.")
    WinActivate, factorioServer
    Sleep, 5000
    Send, Server is going down to make an backup and restart in 1 minute. {enter}
    Sleep, 60000
    send, /server-save {enter}
    Sleep, 60000
    Send, /quit {enter}
    Sleep, 10000
    Log("Factorio server down.")
    global factorioServerDown := true
}

startFactorioServer() {
    Log("Starting factorio server.") 
    run, C:\factorio\Factorio_Server_Start.bat
    global factorioServerStarted := true
}

isFactorioServerRunning() {
    if (winExist("factorioServer")) {
        return true
    } else {
        return false
    }
}