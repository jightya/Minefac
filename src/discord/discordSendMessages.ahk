sendMsgToDiscord(ByRef textContent) {
    if (settings["enableDiscordMsg"]) {
        discordWebhook := settings["webhookDiscord"]
        setDiscordMessages()
        postdata := "{""content"":""" . textContent . """}"
        Log("Sending msg to discord > " . textContent . " <")
        WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
        WebRequest.Open("POST", discordWebhook, false)
        WebRequest.SetRequestHeader("Content-Type", "application/json")
        WebRequest.Send(postdata) 
    } 
}