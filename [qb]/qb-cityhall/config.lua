Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = { -- Only used when not using qb-jobs.
    ["trucker"] = {["label"] = "Trucker", ["isManaged"] = false},
    ["taxis"] = {["label"] = "Taxi", ["isManaged"] = false},
    ["tow"] = {["label"] = "Tow Truck", ["isManaged"] = false},
    ["heli-driver"] = {["label"] = "Helicopter Helicopter", ["isManaged"] = false},
    ["bus-driver"] = {["label"] = "Bus Driver", ["isManaged"] = false},
    ["forklift-driver"] = {["label"] = "ForkLift Driver", ["isManaged"] = false},
    ["lifeguard"] = {["label"] = "Lifeguard", ["isManaged"] = false},
    ["telco"] = {["label"] = "Tel Co", ["isManaged"] = false}
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-554.91, -185.17, 38.22),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.88,
            colour = 0,
            title = "London City Hall"
        },
        licenses = {
            ["id_card"] = {
                label = "ID Card",
                cost = 50,
            },
          -- ["driver_license"] = {
          --      label = "Driver License",
         --       cost = 50,
         --       metadata = "driver"
         --   },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(240.3, -1379.89, 3.74),
        showBlip = false,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = "Driving School"
        },
        instructors = {
            "DJD56142",
            "DXT09752",
            "SRI85140",
            "RUC27027",
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'ig_agatha',
        coords = vec4(-553.11, -193.81, 37.22, 210.78),
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 4.0,
            width = 4.0,
            debugPoly = false
        }
    },
    -- Driving School Ped
    {
        model = 'ig_djtalignazio',
        coords = vec4(240.91, -1379.2, -32.74, 138.96),
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }
}
