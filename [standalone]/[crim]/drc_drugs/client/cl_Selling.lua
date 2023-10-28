local TSE = TriggerServerEvent
local Selling = false
local price = 0
local amount = 0
local ClientPosition = nil
local cooldown = false
local chance = 0
local AttackChance = 0
local ReportChance = 0
local negotiated = false
local sellingDrug = nil
local oldprice = nil

if Config.Target == "qtarget" then
    exports.qtarget:AddTargetModel(Config.PhoneBooths, {
        options = {
            {
                action = function()
                    Drugs()
                end,
                icon = "fas fa-book-skull",
                label = locale("StartSell")
            },
        },
        distance = 2
    })
elseif Config.Target == "qb-target" then
    exports['qb-target']:AddTargetModel(Config.PhoneBooths, {
        options = {
            {
                type = "client",
                action = function()
                    Drugs()
                end,
                icon = "fas fa-book-skull",
                label = locale("StartSell")
            },
        },
        distance = 2
    })
end

function Drugs()
    if not Selling then
        options = {}
        for k, v in pairs(Config.Drugs) do
            options[v.Label] = {}
            options[v.Label].description = locale("SellPrice", v.MinPrice, v.MaxPrice)
            options[v.Label].event = "rx_illegalsales:SellChoose"
            options[v.Label].args = { item = k, label = v.Label, MinPrice = v.MinPrice, MaxPrice = v.MaxPrice,
                MinCount = v.MinCount, MaxCount = v.MaxCount, ReqPolice = v.ReqPolice, chance = v.Chance,
                AttackChance = v.AttackChance, ReportChance = v.ReportChance }
        end
        lib.registerContext({
            id = 'DrugChooseMenu',
            title = locale("ChooseSell"),
            options = options
        })
        lib.showContext('DrugChooseMenu')
    else
        lib.registerContext({
            id = 'CancelMenu',
            title = locale("SellDrugs"),
            options = {
                [locale("SellCancelDeal")] = {
                    arrow = true,
                    event = 'drc_drugs:sell',
                    args = { option = "canceldeal" },
                    metadata = { locale("ClientOffer", price, amount, label) }
                }
            }
        })
        lib.showContext('CancelMenu')
    end
end

function ClientMenu()
    MakeEntityFaceEntity(cache.ped, Client)
    MakeEntityFaceEntity(Client, cache.ped)
    ClientPosition = nil
    if not negotiated then
        lib.registerContext({
            id = 'SellMenu',
            title = locale("ClientOffer", price, amount, label),
            options = {
                [locale("Sell")] = {
                    arrow = false,
                    event = 'drc_drugs:sell',
                    args = { option = "sell" }
                },
                [locale("Cancel")] = {
                    arrow = false,
                    event = 'drc_drugs:sell',
                    args = { option = "cancel" }
                },
                [locale("Negotiate")] = {
                    arrow = false,
                    event = 'drc_drugs:sell',
                    args = { option = "negotiate" }
                }
            }
        })
        lib.showContext('SellMenu')
    else
        lib.registerContext({
            id = 'SellMenu2',
            title = locale("ClientOffer", price, amount, label),
            options = {
                [locale("Sell")] = {
                    arrow = false,
                    event = 'drc_drugs:sell',
                    args = { option = "sell" }
                },
                [locale("Cancel")] = {
                    arrow = false,
                    event = 'drc_drugs:sell',
                    args = { option = "cancel" }
                }
            }
        })
        lib.showContext('SellMenu2')
    end
end

AddEventHandler('rx_illegalsales:SellChoose', function(data)
    lib.callback('drc_drugs:getpolice', false, function(value)
        if value >= data.ReqPolice then
            sellingDrug = data.item
            amount = math.random(data.MinCount, data.MaxCount)
            price = amount * math.random(data.MinPrice, data.MaxPrice)
            oldprice = price
            label = data.label
            chance = data.chance
            AttackChance = data.AttackChance
            ReportChance = data.ReportChance
            StartSelling()
        else
            Notify("error", locale("error"), locale("RequiredCops"))
        end
    end)
end)

MakeEntityFaceEntity = function(entity1, entity2)
    local p1 = GetEntityCoords(entity1, true)
    local p2 = GetEntityCoords(entity2, true)

    local dx = p2.x - p1.x
    local dy = p2.y - p1.y

    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading(entity1, heading)
end

StartSelling = function()
    if not Selling then
        if IsPedInAnyVehicle(cache.ped, true) then
            return
        end

        if cooldown then
            Notify("error", locale("error"), locale("SellCooldown"))
            return
        end

        cooldown = true

        if lib.progressBar({
            duration = 5000,
            label = locale("ClientFinding"),
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = {
                dict = "cellphone@",
                clip = "cellphone_call_listen_base",
                flags = 49,
            },

            prop = {
                model = `vw_prop_casino_phone_01b_handle`,
                pos = vec3(0.0, -0.02, -0.03),
                rot = vec3(90.0, 0.0, 190.0),
                bone = 28422
            },
        }) then
            Notify("info", locale("info"), locale("ClientOffer", price, amount, label))
            Selling = true
            ClientPosition = ClientCoords[math.random(1, #ClientCoords)]
            Wait(1000)

            PedHash = GetHashKey(ClientModels[math.random(1, #ClientModels)])
            RequestModel(PedHash)

            while not HasModelLoaded(PedHash) do
                Wait(0)
            end
            Notify("info", locale("info"), locale("ClientGPS"))
            SetNewWaypoint(ClientPosition.x, ClientPosition.y)
            CreateThread(function()
                local SpawnPed = true

                while true do
                    local sleep = 500
                    if ClientPosition ~= nil then
                        local playerCoords = GetEntityCoords(cache.ped)
                        local dist = #(playerCoords - vec3(ClientPosition.x, ClientPosition.y, ClientPosition.z))
                        if dist < 100 and Selling then
                            if dist < 100 and dist > 20 then
                                lib.showTextUI(locale("Client") .. ': ' .. math.round(dist, 0.1), {
                                    position = "left-center",
                                    icon = 'fa-book-skull',
                                    iconColor = "white",
                                    style = {
                                        backgroundColor = 'red',
                                        color = 'white'
                                    }
                                })
                            end
                            if dist < 20 and dist > 8 then
                                lib.showTextUI(locale("Client") .. ': ' .. math.round(dist, 0.1), {
                                    position = "left-center",
                                    icon = 'fa-book-skull',
                                    iconColor = "white",
                                    style = {
                                        backgroundColor = 'orange',
                                        color = 'white'
                                    }
                                })
                            end
                            if dist < 8 and dist > 2 then
                                lib.showTextUI(locale("Client") .. ': ' .. math.round(dist, 0.1), {
                                    position = "left-center",
                                    icon = 'fa-book-skull',
                                    iconColor = "white",
                                    style = {
                                        backgroundColor = 'green',
                                        color = 'white'
                                    }
                                })
                            end
                            if DoesEntityExist(Client) then
                            else
                                if SpawnPed then
                                    Client = CreatePed(5, PedHash, ClientPosition.x, ClientPosition.y, ClientPosition.z,
                                        0.0
                                        , true, true)
                                    PlaceObjectOnGroundProperly(Client)
                                    SetEntityAsMissionEntity(Client)
                                    SetEntityHeading(Client, ClientPosition.w)
                                    SpawnPed = false
                                end
                            end
                        else
                            lib.hideTextUI()
                        end

                        if dist < 2.0 and Selling then
                            PlaceObjectOnGroundProperly(Client)
                            FreezeEntityPosition(Client, true)
                            lib.hideTextUI()
                            if DoesEntityExist(Client) then
                                if Config.Target == "qtarget" then
                                    exports.qtarget:AddTargetEntity(Client, {
                                        options = {
                                            {
                                                action = function()
                                                    ClientMenu()
                                                end,
                                                icon = "fas fa-person",
                                                label = locale("Client"),
                                                canInteract = function()
                                                    if Selling then
                                                        return true
                                                    end
                                                end
                                            }
                                        },
                                        distance = 2
                                    })
                                elseif Config.Target == "qb-target" then
                                    exports['qb-target']:AddTargetEntity(Client, {
                                        options = {
                                            {
                                                type = "client",
                                                action = function()
                                                    ClientMenu()
                                                end,
                                                icon = "fas fa-person",
                                                label = locale("Client"),
                                                canInteract = function()
                                                    if Selling then
                                                        return true
                                                    end
                                                end
                                            }
                                        },
                                        distance = 2
                                    })
                                end
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
    end
end

CreateThread(function()
    while true do
        Wait(20000)
        if cooldown then
            cooldown = false
        end
    end
end)

AddEventHandler('drc_drugs:sell', function(data)
    if data.option == "sell" then
        lib.callback('drc_drugs:selling:getitem', false, function(value)
            if value and Selling then
                anim = Config.Drugs[sellingDrug].animation
                Selling = false
                negotiated = false
                MakeEntityFaceEntity(cache.ped, Client)
                MakeEntityFaceEntity(Client, cache.ped)
                PlayPedAmbientSpeechNative(Client, 'GENERIC_HI', 'Speech_Params_Force')
                local randomReport = math.random(1, 100)
                if randomReport <= ReportChance then
                    Dispatch(GetEntityCoords(Client), "drugselling")
                end
                RequestAnimDict('mp_common')

                while not HasAnimDictLoaded('mp_common') do
                    Wait(0)
                end

                obj = CreateObject(anim.model, 0, 0, 0, true)
                AttachEntityToEntity(obj, cache.ped, GetPedBoneIndex(cache.ped, anim.bone), anim.pos, anim.rot, 1, 1, 0,
                    1, 0, 1)
                obj2 = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), 0, 0, 0, true)
                AttachEntityToEntity(obj2, Client, GetPedBoneIndex(Client, 57005), 0.12, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0
                    , 1, 0, 1)

                TaskPlayAnim(cache.ped, 'mp_common', 'givetake1_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
                TaskPlayAnim(Client, 'mp_common', 'givetake1_a', 8.0, -8, -1, 49, 0, 0, 0, 0)

                Wait(1000)

                AttachEntityToEntity(obj2, cache.ped, GetPedBoneIndex(cache.ped, anim.bone), anim.pos, anim.rot, 1, 1, 0
                    , 1, 0, 1)
                AttachEntityToEntity(obj, Client, GetPedBoneIndex(Client, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0,
                    1, 0, 1)

                Wait(1000)
                DeleteEntity(obj)
                DeleteEntity(obj2)
                ClearPedTasks(cache.ped)
                ClearPedTasks(Client)
                PlayPedAmbientSpeechNative(Client, 'Generic_Hows_It_Going', 'Speech_Params_Force')
                FreezeEntityPosition(Client, false)
                SetPedAsNoLongerNeeded(Client)
                if Config.Debug then
                    print(price, sellingDrug, amount, label)
                end
                TSE('drc_drugs:selling:pay', math.ceil(price), sellingDrug, amount, label, math.ceil(oldprice))
                Client = nil
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, sellingDrug, amount)
    elseif data.option == "cancel" then
        local random = math.random(1, 100)
        if random <= AttackChance then
            PlayPedAmbientSpeechNative(Client, 'Generic_Fuck_You', 'Speech_Params_Force')
            SetPedAsEnemy(Client, true)
            TaskCombatPed(Client, cache.ped)
            Selling = false
            negotiated = false
            FreezeEntityPosition(Client, false)
            SetPedAsNoLongerNeeded(Client)
            Client = nil
            return
        else
            Selling = false
            negotiated = false
            PlayPedAmbientSpeechNative(Client, 'Generic_Fuck_You', 'Speech_Params_Force')
            FreezeEntityPosition(Client, false)
            SetPedAsNoLongerNeeded(Client)
            Client = nil
            return
        end
    elseif data.option == "canceldeal" then
        if lib.progressBar({
            duration = 5000,
            label = locale("SellCancelingDeal"),
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = {
                dict = "cellphone@",
                clip = "cellphone_call_listen_base",
                flags = 49,
            },

            prop = {
                model = `v_res_tre_banana`,
                pos = vec3(0.0, -0.02, -0.03),
                rot = vec3(90.0, 0.0, 190.0),
                bone = 28422
            },
        }) then
            Selling = false
            negotiated = false
            Client = nil
        end
    elseif data.option == "negotiate" then
        lib.callback('drc_drugs:selling:getitem', false, function(value)
            if value and not negotiated then
                MakeEntityFaceEntity(cache.ped, Client)
                MakeEntityFaceEntity(Client, cache.ped)
                negotiated = true
                if lib.progressBar({
                    duration = 6000,
                    label = locale("Negotiating"),
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
                    local random = math.random(1, 100)
                    if random <= chance then
                        price = price + price / 2
                        lib.registerContext({
                            id = 'SellMenu3',
                            title = locale("ClientOffer", price, amount, label),
                            options = {
                                [locale("Sell")] = {
                                    arrow = false,
                                    event = 'drc_drugs:sell',
                                    args = { option = "sell" }
                                },
                                [locale("Cancel")] = {
                                    arrow = false,
                                    event = 'drc_drugs:sell',
                                    args = { option = "cancel" }
                                }
                            }
                        })
                        lib.showContext('SellMenu3')
                    else
                        negotiated = false
                        Selling = false
                        Notify("error", locale("error"), locale("ClientDeclined"))
                        PlayPedAmbientSpeechNative(Client, 'Generic_Fuck_You', 'Speech_Params_Force')
                        FreezeEntityPosition(Client, false)
                        SetPedAsNoLongerNeeded(Client)
                        Client = nil
                        return
                    end
                end
            else
                Notify("error", locale("error"), locale("RequiredItems"))
            end
        end, sellingDrug, amount)
    end
end)
