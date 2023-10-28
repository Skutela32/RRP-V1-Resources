Crafting = {
	Nos = {
		{ ["nos"] = { ["noscan"] = 1, } },
		{ ["noscan"] = { ["steel"] = 30, } },
		{ ["noscolour"] = { ["plastic"] = 10, } },
	},
	Repairs = {
		{ ["mechanic_tools"] = { ["iron"] = 5, } },
		{ ["ducttape"] = { ["plastic"] = 5, } },
		{ ["newoil"] = { ["plastic"] = 5, } },
		{ ["sparkplugs"] = { ["metalscrap"] = 5, } },
		{ ["carbattery"] = { ["metalscrap"] = 5, ["plastic"] = 1 } },
		{ ["axleparts"] = { ["steel"] = 5, } },
		{ ["sparetire"] = { ["rubber"] = 5, } },
	},
	Tools = {
		{ ["toolbox"] = { ["iron"] = 5, } },
		{ ["paintcan"] = { ["aluminum"] = 1, } },

		{ ["tint_supplies"] = { ["iron"] = 1, } },
		{ ["underglow_controller"] = { ["iron"] = 5, } },
		{ ["cleaningkit"] = { ["rubber"] = 5, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		{ ["cleaningkit"] = { ["rubber"] = 5, ["engine2"] = 1, ["plastic"] = 2 },
				["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --
	},
	Perform = {
		{ ["turbo"] = { ["steel"] = 75, } },
		{ ["car_armor"] = { ["plastic"] = 60, } },
		{ ["engine1"] = { ["steel"] = 10, } },
		{ ["engine2"] = { ["steel"] = 20, } },
		{ ["engine3"] = { ["steel"] = 30, } },
		{ ["engine4"] = { ["steel"] = 40, } },
		{ ["engine5"] = { ["steel"] = 50, } },
		{ ["transmission1"] = { ["steel"] = 10, } },
		{ ["transmission2"] = { ["steel"] = 20, } },
		{ ["transmission3"] = { ["steel"] = 30, } },
		{ ["transmission4"] = { ["steel"] = 40, } },
		{ ["brakes1"] = { ["steel"] = 10, } },
		{ ["brakes2"] = { ["steel"] = 20, } },
		{ ["brakes3"] = { ["steel"] = 30, } },
		{ ["suspension1"] = { ["steel"] = 10, } },
		{ ["suspension2"] = { ["steel"] = 20, } },
		{ ["suspension3"] = { ["steel"] = 30, } },
		{ ["suspension4"] = { ["steel"] = 40, } },
		{ ["suspension5"] = { ["steel"] = 50, ["iron"] = 500, } },
		{ ["bprooftires"] = { ["rubber"] = 100, } },
		{ ["drifttires"] = { ["rubber"] = 120, } },

		{ ["harness"] = { ["steel"] = 10, ["rubber"] = 100,} },
	},
	Cosmetic = {
		{ ["hood"] = { ["plastic"] = 10, } },
		{ ["roof"] = { ["plastic"] = 10, } },
		{ ["spoiler"] = { ["plastic"] = 10, } },
		{ ["bumper"] = { ["plastic"] = 10, } },
		{ ["skirts"] = { ["plastic"] = 10, } },
		{ ["exhaust"] = { ["iron"] = 10, } },
		{ ["seat"] = { ["plastic"] = 10, } },
		{ ["livery"] = { ["plastic"] = 10 }, },
		{ ["tires"] = { ["rubber"] = 10, } },
		{ ["horn"] = { ["plastic"] = 10, } },
		{ ["internals"] = { ["plastic"] = 10, } },
		{ ["externals"] = { ["plastic"] = 10, } },
		{ ["customplate"] = { ["steel"] = 10, } },
		{ ["headlights"] = { ["plastic"] = 10, } },
		{ ["rims"] = { ["iron"] = 10, } },
		{ ["rollcage"] = { ["steel"] = 10, } },
	},
}

Stores = {
	NosItems = {
		label = Loc[Config.Lan]["stores"].nos,
		items = {
			{ name = "nos", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "noscolour", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	RepairItems = {
		label = Loc[Config.Lan]["stores"].repairs,
		items = {
			{ name = "mechanic_tools", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "sparetire", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "axleparts", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "carbattery", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "sparkplugs", price = 0, amount = 1000, info = {}, type = "item", },
			{ name = "newoil", price = 0, amount = 1000, info = {}, type = "item", },
		},
	},
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "toolbox", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cleaningkit", price = 0, amount = 100, info = {}, type = "item", },
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "engine5", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "transmission4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "car_armor", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension5", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bprooftires", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drifttires", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "oilp1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "oilp2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "oilp3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "drives1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drives2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "drives3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "cylind1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cylind2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cylind3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "cables1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cables2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "cables3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "fueltank1", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "fueltank2", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "fueltank3", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "harness", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "antilag", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	CosmeticItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.CosmeticItems.slots = #Stores.CosmeticItems.items
for k in pairs(Stores.CosmeticItems.items) do Stores.CosmeticItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
Stores.RepairItems.slots = #Stores.RepairItems.items
for k in pairs(Stores.RepairItems.items) do Stores.RepairItems.items[k].slot = k end
Stores.NosItems.slots = #Stores.NosItems.items
for k in pairs(Stores.NosItems.items) do Stores.NosItems.items[k].slot = k end