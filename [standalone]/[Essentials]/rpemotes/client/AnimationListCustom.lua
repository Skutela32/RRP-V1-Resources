-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

--- RPEmotes by TayMcKenzieNZ, Mathu_lmn and MadsL, maintained by TayMcKenzieNZ ---
--- Download OFFICIAL version and updates ONLY at https://github.com/TayMcKenzieNZ/rpemotes ---
--- RPEmotes is FREE and ALWAYS will be. STOP PAYING SCAMMERS OR SOMEONE ELSE'S WORK!!! ---
--- Remove the } from the = {} then enter your own animation code ---
--- Don't forget to close the tables. See https://docs.rpemotes.com/for-developers/important-note/custom-emotes-and-props ---

local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {}
CustomDP.Dances = {}
CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = {}
CustomDP.PropEmotes = {
    ["cozinheiro"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Cozinheiro", AnimationOptions =
    {
        Prop = "prop_knife",
        PropBone = 18905,
        PropPlacement = {0.13, 0.15, 0.0, -10.0, 0.0, -20.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["2tabuleiros"] = { "anim@heists@box_carry@", "idle", "Food Tray F", AnimationOptions = {
        Prop = "prop_food_bs_tray_02",
        PropBone = 57005,
        PropPlacement = { 0.2500, 0.1000, 0.0700, -110.5483936, 73.3529273, -16.338362 },
        SecondProp = 'prop_food_bs_tray_03',
        SecondPropBone = 18905,
        SecondPropPlacement = { 0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263 },
        EmoteLoop = true,
        EmoteMoving = true,
    }},
}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

-- Add the custom emotes to RPEmotes main array
for arrayName, array in pairs(CustomDP) do
    if RP[arrayName] then
        for emoteName, emoteData in pairs(array) do
            RP[arrayName][emoteName] = emoteData
        end
    end
    -- Free memory
    CustomDP[arrayName] = nil
end
-- Free memory
CustomDP = nil
