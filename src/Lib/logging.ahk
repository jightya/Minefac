
global last5LogLines := []

Log(text) {
	if (!logfile)
		logfile := "log.txt"
	FormatTime, vDate,, yyyy-MM-dd HH-mm-ss ;24-hour
	OutputDebug, % vDate ": " text "`n"
	FileAppend, % vDate ": " text "`n", %logfile%
	FileAppend, % vDate ": " text "`n", %botAgentLogFile%
	if last5LogLines.MaxIndex() > 4 {
		last5LogLines.RemoveAt(1)
	}
	last5LogLines.Push(text)
}


LogRaw(text) {
	OutputDebug, % text "`n"
}

LogDebug(text) {
	if (settings["debug"]) {
		if (!logfile)
			logfile := "log.txt"
		FormatTime, vDate,, yyyy-MM-dd HH-mm-ss ;24-hour
		OutputDebug, % vDate ": DEBUG: " text "`n"
		FileAppend, % vDate ": DEBUG: " text "`n", %logfile%
		FileAppend, % vDate ": DEBUG: " text "`n", %botAgentLogFile%
		if last5LogLines.MaxIndex() > 4 {
			last5LogLines.RemoveAt(1)
		}
		last5LogLines.Push(text)
	}
}

RunLog(ByRef currentSession, filename) {
	if (botSession.currentSession.startTime) {
		if (!logfile)
			logfile := "log.txt"
		FormatTime, vDate,, yyyy-MM-dd HH-mm-ss ;24-hour
		OutputDebug, % "*******************` " currentSession.logEntry() " *******************`n"
		FileAppend, % vDate "*******************` " currentSession.logEntry() " *******************`n", %logfile%
		FileAppend, % vDate "," currentSession.csvEntry() "`n", %filename% 
		discord.LastRun("LastRunUrl")
	}
}