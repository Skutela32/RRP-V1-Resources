local TSE = TriggerServerEvent
local using = false
RegisterNetEvent('drc_drugs:consumables', function(text, animation, duration, effect)
    if not lib.progressActive() then
        if animation.emote.enabled then
            if lib.progressBar({
                duration = duration,
                label = text,
                useWhileDead = false,
                canCancel = true,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false,
                },
                anim = {
                    dict = animation.emote.anim.dict,
                    clip = animation.emote.anim.clip
                },
                prop = {
                    model = animation.emote.prop.model,
                    pos = animation.emote.prop.pos,
                    rot = animation.emote.prop.rot,
                    bone = animation.emote.prop.bone
                },
            }) then
                Drug(effect)
            end
        elseif animation.scenario.enabled then
            print(animation.scenario.anim.scenario)
            if lib.progressBar({
                duration = duration,
                label = text,
                useWhileDead = false,
                canCancel = true,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false,
                },
                anim = {
                    scenario = animation.scenario.anim.scenario
                },
            }) then
                Drug(effect)
            end
        elseif animation.custom.enabled then
            if animation.custom.anim == "syringe" then
                if not using then
                    using = true
                    RequestAnimDict("rcmpaparazzo1ig_4")
                    while (not HasAnimDictLoaded("rcmpaparazzo1ig_4")) do Wait(0) end
                    TaskPlayAnim(cache.ped, 'rcmpaparazzo1ig_4', 'miranda_shooting_up', 8.0, -8, -1, 49, 0, 0, 0, 0)
                    local hash = GetHashKey("prop_syringe_01")
                    RequestModel(hash)
                    while not HasModelLoaded(hash) do
                        Wait(100)
                        RequestModel(hash)
                    end
                    local prop = CreateObject(hash, GetEntityCoords(cache.ped), true, true, true)
                    AttachEntityToEntity(prop, cache.ped, GetPedBoneIndex(cache.ped, 18905), 0.12, 0.03, 0.03,
                        143.0
                        ,
                        30.0, 0.0, true, true, false, false, 1, true)
                    lib.progressBar({
                        duration = 12500,
                        label = locale("PrepairingSyringe"),
                        useWhileDead = false,
                        canCancel = false
                    })
                    Wait(1000)
                    AttachEntityToEntity(prop, cache.ped, GetPedBoneIndex(cache.ped, 28422), 0.0, 0.03, -0.02,
                        1.0, 0
                        ,
                        0.0, true, true, false, false, 1, true)
                    lib.progressBar({
                        duration = duration,
                        label = text,
                        useWhileDead = false,
                        canCancel = false
                    })
                    DetachEntity(prop, 0, 0)
                    DeleteEntity(prop)
                    ClearPedTasks(cache.ped)
                    using = false
                    Drug(effect)
                end
            end

        end
        --[[elseif data == "bong" then
            if lib.progressBar({
                duration = 10000,
                label = "Smoking Bong",
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false,
                },
                anim = {
                    dict = 'anim@safehouse@bong',
                    clip = 'bong_stage4',
                    flags = 49,
                },
                prop = {
                    model = `hei_heist_sh_bong_01`,
                    pos = vec3(0.10, -0.25, 0.0),
                    rot = vec3(95.0, 190.0, 180.0),
                    bone = 18905
                },
            }) then
                Trip()
            end]]
    end
end)
function Drug(effect)
    if effect == "weed" then
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Wait(0)
        end
        SetPedMotionBlur(cache.ped, true)
        SetPedMovementClipset(cache.ped, "MOVE_M@DRUNK@VERYDRUNK", 1000)
        AnimpostfxPlay("CamPushInFranklin", 10000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.3)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsDrivingOut", 3000, true)
        AnimpostfxStop("CamPushInFranklin")
        Wait(3000)
        AnimpostfxStop("DrugsDrivingOut")
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped, 2000)
    elseif effect == "xanax" then
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Wait(0)
        end
        SetPedMotionBlur(cache.ped, true)
        SetPedMovementClipset(cache.ped, "MOVE_M@DRUNK@VERYDRUNK", 1000)
        AnimpostfxPlay("DeadlineNeon", 10000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.3)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsDrivingOut", 3000, true)
        AnimpostfxStop("DeadlineNeon")
        Wait(3000)
        AnimpostfxStop("DrugsDrivingOut")
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped, 2000)
    elseif effect == "ecstasy" then
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Wait(0)
        end
        SetPedMotionBlur(cache.ped, true)
        SetPedMovementClipset(cache.ped, "MOVE_M@DRUNK@VERYDRUNK", 1000)
        AnimpostfxPlay("DeathFailMichaelIn", 10000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.3)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsDrivingOut", 3000, true)
        AnimpostfxStop("DeathFailMichaelIn")
        Wait(3000)
        AnimpostfxStop("DrugsDrivingOut")
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped, 2000)
    elseif effect == "coke" then
        RequestAnimSet("move_m@alien")
        while not HasAnimSetLoaded("move_m@alien") do
            Wait(0)
        end
        SetPedMovementClipset(cache.ped, "move_m@alien", 1000)
        AnimpostfxPlay("BeastLaunch", 10000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.3)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsDrivingOut", 3000, true)
        AnimpostfxStop("BeastLaunch")
        Wait(3000)
        AnimpostfxStop("DrugsDrivingOut")
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        ResetPedMovementClipset(cache.ped, 2000)
    elseif effect == "Poison" then
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Wait(0)
        end
        SetPedMotionBlur(cache.ped, true)
        SetPedMovementClipset(cache.ped, "MOVE_M@DRUNK@VERYDRUNK", 1000)
        AnimpostfxPlay("DeathFailMPIn", 10000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 1.0)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsDrivingOut", 3000, true)
        AnimpostfxStop("DeathFailMPIn")
        Wait(3000)
        AnimpostfxStop("DrugsDrivingOut")
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetPedMotionBlur(cache.ped, false)
        ResetPedMovementClipset(cache.ped, 2000)
    elseif effect == "trip" then
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
            Wait(0)
        end
        SetPedMotionBlur(cache.ped, true)
        SetPedMovementClipset(cache.ped, "MOVE_M@DRUNK@VERYDRUNK", 1000)
        AnimpostfxPlay("DMT_flight", 10000, true)
        ShakeGameplayCam("DRUNK_SHAKE", 2.0)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsDrivingOut", 3000, true)
        AnimpostfxStop("DMT_flight")
        Wait(3000)
        AnimpostfxStop("DrugsDrivingOut")
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetPedMotionBlur(cache.ped, false)
    elseif effect == "alien" then
        ShakeGameplayCam("DRUNK_SHAKE", 3.0)
        RequestAnimSet("move_m@alien")
        while not HasAnimSetLoaded("move_m@alien") do
            Wait(0)
        end
        SetPedMovementClipset(cache.ped, "move_m@alien", 1000)
        AnimpostfxPlay("DrugsMichaelAliensFight", 3.0, 0)
        Wait(math.random(25000, 38000))
        AnimpostfxPlay("DrugsMichaelAliensFightOut", 3.0, 0)
        ResetPedMovementClipset(cache.ped, 2000)
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        AnimpostfxStop("DrugsMichaelAliensFightIn")
        AnimpostfxStop("DrugsMichaelAliensFight")
        AnimpostfxStop("DrugsMichaelAliensFightOut")
    end
end

RegisterNetEvent("drc_drugs:consumables:menu")
AddEventHandler("drc_drugs:consumables:menu", function(data)
    if data == "weed_wrap" then
        lib.registerContext({
            id = 'WeedWrap',
            title = locale("BluntWraps"),
            options = {
                [locale("BluntRoll")] = {
                    arrow = false,
                    description = locale("BluntDesc"),
                    event = 'drc_drugs:consumables:progress',
                    args = { type = data }
                }
            }
        })
        lib.showContext('WeedWrap')
    elseif data == "syringe" then
        lib.registerContext({
            id = 'syringe',
            title = locale("Syringe"),
            options = {
                [locale("InsertHeroin")] = {
                    arrow = false,
                    description = locale("InsertHeroinDesc"),
                    event = 'drc_drugs:consumables:progress',
                    args = { type = data, drug = "heroin" }
                },
                [locale("InsertMeth")] = {
                    arrow = false,
                    description = locale("InsertMethDesc"),
                    event = 'drc_drugs:consumables:progress',
                    args = { type = data, drug = "meth" }
                }
            }
        })
        lib.showContext('syringe')
    elseif data == "weed_papers" then
        lib.registerContext({
            id = 'WeedPapers',
            title = locale("JointPapers"),
            options = {
                [locale("JointRoll")] = {
                    arrow = false,
                    description = locale("JointDesc"),
                    event = 'drc_drugs:consumables:progress',
                    args = { type = data }
                }
            }
        })
        lib.showContext('WeedPapers')
    end
end)

RegisterNetEvent("drc_drugs:consumables:progress")
AddEventHandler("drc_drugs:consumables:progress", function(data)
    if data == "xanax_pack" then
        if not lib.progressActive() then
            if lib.progressBar({
                duration = 5000,
                label = locale("UnpackingXanax"),
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
            }) then
                TSE("drc_drugs:consumables:giveitems", data)
            end
        end
    elseif data == "xanax_plate" then
        if not lib.progressActive() then
            if lib.progressBar({
                duration = 5000,
                label = locale("UnpackingXanax"),
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
            }) then
                TSE("drc_drugs:consumables:giveitems", data)
            end
        end
    end
    if data.type == "weed_wrap" then
        lib.callback('drc_drugs:consumables:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if lib.progressBar({
                        duration = 5000,
                        label = locale("BluntRolling"),
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
                                model = `prop_cigar_02`,
                                pos = vec3(0.1, 0.03, 0.0),
                                rot = vec3(0.0, 0.0, 0.0),
                                bone = 57005
                            },
                            {
                                model = `bkr_prop_weed_bag_01a`,
                                pos = vec3(0.05, 0.01, 0.02),
                                rot = vec3(0.0, 0.0, 20.0),
                                bone = 18905
                            },
                        },
                    }) then
                        TSE("drc_drugs:consumables:giveitems", data.type)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.type)
    elseif data.type == "syringe" then
        lib.callback('drc_drugs:consumables:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if lib.progressBar({
                        duration = 5000,
                        label = locale("Inserting"),
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
                                model = `prop_syringe_01`,
                                pos = vec3(0.1, 0.03, 0.0),
                                rot = vec3(0.0, 0.0, 0.0),
                                bone = 57005
                            },
                            {
                                model = `bkr_prop_weed_bag_01a`,
                                pos = vec3(0.05, 0.01, 0.02),
                                rot = vec3(0.0, 0.0, 20.0),
                                bone = 18905
                            },
                        },
                    }) then
                        TSE("drc_drugs:consumables:giveitems", data.drug)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.drug)
    elseif data.type == "weed_papers" then
        lib.callback('drc_drugs:consumables:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    if lib.progressBar({
                        duration = 5000,
                        label = locale("JointRolling"),
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
                                model = `prop_cigar_02`,
                                pos = vec3(0.1, 0.03, 0.0),
                                rot = vec3(0.0, 0.0, 0.0),
                                bone = 57005
                            },
                            {
                                model = `bkr_prop_weed_bag_01a`,
                                pos = vec3(0.05, 0.01, 0.02),
                                rot = vec3(0.0, 0.0, 20.0),
                                bone = 18905
                            },
                        },
                    }) then
                        TSE("drc_drugs:consumables:giveitems", data.type)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.type)
    end
end)
