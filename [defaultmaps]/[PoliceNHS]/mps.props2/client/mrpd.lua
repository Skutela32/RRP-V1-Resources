Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local stationCoords = vector3(442.429, -985.581, 29.885)

        local distance = #(playerCoords - stationCoords)

        if distance <= 80 then
            ClearAreaOfPeds(442.429, -985.581, 29.885, 58.0, 0)
        end

        Citizen.Wait(0)
    end
end)