settingsFile := "settingsMinefac.ini"

#Include init.ahk

scriptName := "Minefac"

Log("Started Minefac debug script, automatic minecraft and factorio server backup and restart debugging script")

;initialise variables
; formattime, currentTime,, HH:mm



While 1 {
 if (isMinecraftServerRunning()) {
    Log("yes")
 } else {
    Log("No")
 }
    sleep, 10000
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off