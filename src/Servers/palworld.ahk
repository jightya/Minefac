shutDownPalworldServer() {
    Log("Shutting down palworld server.")
    Sleep, 5000
    Process, Close, PalServer-Win64-Shipping-Cmd.exe
    global PalworldServerDown := true
}

startPalworldServer() {
    Log("Starting palworld server.") 
    run, C:\palworld\Palworld_Server_Start.bat
    global palworldServerStarted := true
    Sleep, 180000
}

isPalworldServerRunning() {
    if (winExist("pal")) {
        return true
    } else {
        return false
    }
}