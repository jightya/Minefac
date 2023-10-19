setDiscordMessages() {
    formattime, discordMsgTime,, HH:mm
    ;server pc start msges
    global DiscordMsgServerPcStart                          := " " discordMsgTime  " ** "  "Server PC started up. Continuing to start Minefac" " "
    global DiscordMsgMinefacStart                           := " " discordMsgTime  " ** "  "Minefac started up. Continuing to start game server/servers." " "
    global DiscordMsgBackupComplete                         := " " discordMsgTime  " ** "  "Everything is backupped. ServerPC restarting." " "
    global DiscordMsgBackupFactorioComplete                 := " " discordMsgTime  " ** "  "Factorio is backupped. ServerPC restarting." " "
    global DiscordMsgBackupMinecraftComplete                := " " discordMsgTime  " ** "  "Minecraft is backupped. ServerPC restarting." " "
    global DiscordMsgServerPcRestart                        := " " discordMsgTime  " ** "  "Server PC restarting." " "
    ;game server start msges
    global DiscordMsgStartupMinecraftServer                 := " " discordMsgTime  " ** "  "Continuing to start minecraft server." " "
    global DiscordMsgStartupFactorioServer                  := " " discordMsgTime  " ** "  "Continuing to start factorio server." " "
    ;game server shutdown msges
    global DiscordMsgShutdownMinecraftServer                := " " discordMsgTime  " ** "  "Shutting down minecraft server." " "
    global DiscordMsgShutdownFactorioServer                 := " " discordMsgTime  " ** "  "Shutting down factorio server." " "
    ;backup msges
    global discordMsgLoggedIntoNas                          := " " discordMsgTime  " ** "  "Logged into NAS." " "     
    global discordMsgTimeToBackUp                           := " " discordMsgTime  " ** "  "Time to backup minecraft and/or factorio server." " "            
    global DiscordMsgBackupMinecraftServer                  := " " discordMsgTime  " ** "  "Backupping minecraft server." " "
    global DiscordMsgBackupFactorioServer                   := " " discordMsgTime  " ** "  "Backupping factorio server." " "
    ; crash msges
    global DiscordMsgMinecraftCrashed                       := " " discordMsgTime  " ** "  "It looks like the minecraft server crashed. Attempting to restart it. " "Crash counter: " minecraftCrashes " "
    global DiscordMsgFactorioCrashed                        := " " discordMsgTime  " ** "  "It looks like the factorio server crashed. Attempting to restart it. " "Crash counter: " factorioCrashes " "
    global DiscordMsgMinecraftCrashedThreeTimes             := " " discordMsgTime  " ** "  "It looks like the minecraft server crashed 3 times. disabling minecraft server. Please resolve these crash issues. " " "
    global DiscordMsgFactorioCrashedThreeTimes             := " " discordMsgTime  " ** "  "It looks like the factorio server crashed 3 times. disabling factorio server. Please resolve these crash issues. " " "
}