local HasNuiFocus, IsFocusThreadRunning = false, false

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        SetCustomNuiFocus(false, false)
    end
end)

RegisterNUICallback('kapat', function(data, cb)
    Citizen.Wait(100)
    SetCustomNuiFocus(false, false)
end)

if config.openCommandEnable then
    RegisterCommand(config.openCommand, function()
        TriggerEvent("tgiann-carcontrol:open")
    end)
end

if config.openKeyEnable then
    Citizen.CreateThread(function()
        RegisterKeyMapping('carcontrol'..config.openKey, 'Car Control Menu', 'keyboard', config.openKey)
    end)  

    RegisterCommand('carcontrol'..config.openKey, function()
        TriggerEvent("tgiann-carcontrol:open")
    end, false)
end

RegisterNetEvent('tgiann-carcontrol:open')
AddEventHandler('tgiann-carcontrol:open', function(hasFocus, hasKeyboard, hasMouse, allControl)
    Citizen.Wait(100)
    SendNUIMessage({type = "open"})
    SetCustomNuiFocus(true, true)
end)

function SetCustomNuiFocus(hasKeyboard, hasMouse)
    HasNuiFocus = hasKeyboard or hasMouse
    SetNuiFocus(hasKeyboard, hasMouse)
    SetNuiFocusKeepInput(HasNuiFocus)
    TriggerEvent("tgiann-menuv3:nui-focus", HasNuiFocus, hasKeyboard, hasMouse, true)
end

RegisterNetEvent('tgiann-menuv3:nui-focus')
AddEventHandler('tgiann-menuv3:nui-focus', function(hasFocus, hasKeyboard, hasMouse, allControl)
    HasNuiFocus = hasFocus
    TriggerEvent("tgiann-base:focus", HasNuiFocus)
	if HasNuiFocus and not IsFocusThreadRunning then
		Citizen.CreateThread(function ()
            while HasNuiFocus do
                if hasKeyboard and not allControl then
                    DisableAllControlActions(0)
                    EnableControlAction(0, 249, true)
                elseif hasKeyboard and allControl then
                    DisableControlAction(0, 24, true) -- disable attack
                    DisableControlAction(0, 25, true) -- disable aim
                    DisableControlAction(0, 1, true) -- LookLeftRight
                    DisableControlAction(0, 2, true) -- LookUpDown
                end

                if not hasKeyboard and hasMouse then
                    DisableControlAction(0, 1, true)
                    DisableControlAction(0, 2, true)
                elseif hasKeyboard and not hasMouse then
                    EnableControlAction(0, 1, true)
                    EnableControlAction(0, 2, true)
                end

                Citizen.Wait(0)
			end
        end)
    end
end)

local checkCar = true
local lastvehicle = 0

local onsolcam = false
local onsagcam = false
local arkasolcam = false
local arkasagcam = false

local inDriveSeat = false

Citizen.CreateThread(function()
    while true do 
        local time = 100
        local playerPed = PlayerPedId()
        local inVeh = IsPedInAnyVehicle(playerPed)
        if inVeh then
            local veh = GetVehiclePedIsIn(playerPed)
            if lastvehicle ~= veh then
                lastvehicle = veh
                for i=0, 3 do
                    RollUpWindow(lastvehicle, i)
                end
                onsolcam = false
                onsagcam = false
                arkasolcam = false
                arkasagcam = false
            end
        end

        if HasNuiFocus then
            time = 1
            
            if inVeh then
                SetPauseMenuActive(false)
                if IsControlJustReleased(0, 177) then
                    SendNUIMessage({type = "close"})
                end

                inDriveSeat = GetPedInVehicleSeat(lastvehicle, -1) == playerPed

                local data = {
                    onsolkoltuk = checkSeat(-1),
                    onsagkoltuk = checkSeat(0),
                    arkasolkoltuk = checkSeat(1),
                    arkasagkoltuk = checkSeat(2),

                    start = checkInDriveSeat(GetIsVehicleEngineRunning(lastvehicle)),

                    bagaj = checkInDriveSeat(GetVehicleDoorAngleRatio(lastvehicle, 5) > 0),
                    kaput = checkInDriveSeat(GetVehicleDoorAngleRatio(lastvehicle, 4) > 0),

                    onsolcam = checkInDriveSeat(onsolcam),
                    onsagcam = checkInDriveSeat(onsagcam),
                    arkasolcam = checkInDriveSeat(arkasolcam),
                    arkasagcam = checkInDriveSeat(arkasagcam),

                    onsolkapi = checkInDriveSeat(GetVehicleDoorAngleRatio(lastvehicle, 0) > 0),
                    onsagkapi = checkInDriveSeat(GetVehicleDoorAngleRatio(lastvehicle, 1) > 0),
                    arkasolkapi = checkInDriveSeat(GetVehicleDoorAngleRatio(lastvehicle, 2) > 0),
                    arkasagkapi = checkInDriveSeat(GetVehicleDoorAngleRatio(lastvehicle, 3) > 0),

                }
                SendNUIMessage({type = "update", data = data})
            else
                SendNUIMessage({type = "close"})
            end
        end
        Citizen.Wait(time)
    end
end)

function checkSeat(no)
    if IsVehicleSeatFree(lastvehicle, no) then
        return false
    elseif GetPedInVehicleSeat(lastvehicle, no) == PlayerPedId() and not IsVehicleSeatFree(lastvehicle, no) then
        return true
    else
        return "pasif"
    end
end

function checkInDriveSeat(firstData)
    if inDriveSeat then
        return firstData
    else
        return "pasif"
    end
end

RegisterNUICallback('set', function(data)
    if data.tip == "onsolkoltuk" then
        if not checkSeat(-1) then
            SetPedIntoVehicle(PlayerPedId(), lastvehicle, -1)
        end
    elseif data.tip == "onsagkoltuk" then
        if not checkSeat(0) then
            SetPedIntoVehicle(PlayerPedId(), lastvehicle, 0)
        end
    elseif data.tip == "arkasolkoltuk" then
        if not checkSeat(1) then
            SetPedIntoVehicle(PlayerPedId(), lastvehicle, 1)
        end
    elseif data.tip == "arkasagkoltuk" then
        if not checkSeat(2) then
            SetPedIntoVehicle(PlayerPedId(), lastvehicle, 2)
        end

    elseif data.tip == "onsolkapi" and inDriveSeat then
        if GetVehicleDoorAngleRatio(lastvehicle, 0) == 0 then
            SetVehicleDoorOpen(lastvehicle, 0, false, false)
        else
            SetVehicleDoorShut(lastvehicle, 0, false, false)
        end
    elseif data.tip == "onsagkapi" and inDriveSeat then
        if GetVehicleDoorAngleRatio(lastvehicle, 1) == 0 then
            SetVehicleDoorOpen(lastvehicle, 1, false, false)
        else
            SetVehicleDoorShut(lastvehicle, 1, false, false)
        end
    elseif data.tip == "arkasolkapi" and inDriveSeat then
        if GetVehicleDoorAngleRatio(lastvehicle, 2) == 0 then
            SetVehicleDoorOpen(lastvehicle, 2, false, false)
        else
            SetVehicleDoorShut(lastvehicle, 2, false, false)
        end
    elseif data.tip == "arkasagkapi" and inDriveSeat then
        if GetVehicleDoorAngleRatio(lastvehicle, 3) == 0 then
            SetVehicleDoorOpen(lastvehicle, 3, false, false)
        else
            SetVehicleDoorShut(lastvehicle, 3, false, false)
        end
    elseif data.tip == "start" and inDriveSeat then
        if GetIsVehicleEngineRunning(lastvehicle) then
            SetVehicleEngineOn(lastvehicle, false, false, true)
        else
            SetVehicleEngineOn(lastvehicle, true, false, false)
        end
    elseif data.tip == "bagaj" and inDriveSeat then
        if GetVehicleDoorAngleRatio(lastvehicle, 5) == 0 then
            SetVehicleDoorOpen(lastvehicle, 5, false, false)
        else
            SetVehicleDoorShut(lastvehicle, 5, false, false)
        end
    elseif data.tip == "kaput" and inDriveSeat then
        if GetVehicleDoorAngleRatio(lastvehicle, 4) == 0 then
            SetVehicleDoorOpen(lastvehicle, 4, false, false)
        else
            SetVehicleDoorShut(lastvehicle, 4, false, false)
        end
    elseif data.tip == "onsolcam" and inDriveSeat then
        onsolcam = not onsolcam
        if onsolcam then
            RollDownWindow(lastvehicle, 0)
        else
            RollUpWindow(lastvehicle, 0)
        end
    elseif data.tip == "onsagcam" and inDriveSeat then
        onsagcam = not onsagcam
        if onsagcam then
            RollDownWindow(lastvehicle, 1)
        else
            RollUpWindow(lastvehicle, 1)
        end
    elseif data.tip == "arkasolcam" and inDriveSeat then
        arkasolcam = not arkasolcam
        if arkasolcam then
            RollDownWindow(lastvehicle, 2)
        else
            RollUpWindow(lastvehicle, 2)
        end
    elseif data.tip == "arkasagcam" and inDriveSeat then
        arkasagcam = not arkasagcam
        if arkasagcam then
            RollDownWindow(lastvehicle, 3)
        else
            RollUpWindow(lastvehicle, 3)
        end
    end
end)

RegisterCommand(config.seatCommand, function(source, args)
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed) then
        if args[1] == nil then Koltuk = -1 else Koltuk = Round(tonumber(args[1]-2)) end
        local Arac = GetVehiclePedIsIn(playerPed, false)
        if IsVehicleSeatFree(Arac, Koltuk) then 
            SetPedIntoVehicle(playerPed, Arac, Koltuk)
        else
            TriggerEvent('QBCore:Notify', "Seat taken!", "error")
        end
    end
end)

function Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

function showNotification(msg)
	BeginTextCommandThefeedPost('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandThefeedPostTicker(0,1)
end

if config.engineStartStopKeyEnable then
    Citizen.CreateThread(function()
        RegisterKeyMapping('carcontrolmotor'..config.engineStartStopKey, 'Engine Start/stop', 'keyboard', config.engineStartStopKey)
    end)  

    RegisterCommand('carcontrolmotor'..config.engineStartStopKey, function()
        local playerPed = PlayerPedId()
        local inVeh = IsPedInAnyVehicle(playerPed)
        if inVeh then
            local veh = GetVehiclePedIsIn(playerPed)
            if GetIsVehicleEngineRunning(veh) then
                SetVehicleEngineOn(veh, false, false, true)
            else
                SetVehicleEngineOn(veh, true, false, false)
            end
        end
    end, false)
end