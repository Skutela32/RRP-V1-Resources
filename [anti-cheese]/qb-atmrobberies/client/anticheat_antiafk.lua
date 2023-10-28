if wx.antiAFK then
    Citizen.CreateThread(function()
    while true do
        local coords = GetEntityCoords(PlayerPedId())
        Wait(wx.antiAFKtime*1000)
        if GetDistanceBetweenCoords(coords,GetEntityCoords(PlayerPedId())) == 0.0 then
            TriggerServerEvent('wx_anticheat:afk')
        end
    end
    end)
end