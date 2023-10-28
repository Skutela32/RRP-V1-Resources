local TSE = TriggerServerEvent
RegisterNetEvent("drc_drugs:medicaments:menus", function(data)
    PlayPedAmbientSpeechNative(MedicamentNPC, 'Generic_Hows_It_Going', 'Speech_Params_Force')
    if data.shop == "medicaments" then
        options = {}
        for _, v in pairs(Config.MedicamentsShop.Items) do
            options[v.label] = {}
            options[v.label].description = v.description .. v.price
            options[v.label].event = 'drc_drugs:medicaments:progress'
            options[v.label].args = { shop = data.shop, item = v.item, price = v.price, min = v.MinAmount,
                max = v.MaxAmount }
        end
        lib.registerContext({
            id = 'MedicamentsMenu',
            title = Config.MedicamentsShop.Header,
            options = options
        })
        lib.showContext('MedicamentsMenu')
    end
end)

RegisterNetEvent("drc_drugs:medicaments:progress")
AddEventHandler("drc_drugs:medicaments:progress", function(data)
    local input = lib.inputDialog(locale("Pricefor") .. data.price,
        { locale("Amount") .. locale("Range") .. data.min .. ' - ' .. data.max })

    if input then
        local amount = tonumber(input[1])
        if amount then
            if amount >= data.min and amount <= data.max then
                lib.callback('drc_drugs:medicaments:getitem', false, function(value)
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
                                PlayPedAmbientSpeechNative(MedicamentNPC, 'Generic_Thanks',
                                    'Speech_Params_Force_Shouted_Critical')
                                TSE("drc_drugs:medicaments:giveitems", data.item, data.price, amount)
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
end)

local MedicamentsShopPed = nil
local Spawned = false
CreateThread(function()
    while true do
        Wait(1000)
        for _, v in pairs(Config.MedicamentsShop.Ped) do
            local Coords = GetEntityCoords(PlayerPedId())
            local distance = #(Coords - vec3(v.coords))
            if distance < 20 and not Spawned then
                Spawned = true
                RequestModel(GetHashKey(v.model))

                while not HasModelLoaded(GetHashKey(v.model)) do
                    Wait(100)
                end

                MedicamentNPC = CreatePed(4, v.model, v.coords, false, true)
                MedicamentsShopPed = MedicamentNPC
                if Config.Target == "qtarget" then
                    exports.qtarget:AddTargetEntity(MedicamentNPC, {
                        options = {
                            {
                                event = "drc_drugs:medicaments:menus",
                                icon = "fas fa-skull",
                                label = locale("shop"),
                                shop = "medicaments"
                            },
                        },
                        distance = 2
                    })
                elseif Config.Target == "qb-target" then
                    exports['qb-target']:AddTargetEntity(MedicamentNPC, {
                        options = {
                            {
                                type = "client",
                                event = "drc_drugs:medicaments:menus",
                                icon = "fas fa-skull",
                                label = locale("shop"),
                                shop = "medicaments"
                            },
                        },
                        distance = 2
                    })
                end
                for i = 0, 255, 51 do
                    Wait(50)
                    SetEntityAlpha(MedicamentNPC, i, false)
                end
                FreezeEntityPosition(MedicamentNPC, true)
                SetEntityInvincible(MedicamentNPC, true)
                SetBlockingOfNonTemporaryEvents(MedicamentNPC, true)
                TaskStartScenarioInPlace(MedicamentNPC, v.scenario, 0, true)
            elseif distance >= 20 and Spawned then
                for i = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(MedicamentsShopPed, i, false)
                end
                DeletePed(MedicamentsShopPed)
                Spawned = false
            end
        end
    end
end)
