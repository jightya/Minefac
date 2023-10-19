settingsFile := "settingsMinefac.ini"

#Include init.ahk

scriptName := "Minefac"

Log("Started Minefac debug script, automatic minecraft and factorio server backup and restart debugging script")

;initialise variables
; formattime, currentTime,, HH:mm

global minecraftCrashes := 0

While 1 {
 

sendMsgToDiscord(DiscordMsgMinecraftCrashed)
    sleep, 1000
    minecraftCrashes++
    if (minecraftCrashes = 3) {
      msgBox, 3333
    }
}

^End::ExitApp
^PgDn::Pause, On
^PgUp::Pause, Off