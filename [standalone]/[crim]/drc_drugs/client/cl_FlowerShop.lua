local TSE = TriggerServerEvent
RegisterNetEvent("drc_drugs:flowershop:menus", function(data)
    PlayPedAmbientSpeechNative(FlowerNPC, 'Generic_Hows_It_Going', 'Speech_Params_Force')
    if data.shop == "flowershop" then
        options = {}
        for _, v in pairs(Config.FlowerShop.Items) do
            options[v.label] = {}
            options[v.label].description = v.description .. v.price
            options[v.label].event = 'drc_drugs:flowershop:progress'
            options[v.label].args = { shop = data.shop, item = v.item, price = v.price, min = v.MinAmount,
                max = v.MaxAmount }
        end
        lib.registerContext({
            id = 'FlowerShop',
            title = Config.FlowerShop.Header,
            options = options
        })
        lib.showContext('FlowerShop')
    end
end)

RegisterNetEvent("drc_drugs:flowershop:progress")
AddEventHandler("drc_drugs:flowershop:progress", function(data)
    if data.shop == "flowershop" then
        local input = lib.inputDialog(locale("Pricefor") .. data.price,
            { locale("Amount") .. locale("Range") .. data.min .. ' - ' .. data.max })

        if input then
            local amount = tonumber(input[1])
            if amount then
                if amount >= data.min and amount <= data.max then
                    lib.callback('drc_drugs:flowershop:getitem', false, function(value)
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
                                    PlayPedAmbientSpeechNative(FlowerNPC, 'GENERIC_THANKS', 'SPEECH_PARAMS_FORCE')
                                    TSE("drc_drugs:flowershop:giveitems", data.item, data.price, amount)
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

local FlowerShopPed = nil
local Spawned = false
CreateThread(function()
    while true do
        Wait(1000)
        for _, v in pairs(Config.FlowerShop.Ped) do
            local Coords = GetEntityCoords(PlayerPedId())
            local distance = #(Coords - vec3(v.coords))
            if distance < 20 and not Spawned then
                Spawned = true
                RequestModel(GetHashKey(v.model))

                while not HasModelLoaded(GetHashKey(v.model)) do
                    Wait(100)
                end

                FlowerNPC = CreatePed(4, v.model, v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, true)
                FlowerShopPed = FlowerNPC
                if Config.Target == "qtarget" then
                    exports.qtarget:AddTargetEntity(FlowerNPC, {
                        options = {
                            {
                                event = "drc_drugs:flowershop:menus",
                                icon = "fas fa-tree",
                                label = locale("shop"),
                                shop = "flowershop"
                            },
                        },
                        distance = 2
                    })
                elseif Config.Target == "qb-target" then
                    exports['qb-target']:AddTargetEntity(FlowerNPC, {
                        options = {
                            {
                                type = "client",
                                event = "drc_drugs:flowershop:menus",
                                icon = "fas fa-tree",
                                label = locale("shop"),
                                shop = "flowershop"
                            },
                        },
                        distance = 2
                    })
                end
                for i = 0, 255, 51 do
                    Wait(50)
                    SetEntityAlpha(FlowerNPC, i, false)
                end
                FreezeEntityPosition(FlowerNPC, true)
                SetEntityInvincible(FlowerNPC, true)
                SetBlockingOfNonTemporaryEvents(FlowerNPC, true)
                TaskStartScenarioInPlace(FlowerNPC, v.scenario, 0, true)
            elseif distance >= 20 and Spawned then
                for i = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(FlowerShopPed, i, false)
                end
                DeletePed(FlowerShopPed)
                Spawned = false
            end
        end
    end
end)
