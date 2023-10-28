-- Zones for Menues
Config = Config or {}

Config.UseTarget = false -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police2'] = {
        vector3(461.45, -986.2, 30.73),
    },
    ['realestate'] = {
        vector3(-123.75, -591.2, 35.07),
    },
}

Config.BossMenuZones = {
    ['police2'] = {
        { coords = vector3(447.23, -974.3, 31.47), length = 1.35, width = 1.45, heading = 351.0, minZ = 30.00, maxZ = 31.73 }, 
    },
}

Config.GangMenus = {
    ['soa'] = {
        vector3(2519.23, 4104.79, 35.59),
    },
    ['essexboys'] = {
        vector3(-1556.66, -397.17, 48.05),
    },
    ['gsf'] = {
        vector3(-186.31, -1701.84, 32.82),
    },
    ['nagmafia'] = {
        vector3(-186.31, -1701.84, 32.82),
    },
    ['white'] = {
        vector3(1405.06, 1165.27, 114.33),
    },
    ['lostmc'] = {
        vector3(915.26, 3581.2, 29.92),
    },
    ['testmc'] = {
        vector3(915.31, 3581.47, 29.92),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
