local spawned = false
local admindata = true
local isDetected = false
AddEventHandler('playerSpawned', function()
    spawned = true
    return
end)


RegisterNetEvent('wx_anticheat:checkAdmin')
AddEventHandler('wx_anticheat:checkAdmin',function(data)
    admindata = data
end)

if wx.fakeTriggers then
    for k,v in pairs(wx.triggerList) do
      if string.lower(v.type) == 'client' then
        RegisterNetEvent(k)
        AddEventHandler(k,function()
            TriggerEvent("wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU", Locale.Trigger:format(k))
        end)
      end
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if wx.antiBlacklistedWeapon then
            Wait(250)
            for weaponname, weaponmodel in pairs(wx.Weapons) do
                if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponmodel), false) == 1 then
                    RemoveAllPedWeapons(PlayerPedId(), true)
                    if not isDetected or wx.Debug then
                        isDetected = true
                        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.BlacklistedWeapon:format(weaponname))
                    end
                end
            end
        end
        if wx.antiBlacklistedVehicles then
            Wait(100)
            for k,v in pairs(wx.vehicleBlacklist) do
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    local veh = GetEntityModel(vehicle)
                    if string.lower(GetDisplayNameFromVehicleModel(veh)) == k and v then
                        DeleteEntity(vehicle)
                        if not isDetected or wx.Debug then
                            isDetected = true
                            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.BlacklistedVeh:format(k))
                        end
                    end
                end
            end
        end
        if wx.antiPeds then
            Wait(2500)
            local pedmodel = GetEntityModel(PlayerPedId())
            for k,v in pairs(wx.pedBlacklist) do
                if pedmodel == GetHashKey(v) then
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Ped:format(v))
                end
            end
        end
        if wx.antiBlips then
            Wait(600)
            for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)
                if DoesBlipExist(GetBlipFromEntity(ped)) then
                    if not isDetected or wx.Debug then
                        isDetected = true
                        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Blips)
                    end
                    return
                end
            end
        end

    end
end)

if wx.antiMagicBullet then
    Citizen.CreateThread(function ()
        AddEventHandler("gameEventTriggered", function(name, args)
            local _entityowner = GetPlayerServerId(NetworkGetEntityOwner(args[2]))
            if _entityowner == GetPlayerServerId(PlayerId()) or args[2] == -1 then
                for k,ped in pairs(wx.playerModels) do
                    if IsEntityAPed(args[1]) and GetEntityModel(args[1]) == GetHashKey(ped) then
                        if not IsEntityOnScreen(args[1]) then
                            local entcoords = GetEntityCoords(args[1])
                            local dist = #(entcoords - GetEntityCoords(PlayerPedId()))
                            if dist < wx.MagicBulletDistance then
                                if not isDetected or wx.Debug then
                                    isDetected = true
                                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.MagicBullet:format(math.floor(dist+0.5)))
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)
end

if wx.antiBlacklistPlate then
    Citizen.CreateThread(function()
        while true do
            Wait(1500)
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                for i, plate in ipairs(wx.Plates) do
                    local currentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
                    if string.find(currentPlate, string.upper(plate)) then
                        if not isDetected or wx.Debug then
                            isDetected = true
                            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.VehiclePlate:format(plate))
                        end
                    end
                end
            end
        end
    end)
end

if wx.antiPlateChange then
    Citizen.CreateThread(function()
        while true do
            Wait(1500)
            if IsPedInAnyVehicle(PlayerPedId(), false) and not IsEntityVisible(PlayerPedId()) --[[ Vehicle shop bypass ]] then
                local currentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
                Wait(5000)
                if currentPlate ~= GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)) and GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)) ~= nil then
                    if not isDetected or wx.Debug then
                        isDetected = true
                        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.PlateChange:format(currentPlate,GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))))
                    end
                end
            end
        end
    end)
end

if wx.antiFastRun then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local playerSpeed = GetEntitySpeed(PlayerPedId())
            if not IsPedInAnyVehicle(PlayerPedId(),false) and IsPedRunning(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) and not IsPedDeadOrDying(PlayerPedId(),false) and playerSpeed > 10.0 and not IsPedClimbing(PlayerPedId()) and not IsPedDiving(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedInCover(PlayerPedId()) then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.FastRun)
                end
            end
        end
    end)
end
-- if wx.antiTeleport then
--     Citizen.CreateThread(function()
--         while true do
--             Citizen.Wait(0)
--             if not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPlayerSwitchInProgress() and not IsPlayerCamControlDisabled() then
--                 local position = GetEntityCoords(PlayerPedId())
--                 Citizen.Wait(5000)
--                 local newPed = PlayerPedId()
--                 local newposition = GetEntityCoords(newPed)
--                 local distance = #(vector3(position) - vector3(newposition))
--                 if distance > wx.maxDistance and not IsPedDeadOrDying(PlayerPedId(),false) and not IsPedInParachuteFreeFall(PlayerPedId()) and not IsPedJumpingOutOfVehicle(PlayerPedId()) and PlayerPedId() == newPed and not IsPlayerSwitchInProgress() and not IsPlayerCamControlDisabled() then
--                     TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', 'Teleporting')
--                 end
--             end
--         end
--     end)
-- end

-- Second checking loop

if wx.antiNoClip then
    Citizen.CreateThread(function()
        while true do
            Wait(250)
            local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
            local still = IsPedStill(PlayerPedId())
            local speed = GetEntitySpeed(PlayerPedId())
            Wait(1500)

            local newx,newy,newz = table.unpack(GetEntityCoords(PlayerPedId(),true))
            if GetDistanceBetweenCoords(x,y,z,newx,newy,newz) > 10.0 and not IsPedInParachuteFreeFall(PlayerPedId()) and not still and not IsPedFalling(PlayerPedId()) and GetEntityHeightAboveGround(PlayerPedId()) > 5.0 and spawned and not IsPedInAnyVehicle(PlayerPedId(),false) and not IsPedStill(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) and speed < 1.0 and not IsPedSwimming(PlayerPedId()) and not IsPedSwimmingUnderWater(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.NoClip)
                end
            end
        end
    end)
end

if wx.antiInfiniteRoll then
    Citizen.CreateThread(function ()
        while true do Wait(5000)
            local _, infiniteroll = StatGetInt(GetHashKey("mp0_shooting_ability"), true)
            if infiniteroll > 100 then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', "Infinite Combat Roll")
                end
            end
        end
    end)
end

if wx.antiSuperJump then
    Citizen.CreateThread(function ()
        while true do
            Wait(250)
            if wx.antiSuperJump then
                Wait(1)
                if IsPedJumping(PlayerPedId()) == 1 and GetEntityHeightAboveGround(PlayerPedId()) > 7.0 and GetEntitySpeed(PlayerPedId()) > 8.0 and not IsPedFalling(PlayerPedId()) then
                    if not isDetected or wx.Debug then
                        isDetected = true
                        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.SuperJump)
                    end
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Wait(500)
        if wx.antiHeadshot then
            local peds = PlayerPedId()
            SetPedSuffersCriticalHits(peds, false)
        end
        if wx.antiSpectate then
            if NetworkIsInSpectatorMode() then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Spectate, spawned)
                end
            end
        end
        if wx.antiNightVision then
            if GetUsingnightvision() and not IsPedInAnyHeli(PlayerPedId()) then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.NightVision)
                end
            end
        end
        if wx.antiThermal then
            if GetUsingseethrough() and not IsPedInAnyHeli(PlayerPedId()) then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ThermalVision)
                end
            end
        if wx.antiAimAssist then
            local aimassiststatus = GetLocalPlayerAimState_2()
            if aimassiststatus ~= 3 then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.AimAssist)
                end
            end
        end
        if wx.antiWeaponVehicles then
            if IsPedInAnyVehicle(PlayerPedId(),false) then
                if DoesVehicleHaveWeapons(GetVehiclePedIsIn(PlayerPedId(),false)) then
                    if not isDetected or wx.Debug then
                        isDetected = true
                        DisableVehicleWeapon(true, GetVehiclePedIsIn(PlayerPedId(),false), PlayerPedId())
                    end
                end
            end
        end
        if wx.antiRadar then
            if not IsPedInAnyVehicle(PlayerPedId(),true) and not IsRadarHidden() then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Radar)
                end
            end
        end
        if wx.BlacklistedTasks then
            for _,v in pairs(wx.TaskList) do
                if GetIsTaskActive(PlayerPedId(), v) then
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', "Blacklisted Task - ["..v.."]")
                end
            end
        end
        if wx.antiFreeCam then
            -- local camRight, camForward, camUp, camPosition = GetCamMatrix(GetRenderingCam())
            -- if camRight  ~= vector3(0, 0, 0) or camForward  ~= vector3(0, 0, 0) or camUp  ~= vector3(0, 0, 0) or camPosition  ~= vector3(0, 0, 0) then
            --     if not isDetected or wx.Debug then
            --         isDetected = true
            --         TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.FreeCam)
            --     end
            -- end
            local coordX, coordY, coordZ = table.unpack(GetEntityCoords(PlayerPedId()) - GetFinalRenderedCamCoord())
            if (coordX > wx.freecamDistance) or (coordY > wx.freecamDistance) or (coordZ > wx.freecamDistance) or (coordX < -wx.freecamDistance) or (coordY < -wx.freecamDistance) or (coordZ < -wx.freecamDistance) and not IsPedInAnyVehicle(PlayerPedId(),false) and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyTaxi(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedInAnyPoliceVehicle(PlayerPedId()) and not IsPedOnAnyBike(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) and spawned then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.FreeCam)
                end
            end
        end
        if wx.antiInvisible then
            if not IsEntityVisible(PlayerPedId()) and not IsEntityVisibleToScript(PlayerPedId()) or GetEntityAlpha(PlayerPedId()) <= 150 and GetEntityAlpha(PlayerPedId()) ~= 0 and spawned then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Invisibility)
                end
            end
        end
        if wx.antiInfiniteAmmo then
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
        end
        if wx.antiExplosiveAmmo then
            local weapon = GetSelectedPedWeapon(PlayerPedId())
            local damageType = GetWeaponDamageType(weapon)
            SetWeaponDamageModifier(GetHashKey("WEAPON_EXPLOSION"), 0.0) 
            if damageType == 4 or damageType == 5 or damageType == 6 or damageType == 13 then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ExploAmmo)
                end
            end
        end
        if wx.antiDamageBoost then
            if GetPlayerWeaponDamageModifier(PlayerId()) > wx.maximumModifier then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.WepDmgBoost)
                end
            end
            if GetPlayerMeleeWeaponDamageModifier(PlayerId()) > wx.maximumModifier then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.MelDefBoost)
                end
            end
        end
        if wx.antiDefenseBoost then
            if GetPlayerWeaponDefenseModifier(PlayerId()) > wx.maximumModifier then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.WepDefBoost)
                end
            end
            if GetPlayerMeleeWeaponDefenseModifier(PlayerId()) > wx.maximumModifier then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.MelDefBoost)
                end
            end
        end



    if wx.antiVDM then
        SetWeaponDamageModifier(-1553120962, 0.0) -- Sets vehicle damage to 0
        Wait(0)
    end
    if wx.antiInfiniteStamina then
        Wait(2000)
    if GetEntitySpeed(PlayerPedId()) > 7 and not IsPedInAnyVehicle(PlayerPedId(), true) and not IsPedFalling(PlayerPedId()) and not IsPedInParachuteFreeFall(PlayerPedId()) and not IsPedJumpingOutOfVehicle(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
        local staminalevel = GetPlayerSprintStaminaRemaining(PlayerId())
        if tonumber(staminalevel) == tonumber(0.0) then
            if not isDetected or wx.Debug then
                isDetected = true
                TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Stamina)
            end
        end
    end
end



-- if wx.antiBlacklistPlate then
--     if IsPedInAnyVehicle(PlayerPedId(), false) then
--         for _, plate in ipairs(wx.Plates) do
--             local currentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
--             if currentPlate == plate then
--                 TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', 'Blacklisted vehicle plate - ['..plate..']')
--             end
--         end
--     end
-- end
if wx.antiInvisible then
    if IsPedInAnyVehicle(PlayerPedId(),false) and IsVehicleVisible(GetVehiclePedIsIn(PlayerPedId(), false)) then
        if not isDetected or wx.Debug then
            isDetected = true
            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.InvisVehicle)
        end
    end
end


if wx.antiPickups then
    AddEventHandler("gameEventTriggered", function(name, args)
        if name == 'CEventNetworkPlayerCollectedPickup' then
            if not isDetected or wx.Debug then
                isDetected = true
                TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Pickup..' - ['..json.encode(args)..']')
            end
        end
    end)
end

if wx.antiSmallPed then
    local isSmall = GetPedConfigFlag(PlayerPedId(), 223, true)
    if isSmall then
        if not isDetected or wx.Debug then
            isDetected = true
            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.SmallPed)
        end
    end
    Wait(500)
end
if wx.antiRainbow then
    Wait(2500)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then
                local color1red, color1green, color1blue = GetVehicleCustomPrimaryColour(vehicle)
                Wait(1000)
                local color2red, color2green, color2blue = GetVehicleCustomPrimaryColour(vehicle)
                Wait(2000)
                local color3red, color3green, color3blue = GetVehicleCustomPrimaryColour(vehicle)
                if color1red ~= nil then
                    if color1red ~= color2red and color2red ~= color3red and color1green ~= color2green and color3green ~= color2green and color1blue ~= color2blue and color3blue ~= color2blue then
                        if not isDetected or wx.Debug then
                            isDetected = true
                            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.Rainbow)
                        end
                    end 
                end
            end
        else
            Wait(0)
        end
end
end
    end
end)

if wx.antiMenus then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(8000)
            local ModMenus = {
                {txd = "HydroMenu", txt = "HydroMenuHeader", name = "HydroMenu"},
                {txd = "CKGang", txt = "VlastnimTiFotra", name = "CKGang"},
                {txd = "John", txt = "John2", name = "SugarMenu"},
                {txd = "darkside", txt = "logo", name = "Darkside"},
                {txd = "ISMMENU", txt = "ISMMENUHeader", name = "ISMMENU"},
                {txd = "dopatest", txt = "duiTex", name = "Copypaste Menu"},
                {txd = "fm", txt = "menu_bg", name = "Fallout Menu"},
                {txd = "wave", txt = "logo", name ="Wave"},
                {txd = "wave1", txt = "logo1", name = "Wave (alt.)"},
                {txd = "meow2", txt = "woof2", name ="Alokas66", x = 1000, y = 1000},
                {txd = "adb831a7fdd83d_Guest_d1e2a309ce7591dff86", txt = "adb831a7fdd83d_Guest_d1e2a309ce7591dff8Header6", name ="Guest Menu"},
                {txd = "hugev_gif_DSGUHSDGISDG", txt = "duiTex_DSIOGJSDG", name="HugeV Menu"},
                {txd = "MM", txt = "menu_bg", name="Metrix Mehtods"},
                {txd = "wm", txt = "wm2", name="WM Menu"},
                {txd = "fm", txt = "menu_bg", name = "Fallout"},
                {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
                {txd = "Blood-X", txt="Blood-X", name="Blood-X Menu"},
                {txd = "Dopamine", txt="Dopameme", name="Dopamine Menu"},
                {txd = "Fallout", txt="FalloutMenu", name="Fallout Menu"},
                {txd = "Luxmenu", txt="Lux meme", name="LuxMenu"},
                {txd = "Reaper", txt="reaper", name="Reaper Menu"},
                {txd = "absoluteeulen", txt="Absolut", name="Absolut Menu"},
                {txd = "KekHack", txt="kekhack", name="KekHack Menu"},
                {txd = "Maestro", txt="maestro", name="Maestro Menu"},
                {txd = "SkidMenu", txt="skidmenu", name="Skid Menu"},
                {txd = "Brutan", txt="brutan", name="Brutan Menu"},
                {txd = "FiveSense", txt="fivesense", name="Fivesense Menu"},
                {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
                {txd = "Auttaja", txt="auttaja", name="Auttaja Menu"},
                {txd = "BartowMenu", txt="bartowmenu", name="Bartow Menu"},
                {txd = "Hoax", txt="hoaxmenu", name="Hoax Menu"},
                {txd = "FendinX", txt="fendin", name="Fendinx Menu"},
                {txd = "Hammenu", txt="Ham", name="Ham Menu"},
                {txd = "Lynxmenu", txt="Lynx", name="Lynx Menu"},
                {txd = "Oblivious", txt="oblivious", name="Oblivious Menu"},
                {txd = "malossimenuv", txt="malossimenu", name="Malossi Menu"},
                {txd = "memeeee", txt="Memeeee", name="Memeeee Menu"},
                {txd = "tiago", txt="Tiago", name="Tiago Menu"},
                {txd = "Hydramenu", txt="hydramenu", name="Hydra Menu"}
            }
            
            for _, data in pairs(ModMenus) do
                if data.x and data.y then
                    if GetTextureResolution(data.txd, data.txt).x == data.x and GetTextureResolution(data.txd, data.txt).y == data.y then
                        if not isDetected or wx.Debug then
                            isDetected = true
                            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ModMenu..' - ['..data.txt..']')
                        end
                    end
                else
                    if GetTextureResolution(data.txd, data.txt).x ~= 4.0 then
                        if not isDetected or wx.Debug then
                            isDetected = true
                            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ModMenu..' - ['..data.txt..']')
                        end
                    end
                end
            end
        end
    end)
end

if wx.antiAIs then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(15000)
            local weapons = {
                GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01'),
                GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'),
                GetHashKey('COMPONENT_APPISTOL_CLIP_01'),
                GetHashKey('COMPONENT_APPISTOL_CLIP_02'),
                GetHashKey('COMPONENT_MICROSMG_CLIP_01'),
                GetHashKey('COMPONENT_MICROSMG_CLIP_02'),
                GetHashKey('COMPONENT_SMG_CLIP_01'),
                GetHashKey('COMPONENT_SMG_CLIP_02'),
                GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01'),
                GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'),
                GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01'),
                GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'),
                GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01'),
                GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'),
                GetHashKey('COMPONENT_MG_CLIP_01'),
                GetHashKey('COMPONENT_MG_CLIP_02'),
                GetHashKey('COMPONENT_COMBATMG_CLIP_01'),
                GetHashKey('COMPONENT_COMBATMG_CLIP_02'),
                GetHashKey('COMPONENT_PUMPSHOTGUN_CLIP_01'),
                GetHashKey('COMPONENT_SAWNOFFSHOTGUN_CLIP_01'),
                GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01'),
                GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02'),
                GetHashKey('COMPONENT_PISTOL50_CLIP_01'),
                GetHashKey('COMPONENT_PISTOL50_CLIP_02'),
                GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01'),
                GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'),
                GetHashKey('COMPONENT_AT_RAILCOVER_01'),
                GetHashKey('COMPONENT_AT_AR_AFGRIP'),
                GetHashKey('COMPONENT_AT_PI_FLSH'),
                GetHashKey('COMPONENT_AT_AR_FLSH'),
                GetHashKey('COMPONENT_AT_SCOPE_MACRO'),
                GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
                GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'),
                GetHashKey('COMPONENT_AT_SCOPE_LARGE'),
                GetHashKey('COMPONENT_AT_SCOPE_MAX'),
                GetHashKey('COMPONENT_AT_PI_SUPP'),
            }
            for i = 1, #weapons do
                local dmg_mod = GetWeaponComponentDamageModifier(weapons[i])
                local accuracy_mod = GetWeaponComponentAccuracyModifier(weapons[i])
                local range_mod = GetWeaponComponentRangeModifier(weapons[i])
                if dmg_mod > wx.maximumModifier or accuracy_mod > wx.maximumModifier or range_mod > wx.maximumModifier then
                    if not isDetected or wx.Debug then
                        isDetected = true
                        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.CitizenAIs)
                    end
                end
            end
        end
    end)
end

if wx.antiSilentAim then
    CreateThread(function()
        while true do
            Wait(10000)
            local model = GetEntityModel(PlayerPedId())
            local min, max 	= GetModelDimensions(model)
            if min.y < -0.29 or max.z > 0.98 then
                if not isDetected or wx.Debug then
                    isDetected = true
                    TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.SilentAim)
                end
            end
        end
    end)
end
if wx.antiSoftAim then
    CreateThread(function()
        while true do 
            local ped = PlayerPedId()
            local weapon = GetSelectedPedWeapon(ped)
            -- SetPedConfigFlag(ped, 43, true) -- Disable lockon
            if weapon ~= 0 and weapon ~= `WEAPON_UNARMED` or weapon ~= `WEAPON_KNIFE` or weapon ~= `WEAPON_SWITCHBLADE` then
                local lockOn = GetLockonDistanceOfCurrentPedWeapon(ped)
                if lockOn > 500.0 then 
                    local player = PlayerId()
                    SetPlayerLockon(player, false)
                    SetPlayerLockonRangeOverride(player, -1.0)
                end
            end
            Wait(2500)
        end
    end)
end

if wx.antiResourceStart then
    AddEventHandler('onResourceStart', function(resourceName)
        if not wx.whitelistedResources[resourceName] then
            if not isDetected or wx.Debug then
                isDetected = true
                TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ResStart:format(resourceName))
            end
        end
    end)
end
if wx.antiResourceStop then
    AddEventHandler('onClientResourceStop', function(resourceName)
        if not wx.whitelistedResources[resourceName] then
            if not isDetected or wx.Debug then
                isDetected = true
                TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ResStop:format(resourceName))
            end
        end
    end)
end

----GOD MODE-----

if wx.antiGodMode then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000)
            local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof = GetEntityProofs(PlayerPedId())
            if not GetEntityCanBeDamaged(PlayerPedId()) or bulletProof or fireProof or explosionProof or collisionProof or meleeProof or steamProof or drownProof or GetEntityCollisionDisabled(PlayerPedId()) or GetPlayerInvincible(PlayerPedId()) == 1 then
                if IsPedInAnyVehicle(PlayerPedId(),false) and not wx.antiGodModeInVehicle then
                    -- if spawned then
                        if not isDetected or wx.Debug then
                            isDetected = true
                            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.GodMode)
                        end
                    -- end
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        local size = GetWeaponClipSize(weapon)
        if weapon ~= GetHashKey('WEAPON_UNARMED') then
            for k,v in pairs(wx.clipSize) do  
            if weapon == GetHashKey(v.weapon) then 
                if size > v.clip then
                    if not isDetected or wx.Debug then
                        isDetected = true
                        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.ClipSize:format(size,v.clip))
                    end
                    end
                end 
            end
        end
    end
end)

-- OCR

local ischecking = false

Citizen.CreateThread(function()
    Citizen.Wait(wx.OCRCheckInverval)
        if not ischecking then
            exports['screenshot-basic']:requestScreenshotUpload(OCR.Webhook, "files[]", {encoding = 'png', quality = 1}, function(data)
                local apiResponse = json.decode(data)
                Citizen.Wait(1000)
                SendNUIMessage({
                    type = "checkscreenshot",
                    screenshoturl = apiResponse.attachments[1].url
                })
            end)
            ischecking = true
        end
        Citizen.Wait(wx.OCRCheckInterval)
    
end)

if wx.Debug then
    RegisterCommand('bantest',function ()
        TriggerServerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1',GetPlayerServerId(PlayerId()),'cau pico')
    end,false)
end

Citizen.CreateThread(function()
    local Internal = {
        init = false,
        analysing = false,
        ticks = 2500
    }
    while true do 
        Citizen.Wait(wx.OCRCheckInterval)
            if not Internal.init then
                RegisterNUICallback("parsedText", function(data)
                    if data.image and data.text then
                        for index, word in next, wx.OCRWords, nil do
                            if string.find(string.lower(data.text), string.lower(word)) then
                                if not isDetected or wx.Debug then
                                    isDetected = true
                                    TriggerServerEvent(GetCurrentResourceName()..":ocrDetection", {word = word, image = data.image})
                                end
                                break
                            end
                        end
                    end
                    Internal.analysing = false
                end)
            end
            
                if not Internal.analysing then
                    exports['screenshot-basic']:requestScreenshotUpload(OCR.Webhook, "files[]", {encoding = 'png', quality = 1}, function(data)
                        local apiResponse = json.decode(data)
                        if apiResponse and apiResponse.attachments then
                            Internal.analysing = true
                            SendNUIMessage({
                                action = GetCurrentResourceName()..":checkScreen",
                                image = apiResponse.attachments[1].url
                            })
                        end
                    end)
                end

        Internal.init = true
    end
end)



RegisterNUICallback('devtoolsdetected', function()
    if wx.antiNUIDevTools then
        if not isDetected or wx.Debug then
            isDetected = true
            TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', Locale.DevTools)
        end
    end
end)

function ReqAndDelete(object, detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end
		if detach then
			DetachEntity(object, 0, false)
		end
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

BadObjs = {"prop_gold_cont_01", "p_cablecar_s", "stt_prop_stunt_tube_l", "stt_prop_stunt_track_dwuturn", "stt_prop_ramp_jump_xs",  "stt_prop_ramp_adj_loop",  "ex_props_exec_crashedp",  "xm_prop_x17_osphatch_40m",  "p_spinning_anus_s",  "xm_prop_x17_sub", "prop_windmill_01", "prop_weed_pallet", "hei_prop_carrier_radar_1_l1", "v_res_mexball", "prop_rock_1_a", "prop_rock_1_b", "prop_rock_1_c", "prop_rock_1_d", "prop_player_gasmask", "prop_rock_1_e", "prop_rock_1_f", "prop_rock_1_g", "prop_rock_1_h", "prop_test_boulder_01", "prop_test_boulder_02", "prop_test_boulder_03", "prop_test_boulder_04", "apa_mp_apa_crashed_usaf_01a", "ex_prop_exec_crashdp", "apa_mp_apa_yacht_o1_rail_a", "apa_mp_apa_yacht_o1_rail_b", "apa_mp_h_yacht_armchair_01", "apa_mp_h_yacht_armchair_03", "apa_mp_h_yacht_armchair_04", "apa_mp_h_yacht_barstool_01", "apa_mp_h_yacht_bed_01", "apa_mp_h_yacht_bed_02", "apa_mp_h_yacht_coffee_table_01", "apa_mp_h_yacht_coffee_table_02", "apa_mp_h_yacht_floor_lamp_01", "apa_mp_h_yacht_side_table_01", "apa_mp_h_yacht_side_table_02", "apa_mp_h_yacht_sofa_01", "apa_mp_h_yacht_sofa_02", "apa_mp_h_yacht_stool_01", "apa_mp_h_yacht_strip_chair_01", "apa_mp_h_yacht_table_lamp_01", "apa_mp_h_yacht_table_lamp_02", "apa_mp_h_yacht_table_lamp_03", "prop_flag_columbia", "apa_mp_apa_yacht_o2_rail_a", "apa_mp_apa_yacht_o2_rail_b", "apa_mp_apa_yacht_o3_rail_a", "apa_mp_apa_yacht_o3_rail_b", "apa_mp_apa_yacht_option1", "proc_searock_01", "apa_mp_h_yacht_", "apa_mp_apa_yacht_option1_cola", "apa_mp_apa_yacht_option2", "apa_mp_apa_yacht_option2_cola", "apa_mp_apa_yacht_option2_colb", "apa_mp_apa_yacht_option3", "apa_mp_apa_yacht_option3_cola", "apa_mp_apa_yacht_option3_colb", "apa_mp_apa_yacht_option3_colc", "apa_mp_apa_yacht_option3_cold", "apa_mp_apa_yacht_option3_cole", "apa_mp_apa_yacht_jacuzzi_cam", "apa_mp_apa_yacht_jacuzzi_ripple003", "apa_mp_apa_yacht_jacuzzi_ripple1", "apa_mp_apa_yacht_jacuzzi_ripple2", "apa_mp_apa_yacht_radar_01a", "apa_mp_apa_yacht_win", "prop_crashed_heli", "apa_mp_apa_yacht_door", "prop_shamal_crash", "xm_prop_x17_shamal_crash", "apa_mp_apa_yacht_door2", "apa_mp_apa_yacht", "prop_flagpole_2b", "prop_flagpole_2c", "prop_flag_canada", "apa_prop_yacht_float_1a", "apa_prop_yacht_float_1b", "apa_prop_yacht_glass_01", "apa_prop_yacht_glass_02", "apa_prop_yacht_glass_03", "apa_prop_yacht_glass_04", "apa_prop_yacht_glass_05", "apa_prop_yacht_glass_06", "apa_prop_yacht_glass_07", "apa_prop_yacht_glass_08", "apa_prop_yacht_glass_09", "apa_prop_yacht_glass_10", "prop_flag_canada_s", "prop_flag_eu", "prop_flag_eu_s", "prop_target_blue_arrow", "prop_target_orange_arrow", "prop_target_purp_arrow", "prop_target_red_arrow", "apa_prop_flag_argentina", "apa_prop_flag_australia", "apa_prop_flag_austria", "apa_prop_flag_belgium", "apa_prop_flag_brazil", "apa_prop_flag_canadat_yt", "apa_prop_flag_china", "apa_prop_flag_columbia", "apa_prop_flag_croatia", "apa_prop_flag_czechrep", "apa_prop_flag_denmark", "apa_prop_flag_england", "apa_prop_flag_eu_yt", "apa_prop_flag_finland", "apa_prop_flag_france", "apa_prop_flag_german_yt", "apa_prop_flag_hungary", "apa_prop_flag_ireland", "apa_prop_flag_israel", "apa_prop_flag_italy", "apa_prop_flag_jamaica", "apa_prop_flag_japan_yt", "apa_prop_flag_canada_yt", "apa_prop_flag_lstein", "apa_prop_flag_malta", "apa_prop_flag_mexico_yt", "apa_prop_flag_netherlands", "apa_prop_flag_newzealand", "apa_prop_flag_nigeria", "apa_prop_flag_norway", "apa_prop_flag_palestine", "apa_prop_flag_poland", "apa_prop_flag_portugal", "apa_prop_flag_puertorico", "apa_prop_flag_russia_yt", "apa_prop_flag_scotland_yt", "apa_prop_flag_script", "apa_prop_flag_slovakia", "apa_prop_flag_slovenia", "apa_prop_flag_southafrica", "apa_prop_flag_southkorea", "apa_prop_flag_spain", "apa_prop_flag_sweden", "apa_prop_flag_switzerland", "apa_prop_flag_turkey", "apa_prop_flag_uk_yt", "apa_prop_flag_us_yt", "apa_prop_flag_wales", "prop_flag_uk", "prop_flag_uk_s", "prop_flag_us", "prop_flag_usboat", "prop_flag_us_r", "prop_flag_us_s", "prop_flag_france", "prop_flag_france_s", "prop_flag_german", "prop_flag_german_s", "prop_flag_ireland", "prop_flag_ireland_s", "prop_flag_japan", "prop_flag_japan_s", "prop_flag_ls", "prop_flag_lsfd", "prop_flag_lsfd_s", "prop_flag_lsservices", "prop_flag_lsservices_s", "prop_flag_ls_s", "prop_flag_mexico", "prop_flag_mexico_s", "prop_flag_russia", "prop_flag_russia_s", "prop_flag_s", "prop_flag_sa", "prop_flag_sapd", "prop_flag_sapd_s", "prop_flag_sa_s", "prop_flag_scotland", "prop_flag_scotland_s", "prop_flag_sheriff", "prop_flag_sheriff_s", "prop_flag_uk", "prop_flag_uk_s", "prop_flag_us", "prop_flag_usboat", "prop_flag_us_r", "prop_flag_us_s", "prop_flamingo", "prop_swiss_ball_01", "prop_air_bigradar_l1", "prop_air_bigradar_l2", "prop_air_bigradar_slod", "p_fib_rubble_s", "prop_money_bag_01", "p_cs_mp_jet_01_s", "prop_poly_bag_money", "prop_air_radar_01", "hei_prop_carrier_radar_1", "prop_air_bigradar", "prop_carrier_radar_1_l1", "prop_asteroid_01", "prop_xmas_ext", "p_oil_pjack_01_amo", "p_oil_pjack_01_s", "p_oil_pjack_02_amo", "p_oil_pjack_03_amo", "p_oil_pjack_02_s", "p_oil_pjack_03_s", "prop_aircon_l_03", "prop_med_jet_01", "p_med_jet_01_s", "hei_prop_carrier_jet", "bkr_prop_biker_bblock_huge_01", "bkr_prop_biker_bblock_huge_02", "bkr_prop_biker_bblock_huge_04", "bkr_prop_biker_bblock_huge_05", "hei_prop_heist_emp", "prop_weed_01", "prop_air_bigradar", "prop_juicestand", "prop_lev_des_barge_02", "hei_prop_carrier_defense_01", "prop_aircon_m_04", "prop_mp_ramp_03", "stt_prop_stunt_track_dwuturn", "ch3_12_animplane1_lod", "ch3_12_animplane2_lod", "hei_prop_hei_pic_pb_plane", "light_plane_rig", "prop_cs_plane_int_01", "prop_dummy_plane", "prop_mk_plane", "v_44_planeticket", "prop_planer_01", "ch3_03_cliffrocks03b_lod", "ch3_04_rock_lod_02", "csx_coastsmalrock_01_", "csx_coastsmalrock_02_", "csx_coastsmalrock_03_", "csx_coastsmalrock_04_", "mp_player_introck", "Heist_Yacht", "csx_coastsmalrock_05_", "mp_player_int_rock", "mp_player_introck", "prop_flagpole_1a", "prop_flagpole_2a", "prop_flagpole_3a", "prop_a4_pile_01", "cs2_10_sea_rocks_lod", "cs2_11_sea_marina_xr_rocks_03_lod", "prop_gold_cont_01", "prop_hydro_platform", "ch3_04_viewplatform_slod", "ch2_03c_rnchstones_lod", "proc_mntn_stone01", "prop_beachflag_le", "proc_mntn_stone02", "cs2_10_sea_shipwreck_lod", "des_shipsink_02", "prop_dock_shippad", "des_shipsink_03", "des_shipsink_04", "prop_mk_flag", "prop_mk_flag_2", "proc_mntn_stone03", "FreeModeMale01", "rsn_os_specialfloatymetal_n", "rsn_os_specialfloatymetal", "cs1_09_sea_ufo", "rsn_os_specialfloaty2_light2", "rsn_os_specialfloaty2_light", "rsn_os_specialfloaty2", "rsn_os_specialfloatymetal_n", "rsn_os_specialfloatymetal", "P_Spinning_Anus_S_Main", "P_Spinning_Anus_S_Root", "cs3_08b_rsn_db_aliencover_0001cs3_08b_rsn_db_aliencover_0001_a", "sc1_04_rnmo_paintoverlaysc1_04_rnmo_paintoverlay_a", "rnbj_wallsigns_0001", "proc_sml_stones01", "proc_sml_stones02", "maverick", "Miljet", "proc_sml_stones03", "proc_stones_01", "proc_stones_02", "proc_stones_03", "proc_stones_04", "proc_stones_05", "proc_stones_06", "prop_coral_stone_03", "prop_coral_stone_04", "prop_gravestones_01a", "prop_gravestones_02a", "prop_gravestones_03a", "prop_gravestones_04a", "prop_gravestones_05a", "prop_gravestones_06a", "prop_gravestones_07a", "prop_gravestones_08a", "prop_gravestones_09a", "prop_gravestones_10a", "prop_prlg_gravestone_05a_l1", "prop_prlg_gravestone_06a", "test_prop_gravestones_04a", "test_prop_gravestones_05a", "test_prop_gravestones_07a", "test_prop_gravestones_08a", "test_prop_gravestones_09a", "prop_prlg_gravestone_01a", "prop_prlg_gravestone_02a", "prop_prlg_gravestone_03a", "prop_prlg_gravestone_04a", "prop_stoneshroom1", "prop_stoneshroom2", "v_res_fa_stones01", "test_prop_gravestones_01a", "test_prop_gravestones_02a", "prop_prlg_gravestone_05a", "FreemodeFemale01", "p_cablecar_s", "stt_prop_stunt_tube_l", "stt_prop_stunt_track_dwuturn", "p_spinning_anus_s", "prop_windmill_01", "hei_prop_heist_tug", "prop_air_bigradar", "p_oil_slick_01", "prop_dummy_01", "hei_prop_heist_emp", "p_tram_cash_s", "hw1_blimp_ce2", "prop_fire_exting_1a", "prop_fire_exting_1b", "prop_fire_exting_2a", "prop_fire_exting_3a", "hw1_blimp_ce2_lod", "hw1_blimp_ce_lod", "hw1_blimp_cpr003", "hw1_blimp_cpr_null", "hw1_blimp_cpr_null2", "prop_lev_des_barage_02", "hei_prop_carrier_defense_01", "prop_juicestand", "S_M_M_MovAlien_01", "s_m_m_movalien_01", "s_m_m_movallien_01", "u_m_y_babyd", "CS_Orleans", "A_M_Y_ACult_01", "S_M_M_MovSpace_01", "U_M_Y_Zombie_01", "s_m_y_blackops_01", "a_f_y_topless_01", "a_c_boar", "a_c_cat_01", "a_c_chickenhawk", "a_c_chimp", "s_f_y_hooker_03", "a_c_chop", "a_c_cormorant", "a_c_cow", "a_c_coyote", "v_ilev_found_cranebucket", "p_cs_sub_hook_01_s", "a_c_crow", "a_c_dolphin", "a_c_fish", "hei_prop_heist_hook_01", "prop_rope_hook_01", "prop_sub_crane_hook", "s_f_y_hooker_01", "prop_vehicle_hook", "prop_v_hook_s", "prop_dock_crane_02_hook", "prop_winch_hook_long", "a_c_hen", "a_c_humpback", "a_c_husky", "a_c_killerwhale", "a_c_mtlion", "a_c_pigeon", "a_c_poodle", "prop_coathook_01", "prop_cs_sub_hook_01", "a_c_pug", "a_c_rabbit_01", "a_c_rat", "a_c_retriever", "a_c_rhesus", "a_c_rottweiler", "a_c_sharkhammer", "a_c_sharktiger", "a_c_shepherd", "a_c_stingray", "a_c_westy", "CS_Orleans", "prop_windmill_01", "prop_Ld_ferris_wheel", "p_tram_crash_s", "p_oil_slick_01", "p_ld_stinger_s", "p_ld_soc_ball_01", "p_parachute1_s", "p_cablecar_s", "prop_beach_fire", "prop_lev_des_barge_02", "prop_lev_des_barge_01", "prop_sculpt_fix", "prop_flagpole_2b", "prop_flagpole_2c", "prop_winch_hook_short", "prop_flag_canada", "prop_flag_canada_s", "prop_flag_eu", "prop_flag_eu_s", "prop_flag_france", "prop_flag_france_s", "prop_flag_german", "prop_ld_hook", "prop_flag_german_s", "prop_flag_ireland", "prop_flag_ireland_s", "prop_flag_japan", "prop_flag_japan_s", "prop_flag_ls", "prop_flag_lsfd", "prop_flag_lsfd_s", "prop_cable_hook_01", "prop_flag_lsservices", "prop_flag_lsservices_s", "prop_flag_ls_s", "prop_flag_mexico", "prop_flag_mexico_s", "csx_coastboulder_00", "des_tankercrash_01", "des_tankerexplosion_01", "des_tankerexplosion_02", "des_trailerparka_02", "des_trailerparkb_02", "des_trailerparkc_02", "des_trailerparkd_02", "des_traincrash_root2", "des_traincrash_root3", "des_traincrash_root4", "des_traincrash_root5", "des_finale_vault_end", "des_finale_vault_root001", "des_finale_vault_root002", "des_finale_vault_root003", "des_finale_vault_root004", "des_finale_vault_start", "des_vaultdoor001_root001", "des_vaultdoor001_root002", "des_vaultdoor001_root003", "des_vaultdoor001_root004", "des_vaultdoor001_root005", "des_vaultdoor001_root006", "des_vaultdoor001_skin001", "des_vaultdoor001_start", "des_traincrash_root6", "prop_ld_vault_door", "prop_vault_door_scene", "prop_vault_door_scene", "prop_vault_shutter", "p_fin_vaultdoor_s", "prop_gold_vault_fence_l", "prop_gold_vault_fence_r", "prop_gold_vault_gate_01", "des_traincrash_root7", "prop_flag_russia", "prop_flag_russia_s", "prop_flag_s", "ch2_03c_props_rrlwindmill_lod", "prop_flag_sa", "prop_flag_sapd", "prop_flag_sapd_s", "prop_flag_sa_s", "prop_flag_scotland", "prop_flag_scotland_s", "prop_flag_sheriff", "prop_flag_sheriff_s", "prop_flag_uk", "prop_yacht_lounger", "prop_yacht_seat_01", "prop_yacht_seat_02", "prop_yacht_seat_03", "marina_xr_rocks_02", "marina_xr_rocks_03", "prop_test_rocks01", "prop_test_rocks02", "prop_test_rocks03", "prop_test_rocks04", "marina_xr_rocks_04", "marina_xr_rocks_05", "marina_xr_rocks_06", "prop_yacht_table_01", "csx_searocks_02", "csx_searocks_03", "csx_searocks_04", "csx_searocks_05", "p_spinning_anus_s", "stt_prop_ramp_jump_xs", "stt_prop_ramp_adj_loop", "ex_props_exec_crashedp", "xm_prop_x17_osphatch_40m", "p_spinning_anus_s", "xm_prop_x17_sub", "csx_searocks_06", "p_yacht_chair_01_s", "p_yacht_sofa_01_s", "prop_yacht_table_02", "csx_coastboulder_00", "csx_coastboulder_01", "csx_coastboulder_02", "csx_coastboulder_03", "csx_coastboulder_04", "csx_coastboulder_05", "csx_coastboulder_06", "csx_coastboulder_07", "csx_coastrok1", "csx_coastrok2", "csx_coastrok3", "csx_coastrok4", "csx_coastsmalrock_01", "csx_coastsmalrock_02", "csx_coastsmalrock_03", "csx_coastsmalrock_04", "csx_coastsmalrock_05", "prop_yacht_table_03", "prop_flag_uk_s", "prop_flag_us", "prop_flag_usboat", "prop_flag_us_r", "prop_flag_us_s", "p_gasmask_s", "prop_flamingo", "p_crahsed_heli_s", "prop_rock_4_big2", "prop_fnclink_05crnr1", "prop_cs_plane_int_01", "prop_windmill_01"}

Citizen.CreateThread(function()
	while wx.antiObjectAttach do
		local CageObjs = BadObjs
		Citizen.Wait(500)
		local ped = PlayerPedId()
		local handle, object = FindFirstObject()
		local finished = false
		repeat
			Wait(1000)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
					ReqAndDelete(object, true)
				end
			end
			for i=1,#CageObjs do
				if GetEntityModel(object) == GetHashKey(CageObjs[i]) then
					ReqAndDelete(object, false)
				end
			end
			finished, object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)

AddStateBagChangeHandler(nil, nil, function(bagName, key, value) 
	if #key > 131072 then
		TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', "State bag crash attempt")
	end
end)


RegisterNetEvent('wx_anticheat:checkTaze', function()
    if not HasPedGotWeapon(PlayerPedId(), `WEAPON_STUNGUN`, false) then
        TriggerServerEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU', "Taze through Mod Menu")
    end
end)

