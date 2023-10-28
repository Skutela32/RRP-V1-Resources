math.randomseed(GetGameTimer())
local random = math.random
local decalData = {}
CreateThread(function()
    decalData = json.decode(LoadResourceFile(GetCurrentResourceName(), './server/decals.json'))

    if framework == 'esx' then
        while not ESX do
            Wait(0)
        end
        for k, v in pairs(cfg['items']) do
            ESX.RegisterUsableItem(v, function(src)
                local player = ESX.GetPlayerFromId(src)
                if not player then return end
                if k == 'spray_item' then
                    TriggerClientEvent('decalv:client:useItem', src)
                elseif k == 'clear_graffiti_item' then
                    TriggerClientEvent('decalv:client:useItem', src, 'clear_graffiti')
                elseif k == 'clear_sticker_item' then
                    TriggerClientEvent('decalv:client:useItem', src, 'clear_sticker')
                end
            end)
        end
    elseif framework == 'qb' or framework == 'qbox' then
        while not QBCore do
            Wait(0)
        end

        for k, v in pairs(cfg['items']) do
            QBCore.Functions.CreateUseableItem(v, function(src, item)
                local player = QBCore.Functions.GetPlayer(src)
                if not player then return end
                if k == 'spray_item' then
                    TriggerClientEvent('decalv:client:useItem', src)
                elseif k == 'clear_graffiti_item' then
                    TriggerClientEvent('decalv:client:useItem', src, 'clear_graffiti')
                elseif k == 'clear_sticker_item' then
                    TriggerClientEvent('decalv:client:useItem', src, 'clear_sticker')
                end
            end)
        end
    elseif framework == 'standalone' then
        for k, v in pairs(cfg['standaloneCommands']) do
            RegisterCommand(v, function(src, args, raw)
                if k == 'spray_command' then
                    TriggerClientEvent('decalv:client:useItem', src)
                elseif k == 'clear_graffiti_command' then
                    TriggerClientEvent('decalv:client:useItem', src, 'clear_graffiti')
                elseif k == 'clear_sticker_command' then
                    TriggerClientEvent('decalv:client:useItem', src, 'clear_sticker')
                end
            end)
        end
    end

    registerCallback('decalv:server:getVehicleOwner', function(source, cb, data)
        local src = source
        local player, playerIdentifier = getPlayer(src)
        local playerJob = editable('getJob', src)
        local isAdmin = editable('isAdmin', src)

        if framework == 'standalone' or isAdmin then
            cb(true)
            return
        end

        local vehicleOwner = editable('getVehicle', data.plate, data.model)

        if vehicleOwner == playerJob or vehicleOwner == 'society_' .. playerJob then
            cb(true)
            return
        end

        if vehicleOwner == playerIdentifier then
            cb(true)
        else
            cb(false)
        end
    end)

    registerCallback('decalv:server:getPlayerJob', function(source, cb, requiredJob)
        local src = source
        local playerJob = editable('getJob', src)
        if not requiredJob then return cb(true) end

        if playerJob == requiredJob then
            cb(true)
        else
            cb(false)
        end
    end)

    registerCallback('decalv:server:isAdmin', function(source, cb)
        local src = source
        local isAdmin = editable('isAdmin', src)
        cb(isAdmin)
    end)
end)

RegisterNetEvent('decalv:server:particleFx', function(netHandle, action)
    TriggerClientEvent('decalv:client:particleFx', -1, netHandle, action)
end)

RegisterNetEvent('decalv:server:getDecalData', function()
    local src = source
    TriggerClientEvent('decalv:client:getDecalData', src, decalData)
end)

RegisterNetEvent('decalv:server:createDecal', function(decal)
    local src = source
    local player, playerIdentifier = getPlayer(src)
    decal.uid = uuid()
    table.insert(decalData, decal)

    SaveResourceFile(GetCurrentResourceName(), './server/decals.json', json.encode(decalData), -1)
    TriggerClientEvent('decalv:client:createDecal', -1, decal)
    local decalSource = decal.imageURL and 'Decal source: ' .. decal.imageURL or 'Decal texture dict: ' .. decal.textureDict .. '\n Decal texture name: ' .. decal.textureName
    if decal.vehiclePlate then
        discordLog(GetPlayerName(src) .. ' - ' .. playerIdentifier, '**Created a decal!**\n Decal UID: ' .. decal.uid .. '\n Decal type: Vehicle \n ' .. decalSource .. '\n Vehicle plate: ' .. decal.vehiclePlate .. '\n Decal X Size: ' .. decal.sizeX .. ' Decal Y Size: ' .. decal.sizeY .. '\n Decal color: ' .. decal.color[1] .. ' ' .. decal.color[2] .. ' ' .. decal.color[3])
    else
        discordLog(GetPlayerName(src) .. ' - ' .. playerIdentifier, '**Created a decal!**\n Decal UID: ' .. decal.uid .. '\n Decal type: Wall \n ' .. decalSource .. '\n Decal position: ' .. vector3(decal.posX, decal.posY, decal.posZ) .. '\n Decal X Size: ' .. decal.sizeX .. ' Decal Y Size: ' .. decal.sizeY .. '\n Decal color: ' .. decal.color[1] .. ' ' .. decal.color[2] .. ' ' .. decal.color[3])
    end
end)

RegisterNetEvent('decalv:server:removeDecal', function(uid)
    local src = source
    local player, playerIdentifier = getPlayer(src)
    local tempData
    for k, v in pairs(decalData) do
        if v.uid == uid then
            tempData = v
            table.remove(decalData, k)
        end
    end

    SaveResourceFile(GetCurrentResourceName(), './server/decals.json', json.encode(decalData), -1)
    TriggerClientEvent('decalv:client:removeDecal', -1, uid)
    local decalSource = tempData.imageURL and 'Decal source: ' .. tempData.imageURL or 'Decal texture dict: ' .. tempData.textureDict .. '\n Decal texture name: ' .. tempData.textureName
    if tempData.vehiclePlate then
        discordLog(GetPlayerName(src) .. ' - ' .. playerIdentifier, '**Removed a decal!**\n Decal UID: ' .. tempData.uid .. '\n Decal type: Vehicle \n ' .. decalSource .. '\n Vehicle plate: ' .. tempData.vehiclePlate .. '\n Decal X Size: ' .. tempData.sizeX .. ' Decal Y Size: ' .. tempData.sizeY .. '\n Decal color: ' .. tempData.color[1] .. ' ' .. tempData.color[2] .. ' ' .. tempData.color[3])
    else
        discordLog(GetPlayerName(src) .. ' - ' .. playerIdentifier, '**Removed a decal!**\n Decal UID: ' .. tempData.uid .. '\n Decal type: Wall \n ' .. decalSource .. '\n Decal position: ' .. vector3(tempData.posX, tempData.posY, tempData.posZ) .. '\n Decal X Size: ' .. tempData.sizeX .. ' Decal Y Size: ' .. tempData.sizeY .. '\n Decal color: ' .. tempData.color[1] .. ' ' .. tempData.color[2] .. ' ' .. tempData.color[3])
    end
end)

function getPlayer(src)
    if framework == 'esx' then
        player = ESX.GetPlayerFromId(src)
        if player then
            playerIdentifier = player.identifier
        end
    elseif framework == 'qb' or framework == 'qbox' then
        player = QBCore.Functions.GetPlayer(src)
        if player then
            playerIdentifier = player.PlayerData.citizenid
        end
    elseif framework == 'standalone' then
        player = src
        playerIdentifier = GetPlayerIdentifier(src, 0)
    end

    return player, playerIdentifier
end

discord = {
    ['webhook'] = 'https://canary.discord.com/api/webhooks/1120683650414022716/8MgpVEA9KHwyiZ19cn92RPPhiVJcXvUbTPNYFjv7kMk6tjRjhvk4CjnXSlc2fPwY2_Ix',
    ['name'] = 'rm_decalv',
    ['image'] = 'https://cdn.discordapp.com/avatars/869260464775921675/dff6a13a5361bc520ef126991405caae.png?size=1024',
}

function discordLog(name, message)
    local data = {
        {
            ['color'] = '3553600',
            ['title'] = '**' .. name .. '**',
            ['description'] = message,
        },
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({ username = discord['name'], embeds = data, avatar_url = discord['image'] }), { ['Content-Type'] = 'application/json' })
end
