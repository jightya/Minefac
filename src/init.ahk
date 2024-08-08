#SingleInstance, Force
#Persistent
#NoEnv
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode 2

#Include lib\logging.ahk
#include lib\json.ahk
#Include CMD\backup.ahk
#Include CMD\logIntoNas.ahk
#Include CMD\windows.ahk
#include servers\factorio.ahk
#include servers\minecraft.ahk
#include servers\palworld.ahk
#include discord\discordMessages.ahk
#include discord\discordSendMessages.ahk
#Include time\checkTime.ahk

global settings := readSettings("settingsMinefac.ini", settingsFile)

logFileName := StrReplace(settingsFile, "settings-", "")
logFileName := StrReplace(logFileName, ".ini", "")
global logfile := "log-Minefac.txt"


readSettings(baseSettingsFile, settingsFile) {
    ; these are the default values
    settings := []

    ; read from the ini file and overwrite any of the above values
    IniRead, sectionNames, %baseSettingsFile%
    Loop, Parse, sectionNames , `n
    {
        thisSection := A_LoopField
        if (thisSection == "Settings") {
            IniRead, OutputVarSection, %baseSettingsFile%, %thisSection%
            Loop, Parse, OutputVarSection , `n
            {
                valArr := StrSplit(A_LoopField,"=")
                valArr[1]
                if (valArr[2] == "true") {
                    valArr[2] := true
                }
                if (valArr[2] == "false") {
                    valArr[2] := false
                }
                settings[valArr[1]] := valArr[2]
            }
        }
    }

    ; read from the ini file and overwrite any of the above values
    IniRead, sectionNames, %settingsFile%
    Loop, Parse, sectionNames , `n
    {
        thisSection := A_LoopField
        IniRead, OutputVarSection, %settingsFile%, %thisSection%
        Loop, Parse, OutputVarSection , `n
        {
            valArr := StrSplit(A_LoopField,"=")
            valArr[1]
            if (valArr[2] == "true") {
                valArr[2] := true
            }
            if (valArr[2] == "false") {
                valArr[2] := false
            }
            settings[valArr[1]] := valArr[2]
        }
    }
    return settings
} ;readsettings thanks to joffreybesos source: https://github.com/joffreybesos/