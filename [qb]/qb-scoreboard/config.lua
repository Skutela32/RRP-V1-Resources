Config = Config or {}

-- Open scoreboard key
Config.OpenKey = 'HOME' -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

Config.Toggle = false -- If this is false the scoreboard stays open only when you hold the OpenKey button, if this is true the scoreboard will be openned and closed with the OpenKey button

-- Max Server Players
Config.MaxPlayers = GetConvarInt('sv_maxclients', 64) -- It returns 48 if it cant find the Convar Int

-- Minimum Police for Actions
Config.IllegalActions = {
    ["storerobbery"] = {
        minimumPolice = 2,
        busy = false,
        label = "Store Robbery",
    },
    ["bankrobbery"] = {
        minimumPolice = 3,
        busy = false,
        label = "Standard Bank Robbery"
    },
    ["jewellery"] = {
        minimumPolice = 8,
        busy = false,
        label = "Jewellery Store Robbery"
    },
    ["pacific"] = {
        minimumPolice = 5,
        busy = false,
        label = "Pacific Bank Robbery"
    },
    ["paleto"] = {
        minimumPolice = 4,
        busy = false,
        label = "Paleto Bank Robbery"
    },
    ["empty"] = {
        minimumPolice = 3,
        busy = false,
        label = "Kidnapping Police"
    },
    ["empty2"] = {
        minimumPolice = 1,
        busy = false,
        label = "Drug Selling"
    },
    ["empty3"] = {
        minimumPolice = 1,
        busy = false,
        label = "Raid Camps"
    }
}

-- Show ID's for all players or Opted in Staff
Config.ShowIDforALL = true
