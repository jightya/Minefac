checkTime(byRef timeToMatch) {
    formattime, time,, HH:mm
    Log("Checking for time. Current time: " time ".")
    if (time = timeToMatch) {
        return true
    } else {
        return false
    }
}