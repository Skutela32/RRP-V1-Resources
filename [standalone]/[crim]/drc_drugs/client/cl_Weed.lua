local TSE = TriggerServerEvent

if Config.Weed.ElectricityNeeded then
    Electricity = false
else
    Electricity = true
end

local WeedLab = CircleZone:Create(Config.Weed.Lab.coords, Config.Weed.Lab.radius,
    { name = Config.Weed.Lab.name,
        debugPoly = Config.Weed.Lab.DebugPoly,
        useZ = true
    })


RegisterNetEvent("drc_drugs:weed:menus", function(data)
    if data.menu == "WeedClean" then
        lib.registerContext({
            id = 'DrugsWeedCleanMenu',
            title = locale("table"),
            options = {
                [Config.Weed.Clean.header] = {
                    arrow = false,
                    description = Config.Weed.Clean.description,
                    event = 'drc_drugs:weed:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsWeedCleanMenu')
    elseif data.menu == "WeedPack" then
        lib.registerContext({
            id = 'DrugsWeedPackMenu',
            title = locale("table"),
            options = {
                [Config.Weed.Package.header] = {
                    arrow = false,
                    description = Config.Weed.Package.description,
                    event = 'drc_drugs:weed:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsWeedPackMenu')
    end
end)

-- PROGRESSY --
RegisterNetEvent("drc_drugs:weed:progress")
AddEventHandler("drc_drugs:weed:progress", function(data)
    if data.menu == "WeedDoor1" then
        DoScreenFadeOut(1000)
        if lib.progressBar({
            duration = 5000,
            label = locale("entering"),
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
        }) then
            SetEntityCoords(cache.ped, Config.Weed.Enterlab.teleport, false, false, false, true)
            Wait(1100)
            DoScreenFadeIn(300)
        end
    elseif data.menu == "WeedDoor2" then
        DoScreenFadeOut(1000)
        if lib.progressBar({
            duration = 5000,
            label = locale("leaving"),
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false,
            },
        }) then
            SetEntityCoords(cache.ped, Config.Weed.LeaveLab.teleport, false, false, false, true)
            Wait(1100)
            DoScreenFadeIn(300)
        end
    elseif data.menu == "WeedClean" then
        lib.callback('drc_drugs:weed:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local ped = cache.ped
                    local dict = "anim@amb@business@weed@weed_sorting_seated@"

                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_weed_bag_01a")
                    RequestModel("bkr_prop_weed_bag_pile_01a")
                    RequestModel("bkr_prop_weed_bud_02b")
                    RequestModel("bkr_prop_weed_leaf_01a")
                    RequestModel("bkr_prop_weed_dry_01a")
                    RequestModel("bkr_prop_weed_bucket_open_01a")

                    while not HasAnimDictLoaded(dict) and
                        not HasModelLoaded("bkr_prop_weed_bag_01a") and
                        not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and
                        not HasModelLoaded("bkr_prop_weed_bud_02b") and
                        not HasModelLoaded("bkr_prop_weed_leaf_01a") and
                        not HasModelLoaded("bkr_prop_weed_dry_01a") and
                        not HasModeLoaded("bkr_prop_weed_bucket_open_01a") do
                        Wait(100)
                    end

                    weed_bag_01 = CreateObject(GetHashKey('bkr_prop_weed_bag_01a'), x, y, z, 1, 0, 1)
                    weed_bag_pile_01 = CreateObject(GetHashKey('bkr_prop_weed_bag_pile_01a'), x, y, z, 1, 0, 1)
                    bud = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), x, y, z, 1, 0, 1)
                    leaf = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), x, y, z, 1, 0, 1)
                    weeedry = CreateObject(GetHashKey('bkr_prop_weed_dry_01a'), x, y, z, 1, 0, 1)
                    bucket = CreateObject(GetHashKey('bkr_prop_weed_bucket_open_01a'), x, y, z, 1, 0, 1)

                    local targetRotation = vec3(180.0, 180.0, Config.Weed.Clean.heading)
                    local x, y, z = table.unpack(Config.Weed.Clean.teleport)
                    local netScene = NetworkCreateSynchronisedScene(x, y, z, targetRotation.x,
                        targetRotation.y, targetRotation.z, 2, false, false,
                        1148846080, 0, 0.9)
                    local netScene2 = NetworkCreateSynchronisedScene(x, y, z, targetRotation.x,
                        targetRotation.y, targetRotation.z, 2, false, false,
                        1148846080, 0, 0.9)
                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "sorter_left_sort_v1_sorter01", 1.5, -4.0, 1,
                        16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(weed_bag_01, netScene, dict, "sorter_left_sort_v1_weedbag01a",
                        4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(weed_bag_pile_01, netScene, dict,
                        "sorter_left_sort_v1_weedbagpile01a",
                        4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(bud, netScene, dict, "sorter_left_sort_v1_weedbud02b^3", 4.0,
                        -8.0, 1)

                    NetworkAddPedToSynchronisedScene(ped, netScene2, dict, "sorter_left_sort_v1_sorter01", 1.5, -4.0, 1,
                        16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(weeedry, netScene2, dict, "sorter_left_sort_v1_weeddry01a", 4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(leaf, netScene2, dict, "sorter_left_sort_v1_weedleaf01a^1", 4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(bucket, netScene2, dict, "sorter_left_sort_v1_bucket01a", 4.0,
                        -8.0, 1)
                    Wait(150)
                    NetworkStartSynchronisedScene(netScene)
                    Wait(150)
                    NetworkStartSynchronisedScene(netScene2)
                    if lib.progressBar({
                        duration = GetAnimDuration(dict, "sorter_left_sort_v1_sorter01") * 970,
                        label = locale("WeedCleaning"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(weed_bag_01)
                        DeleteObject(weed_bag_pile_01)
                        DeleteObject(bud)
                        DeleteObject(leaf)
                        DeleteObject(weeedry)
                        DeleteObject(bucket)
                        FreezeEntityPosition(ped, false)
                        TSE("drc_drugs:weed:giveitems", data.menu)
                        SetEntityCoords(cache.ped, Config.Weed.Clean.leave, false, false, false, true)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "ElectricON" then
        TaskTurnPedToFaceCoord(cache.ped, Config.Weed.AC.coords, 4000)
        if lib.progressBar({
            duration = 10000,
            label = locale("turnonac"),
            useWhileDead = false,
            canCancel = true,
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
            Electricity = true
            local objects = GetGamePool("CObject")
            for i = 1, #objects do
                if Config.Weed.Pickup.Models[GetEntityModel(objects[i])] then
                    if Config.Target == "qtarget" then
                        exports.qtarget:AddTargetEntity(objects[i], {
                            options = {
                                {
                                    action = function(entity)
                                        PickWeed(entity, "WeedPick")
                                    end,
                                    icon = "fas fa-cannabis",
                                    label = locale("pickup"),
                                    canInteract = function()
                                        if Electricity then
                                            return true
                                        end
                                    end
                                },
                            },
                            distance = 2
                        })
                    elseif Config.Target == "qb-target" then
                        exports['qb-target']:AddTargetEntity(objects[i], {
                            options = {
                                {
                                    menu = "client",
                                    action = function(entity)
                                        PickWeed(entity, "WeedPick")
                                    end,
                                    icon = "fas fa-cannabis",
                                    label = locale("pickup"),
                                    canInteract = function()
                                        if Electricity then
                                            return true
                                        end
                                    end
                                },
                            },
                            distance = 2
                        })
                    end
                end
            end
        end
    elseif data.menu == "ElectricOFF" then
        TaskTurnPedToFaceCoord(cache.ped, Config.Weed.AC.coords, 4000)
        if lib.progressBar({
            duration = 10000,
            label = locale("turnoffac"),
            useWhileDead = false,
            canCancel = true,
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
            Electricity = false
        end
    elseif data.menu == "WeedPack" then
        lib.callback('drc_drugs:weed:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if lib.progressBar({
                        duration = 4100,
                        label = locale("WeedPacking"),
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                        anim = {
                            dict = 'mp_arresting',
                            clip = 'a_uncuff'
                        },
                        prop = {
                            {
                                model = `bkr_prop_weed_bud_pruned_01a`,
                                pos = vec3(0.15, 0.06, -0.02),
                                rot = vec3(264.0, 30.0, 120.0),
                                bone = 57005
                            },

                            {
                                model = `bkr_prop_weed_bag_01a`,
                                pos = vec3(0.05, 0.01, 0.02),
                                rot = vec3(0.0, 0.0, 20.0),
                                bone = 18905
                            }
                        },
                    }) then
                        TSE("drc_drugs:weed:giveitems", data.menu)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    end
end)

function PickWeed(entity, menu)
    if DoesEntityExist(entity) then
        if Electricity then
            if not lib.progressActive() then
                lib.callback('drc_drugs:weed:getitem', false, function(value)
                    if value == 1 then
                        Notify("error", locale("error"), locale("WeedColectedAlready"))
                    else
                        TaskTurnPedToFaceEntity(cache.ped, entity, 4000)
                        if value then
                            if lib.progressBar({
                                duration = 10000,
                                label = locale("WeedColecting"),
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    move = true,
                                    car = true,
                                    combat = true,
                                    mouse = false,
                                },
                                anim = {
                                    dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
                                    clip = 'weed_crouch_checkingleaves_idle_01_inspector'
                                },
                                prop = {
                                    model = "prop_cs_scissors",
                                    pos = vec3(0.1, -0.02, -0.03),
                                    rot = vec3(-190.0, 40.0, 90.0),
                                    bone = 57005
                                },
                            }) then
                                TSE("drc_drugs:weed:giveitems", menu, entity)
                            end
                        else
                            Notify("error", locale("error"), locale("RequiredItems"))
                        end
                    end
                end, menu, entity)
            end
        end
    else
        Notify("error", locale("error"), locale("needac"))
    end
end

-- PROGRESSY KONEC --

-- BOXZONES --

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if Config.Target == "qtarget" then
            exports.qtarget:RemoveZone('WeedElectricMenu2')
            exports.qtarget:RemoveZone('WeedElectricMenu')
            exports.qtarget:RemoveZone('WeedSodaMenu')
            exports.qtarget:RemoveZone('WeedFigureMenu')
            exports.qtarget:RemoveZone('WeedCleanMenu')
            exports.qtarget:RemoveZone('WeedTeleportMenu2')
            exports.qtarget:RemoveZone('WeedTeleportMenu1')
            exports.qtarget:RemoveZone('WeedPackMenu')
            exports.qtarget:RemoveZone('MethGet')
        elseif Config.Target == "qb-target" then
            exports['qb-target']:RemoveZone('WeedElectricMenu2')
            exports['qb-target']:RemoveZone('WeedElectricMenu')
            exports['qb-target']:RemoveZone('WeedSodaMenu')
            exports['qb-target']:RemoveZone('WeedFigureMenu')
            exports['qb-target']:RemoveZone('WeedCleanMenu')
            exports['qb-target']:RemoveZone('WeedTeleportMenu2')
            exports['qb-target']:RemoveZone('WeedTeleportMenu1')
            exports['qb-target']:RemoveZone('WeedPackMenu')
        end
    end
end)


if Config.Weed.Enterlab.NeedItem then
    if Config.Target == "qtarget" then
        exports.qtarget:AddCircleZone("WeedTeleportMenu1", Config.Weed.Enterlab.coords, Config.Weed.Enterlab.radius,
            { name = "WeedTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:weed:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "WeedDoor1",
                    item = Config.Weed.Enterlab.ItemName
                }
            },
                distance = 2.5
            }
        )
    elseif Config.Target == "qb-target" then
        exports['qb-target']:AddCircleZone("WeedTeleportMenu1", Config.Weed.Enterlab.coords, Config.Weed.Enterlab.radius
            ,
            { name = "WeedTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:weed:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "WeedDoor1",
                    item = Config.Weed.Enterlab.ItemName
                }
            },
                distance = 2.5
            }
        )
    end
else
    if Config.Target == "qtarget" then
        exports.qtarget:AddCircleZone("WeedTeleportMenu1", Config.Weed.Enterlab.coords, Config.Weed.Enterlab.radius,
            { name = "WeedTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:weed:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "WeedDoor1"
                }
            },
                distance = 2.5
            }
        )
    elseif Config.Target == "qb-target" then
        exports['qb-target']:AddCircleZone("WeedTeleportMenu1", Config.Weed.Enterlab.coords, Config.Weed.Enterlab.radius
            ,
            { name = "WeedTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:weed:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "WeedDoor1"
                }
            },
                distance = 2.5
            }
        )
    end
end

WeedLab:onPlayerInOut(function(isInside)
    if isInside then
        --[[while not IsInteriorReady(GetInteriorAtCoords(Config.Weed.Enterlab.teleport)) do
            Wait(0)
        end]]
        local objects = GetGamePool("CObject")
        for i = 1, #objects do
            if Config.Weed.Pickup.Models[GetEntityModel(objects[i])] then
                if Config.Target == "qtarget" then
                    exports.qtarget:AddTargetEntity(objects[i], {
                        options = {
                            {
                                action = function(entity)
                                    PickWeed(entity, "WeedPick")
                                end,
                                icon = "fas fa-cannabis",
                                label = locale("pickup"),
                                canInteract = function()
                                    if Electricity then
                                        return true
                                    end
                                end
                            },
                        },
                        distance = 2
                    })
                elseif Config.Target == "qb-target" then
                    exports['qb-target']:AddTargetEntity(objects[i], {
                        options = {
                            {
                                menu = "client",
                                action = function(entity)
                                    PickWeed(entity, "WeedPick")
                                end,
                                icon = "fas fa-cannabis",
                                label = locale("pickup"),
                                canInteract = function()
                                    if Electricity then
                                        return true
                                    end
                                end
                            },
                        },
                        distance = 2
                    })
                end
            end
        end
        if Config.Target == "qtarget" then
            exports.qtarget:AddCircleZone("WeedElectricMenu", Config.Weed.AC.coords, Config.Weed.AC.radius,
                { name = "WeedElectricMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:weed:progress", icon = "fas fa-wind", label = locale("turnonact"),
                        menu = "ElectricON", },
                    { event = "drc_drugs:weed:progress", icon = "fas fa-wind", label = locale("turnoffact"),
                        menu = "ElectricOFF", }
                },
                    distance = 2.5
                })
            exports.qtarget:AddCircleZone("WeedTeleportMenu2", Config.Weed.LeaveLab.coords, Config.Weed.LeaveLab.radius,
                { name = "WeedTeleportMenu2", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:weed:progress", icon = "fas fa-door-open", label = locale("leave"),
                        menu = "WeedDoor2",
                    }
                },
                    distance = 2.5
                })

            exports.qtarget:AddCircleZone("WeedCleanMenu", Config.Weed.Clean.coords, Config.Weed.Clean.radius,
                { name = "WeedCleanMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:weed:menus", icon = "fas fa-cannabis", label = locale("WeedClean"),
                        menu = "WeedClean",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                })
            exports.qtarget:AddCircleZone("WeedPackMenu", Config.Weed.Package.coords, Config.Weed.Package.radius,
                { name = "WeedPackMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:weed:menus", icon = "fas fa-box-open", label = locale("WeedPack"),
                        menu = "WeedPack",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                })
        elseif Config.Target == "qb-target" then
            exports['qb-target']:AddCircleZone("WeedElectricMenu", Config.Weed.AC.coords, Config.Weed.AC.radius,
                { name = "WeedElectricMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:weed:progress", icon = "fas fa-wind",
                        label = locale("turnonact"),
                        menu = "ElectricON", },
                    { type = "client", event = "drc_drugs:weed:progress", icon = "fas fa-wind",
                        label = locale("turnoffact"),
                        menu = "ElectricOFF", }
                },
                    distance = 2.5
                })
            exports['qb-target']:AddCircleZone("WeedTeleportMenu2", Config.Weed.LeaveLab.coords,
                Config.Weed.LeaveLab.radius,
                { name = "WeedTeleportMenu2", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:weed:progress", icon = "fas fa-door-open",
                        label = locale("leave"), menu = "WeedDoor2",
                    }
                },
                    distance = 2.5
                })

            exports['qb-target']:AddCircleZone("WeedCleanMenu", Config.Weed.Clean.coords, Config.Weed.Clean.radius,
                { name = "WeedCleanMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:weed:menus", icon = "fas fa-cannabis",
                        label = locale("WeedClean"),
                        menu = "WeedClean",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                })
            exports['qb-target']:AddCircleZone("WeedPackMenu", Config.Weed.Package.coords, Config.Weed.Package.radius,
                { name = "WeedPackMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:weed:menus", icon = "fas fa-box-open",
                        label = locale("WeedPack"),
                        menu = "WeedPack",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                })
        end
    else
        if Config.Target == "qtarget" then
            exports.qtarget:RemoveZone('WeedPackMenu')
            exports.qtarget:RemoveZone('WeedElectricMenu')
            exports.qtarget:RemoveZone('WeedSodaMenu')
            exports.qtarget:RemoveZone('WeedFigureMenu')
            exports.qtarget:RemoveZone('WeedCleanMenu')
            exports.qtarget:RemoveZone('WeedTeleportMenu2')
        elseif Config.Target == "qb-target" then
            exports['qb-target']:RemoveZone('WeedPackMenu')
            exports['qb-target']:RemoveZone('WeedElectricMenu')
            exports['qb-target']:RemoveZone('WeedSodaMenu')
            exports['qb-target']:RemoveZone('WeedFigureMenu')
            exports['qb-target']:RemoveZone('WeedCleanMenu')
            exports['qb-target']:RemoveZone('WeedTeleportMenu2')
        end
    end
end)
--BOXZONES KONEC--
