Config = {}
Config.Debug = false -- True / False for Debug System
Config.Dispatch = "ps-dispatch" -- 'default' / 'ps-dispatch' / 'cd_dispatch'
Config.PoliceRequired = 1 -- How many PD Officers Required to request
Config.Cooldown = 1 -- Server cooldown for alerts ( Set in minutes )

Config.Locations = {
    ["police"] = { -- Set this to the name of the job
        Required = 1, -- How many players with this job are required to be online to make a request/alert (You'll need to add events that track the amount of players online with that job. Police / Ambulance is setup by default)
        Zone = { -- Polyzone Info
            name = "PD Receptionist", -- Name of the menu title
            coords = vector3(442.72, -981.95, 30.69), -- Boxzone Coords
            length = 2.2, width = 2.2, -- Boxzone Length / Width
            heading = 335, -- Boxzone Heading
            minZ = 30.49, -- Boxzone MinZ
            maxZ = 31.29 -- Boxzone MaxZ
        },
        Menu = { -- Menu Info ( Set Header, Text, Icon, Event, and Event Type )
            [1] = { Header = 'Assistance', Txt = '', Icon = 'fas fa-hand', Event = 'rs-frontdesk:client:RequestAssistance', Args = 'assistance' },
            [2] = { Header = 'Interview', Txt = '', Icon = 'fas fa-people-arrows-left-right', Event = 'rs-frontdesk:client:RequestAssistance', Args = 'interview' },
            [3] = { Header = 'Supervisor', Txt = '', Icon = 'fas fa-crown', Event = 'rs-frontdesk:client:RequestAssistance', Args = 'supervisor' },
        }
    },
    ["ambulance"] = {
        Required = 1, -- How many players with this job are required to be online to make a request/alert (You'll need to add events that track the amount of players online with that job. Police / Ambulance is setup by default)
        Zone = {
            name = "St. Pillbox Front Desk",
            coords = vector3(311.82, -583.94, 43.27),
            length = 2.4, width = 2.4,
            heading = 337,
            minZ = 40,
            maxZ = 45
        },
        Menu = {
            [1] = { Header = 'Assistance', Txt = '', Icon = 'fas fa-hand', Event = 'rs-frontdesk:client:RequestAssistance', Args = 'assistance'},
            [2] = { Header = 'Interview', Txt = '', Icon = 'fas fa-people-arrows-left-right', Event = 'rs-frontdesk:client:RequestAssistance', Args = 'interview' },
            [3] = { Header = 'Supervisor', Txt = '', Icon = 'fas fa-crown', Event = 'rs-frontdesk:client:RequestAssistance', Args = 'supervisor'},
        }
    }
}
