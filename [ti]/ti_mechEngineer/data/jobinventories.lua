--[[

job inventories, allowing you to access premade items with no production time or required items.

--]]

local toolBoxModel = `imp_prop_tool_draw_01b`

jobInventories = {
    testInventory1 = {
        characterRestrictions = {
            'ABC:123',
        },
        
        jobRestrictions = {
            srs = 4,
        },
        
        --groupRestrictions = {
        --    police = 2,
        --},

        position = vector3(985.88, -1502.2, 31.5),

        animation = {
            ad = "pickup_object",
            anim = "putdown_low",
            blendIn = 5.0,
            blendOut = 1.5,
            duration = 1.0,
            flag = 48,
            playbackRate = 0.0,
            lockX = false,
            lockY = false,
            lockZ = false
        },

        items = {
            'testEngine1',
            'testBlock1',
            'testComp1',
            'testNitrous1',
        },

        props = {
            {
                position = vector3(-216.46,-1318.63,2.9),
                heading = 90.0,
                model = toolBoxModel,
            },  
        }   
    }
}