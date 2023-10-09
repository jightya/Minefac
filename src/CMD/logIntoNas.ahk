logIntoNas() {
    nasAdress := settings["adressToNas"]
    userNameNas := settings["NasUsername"]
    passw := settings["NasPassw"]
    Runwait, cmd.exe /C NET USE %nasAdress% /USER:%userNameNas% %passw%
    
    ; Check if the command was successful
    if (ErrorLevel = 0) {
        global loggedIntoNas := true
        Log("Login to nas succesfull.")
    } else {
        Log("Failed to log into NAS")
    }
}
