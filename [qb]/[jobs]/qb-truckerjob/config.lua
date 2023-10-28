Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.TruckerJobTruckDeposit = 50
Config.TruckerJobFixedLocation = false
Config.TruckerJobMaxDrops = 5 -- amount of locations before being forced to return to station to reload
Config.TruckerJobDropPrice = 250
Config.TruckerJobBonus = 35 -- this is a percentage to calculate bonus over 5 deliveries.
Config.TruckerJobPaymentTax = 5

Config.TruckerJobLocations = {
    ["main"] = {
        label = "Truck Shed",
        coords = vector4(153.68, -3211.88, 5.91, 274.5),
    },
    ["vehicle"] = {
        label = "Truck Storage",
        coords = vector4(141.12, -3204.31, 5.85, 267.5),
    },
}

Config.TruckerJobVehicles = {
    ["rumpo"] = {
        ["label"] = "Rumpo Delivery Van",
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 1.5
    },
    ["benson"] = {
        ["label"] = "Benson Box Truck",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 5
        },
        ["trunkpos"] = 3
    },
    ["mule5"] = {
        ["label"] = "Mule Box Truck",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 1.5
    },
    ["boxville4"] = {
        ["label"] = "Boxville StepVan",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 1.5
    },
}