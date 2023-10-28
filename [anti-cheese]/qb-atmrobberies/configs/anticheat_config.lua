wx = {}
                                                                 
--   `7MMF'     A     `7MF'    `YMM'   `MP'               db            .g8"""bgd 
--     `MA     ,MA     ,V        VMb.  ,P                ;MM:         .dP'     `M 
--      VM:   ,VVM:   ,V          `MM.M'                ,V^MM.        dM'       ` 
--       MM.  M' MM.  M'            MMb                ,M  `MM        MM          
--       `MM A'  `MM A'           ,M'`Mb.              AbmmmqMA       MM.         
--        :MM;    :MM;           ,P   `MM.            A'     VML      `Mb.     ,' 
--         VF      VF          .MM:.  .:MMa.        .AMA.   .AMMA.      `"bmmmd'  


-- PLEASE DO NOT LEAVE THIS CONFIG FILE AS IT IS!
-- EVERY SERVER IS NOT CONFIGURED THE SAME

-- ┌┐ ┌─┐┌─┐┬┌─┐  ┌─┐┌─┐┌┬┐┌┬┐┬┌┐┌┌─┐┌─┐
-- ├┴┐├─┤└─┐││    └─┐├┤  │  │ │││││ ┬└─┐
-- └─┘┴ ┴└─┘┴└─┘  └─┘└─┘ ┴  ┴ ┴┘└┘└─┘└─┘

wx.Debug = false -- Admins can be detected. Players are able to be detected more than once. Do NOT use in production
wx.Prefix = 'WX AntiCheat' -- Prefix that will pop up when connecting, being banned etc. Do not add brackets
wx.punishType = 'LOG' -- (LOG/KICK/BAN) | LOG (Will only send a webhook) | KICK (Will only kick the player and send a webhook) | BAN (Will ban the player and send a webhook)
wx.showReason = true -- Should banned players be able to see the reason for being banned?
wx.appealDiscord = 'https://discord.gg/T6R4YAfTjS' -- Your Discord link (MUST BE A URL)
wx.adminAce = 'wxAC.bypass' -- Players with this ace permission won't get detected
wx.pingOnDetect = false -- Set this to true if you want to enable discord @everyone pings on new detections
wx.chatMessages = false -- Set this to true if you want to send chat message on new detection including cheater's name and reason. (Everyone will see this message). Great for debugging
wx.screenshots = true -- Do you want to send screenshot to your webhook of the detected player's screen?
wx.adminDetections = false -- Send webhook if an admin gets detected?
wx.screenshotTimeout = 30000 -- in ms, how long should the script wait for detection screenshots to upload before giving up
wx.OCR = true -- On Screen Detection - Once in a while the script will take screenshot from every player and search it for any suspicious words (mod menus)
wx.OCRCheckInterval = 15000 -- In ms, how often should the anticheat check player's screen? Lower values = Faster checks = Higher lag spikes
wx.spoilerIP = true -- Add IP addresses into spoiler tag in discord logs?
wx.antiAFK = false
wx.antiAFKtime = 1200 -- In seconds, how long player needs to be afk before getting kicked
wx.connectingCard = true -- If enabled, players will see "Connecting..." text while connecting. You can translate it in the locale file
wx.antiVPN = true -- Prevent users with VPNs from connecting

wx.whitelistedIPs = { -- These IPs will be ignored by Anti VPN
    ['127.0.0.1'] = true,
}

wx.whitelistedResources = { -- Starting/Stopping these resources will have no effect on resource start/stop detections.
    ['wx_carlock'] = true,
    ['wx_speedometer'] = true,
}

-- ┌─┐  ┌─┐  ┌┐┌  ┌┐┌  ┌─┐  ┌─┐  ┌┬┐  ┬  ┌┐┌  ┌─┐
-- │    │ │  │││  │││  ├┤   │     │   │  │││  │ ┬
-- └─┘  └─┘  ┘└┘  ┘└┘  └─┘  └─┘   ┴   ┴  ┘└┘  └─┘

wx.nameBlacklist = true -- Blacklisted names
wx.needDiscord = true -- Player can(not) join with(out) discord identifier

-- ┌┐ ┌─┐┌─┐┬┌─┐  ┌┬┐┌─┐┌┬┐┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
-- ├┴┐├─┤└─┐││     ││├┤  │ ├┤ │   │ ││ ││││└─┐
-- └─┘┴ ┴└─┘┴└─┘  ─┴┘└─┘ ┴ └─┘└─┘ ┴ ┴└─┘┘└┘└─┘

wx.antiNUIDevTools = true -- Detects nui_devtools ingame
wx.antiResourceStop = true -- Anti resource stop - If true, do NOT ensure resources on live server - it will ban everyone
wx.antiResourceStart = true -- Anti resource start - If true, do NOT ensure resources on live server - it will ban everyone
wx.antiClearTasks = true -- Detects kicking other players from cars etc.
wx.antiGiveWeapons = true -- Detects giving weapons
wx.antiRemoveWeapons = true -- Detects removing weapons
wx.messageBlacklist = true -- Kicks player for blacklisted words in chat
wx.antiHeadshot = true -- Disables headshot one taps
wx.antiBlacklistPlate = true -- Detects blacklisted vehicle plates (Blacklist is below)
wx.antiPlateChange = true -- Detects if player changes his vehicle plate (Can cause problems with vehicle shops)
wx.joinAttempts = true -- If true, the anticheat will send webhook when banned player tries to join with ban reason, ban id and his identifiers
wx.antiObjectAttach = true -- Deletes all objects that are attached to players
wx.antiFastRun = true -- Detects fast run

-- ┌┐ ┬  ┌─┐┌─┐┬┌─┬  ┬┌─┐┌┬┐┌─┐  ┌─┐┌┐┌┌┬┐  ┌─┐┬  ┬┌─┐┌┐┌┌┬┐┌─┐
-- ├┴┐│  ├─┤│  ├┴┐│  │└─┐ │ └─┐  ├─┤│││ ││  ├┤ └┐┌┘├┤ │││ │ └─┐
-- └─┘┴─┘┴ ┴└─┘┴ ┴┴─┘┴└─┘ ┴ └─┘  ┴ ┴┘└┘─┴┘  └─┘ └┘ └─┘┘└┘ ┴ └─┘

wx.antiBlacklistedWeapon = true -- Detects if player has weapon on blacklist
wx.antiBlacklistedVehicles = true -- Detects if player is in blacklisted vehicle
wx.antiBlacklistedVehiclesSpawn = true -- Detects if player spawns blacklisted vehicle (make sure to test the log mode to prevent false bans! it counts enviromental vehicles that spawned around him (like blimp))
wx.antiParticles = true -- Detection of blacklisted particles
wx.antiExplosion = true -- Blacklisted explosions
wx.cancelOtherExplosions = true -- If an explosion type isn't on blacklist, it will get cancelled
wx.antiExplosionMods = true -- Detects invisible, inaudible and damage boosted explosions
wx.antiObjects = true -- Detects creation of blacklisted objects and props
wx.antiPeds = true -- Detects creation of blacklisted peds
wx.explosionLimit = true -- If true, player can only create a set amount of explosions in a specified time below before getting detected

-- ┌┬┐┌─┐─┐ ┬┬┌┬┐┬ ┬┌┬┐  ┌─┐┌┬┐┌─┐┌┬┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
-- │││├─┤┌┴┬┘│││││ ││││  └─┐ │ ├─┤ │ ├┤ │││├┤ │││ │ └─┐
-- ┴ ┴┴ ┴┴ └─┴┴ ┴└─┘┴ ┴  └─┘ ┴ ┴ ┴ ┴ └─┘┴ ┴└─┘┘└┘ ┴ └─┘

wx.maxExplosionsInterval = 10000 -- In miliseconds. Player will get detected if he creates X explosions in X miliseconds
wx.maxExplosions = 15 -- Maximum explosions player can create in short time before getting detected
wx.freecamDistance = 45 -- How far the camera has to be from player to trigger freecam detection.
wx.maxCreatingSpeed = 80 -- Stops spawning vehicles with large speeds (eg. Ram Player option in mod menus)

-- ┬─┐┌─┐┌─┐┌┬┐  ┌─┐┌─┐  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┌┬┐┌┬┐┬┌┐┌┌─┐┌─┐   
-- ├┬┘├┤ └─┐ │   │ │├┤    │ ├─┤├┤   └─┐├┤  │  │ │││││ ┬└─┐   
-- ┴└─└─┘└─┘ ┴   └─┘└     ┴ ┴ ┴└─┘  └─┘└─┘ ┴  ┴ ┴┘└┘└─┘└─┘ooo

wx.antiGodMode = false -- Detects god mode (Can cause problems with multicharacter scripts or vehicle shops)
wx.antiNoClip = true -- Detects players noclipping
wx.antiTaze = true -- Prevents cheaters from tazing other players
wx.antiInfiniteRoll = true -- Detects infinite combat roll
wx.antiWeaponVehicles = true -- Prevents cheaters from using vehicles with built-in weapons (oppressor, nightshark etc.)
wx.antiRadar = false -- Detects if player has radar without being in any vehicle
wx.antiAIs = true -- Anti citizen AIs like No Recoil, Give all weapons, Boost Damage etc.
wx.antiMenus = true -- Anti LUA Menus - This is significantly faster than OCR, because it only detects the most basic menus
wx.antiFreeCam = false -- Anti FreeCam Hack
wx.antiSmallPed = true -- Anti small/tiny ped
wx.antiInvisible = false -- Anti Invisible Player
wx.antiSilentAim = true -- Detects bigger hitboxes (x64a.rpf)
wx.antiVDM = false -- Vehicles will do ZERO damage to players
wx.antiDamageBoost = true -- Detects Citizen AIs and mods for boosted damage
wx.antiDefenseBoost = true -- Detects Citizen AIs and mods for boosted defense

wx.maximumModifier = 1.15 -- FLOAT VALUE! (0.0) - Minimum allowed damage/defense modifier before getting detected

wx.antiInfiniteStamina = true -- Detects infinite stamina mods/cheats/ais
wx.antiSuperJump = true -- Detects Super Jump cheat (VERY BASIC MIGHT NOT WORK)
wx.antiBlips = true -- Detects player blips cheat (See other players on map) - Disable if you're using any police blips script
wx.antiSpectate = true -- Detects if player tries to spectate other players
wx.fakeTriggers = true -- Fake triggers that will pop-up in mod menus and executors
wx.antiExplosiveAmmo = true -- Detects explosive ammo
wx.antiInfiniteAmmo = true -- Anti infinite ammo in clip
wx.antiThermal = true -- Anti Thermal Vision (Has bypass for players in helicopters)
wx.antiNightVision = true -- Anti Night Vision
wx.antiRainbow = true -- Anti rainbow vehicle (Can cause problem with vehicle tuning)
-- [ Logs ]
wx.connectPrints = true -- Prints player connecting (Detects HARDCAP)
wx.connectLogs = true -- Logs players connecting
wx.disconnectLogs = true -- Logs player disconnecting
wx.ExplosionLogs = true -- Logs explosions
wx.ObjectLogs = true -- Logs created objects
wx.ChatLogs = true -- Logs chat messages
wx.ResourceStartLogs = true -- Logs resource start
wx.ResourceStopLogs = true -- Logs resource stop

-- ┌┐ ┬  ┌─┐┌─┐┬┌─┬  ┬┌─┐┌┬┐┌─┐   ┌┬┐┌─┐┌┐ ┬  ┌─┐┌─┐  ┌─┐┌┐┌┌┬┐  ┌─┐┌┬┐┬ ┬┌─┐┬─┐  ┬  ┬┌─┐┌┬┐┌─┐
-- ├┴┐│  ├─┤│  ├┴┐│  │└─┐ │ └─┐    │ ├─┤├┴┐│  ├┤ └─┐  ├─┤│││ ││  │ │ │ ├─┤├┤ ├┬┘  │  │└─┐ │ └─┐
-- └─┘┴─┘┴ ┴└─┘┴ ┴┴─┘┴└─┘ ┴ └─┘┘   ┴ ┴ ┴└─┘┴─┘└─┘└─┘  ┴ ┴┘└┘─┴┘  └─┘ ┴ ┴ ┴└─┘┴└─  ┴─┘┴└─┘ ┴ └─┘

wx.playerModels = { -- Ped models that will be detected for anti magic bullet
    "mp_m_freemode_01",
    "mp_f_freemode_01",
    -- If you allow your players to use other ped models, add them here
}

wx.OCRWords = { -- You can add/remove words to detect
    "FlexSkazaMenu","SidMenu","Lynx8","LynxEvo","Maestro Menu","redEngine","HamMafia","HamHaxia","Dopameme","redMENU","Desudo","explode","gamesense","Anticheat","Tapatio","Malossi","RedStonia","Chocohax",
    "skin changer","torque multiple","override player speed","colision proof","explosion proof","copy outfit","play single particle","infinite ammo","rip server","remove ammo","remove all weapons",
    "V1s_u4l","D3str_0y","D3str_Oy","S3tt1ngs","P4rt1cl_3s","Pl4y3rz","D3l3t3","Sp4m","V3h1cl3s","T4ze","1nv1s1bll3","R41nb_0w","Sp33d","R41nb_Ow","F_ly","3xpl_0d3","Pr0pz","D3str_0y","M4p","G1v3",
    "Convert Vehicle Into Ramps","injected at","Explode Players","Ram Players","Force Third Person","fallout","godmode","god mode","modmenu","esx money","give armor","aimbot","trigger",
    "triggerbot","Aimbot","Rapid Fire","rage bot","ragebot","rapidfire","freecam","execute","noclip","ckgangisontop","lumia1","ISMMENU","TAJNEMENUMenu","rootMenu","Outcasts666","WaveCheat","NacroxMenu","MarketMenu","topMenu",
    "Flip Vehicle","Rainbow Paintjob","Combat Assiters","Damage Multiplier","Give All Weapons","Teleport To Impact","Explosive Impact","Server Nuke Options","No Ragdoll","Super Powers",
    "invisible all vehicles","Spam Message","Destroy Map","Give RPG","max Speed Vehicles","Rainbow All Vehicles","Delete Props","Cobra Menu","Bind Menu Key","Clone Outfit","Give Health",
    "Rp_GG","V3h1cl3","Sl4p","D4nce","3mote","D4nc3","no-clip","injected","Money Options","Nuke Options","Razer","Aimbot","TriggerBot","RageBot","RapidFire",
    "Force Player Blips","Force Radar","Force Gamertags","Steal Outfit","ESX Money Options","press AV PAG","TP to Waypoint","Self Options","Vehicle options","Weapon Options","spam Vehicles","taze All",
    "explosive ammo","super damage","rapid fire","Super Jump","Infinite Roll","Cage Player","Give all","No Criticals","Move On Water","Disable Ragdoll","CutzuSD","Vertisso","M3ny00","Pl4y_3r","W34p_On","W34p_0n","V3h1_cl3",
    "fuck server","lynx","Teleport to Closest Vehicle","CKGang","CK Gang","CKGang 2.0","ESP","Toggle ESP","NoClip","No-Clip","Semi-GodMode","Repair Vehicle","Fix Vehicle","absolute","Lumia","Gamesense","Fivesense","SkidMenu","Dopamine","Explode","Teleport Options","infnite combat roll","Hydro Menu","Enter Menu Open Key",
    "Give Single Weapon","Airstrike Player","Taze Player","Razer Menu","Swagamine","Visual Options","d0pamine","Infinite Stamina","Blackout","Delete Vehicles Within Radius","Engine Power Boost",
    "Teleport Into Player's Vehicle","fivesense","menu keybind","nospread","transparent props","bullet tracers","model chams","reload images","fade out in speed","cursor size","custom weapons texture",
    "Inyection","Inyected","Dumper","LUA Executor","Executor","Lux Menu","NEVERWHERE","by WX","Event Blocker","Spectate","Wallhack","triggers","crosshair","Alokas66","Hacking System!","Destroy Menu","Server IP","Teleport To"
}

-- [ Blacklisted Weapons ]
wx.Weapons = {
--  TRANSLATION/LABEL    INGAME MODEL NAME
    ['Heavy Sniper'] = 'weapon_heavysniper',
    ['Sniper Rifle'] = "weapon_sniperrifle",
    ['Minigun'] = "weapon_minigun",
    ['Heavy Rifle'] = "weapon_heavyrifle",
    ['Heavy Sniper MK2'] = "weapon_heavysniper_mk2",
    ['Marksman Rifle'] = "weapon_marksmanrifle",
    ['Marksman Rifle MK2'] = "weapon_marksmanrifle_mk2",
    ['RPG'] = "weapon_rpg",
    ['Grenade Launcher'] = "weapon_granadelauncher",
    ['Navy Revolver'] = "weapon_navyrevolver",
    ['Double Action Revolver'] = "weapon_doubleaction",
    ['Flare Gun'] = "weapon_flaregun",
    ['Vintage Pistol'] = "weapon_vintagepistol",
    ['Taser'] = "weapon_stungun",
    ['Marksman Pistol'] = "weapon_marksmanpistol",
    ['Gadget Pistol'] = "weapon_gadgetpistol",
    ['Pistol MK2'] = "weapon_pistol_mk2",
    ['Bottle'] = "weapon_bottle",
    ['Stone Hatchet'] = "weapon_stone_hatchet",
    ['Flare'] = "weapon_flare",
    ['Snowball'] = "weapon_snowball",
    ['Gas Canister'] = "weapon_petrolcan",
    ['Parachute'] = "gadget_parachute",
    ['Hazard Canister'] = "weapon_hazardcan",
    ['Fertilizer Can'] = "weapon_fertilizercan",
    ['EMP Launcher'] = "weapon_emplauncher",
    ['Machine Gun'] = "weapon_mg",
    ['SNS Pistol'] = "weapon_snspistol",
    ['SNS Pistol MK2'] = "weapon_snspistol_mk2",
    ['Nightstick'] = "weapon_nightstick",
    ['Ray Pistol'] = "weapon_raypistol",
    ['Ray Carbine'] = "weapon_raycarbine",
    ['Combat MG'] = "weapon_combatmg",
    ['Combat MG MK2'] = "weapon_combatmg_mk2",
    ['SMG MK2'] = "weapon_smg_mk2",
    ['Revolver MK2'] = "weapon_revolver_mk2",
    ['RPG 2'] = "weapon_rpg_2",
    ['Smoke Launcher'] = "weapon_grenadelauncher_smoke",
    ['Firework Launcher'] = "weapon_firework",
    ['Railgun'] = "weapon_railgun",
    ['Homing Launcher'] = "weapon_hominglauncher",
    ['Compact Launcher'] = "weapon_compactlauncher",
    ['Ray Minigun'] = "weapon_rayminigun",
    ['Grenade'] = "weapon_grenade",
    ['BZ Gas'] = "weapon_bzgas",
    ['Molotov'] = "weapon_molotov",
    ['Sticky Bomb'] = "weapon_stickybomb",
    ['Pipe Bomb'] = "weapon_pipebomb",
    ['Proximity Mine'] = "weapon_proxmine"
}

-- [ Blacklists (I recommend you to read through it and edit it) ]
wx.Plates = { -- Blacklisted vehicle plates
    'nigger',
    'nigga',
    'faggot',
    'retard',
    'ownage',
    'owned',
    'ckgang',
    'skriptgg',
    'eulen',
    'fatality'
}

wx.TaskList = { -- Blacklisted tasks https://alloc8or.re/gta5/doc/enums/eTaskTypeIndex.txt
    100,
	101,
	151,
	221,
	222
}

wx.clipSize = { -- How many bullets should be allowed in certain weapons?
    {weapon = 'WEAPON_PISTOL', clip = 14},
    {weapon = 'WEAPON_APPISTOL', clip = 18},
    {weapon = 'WEAPON_COMBATPISTOL', clip = 24},
    {weapon = 'WEAPON_CARBINERIFLE', clip = 60},
    {weapon = 'WEAPON_CARBINERIFLE_MK2', clip = 60},
}

-- [ Blacklisted Assets ]
wx.Assets = {GetHashKey("core"), GetHashKey("scr_ba_bomb"), GetHashKey("scr_rcbarry2"), GetHashKey("scr_rcpaparazzo1")}

-- [ Blacklisted Particles ]
wx.Particles = {
    GetHashKey("scr_firework_xmas_burst_rgw"),
    GetHashKey("exp_grd_petrol_pump"),
    GetHashKey("scr_clown_bul"),
    GetHashKey("scr_mich4_firework_trailburst_spawn"),
    GetHashKey("blood_shark_attack"),
    GetHashKey("td_blood_shotgun"),
    GetHashKey("td_blood_throat"),
    GetHashKey("blood_melee_punch"),
    GetHashKey("blood_exit"),
    GetHashKey("blood_chopper"),
    GetHashKey("trail_splash_blood"),
    GetHashKey("td_blood_stab"),
    GetHashKey("blood_armour_heavy"),
    GetHashKey("blood_mist"),
    GetHashKey("blood_nose"),
    GetHashKey("blood_entry_head_sniper"),
    GetHashKey("scr_ba_bomb_destroy"),
    GetHashKey("scr_clown_appears")
}

wx.TriggerValues = { -- Player will be detected when he triggers one of these events with higher value than specified
['esx_truckerjob:payout'] = 5000,
['esx_garbagejob:payout'] = -1, -- Set to "-1" to detect every value
['esx_poolcleaner:payout'] = 5000,
['esx_godirtyjob:payout'] = 5000,
['esx_vehicleshop:resellVehicle'] = 500000,
}

-- [ Blacklisted/Fake Triggers ]
wx.triggerList = {
    -- type = 'client' = TriggerEvent
    -- type = 'server' = TriggerServerEvent

    -- ["esx_ambulancejob:revive"] = { type = "client" },

    ["esx:spawnVehicle"] = { type = "client" },
    ["esx:setgroup"] = { type = "client" },

    ["esx_garbagejob:payout"] = { type = "server" },
    ["esx_pizzajob:payout"] = { type = "server" },
    ["esx_truckerjob:payout"] = { type = "server" },
    ["AdminMenu:giveCash"] = { type = "server" },
    ["bank:deposit"] = { type = "server" },
    ["bank:withdraw"] = { type = "server" },
    ["esx_carthief:pay"] = { type = "server" },
    ["esx_gopostaljob:pay"] = { type = "server" },
    ["esx-qalle-jail:jailPlayer"] = { type = "server" },
    ["NB:recruterplayer"] = { type = "server" },
    ["paramedic:revive"] = { type = "server" },
    ["esx_jobs:caution"] = { type = "server" },
}


-- [ !WIP! Anti Color Names]
wx.colorNames = {
   "^0",
   "^1",
   "^2",
   "^3",
   "^4",
   "^5",
   "^6",
   "^7",
   "^8",
   "^9",
}

-- [ Blacklisted Names ]
wx.badNames = {
    "nigga",
    "nigger",
    "n1gger",
    "n1gg3r",
    "admin",
    "moderator",
    "owner",
    "coowner",
    "faggot",
    "kys",
    "retard",
    --[[ PREVENTS XSS INJECTION ]] "<script",
    --[[ PREVENTS XSS INJECTION ]] "<script src",
    --[[ PREVENTS XSS INJECTION ]] "<script src=",
    --[[ PREVENTS XSS INJECTION ]] "<script src =",
    --[[ PREVENTS XSS INJECTION ]] "<src =",
    --[[ PREVENTS XSS INJECTION ]] "<script>",
    --[[ PREVENTS XSS INJECTION ]] "/>",
    "moderator",
    "eulencheats",
    "eulen",
    'redengine',
    'susano',
    "lynxmenu",
    "atgmenu",
    "hacker",
    "rustchance.com",
    "rustchance",
    "hellcase.com",
    "hellcase",
    "youtube.com",
    "youtu.be",
    "youtube",
    "twitch.tv",
    "twitch",
    "chocohax",
    "?",
    "§",
    "pornhub.com",
    "porn",
    "pornhub",
}

-- [ Blacklisted chat messages ]
wx.blockedWords = {
    'negre',
    'negr',
    'nigga',
    'nigger',
    'niggers',
    'i hate niggers',
    'nate higgers',
    'retard',
    'faggots',
    'nemas otce',
    'faggot',
    'kys'
}

-- [ Blacklisted Vehicles ]
wx.vehicleBlacklist = {
    ["oppressor"] = true,
    ["oppressor2"] = true,
    ["hydra"] = true,
    ["lazer"] = true,
    ["rhino"] = true,
    ["valkyrie"] = true,
    ["apc"] = true,
    ["barracks"] = true,
    ["minitank"] = true,
    ["barrage"] = true,
    ["chernobog"] = true,
    ["halftrack"] = true,
    ["khanjali"] = true,
    ["scarab"] = true,
    ["scarab2"] = true,
    ["scarab3"] = true,
    ["deluxo"] = true,
    ["thruster"] = true,
    ["trailersmall2"] = true,
    ["deathbike2"] = true,
    ["deathbike3"] = true,
    ["shotaro"] = true,
    ["dominator4"] = true,
    ["dominator5"] = true,
    ["dominator6"] = true,
    ["slamtruck"] = true,
}

-- [ Blacklisted Peds Models to spawn/use ]
wx.pedBlacklist = {
    "a_c_dolphin",
    "a_c_killerwhale", 
    "a_c_sharktiger",
    "a_c_humpback",
    "mp_m_niko_01",
    's_m_y_swat_01',
    'u_m_y_pogo_01',
    "player_one",
    "player_two",
    "u_m_m_jesus_01",
    "u_m_y_babyd",
    "u_m_y_zombie_01",
    "u_m_y_pogo_0",
    "s_m_y_clown_01",
    "mp_f_cocaine_01",
    "a_c_chimp",
    "u_m_y_juggernaut_01"
}



-- [ Blacklisted objects ]
wx.objectBlacklist = {
    "cs4_lod_01_slod3",
    "p_spinning_anus_s",
    "sr_prop_stunt_tube_crn_15d_05a",
    "as_prop_as_dwslope30",
    "prop_carjack",
    "ba_prop_battle_hobby_horse",
    "hei_prop_heist_box",
    "ch_prop_gold_trolly_01a",
    "prop_el_guitar_03",
    "prop_security_case_01",
    "p_amb_brolly_01",
    "stt_prop_stunt_track_uturn",
    "stt_prop_stunt_track_turnice",
    "stt_prop_stunt_track_hill",
    "prop_gold_cont_01",
    "p_cablecar_s",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "prop_fnclink_05crnr1",
    "xs_prop_hamburgher_wl",
    "xs_prop_plastic_bottle_wl",
    "prop_windmill_01",
    "p_spinning_anus_s",
    "stt_prop_ramp_adj_flip_m",
    "stt_prop_ramp_adj_flip_mb",
    "stt_prop_ramp_adj_flip_s",
    "stt_prop_ramp_adj_flip_sb",
    "stt_prop_ramp_adj_hloop",
    "stt_prop_ramp_adj_loop",
    "stt_prop_ramp_jump_l",
    "stt_prop_ramp_jump_m",
    "stt_prop_ramp_jump_s",
    "stt_prop_ramp_jump_xl",
    "stt_prop_ramp_jump_xs",
    "stt_prop_ramp_jump_xxl",
    "stt_prop_ramp_multi_loop_rb",
    "stt_prop_ramp_spiral_l",
    "stt_prop_ramp_spiral_l_l",
    "stt_prop_ramp_spiral_l_m",
    "stt_prop_ramp_spiral_l_s",
    "stt_prop_ramp_spiral_l_xxl",
    "stt_prop_ramp_spiral_m",
    "stt_prop_ramp_spiral_s",
    "stt_prop_ramp_spiral_xxl",
    "stt_prop_stunt_track_dwslope30",
    "-145066854",
    "stt_prop_stunt_track_start",
    "stt_prop_stunt_track_slope45",
    "stt_prop_stunt_track_slope30",
    "stt_prop_stunt_track_slope15",
    "stt_prop_stunt_track_short",
    "stt_prop_stunt_track_sh45_a",
    "stt_prop_stunt_track_sh45",
    "stt_prop_stunt_track_sh30",
    "stt_prop_stunt_track_sh15",
    "stt_prop_stunt_track_otake",
    "stt_prop_stunt_track_link",
    "stt_prop_stunt_track_jump",
    "stt_prop_stunt_track_hill2",
    "stt_prop_stunt_track_hill",
    "stt_prop_stunt_track_funnel",
    "stt_prop_stunt_track_funlng",
    "stt_prop_stunt_track_fork",
    "stt_prop_stunt_track_exshort",
    "stt_prop_stunt_track_dwuturn",
    "stt_prop_stunt_track_dwturn",
    "stt_prop_stunt_track_dwslope45",
    "stt_prop_stunt_track_dwslope30",
    "stt_prop_stunt_track_dwslope15",
    "stt_prop_stunt_track_dwshort",
    "stt_prop_stunt_track_dwsh15",
    "stt_prop_stunt_track_dwlink_02",
    "stt_prop_stunt_track_dwlink",
    "stt_prop_stunt_track_cutout",
    "stt_prop_stunt_track_bumps",
    "stt_prop_stunt_target_small",
    "stt_prop_stunt_target",
    "stt_prop_stunt_soccer_sball",
    "stt_prop_stunt_soccer_lball",
    "stt_prop_stunt_soccer_goal",
    "stt_prop_stunt_soccer_ball",
    "stt_prop_stunt_ramp",
    "stt_prop_stunt_landing_zone_01",
    "stt_prop_stunt_jump_sb",
    "stt_prop_stunt_jump_s",
    "stt_prop_stunt_jump_mb",
    "stt_prop_stunt_jump_m",
    "stt_prop_stunt_jump_loop",
    "stt_prop_stunt_jump_lb",
    "stt_prop_stunt_jump_l",
    "stt_prop_stunt_jump45",
    "stt_prop_stunt_jump30",
    "stt_prop_stunt_jump15",
    "stt_prop_stunt_track_start",
    "prop_container_01a",
    "prop_contnr_pile_01a",
    "ce_xr_ctr2",
    "stt_prop_ramp_jump_xxl",
    "hei_prop_carrier_jet",
    "prop_parking_hut_2",
    "csx_seabed_rock3_",
    "db_apart_03_",
    "db_apart_09_",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "xs_prop_hamburgher_wl",
    "sr_prop_spec_tube_xxs_01a",
	"prop_air_bigradar",
	"p_tram_crash_s",
	"prop_windmill_01",
	"prop_start_gate_01",
	"prop_trailer_01_new",
	"sr_prop_sr_track_block_01",
	"sr_prop_spec_tube_xxs_04a",
	"stt_prop_stunt_soccer_sball",
	"stt_prop_stunt_track_cutout",
	"stt_prop_stunt_target_small",
	"prop_cj_big_boat",
    "stt_prop_stunt_domino"
}

-- [ Explosion Blacklist ] (https://wiki.rage.mp/index.php?title=Explosions)
wx.explosionList = { 1, 2, 3, 4, 5, 6, 19, 22, 25, 26, 32, 33, 35, 36, 37, 38, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72}
