lib.locale()

if Config.Framework == "ESX" then
    ESX = nil
    CreateThread(function()
        while ESX == nil do
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
            Wait(100)
        end
    end)
elseif Config.Framework == "qbcore" then
    QBCore = nil
    QBCore = exports["qb-core"]:GetCoreObject()
elseif Config.Framework == "standalone" then
    -- ADD YOU FRAMEWORK
end

-- Your notification type settings
-- •» You can edit a type of notifications, with chaning type or triggering your own.
Notify = function(type, title, text)
    if Config.NotificationType == "ESX" then
        ESX.ShowNotification(text)
    elseif Config.NotificationType == "ox_lib" then
        if type == "info" then
            lib.notify({
                title = title,
                description = text,
                type = "inform"
            })
        elseif type == "error" then
            lib.notify({
                title = title,
                description = text,
                type = "error"
            })
        elseif type == "success" then
            lib.notify({
                title = title,
                description = text,
                type = "success"
            })
        elseif Config.NotificationType == "qbcore" then
            if type == "success" then
                QBCore.Functions.Notify(text, "success")
            elseif type == "info" then
                QBCore.Functions.Notify(text, "primary")
            elseif type == "error" then
                QBCore.Functions.Notify(text, "error")
            end
        elseif Config.NotificationType == "custom" then
            print("add your notification system! in cl_Utils.lua")
            -- ADD YOUR NOTIFICATION | TYPES ARE info, error, success
        end
    end
end

--Blip creating
CreateThread(function()
    for _, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.BlipCoords)
        SetBlipSprite(blip, v.Sprite)
        SetBlipDisplay(blip, v.Display)
        SetBlipScale(blip, v.Scale)
        SetBlipColour(blip, v.Colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

--Appearance
local appearance = nil
GetSkin = function()
    if Config.Clothing == "illenium-appearance" then
        appearance = exports['illenium-appearance']:getPedAppearance(PlayerPedId())
    elseif Config.Clothing == "esx_skin" then
        TriggerEvent('skinchanger:getSkin', function(skin)
            appearance = skin
        end)
    elseif Config.Clothing == "qb-clothing" then
        -- no need
    elseif Config.Clothing == "custom" then
        print("add your clothing system! in cl_Utils.lua")
        -- ADD YOUR CLOTHING SCRIPT
    end
end

ApplySkin = function()
    if Config.Clothing == "illenium-appearance" then
        exports['illenium-appearance']:setPedAppearance(PlayerPedId(), appearance)
    elseif Config.Clothing == "esx_skin" then
        TriggerEvent('skinchanger:loadSkin', appearance)
    elseif Config.Clothing == "qb-clothing" then
        TriggerServerEvent("drc_drugs:loadPlayerSkin")
        --TriggerServerEvent("qb-clothes:loadPlayerSkin")
    elseif Config.Clothing == "custom" then
        print("add your clothing system! in cl_Utils.lua")
        -- ADD YOUR CLOTHING SCRIPT
    end
end

RegisterNetEvent("drc_drugs:loadSkin")
AddEventHandler("drc_drugs:loadSkin", function(_, model, data)
    model = model ~= nil and tonumber(model) or false
    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        --SetPlayerModel(PlayerId(), model) -- WITH THIS CUTSCENE WONT WORK
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
        data = json.decode(data)
        TriggerEvent('qb-clothing:client:loadPlayerClothing', data, PlayerPedId())
    end)
end)

--
Dispatch = function(coords, type)
    if Config.Dispatch.enabled then
        if Config.Dispatch.script == "cd_dispatch" then
            if type == "drugselling" then
                local data = exports['cd_dispatch']:GetPlayerInfo()
                TriggerServerEvent('cd_dispatch:AddNotification', {
                    job_table = { Config.PoliceJobs },
                    coords = coords,
                    title = "10-66 - Suspicious person",
                    message = "Suspicious activity  was spotted by citizen",
                    flash = 0,
                    unique_id = tostring(math.random(0000000, 9999999)),
                    blip = {
                        sprite = sprite,
                        scale = 1.2,
                        colour = 3,
                        flashes = false,
                        text = text,
                        time = (5 * 60 * 1000),
                        sound = 1,
                    }
                })
            end
        elseif Config.Dispatch.script == "linden_outlawalert" then
            if type == "drugselling" then
                local data = { displayCode = "10-66", description = "Suspicious person", isImportant = 1,
                    recipientList = Config.PoliceJobs,
                    length = '10000', infoM = 'fa-info-circle', info = "Suspicious activity  was spotted by citizen" }
                local dispatchData = { dispatchData = data, caller = 'citizen', coords = coords }
                TriggerServerEvent('wf-alerts:svNotify', dispatchData)
            end
        elseif Config.Dispatch.script == "ps-disptach" then
            if type == "drugselling" then
                exports['ps-dispatch']:SuspiciousActivity()
            end
        elseif Config.Dispatch.script == "custom" then
            print("add your dispatch system! in cl_Utils.lua")
        end
    end
end

if Config.Bob74_ipl then
    Citizen.CreateThread(function()
        BikerMethLab = exports['bob74_ipl']:GetBikerMethLabObject()

        -- Here we make two modifications
        BikerMethLab.Style.Set(BikerMethLab.Style.upgrade, false)
        BikerMethLab.Security.Set(BikerMethLab.Security.upgrade, false)

        -- But we only call the refresh at the end
        RefreshInterior(BikerMethLab.interiorId)
    end)

    Citizen.CreateThread(function()
        BikerCocaine = exports['bob74_ipl']:GetBikerCocaineObject()
        BikerCocaine.Ipl.Interior.Remove()
        -- Here we make two modifications
        BikerCocaine.Style.Set(BikerCocaine.Style.upgrade, false)
        BikerCocaine.Security.Set(BikerCocaine.Security.upgrade, false)
        BikerCocaine.Details.Enable({ BikerCocaine.Details.cokeUpgrade1, BikerCocaine.Details.cokeUpgrade2,
            BikerCocaine.Details.cokeBasic1, BikerCocaine.Details.cokeBasic2, BikerCocaine.Details.cokeBasic3 }, true)

        -- But we only call the refresh at the end
        RefreshInterior(BikerCocaine.interiorId)
    end)
end
