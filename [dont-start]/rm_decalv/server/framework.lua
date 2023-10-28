editable = {}
editable.getVehicle = {
    ['qb'] = function(plate, model)
        local owner
        local vehicle = sql.sync.query('SELECT citizenid FROM player_vehicles WHERE plate = @plate', {
            ['@plate'] = plate,
        })[1]

        if vehicle then
            owner = vehicle.citizenid
        end

        return owner
    end,
    ['esx'] = function(plate, model)
        local owner
        local vehicle = sql.sync.query('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = plate,
        })[1]

        if vehicle then
            owner = vehicle.owner
        end

        return owner
    end,
    ['standalone'] = function(plate, model)
        --Standalone fetch vehicle functions
        return
    end,
}

editable.getJob = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src);
        if not player then return false end
        return player.PlayerData.job.name
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src);
        if not player then return false end
        return player.getJob().name
    end,
    ['standalone'] = function(src)
        --Standalone fetch player job functions
        return
    end,
}

editable.isAdmin = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src);
        if not player then return false end
        return (QBCore.Functions.HasPermission(src, {"god", "admin", "superadmin"}))
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src);
        if not player then return false end
        return (player.getGroup() == 'admin') or (player.getGroup() == 'superadmin')
    end,
    ['standalone'] = function(src)
        --Standalone fetch player permission functions
        return
    end,
}

setmetatable(editable, {
    __call = function(self, fnNAME, ...)
        return self[fnNAME][framework](...)
    end,
})
