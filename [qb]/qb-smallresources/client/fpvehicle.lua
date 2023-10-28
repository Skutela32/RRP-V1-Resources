Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local player = PlayerId()
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        
        if DoesEntityExist(vehicle) then
            local isPlayerShooting = IsPlayerFreeAiming(player)
            local isInVehicle = IsPedInAnyVehicle(GetPlayerPed(-1), false)
            
            if isInVehicle and isPlayerShooting then
                DisableControlAction(0, 24, true)  -- Disable the shooting control (LMB)
            end
        end
    end
end)
