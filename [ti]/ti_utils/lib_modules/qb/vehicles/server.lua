local QBCore = select(2,...)

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
    return QBCore.Shared.Vehicles
end

module.awaitSharedList = function(cb)
    cb(QBCore.Shared.Vehicles)
end

module.awaitSharedListSync = function()
    return QBCore.Shared.Vehicles
end

return module