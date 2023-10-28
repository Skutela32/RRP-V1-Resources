local TSE = TriggerServerEvent
RegisterNetEvent("drc_drugs:comicshop:Menus", function(data)
    PlayPedAmbientSpeechNative(ComicNPC, 'GENERIC_HI', 'SPEECH_PARAMS_FORCE')
    if data.shop == "comicshop" then
        options = {}
        for _, v in pairs(Config.ComicShop.Items) do
            options[v.label] = {}
            options[v.label].description = v.description .. v.price
            options[v.label].event = 'drc_drugs:comicshop:progress'
            options[v.label].args = { shop = data.shop, item = v.item, price = v.price, min = v.MinAmount,
                max = v.MaxAmount }
        end
        lib.registerContext({
            id = 'ComicShop',
            title = Config.ComicShop.Header,
            options = options
        })
        lib.showContext('ComicShop')
    end
end)

RegisterNetEvent("drc_drugs:comicshop:progress")
AddEventHandler("drc_drugs:comicshop:progress", function(data)
    if data.shop == "comicshop" then
        local input = lib.inputDialog(locale("Pricefor") .. data.price,
            { locale("Amount") .. locale("Range") .. data.min .. ' - ' .. data.max })
        if input then
            local amount = tonumber(input[1])
            if amount then
                if amount >= data.min and amount <= data.max then
                    lib.callback('drc_drugs:comicshop:getitem', false, function(value)
                        if value then
                            if not lib.progressActive() then
                                if lib.progressBar({
                                    duration = 6000,
                                    label = locale("Buying"),
                                    useWhileDead = false,
                                    canCancel = false,
                                    disable = {
                                        move = true,
                                        car = true,
                                        combat = true,
                                        mouse = false
                                    },
                                    anim = {
                                        dict = "misscarsteal4@actor",
                                        clip = "actor_berating_loop",
                                        flags = 49,
                                    },
                                }) then
                                    PlayPedAmbientSpeechNative(ComicNPC, 'GENERIC_THANKS', 'SPEECH_PARAMS_FORCE')
                                    TSE("drc_drugs:comicshop:giveitems", data.item, data.price, amount)
                                end
                            end
                        else
                            Notify("error", locale("error"), locale("RequiredItems"))
                        end
                    end, data.price, amount)
                else
                    Notify("error", locale("error"), locale("IvalidAmount"))
                end
            else
                Notify("error", locale("error"), locale("IvalidAmount"))
            end
        end
    end
end)

local ComicShopPed = nil
local Spawned = false
CreateThread(function()
    while true do
        Wait(1000)
        for _, v in pairs(Config.ComicShop.Ped) do
            local Coords = GetEntityCoords(PlayerPedId())
            local distance = #(Coords - vec3(v.coords))
            if distance < 20 and not Spawned then
                Spawned = true
                RequestModel(GetHashKey(v.model))

                while not HasModelLoaded(GetHashKey(v.model)) do
                    Wait(1)
                end

                ComicNPC = CreatePed(4, v.model, v.coords, false, true)
                ComicShopPed = ComicNPC
                if Config.Target == "qtarget" then
                    exports.qtarget:AddTargetEntity(ComicNPC, {
                        options = {
                            {
                                event = "drc_drugs:comicshop:Menus",
                                icon = "fas fa-store",
                                label = locale("shop"),
                                shop = "comicshop"
                            },
                        },
                        distance = 2
                    })
                elseif Config.Target == "qb-target" then
                    exports['qb-target']:AddTargetEntity(ComicNPC, {
                        options = {
                            {
                                type = "client",
                                event = "drc_drugs:comicshop:Menus",
                                icon = "fas fa-store",
                                label = locale("shop"),
                                shop = "comicshop"
                            },
                        },
                        distance = 2
                    })
                end
                for i = 0, 255, 51 do
                    Wait(50)
                    SetEntityAlpha(ComicNPC, i, false)
                end
                FreezeEntityPosition(ComicNPC, true)
                SetEntityInvincible(ComicNPC, true)
                SetBlockingOfNonTemporaryEvents(ComicNPC, true)
                TaskStartScenarioInPlace(ComicNPC, v.scenario, 0, true)
            elseif distance >= 20 and Spawned then
                for i = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(ComicShopPed, i, false)
                end
                DeletePed(ComicShopPed)
                Spawned = false
            end
        end
    end
end)
