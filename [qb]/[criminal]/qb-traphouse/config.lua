Config = Config or {}

-- **** IMPORTANT ****
-- UseTarget should only be set to true when using qb-target
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.MinZOffset = 40
Config.TakeoverPrice = 500
Config.TrapHouses = {
    [1] = {
        coords = {
            ["enter"] = vector3(-1202.15, -1308.43, 4.92),
            ["interaction"] = vector3(-1207.74, -1311.71, -32.65),
        },
        polyzoneBoxData = {
            ["enter"] = {
                heading = 290,
                minZ = 4.0,
                maxZ = 6.0,
                debug = false,
                length = 1,
                width = 1,
                distance = 2.0,
                created = false
            },
            ["interaction"] = {
                heading = 180,
                debug = false,
                length = 1,
                width = 1,
                distance = 1.0,
                created = false
            },
            ["exit"] = {
                heading = 180,
                debug = false,
                length = 1,
                width = 1,
                distance = 1.0,
                created = false
            }
        },
        keyholders = {},
        pincode = 4675,
        inventory = {},
        opened = false,
        takingover = false,
        money = 0,
    }
}

Config.AllowedItems = {
    ["goldbar"] = {
        name = "goldbar",
        wait = 25,
        reward = 25,
    },
    ["copper"] = {
        name = "copper",
        wait = 500,
        reward = 2,
    },
    ["iron"] = {
        name = "iron",
        wait = 500,
        reward = 2,
    },
    ["aluminum"] = {
        name = "aluminum",
        wait = 500,
        reward = 2,
    },
    ["steel"] = {
        name = "steel",
        wait = 500,
        reward = 2,
    },
    ["glass"] = {
        name = "glass",
        wait = 500,
        reward = 2,
    },
    ["lockpick"] = {
        name = "lockpick",
        wait = 10000,
        reward = 10,
    },
    ["screwdriverset"] = {
        name = "screwdriverset",
        wait = 10000,
        reward = 10,
    },
    ["radioscanner"] = {
        name = "radioscanner",
        wait = 10000,
        reward = 85,
    },
    ["weed_brick"] = {
        name = "weed_brick",
        wait = 5000,
        reward = 25,
    },
    ["phone"] = {
        name = "phone",
        wait = 2000,
        reward = 10,
    },
    ["handcuffs"] = {
        name = "handcuffs",
        wait = 2000,
        reward = 40,
    },
    ["10kgoldchain"] = {
        name = "10kgoldchain",
        wait = 10000,
        reward = 300,
    },
}
