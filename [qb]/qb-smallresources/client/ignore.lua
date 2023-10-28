local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
        Wait(10000)
    end
end)

maxTaserCarts = 2 -- The amount of taser cartridges a person can have.

local taserCartsLeft = maxTaserCarts

RegisterNetEvent("FillTaser")
AddEventHandler("FillTaser",function(source, args, rawCommand)
    
    QBCore.Functions.Progressbar("load_tazer", "Reloading Tazer..", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@weapons@pistol@singleshot_str",
        anim = "reload_aim",
        flags = 48,
    }, {}, {}, function() -- Done
    
        
        taserCartsLeft = maxTaserCarts
        TriggerServerEvent("QBCore:Server:RemoveItem", "taserammo", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taserammo"], "remove")
        
    end)
end)  

--add this also in the same area right below
local taserModel = GetHashKey("WEAPON_STUNGUN")

CreateThread(function()
while true do
   Wait(0)
   local ped = PlayerPedId()

   if GetSelectedPedWeapon(ped) == taserModel then
       if IsPedShooting(ped) then
           DisplayAmmoThisFrame(true)
           taserCartsLeft = taserCartsLeft - 1
       end
   end

   if taserCartsLeft <= 0 then
       if GetSelectedPedWeapon(ped) == taserModel then
           SetPlayerCanDoDriveBy(ped, false)
           DisablePlayerFiring(ped, true)
           if IsControlJustReleased(0, 106) then
               QBCore.Functions.Notify("You need to reload your taser!", "error")
           end
       end
   end

   if longerTazeTime then
       SetPedMinGroundTimeForStungun(ped, longerTazeSecTime * 1000)
   end
 end
end)


AddEventHandler("populationPedCreating", function(x, y, z)
	Wait(500) -- Give the entity some time to be created
	local _, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
	if Config.DisableAmbience then
		StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
		SetAudioFlag("DisableFlightMusic", true)
	end
	SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
end)

if Config.Stun.active then
    CreateThread(function()
        local sleep
        while true do
            sleep = 1000
            local ped = PlayerPedId()
            if IsPedBeingStunned(ped, 0) then
                sleep = 0
                SetPedMinGroundTimeForStungun(ped, math.random(Config.Stun.min, Config.Stun.max))
            end
            Wait(sleep)
        end
    end)
end

CreateThread(function()
	for dispatchService, enabled in pairs(Config.DispatchServices) do
		EnableDispatchService(dispatchService, enabled)
	end

	local wantedLevel = 0
	if Config.EnableWantedLevel then
		wantedLevel = 5
	end

	SetMaxWantedLevel(wantedLevel)
end)

if Config.IdleCamera then --Disable Idle Cinamatic Cam
    CreateThread(function()
        while true do
            InvalidateIdleCam()
            InvalidateVehicleIdleCam()
            Wait(1000) --The idle camera activates after 30 second so we don't need to call this per frame
        end
    end)
end

RegisterNetEvent('QBCore:Client:DrawWeapon', function()
    local sleep
    while true do
        sleep = 500
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        if weapon ~= `WEAPON_UNARMED` then
            if IsPedArmed(ped, 6) then
                sleep = 0
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end

            if weapon == `WEAPON_FIREEXTINGUISHER` or weapon == `WEAPON_PETROLCAN` then
                if IsPedShooting(ped) then
                    SetPedInfiniteAmmo(ped, true, weapon)
                end
            end
        else
            break
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    local pedPool = GetGamePool('CPed')
    for _, v in pairs(pedPool) do
        SetPedDropsWeaponsWhenDead(v, false)
    end
end)

CreateThread(function()
    while true do
        Wait(2500)
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        if Config.BlacklistedWeapons[weapon] then
            RemoveWeaponFromPed(ped, weapon)
        end
    end
end)

CreateThread(function()
    while Config.RemovePistolWhipping do
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
        Wait(5)
    end
end)