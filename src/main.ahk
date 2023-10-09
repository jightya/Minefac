settingsFile := "settingsMinefac.ini"

#Include init.ahk

Log("Started Minefac, automatic minecraft and factorio server backup and restart")

;initialise variables
formattime, time,, HH:mm
setVars()

; setting the timer to check if its time to backup and restart
SetTimer, checkTime, 30000

; main loop
While 1 {
    if (timeToReboot) {
        ; if its time to backup and reboot, this is the section that executes
        Sleep, 100
        ; need to set the timer off
        SetTimer, checkTime, off
        Log("Time to backup and reboot")
        if (minecraftServer and factorioServer) {
            Log("Backupping minecraft and factorio server.")
            Sleep, 5000
            if (!minecraftServerDown) {
                ; shutting down minecraft server
                sendMsgToDiscord(DiscordMsgShutdownMinecraftServer)
                shutDownMinecraftServer()
            } 
            if (!factorioServerDown and minecraftServerDown) {
                ; shutting down factorio server
                sendMsgToDiscord(DiscordMsgShutdownFactorioServer)
                shutDownFactorioServer()
            }
            if (minecraftServerDown and factorioServerDown) {
                ; if both servers are down, lets backup
                if (loggedInToNas and settings["backupToNas"]) {
                    ; backupping minecraft server
                    sendMsgToDiscord(DiscordMsgBackupMinecraftServer)
                    copyFolderToBackupDestination(minecraftServerSourceFolder, minecraftServerDestinationFolder)
                    Log("Minecraft server backupped to nas.")
                    global minecraftBackupComplete := true
                    Sleep, 100
                    ; backupping factorio server
                    sendMsgToDiscord(DiscordMsgBackupFactorioServer)
                    copyFolderToBackupDestination(factorioServerSourceFolder, factorioServerDestinationFolder)
                    Log("factorio server backupped to nas.")
                    global factorioBackupComplete := true
                    Sleep, 100
                } else if (!settings["backupToNas"]) {
                    ; backupping minecraft server
                    sendMsgToDiscord(DiscordMsgBackupMinecraftServer)
                    copyFolderToBackupDestination(minecraftServerSourceFolder, minecraftServerDestinationFolder)
                    Log("Minecraft server backupped.")
                    global minecraftBackupComplete := true
                    Sleep, 100
                    ; backupping factorio server
                    sendMsgToDiscord(DiscordMsgBackupFactorioServer)
                    copyFolderToBackupDestination(factorioServerSourceFolder, factorioServerDestinationFolder)
                    Log("factorio server backupped.")
                    global factorioBackupComplete := true
                    Sleep, 100
                }                
            }
            if (minecraftBackupComplete and factorioBackupComplete) {
                ; if all servers are down lets restart windows
                sendMsgToDiscord(DiscordMsgBackupComplete)
                Log("All servers down and backups complete, restarting server PC.")
                restartWindows()
            }
        } else if (!minecraftServer and factorioServer) {
            ; if only an factorio server is running
            Log("Backupping factorio server.")
            Sleep, 5000 
            ; shutting down factorio server
            sendMsgToDiscord(DiscordMsgShutdownFactorioServer)
            shutDownFactorioServer()
            Sleep, 1000
            ; backupping factorio server
            sendMsgToDiscord(DiscordMsgBackupFactorioServer)
            copyFolderToBackupDestination(factorioServerSourceFolder, factorioServerDestinationFolder)
            sendMsgToDiscord(DiscordMsgBackupComplete)
            Log("Backupping factorio server completed, restarting server PC now.")
            ; if all servers are down lets restart windows
            restartWindows()              
        } else if (minecraftServer and !factorioServer) {
            ; if only an minecraft server is running
            Log("Backupping minecraft server.")
            Sleep, 5000
            ; shutting down minecraft server
            sendMsgToDiscord(DiscordMsgShutdownMinecraftServer)
            shutDownMinecraftServer()
            Sleep, 1000
            ; backupping minecraft server
            sendMsgToDiscord(DiscordMsgBackupMinecraftServer)
            copyFolderToBackupDestination(minecraftServerSourceFolder, minecraftServerDestinationFolder)
            sendMsgToDiscord(DiscordMsgBackupComplete)
            Log("Backupping minecraft server completed, restarting server PC now.")
            ; if all servers are down lets restart windows
            restartWindows()
        }
    } if (!bootedUp) {
        Log("Starting everything up.")
        sendMsgToDiscord(DiscordMsgServerPcStart)
        if (settings["enableMinecraftServer"]) {
            ; starting minecraft
            Log("Minecraft enabled. Starting up.")
            sendMsgToDiscord(DiscordMsgStartupMinecraftServer)
            Sleep, 1000
            startMinecraftServer()
            bootedUp := true
        } if (settings["enableFactorioServer"]) {
            ; starting factorio
            Log("Factorio enabled. Starting up.")
            sendMsgToDiscord(DiscordMsgStartupFactorioServer)
            Sleep, 1000
            startFactorioServer()
            Sleep, 1000
            bootedUp := true
        }
    } 
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off

checkTime:
Log("Checking for reboot time.")
formattime, time,, HH:mm
if (time = settings["timeToReboot"]) {
	settimer, checkTime, off
    global timeToReboot := true
    sendMsgToDiscord(discordMsgTimeToBackUp)
    Sleep, 1000
    logIntoNas()
    if (loggedIntoNas) {
        sendMsgToDiscord(discordMsgLoggedIntoNas)
    }
}

return