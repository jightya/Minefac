setDiscordMessages() {
    formattime, discordMsgTime,, HH:mm
    ;server pc start msges
    global DiscordMsgServerPcStart                          := " " discordMsgTime  " ** "  "Server PC started up. Continuing to start Minefac" " "
    global DiscordMsgMinefacStart                           := " " discordMsgTime  " ** "  "Minefac started up. Continuing to start game server/servers." " "
    global DiscordMsgBackupComplete                         := " " discordMsgTime  " ** "  "Everything is backupped. ServerPC restarting." " "
    global DiscordMsgServerPcRestart                        := " " discordMsgTime  " ** "  "Server PC restarting." " "
    ;game server start msges
    global DiscordMsgStartupMinecraftAndFactorio            := " " discordMsgTime  " ** "  "Minefac started up. Continuing to start minecraft and factorio servers." " "
    global DiscordMsgStartupMinecraftServer                 := " " discordMsgTime  " ** "  "Minefac started up. Continuing to start factorio server." " "
    global DiscordMsgStartupFactorioServer                  := " " discordMsgTime  " ** "  "Minefac started up. Continuing to start minecraft server." " "
    ;game server shutdown msges
    global DiscordMsgShutdownMinecraftServer                := " " discordMsgTime  " ** "  "Shutting down minecraft server." " "
    global DiscordMsgShutdownFactorioServer                 := " " discordMsgTime  " ** "  "Shutting down factorio server." " "
    ;backup msges
    global discordMsgLoggedIntoNas                          := " " discordMsgTime  " ** "  "Logged into NAS." " "     
    global discordMsgTimeToBackUp                           := " " discordMsgTime  " ** "  "Time to backup minecraft and/or factorio server." " "            
    global DiscordMsgBackupMinecraftServer                  := " " discordMsgTime  " ** "  "Backupping minecraft server." " "
    global DiscordMsgBackupFactorioServer                   := " " discordMsgTime  " ** "  "Backupping factorio server." " "
}