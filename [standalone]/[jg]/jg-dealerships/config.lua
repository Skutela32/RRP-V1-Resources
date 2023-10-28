Config = {}

Config.Locale = "en"
Config.NumberAndDateFormat = "en-GB"
Config.Currency = "GBP"
Config.SpeedUnit = "mph"
Config.Logging = false
Config.PlateFormat = "1AA111AA" -- 1 = number, A = letter (max 8 characters)

Config.Framework = "QBCore"  -- or "ESX"
Config.FuelSystem = "cdn-fuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "none"
Config.VehicleKeys = "qb-vehiclekeys" -- or "qb-vehiclekeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "none"
Config.Notifications = "ox_lib" -- or "okokNotify", "ox_lib", "ps-ui"

Config.DrawText = "jg-textui" -- or "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenShowroomPrompt = "[E] Open Showroom"
Config.OpenShowroomKeyBind = 38
Config.ViewInShowroomPrompt = "[E] View in Showroom"
Config.ViewInShowroomKeyBind = 38
Config.OpenManagementPrompt = "[E] Dealership Management"
Config.OpenManagementKeyBind = 38
Config.SellVehiclePrompt = "[E] Sell Vehicle"
Config.SellVehicleKeyBind = 38

Config.FinancePayments = 12
Config.FinanceDownPayment = 0.1 -- 0.1 means 10%
Config.FinanceInterest = 0.1 -- 0.1 means 10%
Config.FinancePaymentInterval = 12 -- in hours
Config.FinancePaymentFailedHoursUntilRepo = 1 -- in hours
Config.MaxFinancedVehiclesPerPlayer = 5

Config.TestDrivePlate = "RRPUK"
Config.TestDriveTimeSeconds = 120

Config.DisplayVehiclesPlate = "RRPUK"
Config.DealerPurchasePrice = 0.9 -- 0.8 = Dealers pay 80% of vehicle price
Config.VehicleOrderTime = 10 -- in mins

Config.EnableSellVehicle = true -- Vehicles are sold back to the dealerships - they must pay for the vehicle but receive the vehicle as stock
Config.SellVehiclePercent = 0.6 -- 60% of current sale price

Config.Categories = {
  planes = "Planes",
  sportsclassics = "Sports Classics",
  sedans = "Sedans",
  compacts = "Compacts",
  motorcycles = "Motorcycles",
  super = "Super",
  offroad = "Offroad",
  helicopters = "Helicopters",
  coupes = "Coupes",
  muscle = "Muscle",
  boats = "Boats",
  vans = "Vans",
  sports = "Sports",
  suvs = "SUVs",
  commercial = "Commercial",
  cycles = "Cycles",
  aa = "aa",
  Abarth = "Abarth",
  Audi = "Audi",
  Bentley = "Bentley",
  BMW = "BMW",
  Chevrolet = "Chevrolet",
  CID = "CID",
  CTSFO = "CTSFO",
  Cupra = "Cupra",
  Dodge = "Dodge",
  dono = "dono",
  ERPT = "ERPT",
  Ferrari = "Ferrari",
  Ford = "Ford",
  GMC = "GMC",
  Honda = "Honda",
  Jaguar = "Jaguar",
  Kawaski = "Kawaski",
  Lamborghini = "Lamborghini",
  Lexus = "Lexus",
  Mazda = "Mazda",
  Mclaren = "Mclaren",
  Mercedes = "Mercedes",
  Mitsubishi = "Mitsubishi",
  MO19 = "MO19",
  MO8 = "MO8",
  mrbeanmini = "mrbeanmini",
  NHS = "NHS",
  Nissan = "Nissan",
  Opel = "Opel",
  Porsche = "Porsche",
  RangeRover = "RangeRover",
  Scrap = "Scrap",
  Smart = "Smart",
  staff = "staff",
  Subaru = "Subaru",
  surron = "surron",
  Toyota = "Toyota",
  Vauxhall = "Vauxhall",
  VW = "VW",
  Yamaha = "Yamaha",
  Dinka = "Dinka",
  Pegassi = "Pegassi",
  Nagasaki = "Nagasaki",
  WMC = "WMC",
  Principe = "Principe",
  Shitzu = "Shitzu",
  Maibatsu = "Maibatsu",
  LCC = "LCC",
  driftshop = "driftshop",
  renault = "renault",
  Infiniti = "Infiniti",
  Jeep = "Jeep",
  --GTA BRANDS
  Albany = "Albany",
  Annis = "Annis",
  Benefactor = "Benefactor",
  Bravado = "Bravado",
  Declasse = "Declasse",
  Dewbauchee = "Dewbauchee",
  Dinka = "Dinka",
  Grotti = "Grotti",
  Imponte = "Imponte",
  Karin = "Karin",
  Maibatsu = "Maibatsu",
  Maxwell = "Maxwell",
  Obey = "Obey",
  Ocelot = "Ocelot",
  Ubermacht = "Ubermacht",
  Vapid = "Vapid",
  Weeny = "Weeny",
  -- RRV 
  RRV = "RRV",
}

Config.DealershipLocations = {
  ["Cars"] = {
    type = "self-service", -- or "owned", "self-service"
    openShowroom = vector3(-55.99, -1096.59, 26.42),
    openManagement = vector3(-30.43, -1106.84, 26.42),
    purchaseSpawn = vector4(-13.68, -1092.31, 26.67, 159.82),
    testDriveSpawn = vector4(-959.53, -3362.46, 13.94, 56.67),
    camera = {
      name = "Car",
      coords = vector4(-146.6166, -596.6301, 166.0000, 120.0),
      positions = {5.0, 8.0, 12.0, 8.0}
    },
    categories = {"RRV", "Abarth", "Audi", "Bentley", "BMW", "Chevrolet", "Cupra", "Dodge", "Cupra", "Ferrari", "Ford", "GMC", "Jaguar", "Lamborghini", "Lexus", "Mazda", "Mclaren", "Mercedes", "Mitsubishi", "Nissan", "Opel", "Porsche", "RangeRover", "Smart", "Subaru", "Toyota", "Vauxhall", "VW"},
    enableTestDrive = true,
    hideBlip = false,
    blip = {
      id = 326,
      color = 2,
      scale = 0.6
    },

    -- New config items in v1.1
    sellVehicle = vector3(-27.89, -1082.1, 26.64),
    enableFinance = true,
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    showroomJobWhitelist = {},
    showroomGangWhitelist = {},
    societyPurchaseJobWhitelist = {},
    societyPurchaseGangWhitelist = {},
    disableShowroomPurchase = false,
    job = "cardealer", -- Owned dealerships only
    directSaleDistance = 50,
  },
  ["bikes"] = {
    type = "owned", -- or "owned", "self-service"
    openShowroom = vector3(297.21, -1159.21, 29.27),
    openManagement = vector3(274.22, -1153.71, 33.27),
    purchaseSpawn = vector4(259.89, -1149.63, 28.64, 179.38),
    testDriveSpawn = vector4(-959.53, -3362.46, 13.94, 56.67),
    sellVehicle = vector4(265.4, -1162.51, 28.68, 184.16),
    camera = {
      name = "Car",
      coords = vector4(-146.6166, -596.6301, 166.0000, 120.0),
      positions = {5.0, 8.0, 12.0, 8.0}
    },
    categories = {"RRV", "BMW", "surron", "Yamaha", "Dinka", "Kawaski", "Pegassi", "Nagasaki", "WMC", "Principe", "Shitzu", "Maibatsu", "LCC"},
    enableTestDrive = true,
    enableFinance = true,
    hideBlip = false,
    blip = {
      id = 523,
      color = 2,
      scale = 0.6
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    showroomJobWhitelist = {},
    showroomGangWhitelist = {},
    societyPurchaseJobWhitelist = {},
    societyPurchaseGangWhitelist = {},
  },
  ["redline"] = {
    type = "owned", -- or "owned", "self-service"
    openShowroom = vector3(-591.07, -927.42, 17.36),
    openManagement = vector3(-605.48, -919.97, 23.89),
    purchaseSpawn = vector4(-585.8, -879.84, 16.88, 272.06),
    testDriveSpawn = vector4(-959.53, -3362.46, 13.94, 56.67),
    sellVehicle = vector4(-578.34, -889.95, 16.76, 179.08),
    camera = {
      name = "Car",
      coords = vector4(-146.6166, -596.6301, 166.0000, 120.0),
      positions = {5.0, 8.0, 12.0, 8.0}
    },
    categories = {"RRV", "Audi", "Ford", "GMC", "RangeRover", "Jeep"},
    enableTestDrive = true,
    hideBlip = false,
    blip = {
      id = 523,
      color = 2,
      scale = 0.6
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    showroomJobWhitelist = {},
    showroomGangWhitelist = {},
    societyPurchaseJobWhitelist = {},
    societyPurchaseGangWhitelist = {},
  },
  ["driftshop"] = {
    type = "owned", -- or "owned", "self-service"
    openShowroom = vector3(183.42, 1228.94, 225.72),
    openManagement = vector3(175.61, 1235.47, 225.74),
    purchaseSpawn = vector4(200.83, 1238.71, 225.46, 191.07),
    testDriveSpawn = vector4(-959.53, -3362.46, 13.94, 56.67),
    sellVehicle = vector4(196.76, 1235.41, 225.46, 90.00),
    camera = {
      name = "Car",
      coords = vector4(-146.6166, -596.6301, 166.0000, 120.0),
      positions = {5.0, 8.0, 12.0, 8.0}
    },
    categories = {"RRV", "Nissan", "Ford", "Chevrolet", "Toyota", "Infiniti", "Albany", "Annis", "Benefactor", "Bravado", "Declasse", "Dewbauchee", "Dinka", "Grotti", "Imponte", "Karin", "Maibatsu", "Maxwell", "Obey", "Ocelot", "Ubermacht", "Vapid", "Weeny"},
    enableTestDrive = true,
    enableFinance = true,
    hideBlip = false,
    blip = {
      id = 477,
      color = 2,
      scale = 0.6
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    showroomJobWhitelist = {},
    showroomGangWhitelist = {},
    societyPurchaseJobWhitelist = {},
    societyPurchaseGangWhitelist = {},
  },
}

-- Discord Webhooks
Config.WebhookTestDrive = "https://discord.com/api/webhooks/1155604698863255553/2Lf4ed-cGdW2fQfrCr7pbUGqIOg8MSjZ_uCbczEDwENWRiDSd5mTzTCAiEZHWaCNCP4K"
Config.WebhookPurchase = "https://discord.com/api/webhooks/1155604745571012679/OUFRiiHj9X8BRaMJs364ON-Hk4aUGVvxe2lyoQG4VmwoIGlKoBujQ-f9wh0u5oYV9fgo"
Config.WebhookFinance = "https://discord.com/api/webhooks/1155604784456400896/4nxqivlNqs8DA5t-qgB8nNfnSufgM5tAXWGnev0QXJDWDrgP44_Ig5UobvTulvvZeXu9"
Config.WebhookDealership = "https://discord.com/api/webhooks/1155604825174724678/41GAKnaqqTwx2I1EP-py_b41EhAYFDAFPd4g2fatjEpP-xUiA_zqPfS7fvlusyuTSQEk"
Config.WebhookAdmin = "https://discord.com/api/webhooks/1155604865435848715/SHcABa1BFJ27D2Bd192y5RE8DdxzQzHVhR3OXuFz6rgJvHgq7tnjRoG91WrRr4ThYFxZ"