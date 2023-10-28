RegisterNetEvent('qb-bankrobbery:client:robberyCall', function(type, key, streetLabel, coords)
    if PlayerJob.name == 'police' or PlayerJob.name == 'bcso' or PlayerJob.name == 'sast' and onDuty then
        if type == 'small' then
            exports['ps-dispatch']:FleecaBankRobbery(camId)
        elseif type == 'paleto' then
            exports['ps-dispatch']:PaletoBankRobbery(camId)
        elseif type == 'pacific' then
            exports['ps-dispatch']:PacificBankRobbery(camId)
        end
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('10-90: Bank Robbery')
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)