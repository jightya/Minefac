restartWindows() {
    sendMsgToDiscord(DiscordMsgServerPcRestart)
    Sleep, 1000
    RunWait cmd.exe /c shutdown -r 
}