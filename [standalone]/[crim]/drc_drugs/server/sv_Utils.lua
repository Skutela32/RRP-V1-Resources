lib.locale()

local ver = '1.0.2'

CreateThread(function()
    if GetResourceState(GetCurrentResourceName()) == 'started' then
        print('DRC_DRUGS STARTED ON VERSION: ' .. ver)
    end
end)

if Config.Framework == "ESX" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.Framework == "qbcore" then
    QBCore = nil
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "standalone" then
    -- ADD YOU FRAMEWORK
end

function BanPlayer(source, message)
    if Config.AnticheatBan then
        --Example of usage for SQZ ANTICHEAT (Higly recommended Anticheat!)
        exports['sqz_anticheat']:BanPlayer(source, message)
    end
end

local webhook = "https://discord.com/api/webhooks/1155563138578665603/U_2GOtW8TKytTD1ybqZUhO-eiT0FGJzeVhH55EOuyZ70OzXVMsk2zmwJpjNiAhoYzYoJ"
function Logs(source, message)
    if message ~= nil then
        if Config.Logs.enabled then
            local license = nil
            for k, v in pairs(GetPlayerIdentifiers(source)) do
                if string.sub(v, 1, string.len("license:")) == "license:" then
                    license = v
                end
            end
            if Config.Logs.type == "ox_lib" then
                lib.logger(source, "Drugs", message)
            elseif Config.Logs.type == "webhook" then
                local embed = {
                    {
                        ["color"] = 2600155,
                        ["title"] = "Player: **" .. GetPlayerName(source) .. " | License: " .. license .. " **",
                        ["description"] = message,
                        ["footer"] = {
                            ["text"] = "Logs by DRC SCRIPTS for DRC DRUGS!",
                        },
                    }
                }
                PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',
                    json.encode({ username = "DRC DRUGS", embeds = embed, avatar_url = "https://i.imgur.com/RclET8O.png" })
                    , { ['Content-Type'] = 'application/json' })
            end
        end
    end
end

function GetMoney(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetMoney('cash') >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function RemoveMoney(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeMoney(count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveMoney('cash', count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function AddMoney(count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addMoney(count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddMoney('cash', count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function GetItem(name, count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(name).count >= count then
            return true
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(name) ~= nil then
            if xPlayer.Functions.GetItemByName(name).amount >= count then
                return true
            else
                return false
            end
        else
            return false
        end
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function AddItem(name, count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(name, count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem(name, count, nil, nil)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[name], "add", count)

    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

function RemoveItem(name, count, source)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(name, count)
    elseif Config.Framework == "qbcore" then
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.RemoveItem(name, count, nil, nil)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[name], "remove", count)
    elseif Config.Framework == "standalone" then
        -- ADD YOUR FRAMEWORK
    end
end

lib.callback.register('drc_drugs:getpolice', function(source)
    local policeCount = 0
    if Config.Framework == "ESX" then
        local xPlayers = ESX.GetPlayers()
        for i = 1, #xPlayers do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            for _, job in pairs(Config.PoliceJobs) do
                if xPlayer.job.name == job then
                    policeCount = policeCount + 1
                end
            end
        end
        return policeCount
    elseif Config.Framework == "qbcore" then
        local xPlayers = QBCore.Functions.GetPlayers()
        for i = 1, #xPlayers do
            local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
            for _, job in pairs(Config.PoliceJobs) do
                if xPlayer.PlayerData.job.name == job then
                    policeCount = policeCount + 1
                end
            end
        end
        return policeCount
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end)

if Config.Clothing == "qb-clothing" then
    RegisterServerEvent("drc_drugs:loadPlayerSkin")
    AddEventHandler('drc_drugs:loadPlayerSkin', function()
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?',
            { Player.PlayerData.citizenid, 1 })
        if result[1] ~= nil then
            TriggerClientEvent("drc_drugs:loadSkin", src, false, result[1].model, result[1].skin)
        else
            TriggerClientEvent("drc_drugs:loadSkin", src, true)
        end
    end)
end

RegisterServerEvent("drc_drugs:deleteprop", function(ent)
    local ent = NetworkGetEntityFromNetworkId(ent)
    DeleteEntity(ent)
end)
