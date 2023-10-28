Config = {}

Config.lightSpeed = 20.0 -- This controls how fast the lights change. (the lower the number the faster they change, the higher the number the slower they change!)

Config.envLightBrightness = 1.3 -- How bright should the environment lights be? (0.0 - 3.0)
Config.experimentalEnv = {
    enabled = false,
    -- this runs appx 2x less performance than the normal env lights.
    -- this is a work in progress, it's not perfect yet.
    -- if you have any suggestions on how to improve this, please let me know.
    intensity = 1, -- if intensity is over 9000 then the lights will be more of an experience.
    distance = 12.0, -- How far should the environment lights be? (float)
    brightness = 6.0, -- How bright should the environment lights be? (float)
    hardness = 0.25, -- How hard should the environment lights be? (float)
    radius = 65.0, -- How big should the environment lights be? (float)
    falloff = 0.05, -- How fast should the environment lights fade? not the best way to describe it, just google it. (float)
}

Config.headlightFlashers = {
    enabled = false,
    distance = 65.0,
    brightness = 1.2,
    hardness = 0.0,
    radius = 50.0,
    falloff = 10.0,
} -- Should the headlights flash when the lights are on? (true/false) | This is CLIENT SIDE ONLY! (This is a visual effect only, other players will not see your headlights flashing.)

Config.elsResize = {
    -- The way this works is you just drag the UI to where you want it to go.
    -- And then you can click the +/- buttons to change the size of the UI.
    -- You can also use arrow key up/down to change the size.
    -- You can also use -/+ on your keyboard to change the size.
    -- You must have the UI open to change the size though.

    enabled = true, -- Gives the option to open the ELS Resizer with the command below. (true/false)
    command = "els", -- The command to open the ELS Resizer UI. (string)
}

Config.elsPanel = {
    -- This is the command to turn off/on the ELS UI Panel. Some people don't like it so you can turn it off if you want.
    enabled = true, -- Gives the option to disable/enable the ELS Panel with the command below. (true/false)
    command = "elsPanel", -- The command to open the ELS Panel. (string)
}

--[[
This configuration table is used to define the light patterns for emergency vehicles. The table contains different pattern groups, each containing multiple patterns with their corresponding light sequences for the vehicle's extras. In this case, there is only one pattern group named "default."

Each pattern group has a series of patterns defined by an index (1, 2, 3, etc.), and each pattern has a name attribute. The name attribute is used for reference and will be displayed on the ELS Panel.

Within each pattern, there are a series of numbered keys (1, 2, 3, etc.) corresponding to the "frame" of the "animation". The value for each extra is a string composed of 1s and 0s, where each character in the string represents a light state for a specific frame in the pattern.
    1 means the light is ON in the corresponding frame.
    0 means the light is OFF in the corresponding frame.

For example, in pattern 1 with the name "NORMAL", extra 1 has the following pattern: "000000111111000000111111000000111111".

This means that for the first 6 frames, the light will be OFF (0s), then it will be ON for the next 6 frames (1s), followed by 6 frames of OFF and another 6 frames of ON. This sequence will repeat as the pattern is played.

To create custom patterns, you can add or modify the patterns within a pattern group. To do so, simply modify the sequences of 1s and 0s for each extra in the pattern. While it's recommended to keep the length of the strings consistent for all extras within a specific pattern to maintain continuity, it's not mandatory. You can make an "animation" as long or as short as you want, as it will just repeat. However, do keep in mind that different patterns can have different lengths, but it is advisable to maintain the same length for each extra within a specific pattern for a smoother appearance.
]]

Config.patternGroups = {
    {
        -- This would be pattern group one. By default all cars use pattern group one. In the future you will be able to change this, but right now if you want different patterns, just add/edit/remove patterns in this group.
        name = "default", -- Can be anything you want, not used atm just for reference. Will be used in the future if you want to change the pattern group on a vehicle.
        [1] = {
            -- Pattern 1
            name = "MAIN", -- This is the name of the specific pattern. These are the names that you see on the ELS Panel.
            [1] = "00000000000000111111", -- Frame 1 Blue Left
            [2] = "00000000000000111111", -- Frame 2 Blue Left
            [3] = "00001111110000000000", -- Frame 3 Blue Right
            [4] = "00001111110000000000", -- Frame 4 Blue Right
            [5] = "00000000000000000000", -- Frame 5 White Left
            [6] = "00000000000000000000", -- Frame 6 White Right
            [7] = "00001111110000000000", -- Frame 7 Red Left
            [8] = "00000000000000", -- Frame 8 Nothing
            [9] = "00000000000000111111", -- Frame 9 Red Right
            [10] = "00000000000000", -- Frame 10
            [11] = "00000000000000", -- Frame 11
            [12] = "00000000000000", -- Frame 12
            [13] = "00000000000000", -- Frame 13
            [14] = "00000000000000" -- Frame 14
        },
        [2] = {
            -- Pattern 2
            name = "PRIMARY", -- This is the name of the specific pattern. These are the names that you see on the ELS Panel.
            [1] = "000000000111111", -- Frame 1 Blue Left
            [2] = "000000111111000", -- Frame 2 Blue Left
            [3] = "000111111000000", -- Frame 3 Blue Right
            [4] = "111111000000000", -- Frame 4 Blue Right
            [5] = "000001111100000", -- Frame 5
            [6] = "111000111000111", -- Frame 6
            [7] = "000000000111111", -- Frame 7
            [8] = "000011111110000", -- Frame 8
            [9] = "111111000000000", -- Frame 9
            [10] = "101101001011010", -- Frame 10
            [11] = "101101001011010", -- Frame 11
            [12] = "101101001011010", -- Frame 12
            [13] = "101101001011010", -- Frame 13
            [14] = "101101001011010" -- Frame 14
        },
        [3] = {
            -- Pattern 3
            name = "SECONDARY", -- This is the name of the specific pattern. These are the names that you see on the ELS Panel.
            [1] = "000000111111000000111111000000111111", -- Frame 1
            [2] = "111000111000111000111000111000111000", -- Frame 2
            [3] = "000111000111000111000111000111000111", -- Frame 3
            [4] = "111111000000111111000000111111000000", -- Frame 4
            [5] = "111000111000111000111000111000111000", -- Frame 5
            [6] = "000111000111000111000111000111000111", -- Frame 6
            [7] = "100000110001100000000001100011000001", -- Frame 7
            [8] = "011100000100000111111000001000001110", -- Frame 8
            [9] = "100000110001100000000001100011000001", -- Frame 9
            [10] = "111111000000111111000000111111000000", -- Frame 10
            [11] = "111111000000111111000000111111000000", -- Frame 11
            [12] = "111111000000111111000000111111000000", -- Frame 12
            [13] = "111111000000111111000000111111000000", -- Frame 13
            [14] = "111111000000111111000000111111000000" -- Frame 14
        }
    }
}

-- This code is designed to allow your server to use both ELS and non-ELS vehicles.
-- The purpose of this code is to provide a way to implement non-ELS vehicle scripts
-- without activating them in ELS cars, ensuring compatibility between the two types
-- of vehicles. It's recommended not to modify this code unless you are confident
-- with your understanding.

if not IsDuplicityVersion() then
    local hashList = {}
    local started = false
    Citizen.CreateThread(
        function()
            repeat
                Citizen.Wait(0)
            until NetworkIsSessionActive()

            -- Get a list of all vehicle models
            local allVehicleModels = GetAllVehicleModels()

            -- Create a hash list of vehicle models
            for k, v in pairs(allVehicleModels) do
                hashList[GetHashKey(v)] = v
            end
            started = true
        end
    )

    -- Returns the lower case code for the specified vehicle
    function getCode(veh)
        return hashList[GetEntityModel(veh)]:lower()
    end

    local iVE = {}
    -- Exports a function to check if a vehicle is ELS
    exports(
        "isVehicleELS",
        function(veh)
            if iVE[veh] ~= nil then
                return iVE[veh]
            end

            if Config.Vehicles == nil then
                return false
            end

            -- Check if the vehicle is in the ELS configuration
            local model = GetEntityModel(veh);
            for k, v in pairs(Config.Vehicles) do
                local thisHash = v.__hash__ or GetHashKey(v.name:lower())
                if thisHash == model then
                    iVE[veh] = true
                    return true
                end
            end

            return iVE[veh]
        end
    )
end