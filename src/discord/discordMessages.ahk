setDiscordMessages() {
    formattime, discordMsgTime,, HH:mm
    ;server pc start msges
    global DiscordMsgServerPcStart                          := " " discordMsgTime  " ** "  "Server PC started up. Continuing to start Minefac 1.6.6" " "
    global DiscordMsgMinefacStart                           := " " discordMsgTime  " ** "  "Minefac started up. Continuing to start game server/servers." " "
    global DiscordMsgBackupComplete                         := " " discordMsgTime  " ** "  "Everything is backupped. ServerPC restarting." " "
    global DiscordMsgBackupFactorioComplete                 := " " discordMsgTime  " ** "  "Factorio is backupped. ServerPC restarting." " "
    global DiscordMsgBackupMinecraftComplete                := " " discordMsgTime  " ** "  "Minecraft is backupped. ServerPC restarting." " "
    global DiscordMsgServerPcRestart                        := " " discordMsgTime  " ** "  "Server PC restarting." " "
    ;game server start msges
    global DiscordMsgStartupMinecraftServer                 := " " discordMsgTime  " ** "  "Continuing to start minecraft server." " "
    global DiscordMsgStartupFactorioServer                  := " " discordMsgTime  " ** "  "Continuing to start factorio server." " "
    global DiscordMsgStartupPalworldServer                  := " " discordMsgTime  " ** "  "Continuing to start palworld server." " "
    ;game server shutdown msges
    global DiscordMsgShutdownMinecraftServer                := " " discordMsgTime  " ** "  "Shutting down minecraft server." " "
    global DiscordMsgShutdownFactorioServer                 := " " discordMsgTime  " ** "  "Shutting down factorio server." " "
    global DiscordMsgShutdownPalworldServer                 := " " discordMsgTime  " ** "  "Shutting down palworld server." " "
    ;backup msges
    global discordMsgLoggedIntoNas                          := " " discordMsgTime  " ** "  "Logged into NAS." " "     
    global discordMsgTimeToBackUp                           := " " discordMsgTime  " ** "  "Time to backup minecraft, factorio and/or palworld server." " "            
    global DiscordMsgBackupMinecraftServer                  := " " discordMsgTime  " ** "  "Backupping minecraft server." " "
    global DiscordMsgBackupFactorioServer                   := " " discordMsgTime  " ** "  "Backupping factorio server." " "
    global DiscordMsgBackupPalworldServer                   := " " discordMsgTime  " ** "  "Backupping palworld server." " "
    ; crash msges
    global DiscordMsgMinecraftCrashed                       := " " discordMsgTime  " ** "  "It looks like the minecraft server crashed. Attempting to restart it. " "Crash counter: " minecraftCrashes " "
    global DiscordMsgFactorioCrashed                        := " " discordMsgTime  " ** "  "It looks like the factorio server crashed. Attempting to restart it. " "Crash counter: " factorioCrashes " "
    global DiscordMsgPalworldCrashed                        := " " discordMsgTime  " ** "  "It looks like the palworld server crashed. Attempting to restart it. " "Crash counter: " palworldCrashes " "
    global DiscordMsgMinecraftCrashedThreeTimes             := " " discordMsgTime  " ** "  "It looks like the minecraft server crashed 3 times. disabling minecraft server. Please resolve these crash issues. " " "
    global DiscordMsgFactorioCrashedThreeTimes              := " " discordMsgTime  " ** "  "It looks like the factorio server crashed 3 times. disabling factorio server. Please resolve these crash issues. " " "
    global DiscordMsgPalworldCrashedThreeTimes              := " " discordMsgTime  " ** "  "It looks like the Palworld server crashed 3 times. disabling Palworld server. Please resolve these crash issues. " " "
    ; temp msg for palworld server restart until memory leak is fixed.
    global DiscordMsgPalworldRestartMemoryLeakOne           := " " discordMsgTime  " ** "  "Time to restart palworld in 15 minutes. " " "
    global DiscordMsgPalworldRestartMemoryLeakTwo           := " " discordMsgTime  " ** "  "Time to restart palworld in 10 minutes. " " "
    global DiscordMsgPalworldRestartMemoryLeakThree         := " " discordMsgTime  " ** "  "Time to restart palworld in 5 minutes. " " "
    global DiscordMsgPalworldRestartMemoryLeakFour          := " " discordMsgTime  " ** "  "Time to restart palworld in 1 minutes. " " "
    global DiscordMsgPalworldRestartMemoryLeakFinal         := " " discordMsgTime  " ** "  "Restarting palworld server in 10 seconds. " " "
}