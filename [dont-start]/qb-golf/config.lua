Config = {}

Config.Target = 'qb-target'  --- [ox_target/qb-target/qtarget]
Config.Inventory = 'qb'    ---- ox = Ox-inventory / qb = qb-inventory
Config.MemberPrice = 360
Config.MemberCarditem = 'lscm'

Config.Blip = vec3(-1360.336, 160.0437, 57.4211)  -- Blip Location
Config.PayLoc = vec3(-1365.99, 56.66, 54.1)       -- Where you will Pay for the Membership
Config.GolfStartLoc = vec3(-1348.73, 142.36, 56.27)       -- Where the Location to start Golfing
Config.CartSpawnLoc = {x = -1351.36, y = 134.05, z = 56.26}  -- where the cart will spawn


function alertCops()
    exports['ps-dispatch']:SuspiciousActivity()
end    
