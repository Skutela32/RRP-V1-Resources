local teleports = {
    -- MazeBank
    [1] = { text = "MazeBank Helipad", dest = { 2, 3, 8, 9 }, coord = vector3(-75.21, -824.83, 21.29), h = 157.83, veh = false },
}

-- Don't edit below this line.

local function Teleport(teleport)
    Citizen.CreateThread(function()
        for i, var in pairs(teleports) do
            if (i == teleport) then
                local player = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(player, false)
                local entity = player

                if (vehicle ~= 0) then
                    entity = vehicle
                    if (var.veh == false) then
                        BeginTextCommandThefeedPost("STRING")
                        AddTextComponentSubstringPlayerName("~r~Vehicles are not allowed.")
                        EndTextCommandThefeedPostTicker(true, false)
                        return
                    end
                end

                DoScreenFadeOut(500)
                Citizen.Wait(500)

                NetworkFadeOutEntity(entity, false, true)
                Citizen.Wait(500)

                SetEntityCoordsNoOffset(entity, var.coord.x, var.coord.y, var.coord.z, false, false, false)
                SetGameplayCamRelativeHeading(var.h)
                SetGameplayCamRelativePitch(-20.0, 1.0)
                SetEntityHeading(entity, var.h)

                Citizen.Wait(500)
                NetworkFadeInEntity(entity, true)

                Citizen.Wait(500)
                DoScreenFadeIn(500)
                if i == 200 then
                    TriggerEvent("online-interiors:enterCasino")
                end
            end
        end
    end)
end

local function DrawHelp(teleport)
    for i, var in pairs(teleports) do
        if (i == teleport) then
            DisableControlAction(0, 38, true)
            DisableControlAction(0, 68, true)
            DisableControlAction(0, 86, true)

            BeginTextCommandDisplayHelp("STRING")
            AddTextComponentSubstringPlayerName("Press ~INPUT_PICKUP~ to teleport.")
            EndTextCommandDisplayHelp(0, false, true, 1)

            if (IsDisabledControlJustPressed(0, 38)) then
                Teleport(var.dest[1])
            end
        end
    end
end

local function DrawMenu(teleport)
    for i, var in pairs(teleports) do
        if (i == teleport) then
            local safeZone = GetSafeZone()
            local menuX = 0.0 + safeZone.x
            local menuY = 0.0 + safeZone.y
            local menuW = 450
            local itemH = 38
            local itemM = 8

            if (var.overflow == nil) then
                var.overflow = { min = 1, max = itemM }
            end

            if (var.index == nil) then
                var.index = 1
            end

            DrawRectangle(menuX, menuY, menuW, 40, { 0, 0, 0, 255 })
            DrawText("TELEPORT", (menuX + 10), (menuY + 5), 0.34, 0, { 255, 255, 255, 255 }, false, false, "left", 0)
            DrawText(var.index .. "/" .. #var.dest, (menuX + 440), (menuY + 5), 0.34, 0, { 255, 255, 255, 255 }, false,
                false, "right", 0)
            menuY = menuY + 40

            local itemOffset = 0
            for i2, var2 in pairs(var.dest) do
                if (i2 >= var.overflow.min) and (i2 <= var.overflow.max) then
                    local bgColor = { 0, 0, 0, 190 }
                    local fgColor = { 255, 255, 255, 255 }

                    if (i2 == var.index) then
                        bgColor = { 240, 240, 240, 250 }
                        fgColor = { 0, 0, 0, 255 }
                    end

                    DrawRectangle(menuX, menuY + itemOffset, menuW, itemH, bgColor)
                    for i3, var3 in pairs(teleports) do
                        if (i3 == var2) then
                            DrawText(var3.text or "Null", menuX + 10, (menuY + itemOffset) + 4.5, 0.35, 0, fgColor, false,
                                false, "left", 0)
                        end
                    end

                    itemOffset = itemOffset + itemH
                end
            end

            if (#var.dest > itemM) then
                DrawRectangle(menuX, (menuY + itemOffset), menuW, 36, { 0, 0, 0, 255 })
                DrawSprite2("commonmenu", "shop_arrows_upanddown", menuX + 215, (menuY + itemOffset), 38, 38, 0.0,
                    { 255, 255, 255, 255 })
            end

            DisableControlAction(0, 73, true)
            DisableControlAction(2, 201, true)
            DisableControlAction(2, 188, true)
            DisableControlAction(2, 187, true)

            -- Select
            if (IsDisabledControlJustPressed(2, 201)) then
                for i2, var2 in pairs(var.dest) do
                    if (i2 == var.index) then
                        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                        Teleport(var2)
                        -- exit casino
                        if i == 200 then
                            TriggerEvent("online-interiors:exitCasino")
                        end
                    end
                end
            end

            -- Up
            if (IsDisabledControlJustPressed(2, 188)) then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if (#var.dest > itemM) then
                    if (var.index == var.overflow.min) then
                        if (var.index == 1) then
                            var.overflow.min = #var.dest - (itemM - 1)
                            var.overflow.max = #var.dest
                            var.index = #var.dest
                        else
                            var.overflow.min = var.overflow.min - 1
                            var.overflow.max = var.overflow.max - 1
                            var.index = var.index - 1
                        end
                    else
                        var.index = var.index - 1
                    end
                else
                    if (var.index == 1) then
                        var.index = #var.dest
                    else
                        var.index = var.index - 1
                    end
                end
            end

            -- Down
            if (IsDisabledControlJustPressed(2, 187)) then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if (#var.dest > itemM) then
                    if (var.index == var.overflow.max) then
                        if (var.index == #var.dest) then
                            var.overflow.min = 1
                            var.overflow.max = itemM
                            var.index = 1
                        else
                            var.overflow.min = var.overflow.min + 1
                            var.overflow.max = var.overflow.max + 1
                            var.index = var.index + 1
                        end
                    else
                        var.index = var.index + 1
                    end
                else
                    if (var.index == #var.dest) then
                        var.index = 1
                    else
                        var.index = var.index + 1
                    end
                end
            end
        end
    end
end

local player, playerCoords
local vehicle, vehicleCoords, playerIsDriver

Citizen.CreateThread(function()
    while (true) do
        player = PlayerPedId()
        playerCoords = GetEntityCoords(player)
        vehicle = GetVehiclePedIsIn(player, false)
        if vehicle ~= 0 then
            vehicleCoords = GetEntityCoords(vehicle)
            playerIsDriver = GetPedInVehicleSeat(vehicle, -1) == player
        end
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while (true) do
        local wait = 500

        for i, var in pairs(teleports) do
            if (#var.dest > 0) then
                local distance = #((vehicle ~= 0 and vehicleCoords or playerCoords) - var.coord)

                -- Draw distance for teleporter to appear
                if (distance < 75.0) then
                    wait = 0

                    DrawMarker(1, var.coord.x, var.coord.y, var.coord.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7,
                        0.9, 77, 181, 255, 0.8, false, false, 2,
                        false, nil, nil, false) -- LAST 4 SETS OF NUMBERS CONTROL THE COLOUR OF THE MARKER
                    -- DrawMarker(1, var.coord.x, var.coord.y, var.coord.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 0.9, 255, 255, 255, 255, false, false, 2, false, nil, nil, false)

                    -- Interaction distance
                    if (distance < 1.2) then
                        if (vehicle > 0 and playerIsDriver) or (vehicle == 0) then
                            if (#var.dest > 1) then
                                DrawMenu(i)
                            else
                                DrawHelp(i)
                            end
                        end
                    end
                end
            end
        end

        Citizen.Wait(wait)
    end
end)