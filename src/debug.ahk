settingsFile := "settingsMinefac.ini"

#Include init.ahk

scriptName := "Minefac"

Log("Started Minefac debug script, automatic minecraft and factorio server backup and restart debugging script")

;initialise variables
; formattime, currentTime,, HH:mm

global minecraftCrashes := 0

While 1 {
formattime, weekDay,, dddd

Sleep, 1100000
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off