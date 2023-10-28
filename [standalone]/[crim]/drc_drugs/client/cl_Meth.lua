local TSE = TriggerServerEvent
local Electricity = false
if Config.Meth.ElectricityNeeded then
    Electricity = false
else
    Electricity = true
end
local heat = false
local cooked = false

local MethLab = CircleZone:Create(Config.Meth.Lab.coords, Config.Meth.Lab.radius,
    { name = Config.Meth.Lab.name,
        debugPoly = Config.Meth.Lab.DebugPoly,
        useZ = true
    })

RegisterNetEvent("drc_drugs:meth:menus", function(data)
    if data.menu == "MethPour" then
        if not cooked then
            if heat then
                lib.registerContext({
                    id = 'DrugsMethPourMenu',
                    title = locale("Oven"),
                    options = {
                        [Config.Meth.Pouring.header] = {
                            arrow = false,
                            description = Config.Meth.Pouring.description,
                            event = 'drc_drugs:meth:progress',
                            args = { menu = data.menu }
                        }
                    }
                })
                lib.showContext('DrugsMethPourMenu')
            else
                Notify("error", locale("Meth"), locale("MethNeedHeat"))
            end
        else
            Notify("error", locale("Meth"), locale("MethNeedFinish"))
        end
    elseif data.menu == "MethBreak" then
        lib.registerContext({
            id = 'DrugsMethBreakMenu',
            title = locale("table"),
            options = {
                [Config.Meth.Break.header] = {
                    arrow = false,
                    description = Config.Meth.Break.description,
                    event = 'drc_drugs:meth:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsMethBreakMenu')
    elseif data.menu == "MethPackage" then
        lib.registerContext({
            id = 'DrugsPackageMenu',
            title = locale("table"),
            options = {
                [Config.Meth.Package.header] = {
                    arrow = false,
                    description = Config.Meth.Package.description,
                    event = 'drc_drugs:meth:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsPackageMenu')
    end
end)
-- PROGRESSY --
RegisterNetEvent("drc_drugs:meth:progress")
AddEventHandler("drc_drugs:meth:progress", function(data)
    if data.menu == "MethDoor1" then
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
            SetEntityCoords(cache.ped, Config.Meth.Enterlab.teleport, false, false, false, true)
            Wait(1100)
            DoScreenFadeIn(300)
        end
    elseif data.menu == "MethDoor2" then
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
            SetEntityCoords(cache.ped, Config.Meth.LeaveLab.teleport, false, false, false, true)
            Wait(1100)
            DoScreenFadeIn(300)
        end
    elseif data.menu == "MethGet" then
        lib.callback('drc_drugs:meth:getitem', false, function(value)
            if value then
                SetEntityCoords(cache.ped, Config.Meth.GetSacid.teleport, false, false, false, true)
                TaskTurnPedToFaceCoord(cache.ped, Config.Meth.GetSacid.coords, 1000)
                Wait(1000)
                if lib.progressBar({
                    duration = 5000,
                    label = locale("MethRefueling"),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false,
                    },
                    anim = {
                        dict = 'timetable@gardener@filling_can',
                        clip = 'gar_ig_5_filling_can'
                    },
                    prop = {
                        model = `bkr_prop_meth_sacid`,
                        pos = vec3(0.19, 0.02, 0.46),
                        rot = vec3(0.0, 190.0, 0.0),
                        bone = 18905
                    },
                }) then
                    TSE("drc_drugs:meth:giveitems", data.menu)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "Heat" then
        if not cooked and not heat then
            if Config.Meth.Memorygame then
                exports["memorygame"]:thermiteminigame(6, 3, 5, 10,
                    function()
                        SetEntityCoords(cache.ped, Config.Meth.Heat.teleport, false, false, false, true)
                        SetEntityHeading(cache.ped, Config.Meth.Heat.heading)
                        if lib.progressBar({
                            duration = 5000,
                            label = locale("MethHeating"),
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = true,
                                car = true,
                                combat = true,
                                mouse = false,
                            },
                            anim = {
                                dict = "anim@gangops@facility@servers@",
                                clip = "hotwire",
                            },
                        }) then
                            Notify("success", locale("Meth"), locale("MethHeated"))
                            heat = true
                        end
                    end,
                    function()
                        Notify("error", locale("error"), locale("fail"))
                    end)
            else
                SetEntityCoords(cache.ped, Config.Meth.Heat.teleport, false, false, false, true)
                SetEntityHeading(cache.ped, Config.Meth.Heat.heading)
                if lib.progressBar({
                    duration = 5000,
                    label = locale("MethHeating"),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                        car = true,
                        combat = true,
                        mouse = false,
                    },
                    anim = {
                        dict = "anim@gangops@facility@servers@",
                        clip = "hotwire",
                    },
                }) then
                    Notify("success", locale("Meth"), locale("MethHeated"))
                    heat = true
                end
            end
        else
            Notify("info", locale("Meth"), locale("MethAlready"))
        end
    elseif data.menu == "Complete" then
        lib.callback('drc_drugs:meth:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if cooked and heat then
                        SetEntityCoords(cache.ped, Config.Meth.Complete.teleport, false, false, false, true)
                        SetEntityHeading(cache.ped, Config.Meth.Complete.heading)
                        if lib.progressBar({
                            duration = 5000,
                            label = locale("MethFinishing"),
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                move = true,
                                car = true,
                                combat = true,
                                mouse = false,
                            },
                            anim = {
                                dict = "anim@gangops@facility@servers@",
                                clip = "hotwire",
                            },
                        }) then
                            cooked = false
                            heat = false
                            TSE("drc_drugs:meth:giveitems", data.menu)
                        end
                    else
                        Notify("info", locale("Meth"), locale("MethStartCook"))
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "MethPour" then
        lib.callback('drc_drugs:meth:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local ped = cache.ped
                    local targetRotation = vec3(180.0, 180.0, Config.Meth.Pouring.heading)
                    local x, y, z = table.unpack(Config.Meth.Pouring.teleport)
                    local dict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_meth_ammonia")
                    RequestModel("bkr_prop_meth_sacid")
                    RequestModel("bkr_prop_fakeid_clipboard_01a")
                    RequestModel("bkr_prop_fakeid_penclipboard")

                    while not HasAnimDictLoaded(dict) and
                        not HasModelLoaded("bkr_prop_meth_ammonia") and
                        not HasModelLoaded("bkr_prop_meth_sacid") and
                        not HasModelLoaded("bkr_prop_fakeid_clipboard_01a") and
                        not HasModelLoaded("bkr_prop_fakeid_penclipboard") do
                        Wait(100)
                    end
                    ammonia = CreateObject(GetHashKey('bkr_prop_meth_ammonia'), x, y, z, 1, 0, 1)
                    acid = CreateObject(GetHashKey('bkr_prop_meth_sacid'), x, y, z, 1, 0, 1)
                    clipboard = CreateObject(GetHashKey('bkr_prop_fakeid_clipboard_01a'), x, y, z, 1, 0, 1)
                    pencil = CreateObject(GetHashKey('bkr_prop_fakeid_penclipboard'), x, y, z, 1, 0, 1)
                    local netScene = NetworkCreateSynchronisedScene(x + 5.0, y + 2.0, z - 0.4, targetRotation, 2, false,
                        false, 1148846080, 0, 1.3)
                    local netScene2 = NetworkCreateSynchronisedScene(x + 5.0, y + 2.0, z - 0.4, targetRotation, 2, false
                        , false, 1148846080, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "chemical_pour_long_cooker", 1.5, -4.0, 1,
                        16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(ammonia, netScene, dict, "chemical_pour_long_ammonia", 4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(acid, netScene, dict, "chemical_pour_long_sacid", 4.0, -8.0,
                        1)
                    NetworkAddEntityToSynchronisedScene(clipboard, netScene, dict, "chemical_pour_long_clipboard",
                        4.0, -8.0, 1)
                    NetworkAddPedToSynchronisedScene(ped, netScene2, dict, "chemical_pour_long_cooker", 1.5, -4.0, 1
                        , 16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(pencil, netScene2, dict, "chemical_pour_long_pencil", 4.0,
                        -8.0, 1)

                    Wait(150)
                    NetworkStartSynchronisedScene(netScene)
                    NetworkStartSynchronisedScene(netScene2)
                    if lib.progressBar({
                        duration = GetAnimDuration(dict, "chemical_pour_long_cooker") * 770,
                        label = locale("MethCooking"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(clipboard)
                        DeleteObject(pencil)
                        DeleteObject(ammonia)
                        DeleteObject(acid)
                        cooked = true
                        Notify("info", locale("Meth"), locale("MethGoFinish"))
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "MethPackage" then
        lib.callback('drc_drugs:meth:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local ped = cache.ped
                    local targetRotation = vec3(180.0, 180.0, Config.Meth.Package.heading)
                    local x, y, z = table.unpack(Config.Meth.Package.teleport)
                    local dict = "anim@amb@business@meth@meth_smash_weight_check@"
                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_meth_scoop_01a")
                    RequestModel("bkr_prop_meth_bigbag_03a")
                    RequestModel("bkr_prop_meth_bigbag_04a")
                    RequestModel("bkr_prop_fakeid_penclipboard")
                    RequestModel("bkr_prop_fakeid_clipboard_01a")
                    RequestModel("bkr_prop_meth_openbag_02")
                    RequestModel("bkr_prop_coke_scale_01")
                    RequestModel("bkr_prop_meth_smallbag_01a")
                    RequestModel("bkr_prop_meth_openbag_01a")
                    RequestModel("bkr_prop_fakeid_penclipboard")
                    while not HasAnimDictLoaded(dict) and
                        not HasModelLoaded("bkr_prop_meth_scoop_01a") and
                        not HasModelLoaded("bkr_prop_meth_bigbag_03a") and
                        not HasModelLoaded("bkr_prop_meth_bigbag_04a") and
                        not HasModelLoaded("bkr_prop_meth_openbag_02") and
                        not HasModelLoaded("bkr_prop_coke_scale_01") and
                        not HasModelLoaded("bkr_prop_meth_smallbag_01a") and
                        not HasModelLoaded("bkr_prop_meth_openbag_01a") and
                        not HasModelLoaded("bkr_prop_fakeid_clipboard_01a") and
                        not HasModelLoaded("bkr_prop_fakeid_penclipboard") do
                        Wait(100)
                    end
                    scoop = CreateObject(GetHashKey('bkr_prop_meth_scoop_01a'), x, y, z, 1, 0, 1)
                    box02 = CreateObject(GetHashKey('bkr_prop_meth_bigbag_03a'), x, y, z, 1, 0, 1)
                    box01 = CreateObject(GetHashKey('bkr_prop_meth_bigbag_04a'), x, y, z, 1, 0, 1)
                    box03 = CreateObject(GetHashKey('bkr_prop_meth_openbag_02'), x, y, z, 1, 0, 1)
                    box03_small = CreateObject(GetHashKey('bkr_prop_meth_smallbag_01a'), x, y, z, 1, 0, 1)
                    box03_open = CreateObject(GetHashKey('bkr_prop_meth_openbag_01a'), x, y, z, 1, 0, 1)
                    scale = CreateObject(GetHashKey('bkr_prop_coke_scale_01'), x, y, z, 1, 0, 1)
                    clipboard = CreateObject(GetHashKey('bkr_prop_fakeid_clipboard_01a'), x, y, z, 1, 0, 1)
                    pencilboard = CreateObject(GetHashKey('bkr_prop_fakeid_penclipboard'), x, y, z, 1, 0, 1)
                    local netScene = NetworkCreateSynchronisedScene(x - 5.3, y - 0.4, z - 1.0, targetRotation, 2, false,
                        false, 1148846080, 0, 1.3)
                    local netScene2 = NetworkCreateSynchronisedScene(x - 5.3, y - 0.4, z - 1.0, targetRotation, 2, false
                        , false, 1148846080, 0, 1.3)
                    local netScene3 = NetworkCreateSynchronisedScene(x - 5.3, y - 0.4, z - 1.0, targetRotation, 2, false
                        , false, 1148846080, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "break_weigh_char01", 1.5, -4.0, 1, 16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(scoop, netScene, dict, "break_weigh_scoop", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(box01, netScene, dict, "break_weigh_box01", 4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(box03, netScene, dict, "break_weigh_methbag01^3", 4.0, -8.0,
                        1)
                    NetworkAddPedToSynchronisedScene(ped, netScene2, dict, "break_weigh_char01", 1.5, -4.0, 1, 16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(scale, netScene2, dict, "break_weigh_scale", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(box02, netScene2, dict, "break_weigh_box01^1", 4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(box03_small, netScene2, dict, "break_weigh_methbag01^2",
                        4.0, -8.0, 1)
                    NetworkAddPedToSynchronisedScene(ped, netScene3, dict, "break_weigh_char01", 1.5, -4.0, 1, 16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(box03_open, netScene3, dict, "break_weigh_methbag01^1", 4.0
                        , -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(clipboard, netScene3, dict, "break_weigh_clipboard", 4.0,
                        -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(pencilboard, netScene3, dict, "break_weigh_pen", 4.0, -8.0, 1)
                    NetworkStartSynchronisedScene(netScene)
                    NetworkStartSynchronisedScene(netScene2)
                    NetworkStartSynchronisedScene(netScene3)
                    if lib.progressBar({
                        duration = GetAnimDuration(dict, "break_weigh_char01") * 770,
                        label = locale("MethPacking"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(scoop)
                        DeleteObject(box02)
                        DeleteObject(box01)
                        DeleteObject(box03)
                        DeleteObject(box03_small)
                        DeleteObject(box03_open)
                        DeleteObject(scale)
                        DeleteObject(clipboard)
                        DeleteObject(pencilboard)
                        FreezeEntityPosition(ped, false)
                        TSE("drc_drugs:meth:giveitems", data.menu)
                    end
                    Wait(GetAnimDuration(dict, "break_weigh_char01") * 770)
                    NetworkStopSynchronisedScene(netScene)
                    NetworkStopSynchronisedScene(netScene2)
                    NetworkStopSynchronisedScene(netScene3)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "ElectricON" then
        TaskTurnPedToFaceCoord(cache.ped, Config.Meth.Electricity.coords, 2000)
        Wait(2000)
        if lib.progressBar({
            duration = 1000,
            label = locale("turnonel"),
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = {
                dict = "gestures@f@standing@casual",
                clip = "gesture_point",
                flags = 49,
            },
        }) then
            Electricity = true
        end
    elseif data.menu == "ElectricOFF" then
        TaskTurnPedToFaceCoord(cache.ped, Config.Meth.Electricity.coords, 2000)
        Wait(2000)
        if lib.progressBar({
            duration = 1000,
            label = locale("turnoffel"),
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = {
                dict = "gestures@f@standing@casual",
                clip = "gesture_point",
                flags = 49,
            },
        }) then
            Electricity = false
        end
    elseif data.menu == "MethBreak" then
        lib.callback('drc_drugs:meth:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local ped = cache.ped
                    local targetRotation = vec3(180.0, 180.0, Config.Meth.Break.heading)
                    local x, y, z = table.unpack(Config.Meth.Break.teleport)
                    local dict = "anim@amb@business@meth@meth_smash_weight_check@"

                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_meth_tray_02a")
                    RequestModel("w_me_hammer")
                    RequestModel("bkr_prop_meth_tray_01a")
                    RequestModel("bkr_prop_meth_smashedtray_01")
                    RequestModel("bkr_prop_meth_smashedtray_01_frag_")
                    RequestModel("bkr_prop_meth_bigbag_02a")
                    RequestModel("bkr_prop_fakeid_penclipboard")

                    while not HasAnimDictLoaded(dict) and
                        not HasModelLoaded("bkr_prop_meth_tray_02a") and
                        not HasModelLoaded("bkr_prop_fakeid_penclipboard") and
                        not HasModelLoaded("w_me_hammer") and
                        not HasModelLoaded("bkr_prop_meth_tray_01a") and
                        not HasModelLoaded("bkr_prop_meth_smashedtray_01") and
                        not HasModelLoaded("bkr_prop_meth_smashedtray_01_frag_") and
                        not HasModelLoaded("bkr_prop_meth_bigbag_02a") do
                        Wait(100)
                    end

                    tray = CreateObject(GetHashKey('bkr_prop_meth_tray_02a'), x, y, z, 1, 0, 1)
                    tray_2 = CreateObject(GetHashKey('bkr_prop_meth_tray_01a'), x, y, z, 1, 0, 1)
                    tray_smashed = CreateObject(GetHashKey('bkr_prop_meth_smashedtray_01_frag_'), x, y, z, 1, 0, 1)
                    hammer = CreateObject(GetHashKey('w_me_hammer'), x, y, z, 1, 0, 1)
                    bigbag = CreateObject(GetHashKey('bkr_prop_meth_bigbag_02a'), x, y, z, 1, 0, 1)
                    local netScene = NetworkCreateSynchronisedScene(x, y, z, targetRotation, 2, false,
                        false, 1148846080, 0, 1.3)
                    local netScene2 = NetworkCreateSynchronisedScene(x, y, z, targetRotation, 2, false
                        , false, 1148846080, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "break_weigh_char02", 1.5, -4.0, 1, 16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(tray_2, netScene, dict, "break_weigh_tray01^1", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(hammer, netScene, dict, "break_weigh_hammer", 4.0, -8.0, 1)
                    NetworkAddPedToSynchronisedScene(ped, netScene2, dict, "break_weigh_char02", 1.5, -4.0, 1, 16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(tray, netScene2, dict, "break_weigh_tray01^2", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(tray_smashed, netScene2, dict, "break_weigh_tray01", 4.0
                        , -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(bigbag, netScene2, dict, "break_weigh_box01^1", 4.0, -8.0, 1)
                    Wait(150)
                    NetworkStartSynchronisedScene(netScene)
                    NetworkStartSynchronisedScene(netScene2)

                    if lib.progressBar({
                        duration = GetAnimDuration(dict, "break_weigh_char02") * 770,
                        label = locale("MethBreaking"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(tray)
                        DeleteObject(tray_2)
                        DeleteObject(tray_quebrada)
                        DeleteObject(tray_smashed)
                        DeleteObject(hammer)
                        DeleteObject(bigbag)
                        FreezeEntityPosition(ped, false)
                        TSE("drc_drugs:meth:giveitems", data.menu)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    end
end)
-- PROGRESSY KONEC --

-- BOXZONES --

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if Config.Target == "qtarget" then
            exports.qtarget:RemoveZone('MethHeatMenu')
            exports.qtarget:RemoveZone('MethCompleteMenu')
            exports.qtarget:RemoveZone('MethElectricMenu2')
            exports.qtarget:RemoveZone('MethElectricMenu')
            exports.qtarget:RemoveZone('MethBreakMenu')
            exports.qtarget:RemoveZone('MethPackageMenu')
            exports.qtarget:RemoveZone('MethPourMenu')
            exports.qtarget:RemoveZone('MethTeleportMenu2')
            exports.qtarget:RemoveZone('MethTeleportMenu1')
            exports.qtarget:RemoveZone('MethGet')
        elseif Config.Target == "qb-target" then
            exports['qb-target']:RemoveZone('MethHeatMenu')
            exports['qb-target']:RemoveZone('MethCompleteMenu')
            exports['qb-target']:RemoveZone('MethElectricMenu2')
            exports['qb-target']:RemoveZone('MethElectricMenu')
            exports['qb-target']:RemoveZone('MethBreakMenu')
            exports['qb-target']:RemoveZone('MethPackageMenu')
            exports['qb-target']:RemoveZone('MethPourMenu')
            exports['qb-target']:RemoveZone('MethTeleportMenu2')
            exports['qb-target']:RemoveZone('MethTeleportMenu1')
            exports['qb-target']:RemoveZone('MethGet')
        end
    end
end)

if Config.Meth.Enterlab.NeedItem then
    if Config.Target == "qtarget" then
        exports.qtarget:AddCircleZone("MethTeleportMenu1", Config.Meth.Enterlab.coords, Config.Meth.Enterlab.radius,
            { name = "MethTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:meth:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "MethDoor1", item = Config.Meth.Enterlab.ItemName }
            },
                distance = 2.5
            }
        )
    elseif Config.Target == "qb-target" then
        exports['qb-target']:AddCircleZone("MethTeleportMenu1", Config.Meth.Enterlab.coords, Config.Meth.Enterlab.radius
            ,
            { name = "MethTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "MethDoor1", item = Config.Meth.Enterlab.ItemName }
            },
                distance = 2.5
            }
        )
    end
else
    if Config.Target == "qtarget" then
        exports.qtarget:AddCircleZone("MethTeleportMenu1", Config.Meth.Enterlab.coords, Config.Meth.Enterlab.radius,
            { name = "MethTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:meth:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "MethDoor1" }
            },
                distance = 2.5
            }
        )
    elseif Config.Target == "qb-target" then
        exports['qb-target']:AddCircleZone("MethTeleportMenu1", Config.Meth.Enterlab.coords, Config.Meth.Enterlab.radius
            ,
            { name = "MethTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "MethDoor1" }
            },
                distance = 2.5
            }
        )
    end
end

if Config.Target == "qtarget" then
    exports.qtarget:AddCircleZone("MethGet", Config.Meth.GetSacid.coords, Config.Meth.GetSacid.radius,
        { name = "MethGet", debugPoly = Config.Debug, useZ = true },
        { options = {
            { event = "drc_drugs:meth:progress", icon = "fas fa-fire", label = locale("MethRefuel"), menu = "MethGet" }
        },
            distance = 2.5
        }
    )
elseif Config.Target == "qb-target" then
    exports['qb-target']:AddCircleZone("MethGet", Config.Meth.GetSacid.coords, Config.Meth.GetSacid.radius,
        { name = "MethGet", debugPoly = Config.Debug, useZ = true },
        { options = {
            { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-fire", label = locale("MethRefuel"),
                menu = "MethGet" }
        },
            distance = 2.5
        }
    )
end

MethLab:onPlayerInOut(function(isInside)
    if isInside then
        if Config.Target == "qtarget" then
            exports.qtarget:AddCircleZone("MethElectricMenu", Config.Meth.Electricity.coords,
                Config.Meth.Electricity.radius,
                { name = "MethElectricMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:progress", icon = "fas fa-car-battery", label = locale("turnonelt"),
                        menu = "ElectricON" },
                    { event = "drc_drugs:meth:progress", icon = "fas fa-car-battery", label = locale("turnoffelt"),
                        menu = "ElectricOFF" }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("MethTeleportMenu2", Config.Meth.LeaveLab.coords, Config.Meth.LeaveLab.radius,
                { name = "MethTeleportMenu2", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:progress", icon = "fas fa-door-open", label = locale("leave"),
                        menu = "MethDoor2" }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("MethPourMenu", Config.Meth.Pouring.coords, Config.Meth.Pouring.radius,
                { name = "MethPourMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:menus", icon = "fas fa-fire-burner", label = locale("MethCook"),
                        menu = "MethPour",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("MethHeatMenu", Config.Meth.Heat.coords, Config.Meth.Heat.radius,
                { name = "MethHeatMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:progress", icon = "fas fa-fire", label = locale("MethHeat"), menu = "Heat",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("MethCompleteMenu", Config.Meth.Complete.coords, Config.Meth.Complete.radius,
                { name = "MethCompleteMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:progress", icon = "fas fa-box-open", label = locale("MethFinish"),
                        menu = "Complete",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("MethPackageMenu", Config.Meth.Package.coords, Config.Meth.Package.radius,
                { name = "MethPackageMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:menus", icon = "fas fa-box", label = locale("MethPack"),
                        menu = "MethPackage",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("MethBreakMenu", Config.Meth.Break.coords, Config.Meth.Break.radius,
                { name = "MethBreakMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:meth:menus", icon = "fas fa-hammer", label = locale("MethBreak"),
                        menu = "MethBreak",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )
        elseif Config.Target == "qb-target" then
            exports['qb-target']:AddCircleZone("MethElectricMenu", Config.Meth.Electricity.coords,
                Config.Meth.Electricity.radius,
                { name = "MethElectricMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-car-battery",
                        label = locale("turnonelt"),
                        menu = "ElectricON" },
                    { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-car-battery",
                        label = locale("turnoffelt"),
                        menu = "ElectricOFF" }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("MethTeleportMenu2", Config.Meth.LeaveLab.coords,
                Config.Meth.LeaveLab.radius,
                { name = "MethTeleportMenu2", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-door-open",
                        label = locale("leave"), menu = "MethDoor2" }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("MethPourMenu", Config.Meth.Pouring.coords, Config.Meth.Pouring.radius,
                { name = "MethPourMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:menus", icon = "fas fa-fire-burner",
                        label = locale("MethCook"), menu = "MethPour",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("MethHeatMenu", Config.Meth.Heat.coords, Config.Meth.Heat.radius,
                { name = "MethHeatMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-fire",
                        label = locale("MethHeat"), menu = "Heat",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("MethCompleteMenu", Config.Meth.Complete.coords,
                Config.Meth.Complete.radius,
                { name = "MethCompleteMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:progress", icon = "fas fa-box-open",
                        label = locale("MethFinish"),
                        menu = "Complete",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("MethPackageMenu", Config.Meth.Package.coords, Config.Meth.Package.radius
                ,
                { name = "MethPackageMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:menus", icon = "fas fa-box", label = locale("MethPack"),
                        menu = "MethPackage",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("MethBreakMenu", Config.Meth.Break.coords, Config.Meth.Break.radius,
                { name = "MethBreakMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:meth:menus", icon = "fas fa-hammer",
                        label = locale("MethBreak"),
                        menu = "MethBreak",
                        canInteract = function()
                            if Electricity then
                                return true
                            end
                        end
                    }
                },
                    distance = 2.5
                }
            )
        end
    else
        if Config.Target == "qtarget" then
            exports.qtarget:RemoveZone('MethElectricMenu')
            exports.qtarget:RemoveZone('MethBreakMenu')
            exports.qtarget:RemoveZone('MethPackageMenu')
            exports.qtarget:RemoveZone('MethPourMenu')
            exports.qtarget:RemoveZone('MethTeleportMenu2')
            exports.qtarget:RemoveZone('MethHeatMenu')
            exports.qtarget:RemoveZone('MethCompleteMenu')
        elseif Config.Target == "qb-target" then
            exports['qb-target']:RemoveZone('MethElectricMenu')
            exports['qb-target']:RemoveZone('MethBreakMenu')
            exports['qb-target']:RemoveZone('MethPackageMenu')
            exports['qb-target']:RemoveZone('MethPourMenu')
            exports['qb-target']:RemoveZone('MethTeleportMenu2')
            exports['qb-target']:RemoveZone('MethHeatMenu')
            exports['qb-target']:RemoveZone('MethCompleteMenu')
        end
    end
end)
--BOXZONES KONEC--
