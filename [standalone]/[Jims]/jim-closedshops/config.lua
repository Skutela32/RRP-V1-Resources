print("^2Jim^7-^2ClosedShops ^7v^41^7.^48^8 ^7- ^2ClosedShops Script by ^1Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/jixelpatterns

Config = {
	Debug = false, -- Debugging mode
	Lan = "en", -- Set locale file here
	img = "qb-inventory/html/images/", -- Set this to get correct "buying menu" images

	Core = "qb-core", -- set this to your core folder
	Inv = "qb", -- set to "qb" if using qb_inventory
				-- set to "ox" if using ox_nventory
				-- set to "qs" if using qs-inventory

	Menu = "qb",

	Notify = "qb",

	Renewed = false, -- If "false" use qb-management, if "true" use Renewed-Banking

	Shops = {
		['pipedown'] = {
			enable = true,
			location = vector4(-265.99, 231.65, 90.57, 86.27),
			ped = "mp_m_shopkeep_01",
			--prop = "prop_vend_coffe_01",
			itemlist = {
				--Drinks
				['highnoon'] = 100,
				['speedball'] = 100,
				['gunkaccino'] = 100,
				['bratte'] = 100,
				['flusher'] = 100,
				['ecocoffee'] = 100,
				['caffeagra'] = 100,
				['bigfruit'] = 100,
			},
		},
		['thingyshop'] = {
			enable = true,
			location = vector4(198.75, -235.8, 53.07, 119.2),
			ped = "u_m_y_hippie_01",
			--prop = "prop_vend_coffe_01",
			itemlist = {
				--Drinks
				['weed_papers'] = 2,
				['weed_wrap'] = 1,
				['plastic_bag'] = 1,
			},
		},
		['whitewidow'] = {
			enable = true,
			location = vector4(188.07, -241.91, 54.07, 244.47),
			ped = "s_m_y_strvend_01",
			--prop = "prop_vend_snak_01",
			itemlist = {
				--Bags
				['weed_skunk_cbd'] = 15,
				['weed_og-kush_cbd'] = 15,
				['weed_white-widow_cbd'] = 15,
				['weed_ak47_cbd'] = 15,
				['weed_amnesia_cbd'] = 15,
				['weed_purple-haze_cbd'] = 15,
				['weed_gelato_cbd'] = 15,
				['weed_zkittlez_cbd'] = 15,
				--Gummies
				['gummy_skunk_cbd'] = 20,
				['gummy_og-kush_cbd'] = 20,
				['gummy_white-widow_cbd'] = 20,
				['gummy_ak47_cbd'] = 20,
				['gummy_amnesia_cbd'] =20,
				['gummy_purple-haze_cbd'] = 20,
				['gummy_gelato_cbd'] = 20,
				['gummy_zkittlez_cbd'] = 20,
				--Joints
				['weed_skunk_cbd_joint'] = 5,
				['weed_og-kush_cbd_joint'] = 5,
				['weed_white-widow_cbd_joint'] = 5,
				['weed_ak47_cbd_joint'] = 5,
				['weed_amnesia_cbd_joint'] = 5,
				['weed_purple-haze_cbd_joint'] = 5,
				['weed_gelato_cbd_joint'] = 5,
				['weed_zkittlez_cbd_joint'] = 5,
			},
		},
		['catcafe'] = {
			enable = true,
			location = vector4(-584.75, -1060.62, 22.34, 270.99),
			ped = "s_f_y_shop_low",
			--prop = "prop_vend_snak_01",
			NoLimitStash = true,
			itemlist = {
				--Drinks
				['bobatea'] = 100,
				['bbobatea'] = 100,
				['gbobatea'] = 100,
				['obobatea'] = 100,
				['pbobatea'] = 100,
				['mocha'] = 100,
				--Food
				['bmochi'] = 100,
				['gmochi'] = 100,
				['omochi'] = 100,
				['pmochi'] = 100,
				['riceball'] = 100,
				['bento'] = 100,
				['purrito'] = 100,
				['nekocookie'] = 100,
				['nekodonut'] = 100,
				['cake'] = 100,
				['cakepop'] = 100,
				['pancake'] = 100,
				['pizza'] = 100,
				['miso'] = 100,
				['ramen'] = 100,
				['noodlebowl'] = 100,
			},
		},
		['henhouse'] = {
			enable = false,
			location = vec4(-296.48, 6259.31, 31.49, 255.0),
			--ped = "S_M_M_AmmuCountry",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['tillie'] = 100,
				['b52'] = 100,
				['brussian'] = 100,
				['bkamikaze'] = 100,
				['cappucc'] = 100,
				['ccookie'] = 100,
				['iflag'] = 100,
				['kamikaze'] = 100,
				['sbullet'] = 100,
				['voodoo'] = 100,
				['woowoo'] = 100,
				--Food
				['friedpick'] = 100,
				['maccheese'] = 100,
				['bplate'] = 100,
				['cplate'] = 100,
				['splate'] = 100,
				['rplate'] = 100,
				['nplate'] = 100,
				['wings'] = 100,
			},
		},
		['pizzathis'] = {
			enable = false,
			location = vec4(793.6, -742.23, 27.27, 90.0),
			--ped = "S_M_Y_Chef_01",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Food
				['capricciosabox'] = 100,
				['diavolabox'] = 100,
				['marinarabox'] = 100,
				['margheritabox'] = 100,
				['prosciuttiobox'] = 100,
				['vegetarianabox'] = 100,
				['bolognese'] = 100,
				['calamari'] = 100,
				['meatball'] = 100,
				['alla'] = 100,
				['pescatore'] = 100,
			},
		},
		['popsdiner'] = {
			enable = false,
			location = vec4(1577.99, 6458.41, 25.32, 157.0),
			--ped = "S_M_Y_Chef_01",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Food
				['baconeggs'] = 100,
				['bltsandwich'] = 100,
				['cheeseburger'] = 100,
				['cheesesandwich'] = 100,
				['eggsandwich'] = 100,
				['grilledwrap'] = 100,
				['hamburger'] = 100,
				['hamcheesesandwich'] = 100,
				['hamsandwich'] = 100,
				['ranchwrap'] = 100,
				['sausageeggs'] = 100,
				['steakburger'] = 100,
				['toastbacon'] = 100,
				['tunasandwich'] = 100,
				['veggiewrap'] = 100,
			},
		},
		['tequilala'] = {
			enable = false,
			location = vec4(-562.61, 274.47, 83.02, 172.0),
			--ped = "A_F_Y_Hipster_02",
			prop = "prop_vend_snak_01",
			itemlist = {
				['b52'] = 100,
				['brussian'] = 100,
				['bkamikaze'] = 100,
				['cappucc'] = 100,
				['ccookie'] = 100,
				['iflag'] = 100,
				['kamikaze'] = 100,
				['sbullet'] = 100,
				['voodoo'] = 100,
				['woowoo'] = 100,
			},
		},
		['vanilla'] = {
			enable = false,
			location = vec4(129.87, -1305.12, 29.22, 216.0),
			--ped = "CSB_Stripper_02",
			prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['amarettosour'] = 100,
				['bellini'] = 100,
				['cosmopolitan'] = 100,
				['longisland'] = 100,
				['margarita'] = 100,
				['pinacolada'] = 100,
				['sangria'] = 100,
				['screwdriver'] = 100,
				['strawdaquiri'] = 100,
				['strawmargarita'] = 100,
				--Food
				['vusliders'] = 100,
				['vutacos'] = 100,
				['nplate'] = 100,
				['tots'] = 100,
			},
		},
		['bakery'] = {
			enable = false,
			location = vec4(49.42, -134.08, 55.46, 160.14),
			ped = "S_M_Y_Chef_01",
			--prop = "prop_vend_snak_01",
			itemlist = {
				--Drinks
				['milkshake'] = 100,
				['strawberrymilkshake'] = 100,
				['chocolatemilkshake'] = 100,
				--Food
				['tbcake'] = 100,
				['tbchoccake'] = 100,
				['tbbirthdaycake'] = 100,
				['tbcookie'] = 100,
				['tbcupcake'] = 100,
				['tbsweetroll'] = 100,
				['tbdonut'] = 100,
				['tblongjohn'] = 100,
				['tbcroissant'] = 100,
				['tbchoccroiss'] = 100,
			},
		},
	},
}

Loc = {}