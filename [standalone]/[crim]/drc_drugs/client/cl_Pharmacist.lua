local TSE = TriggerServerEvent
RegisterNetEvent("drc_drugs:pharmacist:Menus")
AddEventHandler("drc_drugs:pharmacist:Menus", function(data)
    if data.shop == "PharmacistShop" then
        local h = GetClockHours()
        if Config.Pharmacist.Available.enabled then
            if h > Config.Pharmacist.Available.from - 1.0 and h < Config.Pharmacist.Available.to + 1.0 then
                options = {}
                for _, v in pairs(Config.Pharmacist.Items) do
                    options[v.label] = {}
                    options[v.label].description = v.description .. v.price
                    options[v.label].event = 'drc_drugs:pharmacist:progress'
                    options[v.label].args = { shop = data.shop, item = v.item, price = v.price, min = v.MinAmount,
                        max = v.MaxAmount }
                end
                lib.registerContext({
                    id = 'PharmacistShop',
                    title = Config.Pharmacist.Header,
                    options = options
                })
                lib.showContext('PharmacistShop')
            else
                Notify("info", locale("Pharmacist"), locale("PharmacistBreak"))
            end
        else
            options = {}
            for _, v in pairs(Config.Pharmacist.Items) do
                options[v.label] = {}
                options[v.label].description = v.description .. v.price
                options[v.label].event = 'drc_drugs:pharmacist:progress'
                options[v.label].args = { shop = data.shop, item = v.item, price = v.price, min = v.MinAmount,
                    max = v.MaxAmount }
            end
            lib.registerContext({
                id = 'PharmacistShop',
                title = Config.Pharmacist.Header,
                options = options
            })
            lib.showContext('PharmacistShop')
        end
    end
end)

RegisterNetEvent("drc_drugs:pharmacist:progress")
AddEventHandler("drc_drugs:pharmacist:progress", function(data)
    if data.shop == "PharmacistShop" then
        local input = lib.inputDialog(locale("Pricefor") .. data.price,
            { locale("Amount") .. locale("Range") .. data.min .. ' - ' .. data.max })

        if input then
            local amount = tonumber(input[1])
            if amount then
                if amount >= data.min and amount <= data.max then
                    lib.callback('drc_drugs:pharmacist:getitem', false, function(value)
                        if value then
                            if not lib.progressActive() then
                                for _, v in pairs(Config.Pharmacist.Ped) do
                                    TaskTurnPedToFaceCoord(cache.ped, v.coords, 4000)
                                end
                                if lib.progressBar({
                                    duration = 15000,
                                    label = locale("Buying"),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        move = true,
                                        car = true,
                                        combat = true,
                                        mouse = false,
                                    },
                                    anim = {
                                        dict = "misscarsteal4@actor",
                                        clip = "actor_berating_loop",
                                        flags = 49,
                                    },
                                }) then
                                    TSE("drc_drugs:pharmacist:giveitems", data.item, data.price, amount)
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

local PharmacistPed = nil
local Spawned = false
CreateThread(function()
    while true do
        Wait(1000)
        for _, v in pairs(Config.Pharmacist.Ped) do
            local Coords = GetEntityCoords(PlayerPedId())
            local distance = #(Coords - vec3(v.coords))
            if distance < 20 and not Spawned then
                Spawned = true
                RequestModel(GetHashKey(v.model))

                while not HasModelLoaded(GetHashKey(v.model)) do
                    Wait(100)
                end

                local Pharmacist = CreatePed(4, v.model, v.coords, false, true)
                PharmacistPed = Pharmacist
                if Config.Target == "qtarget" then
                    exports.qtarget:AddTargetEntity(Pharmacist, {
                        options = {
                            {
                                event = "drc_drugs:pharmacist:Menus",
                                icon = "fas fa-book-medical",
                                label = locale("shop"),
                                shop = "PharmacistShop"
                            },
                        },
                        distance = 2
                    })
                elseif Config.Target == "qb-target" then
                    exports['qb-target']:AddTargetEntity(Pharmacist, {
                        options = {
                            {
                                type = "client",
                                event = "drc_drugs:pharmacist:Menus",
                                icon = "fas fa-book-medical",
                                label = locale("shop"),
                                shop = "PharmacistShop"
                            },
                        },
                        distance = 2
                    })
                end
                for i = 0, 255, 51 do
                    Wait(50)
                    SetEntityAlpha(Pharmacist, i, false)
                end
                FreezeEntityPosition(Pharmacist, true)
                SetEntityInvincible(Pharmacist, true)
                SetBlockingOfNonTemporaryEvents(Pharmacist, true)
                TaskStartScenarioInPlace(Pharmacist, v.scenario, 0, true)
            elseif distance >= 20 and Spawned then
                for i = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(PharmacistPed, i, false)
                end
                DeletePed(PharmacistPed)
                Spawned = false
            end
        end
    end
end)
