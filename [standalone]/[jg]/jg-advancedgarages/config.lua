-- Generated with https://configurator.jgscripts.com at 10/3/2023, 11:45:03 PM

Config = {}
Config.Config = {}
Config.Framework = 'QBCore'
Config.FuelSystem = 'cdn-fuel'
Config.VehicleKeys = 'qb-vehiclekeys'
Config.Notifications = 'ps-ui'
Config.Locale = 'en'
Config.DateFormat = 'en-GB'
Config.CurrencySymbol = '£'
Config.DrawText = 'ps-ui'
Config.OpenGarageKeyBind = 38
Config.OpenImpoundKeyBind = 38
Config.InsertVehicleKeyBind = 38
Config.OpenGaragePrompt = '[E] Open Garage'
Config.OpenImpoundPrompt = '[E] Open Impound'
Config.InsertVehiclePrompt = '[E] Store Vehicle'
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true
Config.AdvancedVehicleDamage = true
Config.SaveVehiclePropsOnInsert = true
Config.GarageVehicleTransferCost = 20
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true,
}
Config.AllowInfiniteVehicleSpawns = false
Config.JobGaragesAllowInfiniteVehicleSpawns = false
Config.GangGaragesAllowInfiniteVehicleSpawns = false
Config.GarageVehicleReturnCost = 50
Config.GarageVehicleReturnCostSocietyFund = false
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageLocations = {
  ['Legion Square'] = {
    coords = vector3(215.09, -805.17, 30.81),
    spawn = {
      vector4(212.79, -797.75, 30.55, 159.48),
    },
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Casino Parking'] = {
    coords = vector3(873.36, -41.73, 78.76),
    spawn = {
      vector4(876.02, -44.49, 78.76, 234.54),
    },
    distance = 25,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Islington South'] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Grove Street'] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Mirror Park'] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  Beach = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Great Ocean Highway'] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Sandy South'] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Sandy North'] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Fokcuo Island'] = {
    coords = vector3(-4864.27, 466.02, 29.54),
    spawn = vector4(-4864.27, 466.02, 29.54, 182.83),
    distance = 5,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['North Vinewood Blvd'] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Apartments mlb'] = {
    coords = vector3(-691.12, -1117.96, 14.53),
    spawn = vector4(-691.12, -1117.96, 14.53, 26.07),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  Grapeseed = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Paleto Bay'] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 15,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  Docks = {
    coords = vector3(1179.67, -3267.48, 5.69),
    spawn = vector4(1179.67, -3267.48, 5.69, 89.67),
    distance = 5,
    type = 'car',
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Syndicate Garage'] = {
    coords = vector3(164.26, -3006.02, 5.56),
    spawn = vector4(164.26, -3006.02, 5.56, 270.42),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Filthy Few Garage'] = {
    coords = vector3(-2180.56, -385.46, 13.31),
    spawn = vector4(-2180.56, -385.46, 13.31, 341.88),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['AA Garage'] = {
    coords = vector3(-366.94, -121.77, 38.38),
    spawn = vector4(-366.94, -121.77, 38.38, 72.42),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  SRS = {
    coords = vector3(976.55, -1565.51, 30.58),
    spawn = vector4(976.55, -1565.51, 30.58, 88.77),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['PD Private Parking'] = {
    coords = vector3(544.31, 4.63, 70.63),
    spawn = vector4(544.31, 4.63, 70.63, 199.33),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  SOA = {
    coords = vector3(2523.98, 4114.57, 37.86),
    spawn = vector4(2523.98, 4114.57, 37.86, 333.43),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  Yiannimise = {
    coords = vector3(847.58, -2123.14, 29.94),
    spawn = vector4(847.58, -2123.14, 29.94, 264.22),
    distance = 5,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  essexboys = {
    coords = vector3(-1542.94, -396.66, 41.99),
    spawn = vector4(-1542.94, -396.66, 41.99, 224.5),
    distance = 2,
    type = 'car',
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  Boats = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 20,
    type = 'sea',
    hideBlip = false,
    blip = {
      id = 410,
      color = 0,
      scale = 0.6,
    },
  },
  Hangar = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = 'air',
    hideBlip = false,
    blip = {
      id = 423,
      color = 0,
      scale = 0.6,
    },
  },
}
Config.JobGarageShowBlips = true
Config.JobGarageUniqueBlips = false
Config.JobGarageSetVehicleCommand = 'setjobvehicle'
Config.JobGarageRemoveVehicleCommand = 'removejobvehicle'
Config.JobGarageLocations = {
  Mechanic = {
    coords = vector3(974.38, -1565.31, 29.93),
    spawn = {
      vector4(974.38, -1565.31, 29.93, 90.78),
    },
    distance = 6,
    type = 'car',
    job = 'srs',
    hideBlip = true,
    vehiclesType = 'owned',
    vehicles = {},
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
  },
  ['Midnight Syndicate'] = {
    coords = vector3(167.16, -3045.05, 5.87),
    spawn = {
      vector4(167.16, -3045.05, 5.87, 269.3),
    },
    distance = 5,
    type = 'car',
    job = 'midnightsyn',
    hideBlip = false,
    vehiclesType = 'owned',
    vehicles = {},
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
    showLiveriesExtrasMenu = true,
  },
  ['White Widow'] = {
    coords = vector3(191.82, -274.34, 48.81),
    spawn = {
      vector4(191.82, -274.34, 48.81, 248.39),
    },
    distance = 5,
    type = 'car',
    job = 'whitewidow',
    hideBlip = false,
    vehiclesType = 'owned',
    vehicles = {},
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
    showLiveriesExtrasMenu = true,
  },
  ['catcafe'] = {
    coords = vector3(-606.13, -1059.77, 21.79),
    spawn = {
      vector4(-606.13, -1059.77, 21.79, 92.66),
    },
    distance = 5,
    type = 'car',
    job = 'catcafe',
    hideBlip = false,
    vehiclesType = 'personal',
    vehicles = {},
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
    showLiveriesExtrasMenu = true,
  },
  redlinegarage = {
    coords = vector3(-571.79, -914.35, 23.28),
    spawn = {
      vector4(-571.79, -914.35, 23.28, 179.35),
    },
    distance = 5,
    type = 'car',
    job = 'redline',
    hideBlip = true,
    vehiclesType = 'spawner',
    vehicles = {
      {
        vehicle = 'atow',
        plate = 'R3DL1NE',
        minJobGrade = 0,
        nickname = 'Redline Tow',
      },
    },
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
    showLiveriesExtrasMenu = false,
  },
  ['Police Garage'] = {
    coords = vector3(443.65, -1017.16, 28.65),
    spawn = {
      vector4(446.71, -1024.59, 28.08, 359.73),
    },
    distance = 15,
    type = 'car',
    job = 'police',
    hideBlip = true,
    vehiclesType = 'personal',
    vehicles = {},
    blip = {
      id = 357,
      color = 0,
      scale = 0.6,
    },
    showLiveriesExtrasMenu = true,
  },
}
Config.GangGarageShowBlips = true
Config.GangGarageUniqueBlips = false
Config.GangGarageSetVehicleCommand = 'setgangvehicle'
Config.GangGarageRemoveVehicleCommand = 'removegangvehicle'
Config.GangGarageLocations = {}
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundCommand = 'iv'
Config.ImpoundJobRestriction = {
  'police',
}
Config.ImpoundFeesSocietyFund = 'police'
Config.ImpoundLocations = {
  ['Impound A'] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15,
    type = 'car',
    blip = {
      id = 68,
      color = 0,
      scale = 0.6,
    },
    hideBlip = false,
  },
  ['Impound B'] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15,
    type = 'car',
    blip = {
      id = 68,
      color = 0,
      scale = 0.6,
    },
    hideBlip = false,
  },
}
Config.PrivGarageCreateCommand = 'privategarages'
Config.PrivGarageCreateJobRestriction = {
  'realestate',
}
Config.ChangeVehiclePlate = 'vplate'
Config.DeleteVehicleFromDB = 'dvdb'
Config.ReturnVehicleToGarage = 'vreturn'
Config.VehicleLabels = {
  spawnName = 'Pretty Vehicle Label',
}
Config.__v2Config = true
