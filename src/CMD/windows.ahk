restartWindows() {
    sendMsgToDiscord(DiscordMsgServerPcRestart)
    Sleep, 5000
    RunWait cmd.exe /c shutdown -r
    Sleep, 65000    
}