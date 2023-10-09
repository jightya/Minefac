settingsFile := "settingsMinefac.ini"

#Include init.ahk

scriptName := "Minefac"

Log("Started Minefac debug script, automatic minecraft and factorio server backup and restart debugging script")

;initialise variables
formattime, currentTime,, HH:mm
setVars()



While 1 {
    ; logIntoNas()
     isMinecraftServerRunning()
    sleep, 10000
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off