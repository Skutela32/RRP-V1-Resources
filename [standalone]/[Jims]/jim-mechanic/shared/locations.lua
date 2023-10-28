Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "srs",
	zones = {
		vec2(870.37, -2092.68),		--Yan
		vec2(919.18, -2095.11),		--Yan
		vec2(917.40, -2136.90),		--Yan
		vec2(867.38, -2133.96),		--Yan
		vec2(867.38, -2133.96),		--Yan
		vec2(979.15, -1502.7),		--Tuner
		vec2(980.1, -1492.22),		--Tuner
		vec2(1001.1, -1492.05),		--Tuner
		vec2(1001.79, -1502.7)		--Tuner
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(913.64, -2116.74, 30.46, 261.96), w = 3.6, d = 1.8, },
	},
	store = {
		{ coords = vec4(124.55, -3007.91, 0.04, 358.07), w = 3.60, d = 0.8 },
	},
	crafting = {
		{ coords = vec4(915.93, -2105.4, 30.46, 259.85), w = 2.8, d = 1.5 },
	},
	clockin = {
		{ coords = vec4(146.63, -3013.7, 0.84, 355.34), prop = false },
	},
	manualRepair = {
		{ coords = vec4(146.63, -3013.7, 0.84, 355.34), prop = false, },
	},
	carLift = {
        { coords = vec4(913.62, -2103.83, 29.86, 172.88), use = false },
        { coords = vec4(998.8, -1499.59, 31.08, 181.15), use = false },
    },
	garage = {
		spawn = vec4(-182.74, -1317.61, 0.63, 357.23),
		out = vec4(-190.62, -1311.57, 1.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = false
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-192.21, -1316.34, 1.10, 285.83), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-913.62, -2103.83, 29.86),
		label = "Yiannimize",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "midnightsyn",
	zones = {
		vec2(121.59, -3083.33),
		vec2(121.59, -3001.89),
		vec2(156.06, -3001.89),
		vec2(156.06, -3083.33)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(128.72, -3013.57, 7.04, 181.11), w = 3.6, d = 1.8, },
	},
	store = {
		{ coords = vec4(126.06, -3007.91, 7.04, -25.31), w = 3.60, d = 0.8 },
	},
	crafting = {
		{ coords = vec4(138.66, -3050.74, 7.04, 181.77), w = 2.8, d = 1.5 },
	},
	clockin = {
		{ coords = vec4(145.76, -3014.68, 7.04, 168.48), prop = false },
	},
	manualRepair = {
		{ coords = vec4(121.05, -3047.82, 7.04, 272.02), prop = false, },
	},
	carLift = {
        { coords = vec4(125.19, -3041.12, 7.04, 271.13), use = false },
        { coords = vec4(125.7, -3034.51, 7.04, 273.59), use = false },
    },
	garage = {
		spawn = vec4(-182.74, -1317.61, 0.63, 357.23),
		out = vec4(-190.62, -1311.57, 1.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = false
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(147.34, -3013.46, 7.04, 185.49), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(144.15, -3034.99, 7.04),
		label = "Midnight Syndicate",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ LS CUSTOMS IN CITY ]]--
	Enabled = true,
	job = "redline",
	zones = {
		vec2(-551.83, -906.69),
		vec2(-556.39, -942.11),
		vec2(-600.41, -942.06),
		vec2(-590.74, -906.94)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(-586.67, -931.99, 23.89, 88.24), w = 4.0, d = 1.0, },
	},
	store = {
		{ coords = vec4(-347.9, -133.19, 39.01, 340.0), w = 1.2, d = 0.25, },
	},
	crafting = {
		{ coords = vec4(-583.84, -938.89, 23.89, 181.31), w = 3.2, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(-344.85, -140.35, 39.05, 157.0), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-322.28, -140.38, 39.01, 68.35), prop = false, },
	},
	garage = {
		spawn = vec4(-361.48, -123.14, 38.03, 158.96),
		out = vec4(-356.2, -126.55, 39.43, 253.49),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(-343.75, -140.86, 39.02, 180.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-572.82, -923.74, 29.2),
		label = "Redline",
		color = 1,
		sprite = 544,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}


Config.Locations[#Config.Locations+1] = { --[[ Essex Customs ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-1405.71, -445.44),
		vec2(-1412.09, -435.45),
		vec2(-1434.71, -449.50),
		vec2(-1427.71, -460.17)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(-1414.76, -451.23, 35.91, 206.61), w = 4.0, d = 1.0, },
	},
	store = {
		{ coords = vec4(-347.9, -133.19, 39.01, 340.0), w = 1.2, d = 0.25, },
	},
	crafting = {
		{ coords = vec4(-1408.75, -447.48, 35.91, 221.80), w = 3.2, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(-344.85, -140.35, 39.05, 157.0), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-322.28, -140.38, 39.01, 68.35), prop = false, },
	},
	garage = {
		spawn = vec4(-361.48, -123.14, 38.03, 158.96),
		out = vec4(-356.2, -126.55, 39.43, 253.49),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(-343.75, -140.86, 39.02, 180.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-1417.11, -446.04, 35.91),
		label = "Essex Customs",
		color = 1,
		sprite = 402,
		disp = 6,
		scale = 1.1,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}