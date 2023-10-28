-- Thanks for using this script! Check out other free scripts by me on CFX FiveM or my Tebex for paid scripts/support: https://angelicxs.tebex.io/

Config = {}

Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.UseThirdEye = true				-- If true uses third eye.
Config.ThirdEyeName = 'qb-target' 			-- Name of third eye aplication
Config.Use3DText = false                        -- Use 3D text to interact
Config.NHMenu = false						-- Use NH-Context [https://github.com/whooith/nh-context]
Config.QBMenu = true					-- Use QB-Menu (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-menu]
Config.OXLib = false						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib] !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!
Config.ElevatorWaitTime = 3					-- How many seconds until the player arrives at their floor

Config.Notify = {
	enabled = false,							-- Display hint notification?
	distance = 3.0,							-- Distance from elevator that the hint will show
	message = "Target the elevator to use"	-- Text of the hint notification
}

--[[
	USAGE
	To add an elevator, copy the table below and configure as needed:
		coords = vector3 coords of center of elevator
		heading = Direction facing out of the elevator
		level = What floor are they going to
		label = What is on that floor
		jobs = OPTIONAL: Table of job keys that are allowed to access that floor and value of minimum grade of each job
		items = OPTIONAL: Any items that are required to access that floor (only requires one of the items listed)
		jobAndItem = OPTIONAL: If true, you must you have a required job AND a required items. If false or nil no items are needed
	
]]

--[[
	ExampleElevator = {	
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 2", label = "Roof",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_bronze",
				"casino_pass_silver",
				"casino_pass_gold",
			}
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 1", label = "Penthouse",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_gold",
			},
			jobAndItem = true
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 0", label = "Ground"
		},
	},
]]

Config.Elevators = {

	VPDMainElevator = {	
		{
			coords = vector3(-1096.22, -850.763, 38.20), heading = 36.8, level = "Floor 6", label = "Roof Access",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 34.40), heading = 36.8, level = "Floor 5", label = "Detective Bureau",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 30.80), heading = 36.8, level = "Floor 4", label = "Operations Center",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 27.00), heading = 36.8, level = "Floor 3", label = "Division Offices & Briefing Room",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 23.00), heading = 36.8, level = "Floor 2", label = "Cafe",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 19.00), heading = 36.8, level = "Floor 1", label = "Main Hall",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 4.80), heading = 36.8, level = "Floor -1", label = "Detention Cells & Interrogation",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 10.20), heading = 36.8, level = "Floor -2", label = "Crime Lab & Evidence Rooms",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1096.22, -850.763, 13.70), heading = 36.8, level = "Floor -3", label = "Garage & Armory",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
	},

	VPDPublicElevator = {
		{
			coords = vector3(-1066.05, -833.71, 26.82318), heading = 36.1, level = "Floor 3", label = "Division Offices",
		},
		{
			coords = vector3(-1066.05, -833.71, 23.03471), heading = 36.1, level = "Floor 2", label = "UNDER RENOVATIONS",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1066.05, -833.713, 18.9964), heading = 36.1, level = "Floor 1", label = "Main Hall",
		},
		{
			coords = vector3(-1066.05, -833.71, 4.88), heading = 36.1, level = "Floor -1", label = "Detention Cells & Interrogation",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1066.05, -833.71, 10.27282), heading = 36.1, level = "Floor -2", label = "Crime Lab & Evidence Rooms",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			}
		},
		{
			coords = vector3(-1066.05, -833.71, 13.69069), heading = 36.1, level = "Floor -3", label = "Garage & Armory",
			jobs = {
				["police"] = 0,
				["sheriff"] = 0,
				["ambulance"] = 0,
			},
		},
	},

	SkybarElevatorSouth = {
		{
			coords = vector3(315.49, -929.32, 52.81), heading = 176.67, level = "Skybar 5th Floor", label = "Bar Level for Skybar",
		},
		{
			coords = vector3(315.49, -929.32, 29.47), heading = 176.67, level = "Skybar Ground", label = "Street Level for Skybar",
		},
	},
	
	SkybarElevatorNorth = {
		{
			coords = vector3(309.81, -929.05, 52.81), heading = 176.67, level = "Skybar 5th Floor", label = "Bar Level for Skybar",
		},
		{
			coords = vector3(309.81, -929.05, 29.47), heading = 176.67, level = "Skybar Ground", label = "Street Level for Skybar",
		},
	},

	PiecesViewed = {
		{
			coords = vector3(5800.82, -5646.01, -30.27), heading = 269.75, level = "Entrance", label = "Main Entrance",
		},
		{
			coords = vector3(482.35, -2623.84, -49.06), heading = 180.13, level = "RV Ground", label = "Big Pieces",
		},
	},

	LockoEnnit = {
		{
			coords = vector3(-1023.34, -439.92, 39.61), heading = 203.91, level = "Entrance", label = "Main Entrance",
		},
		{
			coords = vector3(-1030.83, -434.61, 63.86), heading = 300.26, level = "Main Floor", label = "Main Floor",
		},
	},

	VinePD = {
		{
			coords = vector3(604.75, 5.43, 97.87), heading = 340.03, level = "VPD 4th Floor", label = "VPD - 4th Floor",
			jobs = {
				["police"] = 0,
			},
		},
		{
			coords = vector3(565.7, 4.94, 103.23), heading = 272.24, level = "VPD Rooftop", label = "VPD - Rooftop",
			jobs = {
				["police"] = 0,
			},
		},
	},

	Casino = {
		{
			coords = vector3(959.98, 43.12, 71.7), heading = 257.84, level = "Casino Floor", label = "Casino - Main Casino",
			jobs = {
				["casino"] = 0,
			},
		},
		{
			coords = vector3(980.89, 56.52, 116.16), heading = 61.95, level = "Casino Penthouse", label = "Casino - Penthouse",
			jobs = {
				["casino"] = 0,
			},
		},
		{
			coords = vector3(968.11, 63.4, 112.55), heading = 61.95, level = "Parking", label = "Casino - Roof Terrance",
			jobs = {
				["casino"] = 0,
			},
		},
	},

	PillboxElevatorNorth = {
		{
			coords = vector3(332.37, -595.56, 43.28), heading = 70.65, level = "Upper Pillbox", label = "Pillbox - Main Floor",
		},
		{
			coords = vector3(344.31, -586.12, 28.79), heading = 252.84, level = "Lower Pillbox", label = "Pillbox - Lower Pillbox",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(340.05, -584.98, 28.79), heading = 88.21, level = "Parking", label = "Pillbox - Parking Facilities",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(275.75, -1361.5, 24.54), heading = 48.9, level = "Mourge", label = "Pillbox - Mourge",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},

	Pillbox = {
		{
			coords = vector3(338.52, -583.84, 74.16), heading = 254.13, level = "Rooftop", label = "Pillbox - HeliPad",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(335.72, -588.87, 43.27), heading = 67.1, level = "Upper Pillbox", label = "Pillbox - Main Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(323.67, -587.1, 28.85), heading = 247.55, level = "Bottom Pillbox", label = "Pillbox - Bottom Floor",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(275.75, -1361.5, 24.54), heading = 48.9, level = "Parking", label = "Pillbox - Mourge",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
			},
		},
	},

	SirPieces = {
		{
			coords = vector3(-144.4, -598.59, 206.92), heading = 162.32, level = "Rooftop", label = "B&C - Helipad",
			jobs = {
				["spbc"] = 0,
			},
		},
		{
			coords = vector3(-141.69, -620.94, 168.82), heading = 280.99, level = "Office Floors", label = "B&C - Offices",
		},
		{
			coords = vector3(-146.12, -604.1, 167.0), heading = 38.75, level = "Mod Shop", label = "B&C - Mod Shop Floor",
			jobs = {
				["spbc"] = 0,
			},
		},
		{
			coords = vector3(-129.07, -583.24, 35.07), heading = 152.16, level = "Lobby", label = "B&C - Lobby",
		},
		{
			coords = vector3(-142.76, -572.64, 32.42), heading = 157.32, level = "Garage", label = "B&C - Garage",
		},
	},

}
