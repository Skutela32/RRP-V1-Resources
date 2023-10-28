local ESX = select(2,...)

local sharedList
local mysql = exports["oxmysql"]

RegisterNetEvent("ti_utils:" .. GetCurrentResourceName() .. ":getSharedVehicleList",function()
    local _source = source

    while not sharedList do
        Wait(500)
    end

    TriggerClientEvent("ti_utils:gotSharedVehicleList",_source,sharedList)
end)

Citizen.CreateThread(function()
    Wait(0)

    local rows = mysql:executeSync("SELECT * FROM vehicles")

    local list = {}

    for _,row in ipairs(rows) do
        list[row.model:lower()] = {
            name = row.name,
            model = row.model:lower(),
            price = row.price,
            category = row.category,
            categoryLabel = row.categoryLabel or row.category:upper(),
            brand = row.brand or "UNKNOWN",
            hash = GetHashKey(row.model)%0x100000000,
            shop = row.shop or "none"
        }
    end

    sharedList = list
end)

ti.callbacks.register("ti_utils:vehicles:spawnNetworked", function(source, cb, model, pos, heading)    
    local hash = type(model) == "string" and GetHashKey(model) or model

    local ent = CreateVehicle(hash, pos.x, pos.y, pos.z, heading, true, true)

    while not DoesEntityExist(ent) do
        Wait(0)
    end    

    local netId = NetworkGetNetworkIdFromEntity(ent)

    cb(netId)
end)

local module = {}

module.getSharedList = function()
    return sharedList
end

module.awaitSharedList = function(cb)
    while not sharedList do
        Wait(0)
    end

    cb(sharedList)
end

module.awaitSharedListSync = function()
    while not sharedList do
        Wait(0)
    end

    return sharedList
end

return module