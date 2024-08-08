settingsFile := "settingsMinefac.ini"

#Include init.ahk

Log("Started Minefac, automatic minecraft, factorio and palworld server backup and restart")

; some vars

crashDetection := settings["checkForServerCrash"]
; main loop
While 1 {
    Sleep, 30000
    if (checkTime(settings["timeToReboot"]) and bootedup) {
        ; if its time to backup and reboot, this is the section that executes
        crashDetection := false
        Sleep, 100
        Log("Time to backup and reboot")
        sendMsgToDiscord(discordMsgTimeToBackUp)
        if (settings["backupToNas"]) {
            logIntoNas()
            if (loggedIntoNas) {
                sendMsgToDiscord(discordMsgLoggedIntoNas)
            }
        ; shutting down active servers
        } if (minecraftServer) {
            if (!minecraftServerDown) {
                ; shutting down minecraft server
                sendMsgToDiscord(DiscordMsgShutdownMinecraftServer)
                shutDownMinecraftServer()
            } 
        } if (factorioServer) {
            if (!factorioServerDown) {
                ; shutting down factorio server
                sendMsgToDiscord(DiscordMsgShutdownFactorioServer)
                shutDownFactorioServer()
            } 
        } if (palworldServer) {
            if (!PalworldServerDown) {
                ; shutting down palworld server
                sendMsgToDiscord(DiscordMsgShutdownPalworldServer)
                shutDownPalworldServer()
            } 
        ; backup all servers we just shutdown
        } if (minecraftServerDown and !minecraftBackupComplete) {
            ; backupping minecraft server
            sendMsgToDiscord(DiscordMsgBackupMinecraftServer)
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftServerDestination"])
            Log("Minecraft server backupped to nas.")
            Log("Minecraft server going to be backupped to week day.")
            logIntoNas()
            backupToWeekDay("minecraft")
            minecraftBackupComplete := true
            Sleep, 100
        } if (factorioServerDown and !factorioBackupComplete) {
            sendMsgToDiscord(DiscordMsgBackupFactorioServer)
            copyFolderToBackupDestination(settings["factorioServerSource"], settings["factorioServerDestination"])
            ; backupping factorio saves
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioServerSaveDestination"])
            Log("factorio server backupped to nas.")
            Log("factorio server going to be backupped to week day.")
            logIntoNas()
            backupToWeekDay("factorio")
            factorioBackupComplete := true
             Sleep, 100
        } if (palworldServerDown and !palworldBackupComplete) {
            sendMsgToDiscord(DiscordMsgBackupPalworldServer)
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldServerDestination"])
            Log("palworld server backupped to nas.")
            Log("palworld server going to be backupped to week day.")
            logIntoNas()
            backupToWeekDay("palworld")
            palworldBackupComplete := true
            Sleep, 100
        }
    } if (minecraftBackupComplete or factorioBackupComplete or palworldBackupComplete) {
        sendMsgToDiscord(DiscordMsgBackupComplete)
        Sleep, 1000
        Log("All servers down and backups complete, restarting server PC.")
        restartWindows()
    } 

    ; crash detection
    if (crashDetection and bootedUp) {
        if (minecraftServer) {
            if (!isMinecraftServerRunning() and !minecraftCrashedTooMuch) {
                Log("Looks like minecraft server has crashed. trying to restart.")
                startMinecraftServer()
                Sleep, 5000
                minecraftCrashes++
                sendMsgToDiscord(DiscordMsgMinecraftCrashed)
            }
        } if (factorioServer) {
                if (!isFactorioServerRunning() and !factorioCrashedTooMuch) {
                Log("Looks like factorio server has crashed. trying to restart.")
                startFactorioServer()
                Sleep, 5000
                factorioCrashes++
                sendMsgToDiscord(DiscordMsgFactorioCrashed)
            }
        } if (palworldServer) {
                if (!isPalworldServerRunning() and !palwordCrashedTooMuch) {
                Log("Looks like palworld server has crashed. trying to restart.")
                startPalworldServer()
                Sleep, 5000
                palworldCrashes++
                sendMsgToDiscord(DiscordMsgPalworldCrashed)
            }
        }
    } if (settings["StopServerAfter3Crashes"]) {
        if (minecraftCrashes = 3) {
            sendMsgToDiscord(DiscordMsgMinecraftCrashedThreeTimes)
            minecraftCrashedTooMuch := true
            Log("Minecraft server crashed 3 times. Please resolve these crash issue's.")
        } if (factorioCrashes = 3) {
            sendMsgToDiscord(DiscordMsgFactorioCrashedThreeTimes)
            factorioCrashedTooMuch := true
            Log("factorio server crashed 3 times. Please resolve these crash issue's.")            
        } if (palworldCrashes = 3) {
            sendMsgToDiscord(DiscordMsgPalworldCrashedThreeTimes)
            palwordCrashedTooMuch := true
            Log("Palworld server crashed 3 times. Please resolve these crash issue's.")            
        }
    } if (!bootedUp) {
        Log("Starting everything up. Minefac version 1.6.3")
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
            minecraftCrashedTooMuch := false
        } if (settings["enableFactorioServer"]) {
            ; starting factorio
            Log("Factorio enabled. Starting up.")
            sendMsgToDiscord(DiscordMsgStartupFactorioServer)
            Sleep, 1000
            startFactorioServer()
            Sleep, 1000
            global factorioCrashes := 0
            factorioServer := true
            factorioCrashedTooMuch := false
        }  if (settings["enablePalworldServer"]) {
            ; starting palworld
            Log("Palworld enabled. Starting up.")
            sendMsgToDiscord(DiscordMsgStartupPalworldServer)
            Sleep, 1000
            startPalworldServer()
            Sleep, 60000
            global palworldCrashes := 0
            palworldServer := true
            palwordCrashedTooMuch := false
        } if (minecraftServer or factorioServer or palworldServer) {
            bootedUp := true
        } else {
            Log("No gameserver activated in settings.")
        }
    } 
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off

return