lib.locale()
local TSE = TriggerServerEvent
local Electricity = false
local headingtotable = nil
local SpawnedCokePlant = 0
local CokePlants = {}
local inside = false

if Config.Coke.ElectricityNeeded then
    Electricity = false
else
    Electricity = true
end

local FigureCarry = false

local CokeLab = CircleZone:Create(Config.Coke.Lab.coords, Config.Coke.Lab.radius,
    { name = Config.Coke.Lab.name,
        debugPoly = Config.Coke.Lab.DebugPoly,
        useZ = true
    })

local CokeField = CircleZone:Create(Config.Coke.Field.coords, Config.Coke.Field.radius,
    { name = Config.Coke.Field.name,
        debugPoly = Config.Coke.Field.DebugPoly,
        useZ = true
    })

RegisterNetEvent("drc_drugs:coke:menus", function(data)
    if data == "FullFigure" then
        lib.registerContext({
            id = 'DrugsFigureMenu',
            title = locale("CokeFigure"),
            options = {
                [locale("CokeCarryFigure")] = {
                    arrow = false,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data, option = "carry" }
                },
                [locale("CokeBreakigure")] = {
                    arrow = false,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data, option = "break" }
                }
            }
        })
        lib.showContext('DrugsFigureMenu')
    elseif data == "EmptyFigure" then
        lib.registerContext({
            id = 'DrugsEmptyFigureMenu',
            title = locale("CokeFigure"),
            options = {
                [locale("CokeCarryFigure")] = {
                    arrow = false,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data, option = "carry" }
                },
                [locale("CokeBreakigure")] = {
                    arrow = false,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data, option = "break" }
                }
            }
        })
        lib.showContext('DrugsEmptyFigureMenu')
    elseif data == "BrokenFigure" then
        lib.registerContext({
            id = 'DrugsBrokenFigureMenu',
            title = locale("CokeFigure"),
            options = {
                [locale("CokeRepairFigure")] = {
                    description = locale("CokeRepairFigureDesc"),
                    arrow = false,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data }
                }
            }
        })
        lib.showContext('DrugsBrokenFigureMenu')
    end
    if data.menu == "CokeBox" then
        lib.registerContext({
            id = 'DrugsCokeBoxMenu',
            title = locale("table"),
            options = {
                [Config.Coke.CokeBox.header] = {
                    arrow = false,
                    description = Config.Coke.CokeBox.description,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsCokeBoxMenu')
    elseif data.menu == "CokeProcess" then
        lib.registerContext({
            id = 'DrugsProcessMenu',
            title = locale("table"),
            options = {
                [Config.Coke.LeafProcess.header] = {
                    arrow = false,
                    description = Config.Coke.LeafProcess.description,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsProcessMenu')
    elseif data.menu == "CokeSoda" then
        headingtotable = data.headingtotable
        lib.registerContext({
            id = 'DrugsSodaMenu',
            title = locale("table"),
            options = {
                [Config.Coke.Soda.header] = {
                    arrow = false,
                    description = Config.Coke.Soda.description,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsSodaMenu')
    elseif data.menu == "CokeFigure" then
        lib.registerContext({
            id = 'DrugsFigureMenu',
            title = locale("table"),
            options = {
                [Config.Coke.FigurePackage.header] = {
                    arrow = false,
                    description = Config.Coke.FigurePackage.description,
                    event = 'drc_drugs:coke:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsFigureMenu')
    end
end)

-- PROGRESSY --
RegisterNetEvent("drc_drugs:coke:progress")
AddEventHandler("drc_drugs:coke:progress", function(data)
    if data.menu == "CokeDoor1" then
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
            SetEntityCoords(cache.ped, Config.Coke.Enterlab.teleport, false, false, false, true)
            Wait(1100)
            DoScreenFadeIn(300)
        end
    elseif data.menu == "CokeDoor2" then
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
            SetEntityCoords(cache.ped, Config.Coke.LeaveLab.teleport, false, false, false, true)
            Wait(1100)
            DoScreenFadeIn(300)
        end
    elseif data.menu == "CokeBox" then
        lib.callback('drc_drugs:coke:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local ped = cache.ped
                    local dict = "anim@amb@business@coc@coc_unpack_cut@"

                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_coke_box_01a")
                    RequestModel("bkr_prop_coke_fullmetalbowl_02")
                    RequestModel("bkr_prop_coke_fullscoop_01a")
                    while not HasAnimDictLoaded(dict) and not HasModelLoaded("bkr_prop_coke_box_01a") and
                        not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and
                        not HasModelLoaded("bkr_prop_coke_fullscoop_01a") do
                        Wait(100)
                    end

                    CokeBowl = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
                    CokeScoop = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1)
                    CokeBox = CreateObject(GetHashKey('bkr_prop_coke_box_01a'), x, y, z, 1, 0, 1)
                    local targetRotation = vec3(180.0, 180.0, Config.Coke.CokeBox.heading)
                    local x, y, z = table.unpack(Config.Coke.CokeBox.teleport)
                    local netScene = NetworkCreateSynchronisedScene(x - 0.2, y - 0.1, z - 0.65, targetRotation, 2, false
                        , false, 1148846080, 0, 1.3)

                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "fullcut_cycle_v1_cokepacker", 1.5, -4.0, 1, 16
                        , 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(CokeBowl, netScene, dict, "fullcut_cycle_v1_cokebowl", 4.0, -8.0
                        , 1)
                    NetworkAddEntityToSynchronisedScene(CokeBox, netScene, dict, 'fullcut_cycle_v1_cokebox', 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(CokeScoop, netScene, dict, 'fullcut_cycle_v1_cokescoop', 4.0,
                        -8.0, 1)
                    FreezeEntityPosition(ped, true)
                    Wait(150)
                    NetworkStartSynchronisedScene(netScene)
                    SetEntityVisible(CokeScoop, false, 0)
                    if lib.progressBar({
                        duration = 43828,
                        label = locale("CokeBoxProg"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(CokeBowl)
                        DeleteObject(CokeBox)
                        DeleteObject(CokeScoop)
                        FreezeEntityPosition(ped, false)
                        TSE("drc_drugs:coke:giveitems", data.menu)
                    end
                    Wait(GetAnimDuration(dict, "fullcut_cycle_v1_cokepacker") * 450)
                    SetEntityVisible(CokeScoop, true, 0)
                    Wait(GetAnimDuration(dict, "fullcut_cycle_v1_cokepacker") * 65)
                    SetEntityVisible(CokeBox, false, 0)
                    Wait(GetAnimDuration(dict, "fullcut_cycle_v1_cokepacker") * 245)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "CokeFigure" then
        lib.callback('drc_drugs:coke:getitem', false, function(value)
            if value then
                if not lib.progressActive() then

                    local ped = cache.ped
                    local dict = "anim@amb@business@coc@coc_packing_hi@"
                    FreezeEntityPosition(ped, true)
                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_coke_fullscoop_01a")
                    RequestModel("bkr_prop_coke_fullmetalbowl_02")
                    RequestModel("bkr_prop_coke_dollboxfolded")
                    RequestModel("bkr_prop_coke_dollmould")
                    RequestModel("bkr_prop_coke_press_01b")
                    RequestModel("bkr_prop_coke_dollcast")
                    RequestModel("bkr_prop_coke_doll")
                    RequestModel("bkr_prop_coke_dollbox")
                    RequestModel("bkr_prop_coke_doll_bigbox")

                    while not HasAnimDictLoaded(dict) and
                        not HasModelLoaded("bkr_prop_coke_fullscoop_01a") and
                        not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and
                        not HasModelLoaded("bkr_prop_coke_dollboxfolded") and
                        not HasModelLoaded("bkr_prop_coke_dollmould") and
                        not HasModelLoaded("bkr_prop_coke_press_01b") and
                        not HasModelLoaded("bkr_prop_coke_dollcast") and
                        not HasModelLoaded("bkr_prop_coke_doll") and
                        not HasModelLoaded("bkr_prop_coke_dollbox") and
                        not HasModelLoaded("bkr_prop_coke_doll_bigbox") do
                        Wait(100)
                    end

                    scoop = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1)
                    metalbowl = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
                    foldedbox = CreateObject(GetHashKey('bkr_prop_coke_dollboxfolded'), x, y, z, 1, 0, 1)
                    dollmould = CreateObject(GetHashKey('bkr_prop_coke_dollmould'), x, y, z, 1, 0, 1)
                    cokepress = CreateObject(GetHashKey('bkr_prop_coke_press_01b'), x, y, z, 1, 0, 1)
                    dollcast = CreateObject(GetHashKey('bkr_prop_coke_dollcast'), x, y, z, 1, 0, 1)
                    cocdoll = CreateObject(GetHashKey('bkr_prop_coke_doll'), x, y, z, 1, 0, 1)
                    boxeddoll = CreateObject(GetHashKey('bkr_prop_coke_dollbox'), x, y, z, 1, 0, 1)

                    local targetRotation = vec3(180.0, 180.0, Config.Coke.FigurePackage.heading)
                    local x, y, z = table.unpack(Config.Coke.FigurePackage.teleport)
                    local netScene = NetworkCreateSynchronisedScene(x, y, z, targetRotation, 2, false, false, 1148846080
                        , 0, 1.3)
                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "full_cycle_v1_pressoperator", 1.5, -4.0, 1, 16
                        , 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(scoop, netScene, dict, "full_cycle_v1_scoop", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(metalbowl, netScene, dict, "full_cycle_v1_cocbowl", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(foldedbox, netScene, dict, "full_cycle_v1_foldedbox", 4.0, -8.0,
                        1)
                    local netScene2 = NetworkCreateSynchronisedScene(x, y, z, targetRotation, 2, false, false, 1148846080
                        , 0, 1.3)
                    NetworkAddEntityToSynchronisedScene(dollmould, netScene2, dict, "full_cycle_v1_dollmould", 4.0, -8.0
                        , 1) --
                    NetworkAddEntityToSynchronisedScene(cokepress, netScene2, dict, "full_cycle_v1_cokepress", 4.0, -8.0
                        , 1)
                    NetworkAddEntityToSynchronisedScene(dollcast, netScene2, dict, "full_cycle_v1_dollcast^3", 4.0, -8.0
                        , 1)
                    local netScene3 = NetworkCreateSynchronisedScene(x, y, z, targetRotation, 2, false, false, 1148846080
                        , 0, 1.3)
                    NetworkAddEntityToSynchronisedScene(cocdoll, netScene3, dict, "full_cycle_v1_cocdoll", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(boxeddoll, netScene3, dict, "full_cycle_v1_boxeddoll", 4.0, -8.0
                        , 1)
                    Wait(150)
                    NetworkStartSynchronisedScene(netScene)
                    Wait(100)
                    NetworkStartSynchronisedScene(netScene2)
                    Wait(100)
                    NetworkStartSynchronisedScene(netScene3)
                    if lib.progressBar({
                        duration = GetAnimDuration(dict, "full_cycle_v1_pressoperator") * 780,
                        label = locale("CokePacking"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(cokepress)
                        DeleteObject(foldedbox)
                        DeleteObject(dollmould)
                        DeleteObject(dollcast)
                        DeleteObject(cocdoll)
                        DeleteObject(boxeddoll)
                        DeleteObject(scoop)
                        DeleteObject(metalbowl)
                        FreezeEntityPosition(ped, false)
                        TSE("drc_drugs:coke:giveitems", data.menu)
                    end
                    Wait(GetAnimDuration(dict, "full_cycle_v1_pressoperator") * 780)
                    NetworkStopSynchronisedScene(netScene)
                    NetworkStopSynchronisedScene(netScene2)
                    NetworkStopSynchronisedScene(netScene3)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "EmptyFigure" then
        if data.option == "break" then
            if lib.progressBar({
                duration = 6000,
                label = locale("BreakFigure"),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false
                },
                prop = {
                    model = `bkr_prop_coke_doll`,
                    pos = vec3(-0.11, 0.4, -0.11),
                    rot = vec3(1.0, 9.0, 115.0),
                    bone = 24816
                },
                anim = {
                    dict = "anim@heists@box_carry@",
                    clip = "idle",
                    flags = 49,
                },
            }) then
                TSE("drc_drugs:coke:giveitems", "empty")
            end
        else
            if not FigureCarry then
                local ped = cache.ped
                RequestAnimDict("impexp_int-0")
                while (not HasAnimDictLoaded("impexp_int-0")) do Wait(0) end
                TaskPlayAnim(ped, 'impexp_int-0', 'mp_m_waremech_01_dual-0', 8.0, -8, -1, 49, 0, 0, 0, 0)
                FigureObject = CreateObject(GetHashKey("bkr_prop_coke_doll"), 0, 0, 0, true, true, true)
                AttachEntityToEntity(FigureObject, ped, GetPedBoneIndex(ped, 24816), -0.03, 0.45, -0.01, -10.0, 90.0,
                    180.0, true, true, false, true, 1, true)
            else
                DetachEntity(FigureObject, 0, 0)
                DeleteEntity(FigureObject)
                ClearPedTasks(cache.ped)
            end
            FigureCarry = not FigureCarry
        end
    elseif data.menu == "BrokenFigure" then
        lib.callback('drc_drugs:coke:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if lib.progressBar({
                        duration = 6000,
                        label = locale("RepairingFigure"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false
                        },
                        prop = {
                            model = `bkr_prop_coke_doll`,
                            pos = vec3(-0.11, 0.4, -0.11),
                            rot = vec3(1.0, 9.0, 115.0),
                            bone = 24816
                        },
                        anim = {
                            dict = "anim@heists@box_carry@",
                            clip = "idle",
                            flags = 49,
                        },
                    }) then
                        TSE("drc_drugs:coke:giveitems", data.menu)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "FullFigure" then
        if data.option == "break" then
            if lib.progressBar({
                duration = 6000,
                label = locale("BreakFigure"),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false
                },
                prop = {
                    model = `bkr_prop_coke_doll`,
                    pos = vec3(-0.11, 0.4, -0.11),
                    rot = vec3(1.0, 9.0, 115.0),
                    bone = 24816
                },
                anim = {
                    dict = "anim@heists@box_carry@",
                    clip = "idle",
                    flags = 49,
                },
            }) then
                TSE("drc_drugs:coke:giveitems", data.option)
            end
        else
            if not FigureCarry then
                local ped = cache.ped
                RequestAnimDict("impexp_int-0")
                while (not HasAnimDictLoaded("impexp_int-0")) do Wait(0) end
                TaskPlayAnim(ped, 'impexp_int-0', 'mp_m_waremech_01_dual-0', 8.0, -8, -1, 49, 0, 0, 0, 0)
                FigureObject = CreateObject(GetHashKey("bkr_prop_coke_doll"), 0, 0, 0, true, true, true)
                AttachEntityToEntity(FigureObject, ped, GetPedBoneIndex(ped, 24816), -0.03, 0.45, -0.01, -10.0, 90.0,
                    180.0, true, true, false, true, 1, true)
            else
                DetachEntity(FigureObject, 0, 0)
                DeleteEntity(FigureObject)
                ClearPedTasks(cache.ped)
            end
            FigureCarry = not FigureCarry
        end
    elseif data.menu == "ElectricON" then
        TaskTurnPedToFaceCoord(cache.ped, Config.Coke.Electricity.coords, 2000)
        Wait(2000)
        TaskStartScenarioInPlace(cache.ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
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
        TaskTurnPedToFaceCoord(cache.ped, Config.Coke.Electricity.coords, 2000)
        Wait(2000)
        TaskStartScenarioInPlace(cache.ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
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
    elseif data.menu == "CokeProcess" then
        lib.callback('drc_drugs:coke:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local object = CreateObject(GetHashKey("bkr_prop_coke_box_01a"), Config.Coke.LeafProcess.boxcoords.x
                        , Config.Coke.LeafProcess.boxcoords.y, Config.Coke.LeafProcess.boxcoords.z, true, true, false)
                    SetEntityHeading(object, Config.Coke.LeafProcess.boxcoords.w)
                    TaskTurnPedToFaceCoord(cache.ped, Config.Coke.LeafProcess.coords, 2000)
                    Wait(2000)
                    if lib.progressBar({
                        duration = 10000,
                        label = locale('CokeProcessing'),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false
                        },
                        anim = {
                            dict = "mp_arresting",
                            clip = "a_uncuff",
                            flags = 49,
                        },
                        prop = {
                            model = `ng_proc_leaves01`,
                            pos = vec3(0.13, 0.05, 0.0),
                            rot = vec3(0.0, 0.0, 0.0),
                            bone = 18905
                        },
                    }) then
                        TSE("drc_drugs:coke:giveitems", data.menu)
                        DeleteObject(object)
                    else
                        DeleteObject(object)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    elseif data.menu == "CokeSoda" then
        lib.callback('drc_drugs:coke:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    local ped = cache.ped
                    local dict = "anim@amb@business@coc@coc_unpack_cut_left@"
                    RequestAnimDict(dict)
                    RequestModel("bkr_prop_coke_box_01a")
                    RequestModel("prop_cs_credit_card")
                    RequestModel("bkr_prop_coke_bakingsoda_o")
                    while not HasAnimDictLoaded(dict) and not HasModelLoaded("bkr_prop_coke_bakingsoda_o") and
                        not HasModelLoaded("prop_cs_credit_card") do
                        Wait(100)
                    end
                    card = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
                    card_2 = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
                    soda = CreateObject(GetHashKey('bkr_prop_coke_bakingsoda_o'), x, y, z, 1, 0, 1)
                    local targetRotation = vec3(180.0, 180.0, headingtotable)
                    local x, y, z = table.unpack(GetEntityCoords(cache.ped))
                    if headingtotable == 0.0 then
                        netScene = NetworkCreateSynchronisedScene(x + 1.7, y + 0.4, z - 0.65, targetRotation, 2, false,
                            false, 1148846080, 0, 1.1)
                    else
                        netScene = NetworkCreateSynchronisedScene(x - 1.7, y - 0.4, z - 0.65, targetRotation, 2, false,
                            false, 1148846080, 0, 1.1)
                    end
                    NetworkAddPedToSynchronisedScene(ped, netScene, dict, "coke_cut_coccutter", 1.5, -4.0, 1, 16,
                        1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(card, netScene, dict, "coke_cut_creditcard", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(card_2, netScene, dict, "coke_cut_creditcard^1", 4.0, -8.0, 1)
                    NetworkAddEntityToSynchronisedScene(soda, netScene, dict, "cut_cough_v1_bakingsoda", 4.0, -8.0, 1)
                    NetworkStartSynchronisedScene(netScene)
                    if lib.progressBar({
                        duration = GetAnimDuration(dict, "coke_cut_coccutter") * 770,
                        label = locale("CokeCleaning"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                    }) then
                        DeleteObject(card)
                        DeleteObject(card_2)
                        DeleteObject(soda)
                        FreezeEntityPosition(ped, false)
                        TSE("drc_drugs:coke:giveitems", data.menu)
                    end
                    Wait(GetAnimDuration(dict, "coke_cut_coccutter") * 770)
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    end
end)

function PickUpCoke(target)
    local nearbyID
    for i = 1, #CokePlants, 1 do
        local dist = #(GetEntityCoords(cache.ped) - GetEntityCoords(CokePlants[i]))
        if dist < 2 then
            nearbyID = i
        end
    end
    if IsPedOnFoot(cache.ped) then
        lib.callback('drc_drugs:coke:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if lib.progressBar({
                        duration = 10000,
                        label = locale("pickingup"),
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                        anim = {
                            scenario = "world_human_gardener_plant",
                        },
                    }) then
                        TSE('drc_drugs:deleteprop', ObjToNet(target))
                        SetEntityAsMissionEntity(target, false, true)
                        DeleteObject(target)
                        table.remove(CokePlants, nearbyID)
                        SpawnedCokePlant = SpawnedCokePlant - 1
                        TSE('drc_drugs:coke:giveitems', "CokePick")
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredTrowel"))
            end
        end, "CokePick")
    else
        Wait(500)
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(CokePlants) do
            SetEntityAsMissionEntity(v, false, true)
            DeleteObject(v)
        end
    end
end)

CokeField:onPlayerInOut(function(isInside)
    if isInside then
        while SpawnedCokePlant < 15 do
            Wait(0)
            local CokeCoords = GenerateCokePlantCoords()
            RequestModel(`prop_plant_01a`)
            while not HasModelLoaded(`prop_plant_01a`) do
                Wait(100)
            end
            local obj = CreateObject(`prop_plant_01a`, CokeCoords.x, CokeCoords.y, CokeCoords.z, true, true, false)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)
            table.insert(CokePlants, obj)
            SpawnedCokePlant = SpawnedCokePlant + 1
        end
    end
end)

CokeField:onPlayerInOut(function(isInside)
    if isInside then
        inside = true
    else
        inside = false
    end
end)

if Config.Target == "qtarget" then
    exports.qtarget:AddTargetModel(`prop_plant_01a`, {
        options = {
            {
                action = function(entity)
                    PickUpCoke(entity)
                end,
                icon = "fas fa-leaf",
                label = locale("pickup"),
                canInteract = function()
                    if inside then
                        return true
                    end
                end
            },
        },
        distance = 3
    })
elseif Config.Target == "qb-target" then
    exports['qb-target']:AddTargetModel(`prop_plant_01a`, {
        options = {
            {
                type = "client",
                action = function(entity)
                    PickUpCoke(entity)
                end,
                icon = "fas fa-leaf",
                label = locale("pickup"),
                canInteract = function()
                    if inside then
                        return true
                    end
                end
            },
        },
        distance = 3
    })
end

function GenerateCokePlantCoords()
    while true do
        Wait(0)

        local CokeCoordX, CokeCoordY

        math.randomseed(GetGameTimer())
        local modX = math.random(math.floor(Config.Coke.Field.radius * -1) + 2, math.floor(Config.Coke.Field.radius) - 2)

        Wait(100)

        math.randomseed(GetGameTimer())
        local modY = math.random(math.floor(Config.Coke.Field.radius * -1) + 2, math.floor(Config.Coke.Field.radius) - 2)

        CokeCoordX = Config.Coke.Field.coords.x + modX
        CokeCoordY = Config.Coke.Field.coords.y + modY

        local coordZ = GetCoordZCoke(CokeCoordX, CokeCoordY)
        local coord = vector3(CokeCoordX, CokeCoordY, coordZ)

        if ValidateCokePlantCoord(coord) then
            return coord
        end
    end
end

function GetCoordZCoke(x, y)
    local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

        if foundGround then
            return z
        end
    end

    return 70
end

function ValidateCokePlantCoord(plantCoord)
    if SpawnedCokePlant > 0 then
        local validate = true

        for k, v in pairs(CokePlants) do
            local dist = #(plantCoord - GetEntityCoords(v))
            if dist < 5 then
                validate = false
            end
        end
        local validdist = #(plantCoord - Config.Coke.Field.coords)
        if validdist > 50 then
            validate = false
        end

        return validate
    else
        return true
    end
end

-- PROGRESSY KONEC --

-- BOXZONES --

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if Config.Target == "qtarget" then
            for k, _ in pairs(Config.Coke.SodaTables) do
                exports.qtarget:RemoveZone('CokeSodaMenu' .. k)
            end
            exports.qtarget:RemoveZone('CokeElectricMenu')
            exports.qtarget:RemoveZone('CokeFigureMenu')
            exports.qtarget:RemoveZone('CokeBoxMenu')
            exports.qtarget:RemoveZone('CokeTeleportMenu2')
            exports.qtarget:RemoveZone('CokeTeleportMenu1')
            exports.qtarget:RemoveZone('CokeProcessMenu')
        elseif Config.Target == "qb-target" then
            for k, _ in pairs(Config.Coke.SodaTables) do
                exports['qb-target']:RemoveZone('CokeSodaMenu' .. k)
            end
            exports['qb-target']:RemoveZone('CokeElectricMenu')
            exports['qb-target']:RemoveZone('CokeFigureMenu')
            exports['qb-target']:RemoveZone('CokeBoxMenu')
            exports['qb-target']:RemoveZone('CokeTeleportMenu2')
            exports['qb-target']:RemoveZone('CokeTeleportMenu1')
            exports['qb-target']:RemoveZone('CokeProcessMenu')
        end
    end
end)
if Config.Coke.Enterlab.NeedItem then
    if Config.Target == "qtarget" then
        exports.qtarget:AddCircleZone("CokeTeleportMenu1", Config.Coke.Enterlab.coords, Config.Coke.Enterlab.radius,
            { name = "CokeTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:coke:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "CokeDoor1",
                    item = Config.Coke.Enterlab.ItemName }
            },
                distance = 2.5
            }
        )
    elseif Config.Target == "qb-target" then
        exports['qb-target']:AddCircleZone("CokeTeleportMenu1", Config.Coke.Enterlab.coords, Config.Coke.Enterlab.radius
            ,
            { name = "CokeTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { type = "client", event = "drc_drugs:coke:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "CokeDoor1", item = Config.Coke.Enterlab.ItemName }
            },
                distance = 2.5
            }
        )
    end
else
    if Config.Target == "qtarget" then
        exports.qtarget:AddCircleZone("CokeTeleportMenu1", Config.Coke.Enterlab.coords, Config.Coke.Enterlab.radius,
            { name = "CokeTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { event = "drc_drugs:coke:progress", icon = "fas fa-door-open", label = locale("enter"),
                    menu = "CokeDoor1" }
            },
                distance = 2.5
            }
        )
    elseif Config.Target == "qb-target" then
        exports['qb-target']:AddCircleZone("CokeTeleportMenu1", Config.Coke.Enterlab.coords,
            Config.Coke.Enterlab.radius
            ,
            { name = "CokeTeleportMenu1", debugPoly = Config.Debug, useZ = true },
            { options = {
                { type = "client", event = "drc_drugs:coke:progress", icon = "fas fa-door-open",
                    label = locale("enter"),
                    menu = "CokeDoor1" }
            },
                distance = 2.5
            }
        )
    end
end

CokeLab:onPlayerInOut(function(isInside)
    if isInside then
        if Config.Target == "qtarget" then
            exports.qtarget:AddCircleZone("CokeElectricMenu", Config.Coke.Electricity.coords,
                Config.Coke.Electricity.radius,
                { name = "CokeElectricMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:coke:progress", icon = "fas fa-car-battery", label = locale("turnonelt"),
                        menu = "ElectricON" },
                    { event = "drc_drugs:coke:progress", icon = "fas fa-car-battery", label = locale("turnoffelt"),
                        menu = "ElectricOFF" }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("CokeProcessMenu", Config.Coke.LeafProcess.coords,
                Config.Coke.LeafProcess.radius,
                { name = "CokeProcessMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:coke:menus", icon = "fas fa-box-open", label = locale("CokeProcess"),
                        menu = "CokeProcess",
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

            exports.qtarget:AddCircleZone("CokeTeleportMenu2", Config.Coke.LeaveLab.coords, Config.Coke.LeaveLab.radius,
                { name = "CokeTeleportMenu2", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:coke:progress", icon = "fas fa-door-open", label = locale("leave"),
                        menu = "CokeDoor2" }
                },
                    distance = 2.5
                }
            )

            exports.qtarget:AddCircleZone("CokeBoxMenu", Config.Coke.CokeBox.coords, Config.Coke.CokeBox.radius,
                { name = "CokeBoxMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:coke:menus", icon = "fas fa-box-open", label = locale("CokeBox"),
                        menu = "CokeBox",
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

            exports.qtarget:AddCircleZone("CokeFigureMenu", Config.Coke.FigurePackage.coords,
                Config.Coke.FigurePackage.radius,
                { name = "CokeFigureMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { event = "drc_drugs:coke:menus", icon = "fas fa-box", label = locale("CokePack"),
                        menu = "CokeFigure",
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

            for k, v in pairs(Config.Coke.SodaTables) do
                exports.qtarget:AddCircleZone("CokeSodaMenu" .. k, v.coords, v.radius,
                    { name = "CokeSodaMenu" .. k, debugPoly = v.debugPoly, useZ = true },
                    { options = {
                        { event = "drc_drugs:coke:menus", icon = "fas fa-prescription-bottle",
                            label = locale("CokeClean"), menu = "CokeSoda", headingtotable = v.headingtotable,
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
        elseif Config.Target == "qb-target" then
            exports['qb-target']:AddCircleZone("CokeElectricMenu", Config.Coke.Electricity.coords,
                Config.Coke.Electricity.radius,
                { name = "CokeElectricMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:coke:progress", icon = "fas fa-car-battery",
                        label = locale("turnonelt"), menu = "ElectricON" },
                    { type = "client", event = "drc_drugs:coke:progress", icon = "fas fa-car-battery",
                        label = locale("turnoffelt"), menu = "ElectricOFF" }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("CokeProcessMenu", Config.Coke.LeafProcess.coords,
                Config.Coke.LeafProcess.radius,
                { name = "CokeProcessMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:coke:menus", icon = "fas fa-box-open",
                        label = locale("CokeProcess"), menu = "CokeProcess",
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

            exports['qb-target']:AddCircleZone("CokeTeleportMenu2", Config.Coke.LeaveLab.coords,
                Config.Coke.LeaveLab.radius,
                { name = "CokeTeleportMenu2", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:coke:progress", icon = "fas fa-door-open",
                        label = locale("leave"), menu = "CokeDoor2" }
                },
                    distance = 2.5
                }
            )

            exports['qb-target']:AddCircleZone("CokeBoxMenu", Config.Coke.CokeBox.coords, Config.Coke.CokeBox.radius,
                { name = "CokeBoxMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:coke:menus", icon = "fas fa-box-open",
                        label = locale("CokeBox"), menu = "CokeBox",
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

            exports['qb-target']:AddCircleZone("CokeFigureMenu", Config.Coke.FigurePackage.coords,
                Config.Coke.FigurePackage.radius,
                { name = "CokeFigureMenu", debugPoly = Config.Debug, useZ = true },
                { options = {
                    { type = "client", event = "drc_drugs:coke:menus", icon = "fas fa-box", label = locale("CokePack"),
                        menu = "CokeFigure",
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

            for k, v in pairs(Config.Coke.SodaTables) do
                exports['qb-target']:AddCircleZone("CokeSodaMenu" .. k, v.coords, v.radius,
                    { name = "CokeSodaMenu" .. k, debugPoly = v.debugPoly, useZ = true },
                    { options = {
                        { type = "client", event = "drc_drugs:coke:menus", icon = "fas fa-prescription-bottle",
                            label = locale("CokeClean"), menu = "CokeSoda", headingtotable = v.headingtotable,
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
        end
    else
        if Config.Target == "qtarget" then
            exports.qtarget:RemoveZone('CokeElectricMenu')
            for k, v in pairs(Config.Coke.SodaTables) do
                exports.qtarget:RemoveZone('CokeSodaMenu' .. k)
            end
            exports.qtarget:RemoveZone('CokeFigureMenu')
            exports.qtarget:RemoveZone('CokeBoxMenu')
            exports.qtarget:RemoveZone('CokeTeleportMenu2')
        elseif Config.Target == "qb-target" then
            exports['qb-target']:RemoveZone('CokeElectricMenu')
            for k, v in pairs(Config.Coke.SodaTables) do
                exports['qb-target']:RemoveZone('CokeSodaMenu' .. k)
            end
            exports['qb-target']:RemoveZone('CokeFigureMenu')
            exports['qb-target']:RemoveZone('CokeBoxMenu')
            exports['qb-target']:RemoveZone('CokeTeleportMenu2')
        end
    end
end)
--BOXZONES KONEC--
