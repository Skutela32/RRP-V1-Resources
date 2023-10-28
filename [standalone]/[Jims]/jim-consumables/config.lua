print("^2Jim^7-^2Consumables ^7v^41^7.^45 ^7- ^2Consumables Script by ^1Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false,
	Core = "qb-core",

	Inv = "qb", -- set to "ox" if using ox_inventory
	Notify = "qb",  -- set to "ox" if using ox_lib

	UseProgbar = true,
	ProgressBar = "qb", -- set to "ox" if using ox_lib

	Consumables = {
	
		["primeenergygrape"] = { emote = "drinkprimegrape", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["primeenergyorange"] = { emote = "drinkprimeorange", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["primeenergyicepop"] = { emote = "drinkprimeicepop", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["primeenergytropical"] = { emote = "drinkprimetropical", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["primeenergylemonlime"] = { emote = "drinkprimelemonlime", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["primeenergybluerasp"] = { emote = "drinkprimebluerasp", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["primeenergymetamoon"] = { emote = "drinkprimemetamoon", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["7upcan"] = { emote = "drink7up", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},	
		["cokecan"] = { emote = "drinkcoke", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},	
		["cokecherrycan"] = { emote = "drinkcokecherry", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["cokezerocan"] = { emote = "drinkcokezero", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["drpeppercan"] = { emote = "drinkdrpepper", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["7upcan"] = { emote = "drink7up", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["fantacan"] = { emote = "drinkfanta", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["dietpepsican"] = { emote = "drinkdietpepsi", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["pepsicherrycan"] = { emote = "drinkpepsicherry", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["spritecan"] = { emote = "drinksprite", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["redbullcan"] = { emote = "drinkredbull", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		["mountaindewcan"] = { emote = "drinkmountaindew", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35,54), }},
		
		
	},
	Emotes = {
		["drinkprimegrape"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Grape", AnimationOptions =
			{ Prop = 'brum_prime_grape', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkprimelemonlime"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Lemon & Lime", AnimationOptions =
			{ Prop = 'brum_prime_lemonlime', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkprimeorange"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Orange", AnimationOptions =
			{ Prop = 'brum_prime_orange', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkprimemetamoon"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Meta Moon", AnimationOptions =
			{ Prop = 'brum_prime_metamoon', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkprimeicepop"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Ice Pop", AnimationOptions =
			{ Prop = 'brum_prime_icepop', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkprimetropical"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Tropical Punch", AnimationOptions =
			{ Prop = 'brum_prime_tropicalpunch', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkprimebluerasp"] = {"mp_player_intdrink", "loop_bottle", "Prime Energy Blue Raspberry", AnimationOptions =
			{ Prop = 'brum_prime_blueraspberrry', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drink7up"] = {"mp_player_intdrink", "loop_bottle", "7 UP", AnimationOptions =
			{ Prop = 'brum_7up', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkcoke"] = {"mp_player_intdrink", "loop_bottle", "Coca Cola", AnimationOptions =
			{ Prop = 'brum_coke', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkcokecherry"] = {"mp_player_intdrink", "loop_bottle", "Coca Cola Cherry", AnimationOptions =
			{ Prop = 'brum_7up', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkcokezero"] = {"mp_player_intdrink", "loop_bottle", "Coca Cola Zero", AnimationOptions =
			{ Prop = 'brum_cokezero', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkdrpepper"] = {"mp_player_intdrink", "loop_bottle", "Dr Pepper", AnimationOptions =
			{ Prop = 'brum_dppepper', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkfanta"] = {"mp_player_intdrink", "loop_bottle", "Fanta", AnimationOptions =
			{ Prop = 'brum_fanta', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkdietpepsi"] = {"mp_player_intdrink", "loop_bottle", "Diet Pepsi", AnimationOptions =
			{ Prop = 'brum_pepsi_diet', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkpepsicherry"] = {"mp_player_intdrink", "loop_bottle", "Pepsi Wild Cherry", AnimationOptions =
			{ Prop = 'brum_pepsiwildcherry', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinksprite"] = {"mp_player_intdrink", "loop_bottle", "Sprite", AnimationOptions =
			{ Prop = 'brum_can_sprite', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkredbull"] = {"mp_player_intdrink", "loop_bottle", "Red Bull", AnimationOptions =
			{ Prop = 'brum_can_redbull', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
		["drinkmountaindew"] = {"mp_player_intdrink", "loop_bottle", "7 UP", AnimationOptions =
			{ Prop = 'brum_can_mountaindew', PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteLoop = true, EmoteMoving = true, }},
	}
}   

