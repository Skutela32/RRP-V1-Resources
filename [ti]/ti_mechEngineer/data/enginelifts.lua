--[[

locations for engine cranes/lifts.

--]]

local craneModel = `imp_prop_engine_hoist_02a`

engineLifts = {
    testLift1 = {
        characterRestrictions = {
            'ABC:123',
        },
        
        jobRestrictions = {
            srs = 4,
        },
        
        --groupRestrictions = {
        --    police = 2,
        --},

        position = vector3(980.84, -1493.13, 31.5),

        props = {
            {
                position = vector3(980.84, -1493.13, 31.5),
                heading = 240.58,
                model = craneModel
            }
        }
    }
}