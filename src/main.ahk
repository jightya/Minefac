settingsFile := "settingsMinefac.ini"

#Include init.ahk

Log("Started Minefac, automatic minecraft and factorio server backup and restart")

; setting the timer to check if its time to backup and restart

; main loop
While 1 {
    if (checkRebootTime(settings["timeToReboot"]) and bootedup) {
        ; if its time to backup and reboot, this is the section that executes
        Sleep, 100
        Log("Time to backup and reboot")
        sendMsgToDiscord(discordMsgTimeToBackUp)
        if (settings["backupToNas"]) {
            logIntoNas()
            if (loggedIntoNas) {
                sendMsgToDiscord(discordMsgLoggedIntoNas)
            }
        }
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
                if (settings["enableBackup"]) {
                    ; backupping minecraft server
                    sendMsgToDiscord(DiscordMsgBackupMinecraftServer)
                    copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftServerDestination"])
                    Log("Minecraft server backupped to nas.")
                    minecraftBackupComplete := true
                    Sleep, 100
                    ; backupping factorio server
                    sendMsgToDiscord(DiscordMsgBackupFactorioServer)
                    copyFolderToBackupDestination(settings["factorioServerSource"], settings["factorioServerDestination"])
                    Log("factorio server backupped to nas.")
                    factorioBackupComplete := true
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
            if (settings["enableBackup"]) {
                sendMsgToDiscord(DiscordMsgBackupFactorioServer)
                copyFolderToBackupDestination(settings["factorioServerSource"], settings["factorioServerDestination"])
                sendMsgToDiscord(DiscordMsgBackupComplete)
                factorioBackupComplete := true
                Log("Backupping factorio server completed, restarting server PC now.")
                ; if factorio server is down and backupped, lets restart
                If (factorioBackupComplete) {
                    sendMsgToDiscord(DiscordMsgBackupFactorioComplete)
                    Log("Factorio server backup complete. Restarting server PC")
                    restartWindows() 
                }
            }             
        } else if (minecraftServer and !factorioServer) {
            ; if only an minecraft server is running
            Log("Backupping minecraft server.")
            Sleep, 5000 
            ; shutting down Minecraft server
            sendMsgToDiscord(DiscordMsgShutdownminecraftServer)
            shutDownMinecraftServer()
            Sleep, 1000
            ; backupping Minecraft server
            if (settings["enableBackup"]) {
                sendMsgToDiscord(DiscordMsgBackupMinecraftServer)
                copyFolderToBackupDestination(settings["minecraftServerSource"], settings["minecraftServerDestination"])
                sendMsgToDiscord(DiscordMsgBackupMinecraftComplete )
                minecraftBackupComplete := true
                Log("Backupping minecraft server completed, restarting server PC now.")
                ; if minecraft server is down and backupped, lets restart
                If (minecraftBackupComplete) {
                    sendMsgToDiscord(DiscordMsgBackupminecraftComplete)
                    Log("Minecraft server backup complete. Restarting server PC")
                    restartWindows() 
                }
            }
        }     
    } else if (settings["checkForServerCrash"] and bootedUp) {
        if (minecraftServer) {
            if (!isMinecraftServerRunning()) {
                Log("Looks like minecraft server has crashed. trying to restart.")
                sendMsgToDiscord(DiscordMsgMinecraftCrashed)
                startMinecraftServer()
                Sleep, 60000
                minecraftCrashes++
            }
        } if (factorioServer) {
                if (!isFactorioServerRunning()) {
                Log("Looks like factorio server has crashed. trying to restart.")
                sendMsgToDiscord(DiscordMsgFactorioCrashed)
                startFactorioServer()
                Sleep, 60000
                factorioCrashes++
            }
        }
    } else if (settings["StopServerAfter3Crashes"]) {
        if (minecraftCrashes = 3) {
            sendMsgToDiscord(DiscordMsgMinecraftCrashedThreeTimes)
            minecraftServer = false
            Log("Minecraft server crashed 3 times. Please resolve these crash issue's. Error code: 110")
        } else if (factorioCrashes = 3) {
            sendMsgToDiscord(DiscordMsgFactorioCrashedThreeTimes)
            factorioServer = false
            Log("factorio server crashed 3 times. Please resolve these crash issue's. Error code: 210")            
        }
    }       
    if (!bootedUp) {
        Log("Starting everything up. Minefac version 1.5.2.")
        sendMsgToDiscord(DiscordMsgServerPcStart)
        if (settings["enableMinecraftServer"]) {
            ; starting minecraft
            Log("Minecraft enabled. Starting up.")
            sendMsgToDiscord(DiscordMsgStartupMinecraftServer)
            Sleep, 1000
            startMinecraftServer()
            Sleep, 1000
            global minecraftCrashes := 0
            minecraftServer := true
            bootedUp := true
        } if (settings["enableFactorioServer"]) {
            ; starting factorio
            Log("Factorio enabled. Starting up.")
            sendMsgToDiscord(DiscordMsgStartupFactorioServer)
            Sleep, 1000
            startFactorioServer()
            Sleep, 1000
            global factorioCrashes := 0
            factorioServer := true
            bootedUp := true
        }
    } 
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off

return