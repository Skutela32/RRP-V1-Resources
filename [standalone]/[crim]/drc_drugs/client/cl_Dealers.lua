local TSE = TriggerServerEvent

if Config.Target == "qtarget" then
    exports.qtarget:RemoveZone('DealerLocation1')
    exports.qtarget:AddCircleZone("DealerLocation1", Config.LocateDealer.Location.Coords,
        Config.LocateDealer.Location.radius,
        { name = "DealerLocation1", debugPoly = Config.Debug, useZ = true },
        { options = {
            { event = "drc_drugs:dealers:progress", icon = "fas fa-desktop", label = locale("LocateDealer"),
                shop = "LocateDealer1",
            }
        },
            distance = 2.5
        }
    )

    exports.qtarget:RemoveZone('GeraldLocation')
    exports.qtarget:AddCircleZone("GeraldLocation", Config.Gerald.Location.Coords, Config.Madrazo.Location.radius,
        { name = "GeraldLocation", debugPoly = Config.Debug, useZ = true },
        { options = {
            { event = "drc_drugs:dealers:menus", icon = "fas fa-cannabis", label = locale("Gerald"),
                shop = "GeraldShop",
            }
        },
            distance = 2.5
        }
    )

    exports.qtarget:RemoveZone('MadrazoLocation')
    exports.qtarget:AddCircleZone("MadrazoLocation", Config.Madrazo.Location.Coords, Config.Madrazo.Location.radius,
        { name = "MadrazoLocation", debugPoly = Config.Debug, useZ = true },
        { options = {
            { event = "drc_drugs:dealers:menus", icon = "fas fa-capsules", label = locale("Madrazo"),
                shop = "MadrazoTrade",
            }
        },
            distance = 2.5
        }
    )

elseif Config.Target == "qb-target" then
    exports['qb-target']:RemoveZone('DealerLocation1')
    exports['qb-target']:AddCircleZone("DealerLocation1", Config.LocateDealer.Location.Coords,
        Config.LocateDealer.Location.radius,
        { name = "DealerLocation1", debugPoly = Config.Debug, useZ = true },
        { options = {
            { type = "client", event = "drc_drugs:dealers:progress", icon = "fas fa-desktop",
                label = locale("LocateDealer"),
                shop = "LocateDealer1",
            }
        },
            distance = 2.5
        }
    )

    exports['qb-target']:RemoveZone('GeraldLocation')
    exports['qb-target']:AddCircleZone("GeraldLocation", Config.Gerald.Location.Coords, Config.Madrazo.Location.radius,
        { name = "GeraldLocation", debugPoly = Config.Debug, useZ = true },
        { options = {
            { type = "client", event = "drc_drugs:dealers:menus", icon = "fas fa-cannabis",
                label = locale("Gerald"),
                shop = "GeraldShop",
            }
        },
            distance = 2.5
        }
    )

    exports['qb-target']:RemoveZone('MadrazoLocation')
    exports['qb-target']:AddCircleZone("MadrazoLocation", Config.Madrazo.Location.Coords, Config.Madrazo.Location.radius
        ,
        { name = "MadrazoLocation", debugPoly = Config.Debug, useZ = true },
        { options = {
            { type = "client", event = "drc_drugs:dealers:menus", icon = "fas fa-capsules",
                label = locale("Madrazo"),
                shop = "MadrazoTrade",
            }
        },
            distance = 2.5
        }
    )

end

RegisterNetEvent("drc_drugs:dealers:menus")
AddEventHandler("drc_drugs:dealers:menus", function(data)
    if data.shop == "GeraldShop" then
        if not lib.progressActive() then
            SetEntityHeading(cache.ped, Config.Gerald.Location.Heading)
            Wait(1500)
            if lib.progressBar({
                duration = 2000,
                label = locale("Listening"),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'mini@safe_cracking',
                    clip = 'idle_base'
                },
            }) then
                if Config.Gerald.Available.enabled then
                    local h = GetClockHours()
                    if h > Config.Gerald.Available.from and h < Config.Gerald.Available.to then
                        lib.registerContext({
                            id = 'GeraldShopMenu',
                            title = Config.Gerald.Header,
                            options = {
                                [Config.Gerald.Title] = {
                                    arrow = false,
                                    description = Config.Gerald.Description,
                                    event = 'drc_drugs:dealers:progress',
                                    args = { shop = data.shop }
                                }
                            }
                        })
                        lib.showContext('GeraldShopMenu')
                    else
                        Notify("info", locale("Gerald"), locale("GeraldNotHome"))
                    end
                else
                    lib.registerContext({
                        id = 'GeraldShopMenu',
                        title = Config.Gerald.Header,
                        options = {
                            [Config.Gerald.Title] = {
                                arrow = false,
                                description = Config.Gerald.Description,
                                event = 'drc_drugs:dealers:progress',
                                args = { shop = data.shop }
                            }
                        }
                    })
                    lib.showContext('GeraldShopMenu')
                end
            end
        end
    elseif data.shop == "MadrazoTrade" then
        if not lib.progressActive() then
            SetEntityHeading(cache.ped, Config.Madrazo.Location.Heading)
            Wait(1500)
            if not lib.progressActive() then
                if lib.progressBar({
                    duration = 2000,
                    label = locale("Listening"),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                    },
                    anim = {
                        dict = 'mini@safe_cracking',
                        clip = 'idle_base'
                    },
                }) then
                    if Config.Madrazo.Available.enabled then
                        local h = GetClockHours()
                        if h > 0 and h < 23 then
                            lib.registerContext({
                                id = 'MadrazoShopMenu',
                                title = Config.Madrazo.Header,
                                options = {
                                    [Config.Madrazo.Title] = {
                                        arrow = false,
                                        description = Config.Madrazo.Description,
                                        event = 'drc_drugs:dealers:progress',
                                        args = { shop = data.shop }
                                    }
                                }
                            })
                            lib.showContext('MadrazoShopMenu')
                        else
                            Notify("info", locale("Madrazo"), locale("MadrazoNotHome"))
                        end
                    else
                        lib.registerContext({
                            id = 'MadrazoShopMenu',
                            title = Config.Madrazo.Header,
                            options = {
                                [Config.Madrazo.Title] = {
                                    arrow = false,
                                    description = Config.Madrazo.Description,
                                    event = 'drc_drugs:dealers:progress',
                                    args = { shop = data.shop }
                                }
                            }
                        })
                        lib.showContext('MadrazoShopMenu')
                    end
                end
            end
        end
    elseif data.shop == "DealerShop" then
        options = {}
        for _, v in pairs(Config.Dealer.Items) do
            options[v.label] = {}
            options[v.label].description = v.description .. v.price
            options[v.label].event = 'drc_drugs:dealers:progress'
            options[v.label].args = { shop = data.shop, item = v.item, price = v.price, min = v.MinAmount,
                max = v.MaxAmount }
        end
        lib.registerContext({
            id = 'DealerShop',
            title = Config.Dealer.Header,
            options = options
        })
        lib.showContext('DealerShop')
    end
end)

RegisterNetEvent("drc_drugs:dealers:progress")
AddEventHandler("drc_drugs:dealers:progress", function(data)
    if data.shop == "DealerShop" then
        local input = lib.inputDialog(locale("Pricefor") .. data.price,
            { locale("Amount") .. locale("Range") .. data.min .. ' - ' .. data.max })

        if input then
            local amount = tonumber(input[1])
            if amount then
                if amount >= data.min and amount <= data.max then
                    lib.callback('drc_drugs:dealersshop:getitem', false, function(value)
                        if value then
                            if not lib.progressActive() then
                                for _, v in pairs(Config.Dealer.Ped) do
                                    TaskTurnPedToFaceCoord(cache.ped, v.coords, 4000)
                                end
                                if lib.progressBar({
                                    duration = 9000,
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
                                    TSE("drc_drugs:dealersshop:giveitems", data.item, data.price, amount)
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
    elseif data.shop == "GeraldShop" then
        lib.callback('drc_drugs:dealers:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    GetSkin()
                    local x, y, z = table.unpack(GetEntityCoords(cache.ped, false))
                    RequestCutscene('mp_intro_mcs_10_a2', 8)
                    while not (HasCutsceneLoaded()) do
                        Wait(0)
                    end
                    local model = GetHashKey("s_m_y_marine_01")
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Wait(0)
                    end
                    local ped = CreatePed(7, model, x, y, z - 40, 0.0, true, true)

                    local ped2 = CreatePed(7, model, x, y, z - 40, 0.0, true, true)

                    local ped3 = CreatePed(7, model, x, y, z - 40, 0.0, true, true)
                    SetEntityVisible(ped2, false, false)
                    SetEntityVisible(ped, false, false)
                    SetEntityVisible(ped3, false, false)
                    SetEntityCollision(ped2, false, false)
                    SetEntityCollision(ped, false, false)
                    SetEntityCollision(ped3, false, false)
                    SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
                    RegisterEntityForCutscene(cache.ped, 'MP_1', 0, 0, 64)
                    SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
                    RegisterEntityForCutscene(ped, 'MP_2', 0, 0, 64)
                    SetCutsceneEntityStreamingFlags('MP_3', 0, 1)
                    RegisterEntityForCutscene(ped2, 'MP_3', 0, 0, 64)
                    SetCutsceneEntityStreamingFlags('MP_4', 0, 1)
                    RegisterEntityForCutscene(ped3, 'MP_4', 0, 0, 64)
                    StartCutscene(0)
                    while not (DoesCutsceneEntityExist('MP_2', 0)) do
                        Wait(0)
                    end
                    while not (DoesCutsceneEntityExist('MP_1', 0)) do
                        Wait(0)
                    end
                    while not (DoesCutsceneEntityExist('MP_3', 0)) do
                        Wait(0)
                    end
                    while not (DoesCutsceneEntityExist('MP_4', 0)) do
                        Wait(0)
                    end
                    ApplySkin()
                    while not (HasCutsceneFinished()) do
                        SetEntityCollision(cache.ped, true, true)
                        Wait(0)
                    end
                    DeleteEntity(ped)
                    DeleteEntity(ped2)
                    DeleteEntity(ped3)
                    ApplySkin()
                    SetEntityCollision(cache.ped, true, true)
                    TSE("drc_drugs:dealers:giveitems", data.shop)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.shop)
    elseif data.shop == "MadrazoTrade" then
        lib.callback('drc_drugs:dealers:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    GetSkin()
                    local x, y, z = table.unpack(GetEntityCoords(cache.ped, false))
                    RequestCutscene('mp_int_mcs_15_a3', 8)
                    while not (HasCutsceneLoaded()) do
                        Wait(0)
                    end
                    local model = GetHashKey("s_m_y_marine_01")
                    RequestModel(model)

                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Wait(0)
                    end

                    local ped = CreatePed(7, model, x, y, z - 40, 0.0, true, true)

                    local ped2 = CreatePed(7, model, x, y, z - 40, 0.0, true, true)

                    local ped3 = CreatePed(7, model, x, y, z - 40, 0.0, true, true)

                    SetEntityVisible(ped2, false, false)
                    SetEntityVisible(ped, false, false)
                    SetEntityVisible(ped3, false, false)
                    SetEntityCollision(ped2, false, false)
                    SetEntityCollision(ped, false, false)
                    SetEntityCollision(ped3, false, false)
                    SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
                    RegisterEntityForCutscene(cache.ped, 'MP_1', 0, 0, 64)
                    SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
                    RegisterEntityForCutscene(ped, 'MP_2', 0, 0, 64)
                    SetCutsceneEntityStreamingFlags('MP_3', 0, 1)
                    RegisterEntityForCutscene(ped2, 'MP_3', 0, 0, 64)
                    SetCutsceneEntityStreamingFlags('MP_4', 0, 1)

                    RegisterEntityForCutscene(ped3, 'MP_4', 0, 0, 64)
                    StartCutscene(0)

                    while not (DoesCutsceneEntityExist('MP_2', 0)) do
                        Wait(0)
                    end
                    while not (DoesCutsceneEntityExist('MP_1', 0)) do
                        Wait(0)
                    end
                    while not (DoesCutsceneEntityExist('MP_3', 0)) do
                        Wait(0)
                    end
                    while not (DoesCutsceneEntityExist('MP_4', 0)) do
                        Wait(0)
                    end
                    ApplySkin()
                    while not (HasCutsceneFinished()) do
                        Wait(0)
                    end
                    TSE("drc_drugs:dealers:giveitems", data.shop)
                    DeleteEntity(ped)
                    DeleteEntity(ped2)
                    DeleteEntity(ped3)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.shop)
    elseif data.shop == "LocateDealer1" then
        lib.callback('drc_drugs:dealers:getitem', fasle, function(value)
            if value then
                if not lib.progressActive() then
                    TaskTurnPedToFaceCoord(cache.ped, Config.LocateDealer.Location.Coords, 4000)
                    if lib.progressBar({
                        duration = 15000,
                        label = locale("LocatingDealer"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                        anim = {
                            dict = 'anim@heists@prison_heiststation@cop_reactions',
                            clip = 'cop_b_idle'
                        },
                    }) then
                        Notify("success", locale("success"), locale("LocationInGPS"))
                        DealerPos = Config.LocateDealer.DealerPos[math.random(1, #Config.LocateDealer.DealerPos)]
                        SetNewWaypoint(DealerPos)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.shop)
    end
end)

local DealerPed = nil
local SpawnedDealer = false
CreateThread(function()
    while true do
        Wait(1000)
        for _, v in pairs(Config.Dealer.Ped) do
            local Coords = GetEntityCoords(PlayerPedId())
            local distance = #(Coords - vec3(v.coords))
            if distance < 20 and not SpawnedDealer then
                SpawnedDealer = true
                RequestModel(GetHashKey(v.model))

                while not HasModelLoaded(GetHashKey(v.model)) do
                    Wait(100)
                end

                local Dealer = CreatePed(4, v.model, v.coords, false, true)
                DealerPed = Dealer
                if Config.Target == "qtarget" then
                    exports.qtarget:AddTargetEntity(Dealer, {
                        options = {
                            {
                                event = "drc_drugs:dealers:menus",
                                icon = "fas fa-store",
                                label = locale("shop"),
                                shop = "DealerShop"
                            },
                        },
                        distance = 2
                    })
                elseif Config.Target == "qb-target" then
                    exports['qb-target']:AddTargetEntity(Dealer, {
                        options = {
                            {
                                type = "client",
                                event = "drc_drugs:dealers:menus",
                                icon = "fas fa-store",
                                label = locale("shop"),
                                shop = "DealerShop"
                            },
                        },
                        distance = 2
                    })
                end
                for i = 0, 255, 51 do
                    Wait(50)
                    SetEntityAlpha(Dealer, i, false)
                end
                FreezeEntityPosition(Dealer, true)
                SetEntityInvincible(Dealer, true)
                SetBlockingOfNonTemporaryEvents(Dealer, true)
                TaskStartScenarioInPlace(Dealer, v.scenario, 0, true)
            elseif distance >= 20 and SpawnedDealer then
                for i = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(DealerPed, i, false)
                end
                DeletePed(DealerPed)
                SpawnedDealer = false
            end
        end
    end
end)
