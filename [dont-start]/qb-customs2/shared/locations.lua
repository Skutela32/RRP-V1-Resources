--[[
Vehicle Classes:
0: Compacts     1: Sedans       2: SUVs         3: Coupes       4: Muscle       5: Sports Classics
6: Sports       7: Super        8: Motorcycles  9: Off-road     10: Industrial  11: Utility
12: Vans        13: Cycles      14: Boats       15: Helicopters 16: Planes      17: Service
18: Emergency   19: Military    20: Commercial  21: Trains
 ]]

Config = Config or {}

Config.Locations = {
     ['6str'] = {
        settings = {
            label = 'grovestreet customs',
            welcomeLabel = "grovestreet customs",
            enabled = true,
        },
        blip = {
            label = 'grovestreet customs',
            coords = vector3(-2061.63, -471.59, 12.19),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "grove street customs"
        },
        restrictions = {
            job = { 'bmc' },
            allowedClasses = {},
           },
        zones = {
            { coords = vector3(-2044.84, -485.22, 11.19), length = 6.0, width = 4.0, heading = 141.24, minZ = 2.88, maxZ = 40.48 },
            { coords = vector3(-2052.56, -478.51, 11.19), length = 6.0, width = 4.0, heading = 141.24, minZ = 2.88, maxZ = 40.48 },
            { coords = vector3(-2061.63, -471.59, 11.19), length = 6.0, width = 4.0, heading = 141.24, minZ = 2.88, maxZ = 40.48 },
        }
    },
}