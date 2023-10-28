local TSE = TriggerServerEvent

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if Config.Target == "qtarget" then
            exports.qtarget:RemoveZone('CrackProcess')
        elseif Config.Target == "qb-target" then
            exports['qb-target']:RemoveZone('CrackProcess')
        end
    end
end)

if Config.Target == "qtarget" then
    exports.qtarget:AddCircleZone("CrackProcess", Config.Crack.Process.coords, Config.Crack.Process.radius,
        { name = "CrackProcess", debugPoly = Config.Debug, useZ = true },
        { options = {
            { event = "drc_drugs:crack:menu", icon = "fas fa-pills", label = locale("MakeCrack"),
                menu = "CrackProcess",
            }
        },
            distance = 2.5
        }
    )
elseif Config.Target == "qb-target" then
    exports['qb-target']:AddCircleZone("CrackProcess", Config.Crack.Process.coords, Config.Crack.Process.radius,
        { name = "CrackProcess", debugPoly = Config.Debug, useZ = true },
        { options = {
            { type = "client", event = "drc_drugs:crack:menu", icon = "fas fa-pills", label = locale("MakeCrack"),
                menu = "CrackProcess",
            }
        },
            distance = 2.5
        }
    )
end

RegisterNetEvent("drc_drugs:crack:menu", function(data)
    if data.menu == "CrackProcess" then
        lib.registerContext({
            id = 'DrugsCrackMenu',
            title = locale("table"),
            options = {
                [Config.Crack.Process.header] = {
                    arrow = false,
                    description = Config.Crack.Process.description,
                    event = 'drc_drugs:crack:progress',
                    args = { menu = data.menu }
                }
            }
        })
        lib.showContext('DrugsCrackMenu')
    end
end)

RegisterNetEvent("drc_drugs:crack:progress")
AddEventHandler("drc_drugs:crack:progress", function(data)
    if data.menu == "CrackProcess" then
        lib.callback('drc_drugs:crack:getitem', false, function(value)
            if value then
                if not lib.progressActive() then
                    SetEntityCoords(cache.ped, Config.Crack.Process.Teleport, false, false, false, true)
                    TaskTurnPedToFaceCoord(cache.ped, Config.Crack.Process.coords, 2000)
                    if lib.progressBar({
                        duration = Config.Heroin.Process.Duration,
                        label = locale("CrackMaking"),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false,
                        },
                        anim = {
                            dict = "anim@mp_player_intupperspray_champagne",
                            clip = "idle_a",
                        },
                        prop = {
                            model = "bkr_prop_coke_bottle_01a",
                            pos = vec3(0.0, 0.0, -0.22),
                            rot = vec3(0.0, 0.0, 0.0),
                            bone = 28422
                        },
                    }) then
                        TSE("drc_drugs:crack:giveitems", data.menu)
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, data.menu)
    end
end)
