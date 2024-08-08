copyFolderToBackupDestination(ByRef source, ByRef destination) {
    if (settings["backupToNas"]) {
    Log("Backupping folder to NAS.")
    Sleep, 100
    RunWait cmd.exe /c robocopy %source% %destination% /E /Z /COPY:DAT /R:3 /W:10 /NP /V /MT:32
    } else if (!settings["backupToNas"]) {
        Log("Backupping folder to backup destination.")
        Sleep, 100
        RunWait cmd.exe /c robocopy %source% %destination% /E /Z /COPY:DAT /R:3 /W:10 /NP /V /MT:32
    }
}

backupToWeekDay(ByRef serverTypeRunning) {
    Log("Going to backup to week day.")
    formattime, weekDay,, dddd
    if (serverTypeRunning = "minecraft") {
        Log("Going to backup to week day MINECRAFT.")
        if (weekDay = "Monday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationMonday"])
        } else if (weekDay = "Tuesday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationTuesday"])
        } else if (weekDay = "Wednesday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationWednesday"])
        } else if (weekDay = "Thursday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationThursday"])
        } else if (weekDay = "Friday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationFriday"])
        } else if (weekDay = "Saterday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationSaterday"])
        } else if (weekDay = "Sunday") {
            copyFolderToBackupDestination(settings["mineCraftServerSource"], settings["minecraftBackupLocationSunday"])
        }
    } else if (serverTypeRunning = "factorio") {
        Log("Going to backup to week day. FACTORIO")
        if (weekDay = "Monday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationMonday"])
        } else if (weekDay = "Tuesday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationTuesday"])
        } else if (weekDay = "Wednesday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationWednesday"])
        } else if (weekDay = "Thursday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationThursday"])
        } else if (weekDay = "Friday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationFriday"])
        } else if (weekDay = "Saterday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationSaterday"])
        } else if (weekDay = "Sunday") {
            copyFolderToBackupDestination(settings["factorioServerSaveSource"], settings["factorioBackupLocationSunday"])
        }
    } else if (serverTypeRunning = "palworld") {
        Log("Going to backup to week day. PALWORLD")
        if (weekDay = "Monday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationMonday"])
        } else if (weekDay = "Tuesday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationTuesday"])
        } else if (weekDay = "Wednesday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationWednesday"])
        } else if (weekDay = "Thursday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationThursday"])
        } else if (weekDay = "Friday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationFriday"])
        } else if (weekDay = "Saterday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationSaterday"])
        } else if (weekDay = "Sunday") {
            copyFolderToBackupDestination(settings["palworldServerSource"], settings["palworldBackupLocationSunday"])
        }
    }
}