setVars() {
    ; servers
    global factorioServerDown                           := false
    global minecraftServerDown                          := false

    global startFactorioServer                          := settings["startFactorioServer"]
    global startMinecraftServer                         := settings["startMinecraftServer"]

    global minecraftBackupComplete                      := false
    global factorioBackupComplete                       := false

    ;stuff to backup

        ;>> folders
        global minecraftServerSourceFolder              := settings["mineCraftServerSource"]
        global minecraftServerDestinationFolder         := settings["minecraftServerDestination"]
        global factorioServerSourceFolder               := settings["factorioServerSource"]   
        global factorioServerDestinationFolder          := settings["factorioServerDestination"]
    
}