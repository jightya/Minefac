checkRebootTime(byRef rebootTime) {
    Log("Checking for reboot time.")
    formattime, time,, HH:mm
    if (time = rebootTime) {
        return true
    } else {
        return false
    }
}