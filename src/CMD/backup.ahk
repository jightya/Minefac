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