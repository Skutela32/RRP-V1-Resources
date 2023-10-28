debugMode = false --Do not touch unless your dev
------------------------------------------------

Config = {}

Config.CoreFolder = "qb-core"

Config.Webhook = "" --If you want to receive a log of chip installations

Config.TimeInstall = 4000 -- time in ms that progressbar will take to install the chip

Config.PopsCommand = "togglepops" --the command name to toggle ON/OFF if the vehicle have pops_bangs enabled

Config.tunerchipr = {
    deleteOnUsage = true, -- It will remove the "Chip Remover" on usage
    extractCurrentChip = true --The player will get the chip that was installed on the vehicle
}

Config.Chips = {--You can add more chips and customize to your likings

    --jobWhitelist = the job required to install the chip (leave at "none" so everyone can apply)

    --speedBoost = will multiply your engine power (You can set to false if you dont want to use)

    --[flames]
        --Size = if you rev up to the redline of the vehicle it will create sizable flames at the exhausts (You can set to false if you dont want to use)
            --Size = If you downshift it will make exhaust flames
        --color = RGB color of the flames, make sure to set a predominant color ( set false to disable the coloring) (values go from 0.0 to 1.0)

    --[pops_bangs] = ALS system
    --  enabled = if the vehicle should produce pops and bangs
    --  delay = time in ms of how often will the pops and bangs be produced between each other once triggered
    --  rpm = minimum rpm's needed for pops being triggered ( GTA rpms goes from 0.0 to 1.0)
    --  sounds = list here every sound that you want to be able to play when pops are triggered (can be 1 or more)
    --  soundVolume = every pop will sound randomly according to these values goes from 0.0 to 1.0

    --[TURBO] = Vehicle must have turbo installed to this module being activated
    --  type = will make a sound of decompressing turbo (Setting to false will disable all features related to turbo)
    --  pressure = when the vehicle hits at least the value of pressure, (speedBoost) will get multiplied by the current turbo pressure (You can set to false if you dont want the turbo boost)
    --  volume = volume of the turbo decompressing sound
    

    ["tunerchip3"] = {--this is the item name
        jobWhitelist = "srs",
        speedBoost = false,
        flames = {
            size = 1.3,
            color = { 1.0, 0.7, 0.8 }
        },
        pops_bangs = {
            enabled = true, 
            delay = {min = 25, max = 300},
            rpm = 0.75,
            sounds = {"pops1", "pops2", "pops3", "pops4", "pops5", "pops6", "pops7", "pops8", "pops9", "pops10", "pops11", "pops12", "pops13", "pops14", "pops15"},
            soundVolume = {min = 0.05, max = 0.1} 
        },
        turbo = {
            type = "turbo1", 
            pressure = 1.4, 
            volume = 0.1
        }
    },
}

Locales = {
    ["notInVehicle"] = "You are not inside a vehicle",
    ["installed"] = "Successfully installed",
    ["installing"] = "Installing",
    ["noChip"] = "This vehicle dont have a chip",
    ["chipRemoved"] = "You removed a chip :",
    ["notOwnedVehicle"] = "This isnt an owned vehicle",
    ["popsON"] = "ON",
    ["popsOFF"] = "OFF",
    ["noPermission"] = "You dont have permission to install."
}