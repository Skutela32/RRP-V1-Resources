Config = Config or {}
Config.AutoRespawn = false --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
Config.SharedGarages = false   --True == Gang and job garages are shared, false == Gang and Job garages are personal
Config.VisuallyDamageCars = true --True == Visually damage cars that go out of the garage depending of body damage, false == Do not visually damage cars (damage is still applied to car values)
Config.SharedPublicGarages = false --Ture All public garages can access all vehicle of player that parked in garage type "public", -- False player can't access another public garages from anywhere (this is original behavior of script)

Config.Garages = {
    ["casinogarage"] = {
        ["label"] = "Casino Parking",
        ["takeVehicle"] = vector3(925.3, 51.85, 81.11),
        ["spawnPoint"] = vector4(918.77, 51.73, 80.16, 329.43),
        ["putVehicle"] = vector3(914.92, 37.85, 80.07),
        ["showBlip"] = true,
        ["blipName"] = "Public Parking",
        ["blipNumber"] = 357,
        ["blipColor"] = 3,
        ["type"] = "job",                --public, job, gang, depot
        ["job"] = "casino",
        ["vehicle"] = "car"                 --car, air, sea, rig
    },
}
Config.HouseGarages = {}
