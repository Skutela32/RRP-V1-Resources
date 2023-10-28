function searchDist(vehicle)
	local dist = ""
	local p = promise.new()
	QBCore.Functions.TriggerCallback('jim-mechanic:distGrab', function(cb) p:resolve(cb) end, trim(GetVehicleNumberPlateText(vehicle)))
	dist = Citizen.Await(p)
	if dist ~= "" then
		if Config.System.distkph then
			dist = Loc[Config.Lan]["functions"].distance..string.format("%.2f", (math.floor(dist) * 0.001)).."Km"
		else
			dist = Loc[Config.Lan]["functions"].distance..string.format("%.2f", (math.floor(dist) * 0.000621371)).."Mi"
		end
	end
    return dist
end

function getClass(vehicle)
	local classlist = {
		"Compacts", 		--1
		"Sedans", 			--2
		"SUVs", 			--3
		"Coupes", 			--4
		"Muscle", 			--5
		"Sports Classics", 	--6
		"Sports", 			--7
		"Super", 			--8
		"Motorcycles", 		--9
		"Off-road", 		--10
		"Industrial", 		--11
		"Utility", 			--12
		"Vans", 			--13
		"Cycles", 			--14
		"Boats", 			--15
		"Helicopters", 		--16
		"Planes", 			--17
		"Service", 			--18
		"Emergency", 		--19
		"Military", 		--20
		"Commercial", 		--21
		"Trains", 			--22
	}
	return classlist[GetVehicleClass(vehicle) + 1], GetVehicleClass(vehicle)
end

function getClosest(coords)
	local vehs = { 71, 0, 2, 4, 6, 7, 23, 127, 260, 2146, 2175, 12294, 16834, 16386, 20503, 32768, 67590, 67711, 98309, 100359 }
	for _, v in pairs(vehs) do if GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, v) ~= 0 then vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, v) break end end
	return vehicle
end

local lastCar = nil
local newName = nil
function searchCar(vehicle)
	if lastCar ~= vehicle then -- Check added to use old info instead of checking again
		lastCar = vehicle
		newName = nil
		for k, v in pairs(QBCore.Shared.Vehicles) do
			if tonumber(v.hash) == GetEntityModel(vehicle) then
			if Config.System.Debug then print("^5Debug^7: ^2Vehicle info found in^7 ^4vehicles^7.^4lua^7: ^6"..v.hash.. " ^7(^6"..QBCore.Shared.Vehicles[k].name.."^7)") end
			newName = QBCore.Shared.Vehicles[k].name.." "..QBCore.Shared.Vehicles[k].brand
			end
		end
		if Config.System.Debug then if not newName then print("^5Debug^7: ^2Vehicle ^1not ^2found in ^4vehicles^7.^4lua^7: ^6"..GetEntityModel(vehicle).." ^7(^6"..GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower().."^7)") end end
		if not newName then newName = string.upper(GetMakeNameFromVehicleModel(GetEntityModel(vehicle)).." "..GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) end
		if Config.System.Menu == "ox" then newName = newName.."\n" end
		return newName
	else
		return newName
	end
end

function searchPrice(vehicle)
	local price = nil
	for k, v in pairs(QBCore.Shared.Vehicles) do
		if tonumber(v.hash) == GetEntityModel(vehicle) then
		price = cv(QBCore.Shared.Vehicles[k].price)
		end
	end
	if not price then price = (0)..br end
    return price
end

-- Push as in push to every player
-- Doubles up as a way to reduce spam of commands
function pushVehicle(entity)
	--if Config.System.Debug then print("^5Debug^7: ^3pushVehicle^7: ^2Running function^7...") end
	SetVehicleModKit(entity, 0)
	if entity ~= 0 and DoesEntityExist(entity) then
		if not NetworkHasControlOfEntity(entity) then
			if Config.System.Debug then print("^5Debug^7: ^3pushVehicle^7: ^2Requesting network control of vehicle^7.") end
			NetworkRequestControlOfEntity(entity)
			local timeout = 2000
			while timeout > 0 and not NetworkHasControlOfEntity(entity) do
				Wait(100)
				timeout = timeout - 100
			end
			if NetworkHasControlOfEntity(entity) and Config.System.Debug then print("^5Debug^7: ^3pushVehicle^7: ^2Network has control of entity^7.") end
		end
		if not IsEntityAMissionEntity(entity) then
			if Config.System.Debug then print("^5Debug^7: ^3pushVehicle^7: ^2Setting vehicle as a ^7'^2mission^7' &2entity^7.") end
			SetEntityAsMissionEntity(entity, true, true)
			local timeout = 2000
			while timeout > 0 and not IsEntityAMissionEntity(entity) do
				Wait(100)
				timeout = timeout - 100
			end
			if IsEntityAMissionEntity(entity) and Config.System.Debug then print("^5Debug^7: ^3pushVehicle^7: ^2Vehicle is a ^7'^2mission^7'^2 entity^7.") end
		end
	end
end

local updateDelay = {}
function updateCar(vehicle)
	if DoesEntityExist(vehicle) and vehicle ~= 0 and vehicle ~= nil then
		updateDelay[vehicle] = { delay = Config.updateDelay or 2, mods = QBCore.Functions.GetVehicleProperties(vehicle) }
		if Config.System.Debug then print("^5Debug^7: ^2Updating database timer started/reset^7: '^6" ..updateDelay[vehicle].mods.plate.."^7' - ^4"..(updateDelay[vehicle].delay * 10).." ^2Seconds^7.") end
	else
		if Config.System.Debug then print("^5Debug^7: ^1ERROR^7 - ^2Attempted to add vehicle to update timer but vehicle entity recieved was ^7'^6nil^7'") end
	end
end

function forceUpdateCar(vehicle, mods)
	if IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then
		-- Attempt to update database mods
		TriggerServerEvent('jim-mechanic:updateVehicle', mods, trim(mods.plate))
		if Config.System.Debug then print("^5Debug^7: ^2Updating database mods of vehicle^7: '^6" ..mods.plate.."^7'") end
		-- Attempt to update status damages
		local mechDamages = {}
		local p = promise.new() QBCore.Functions.TriggerCallback('jim-mechanic:server:GetStatus', function(cb) p:resolve(cb) end, trim(GetVehicleNumberPlateText(vehicle)))
		mechDamages = Citizen.Await(p) or {} mechDamages.body = nil mechDamages.engine = nil
		TriggerServerEvent('jim-mechanic:server:saveStatus', mechDamages, trim(GetVehicleNumberPlateText(vehicle)), GetVehicleEngineHealth(vehicle), GetVehicleBodyHealth(vehicle))
	end
	--Update everyone with the new changes (helps syncing)
	TriggerServerEvent("jim-mechanic:server:updateCar", VehToNet(vehicle), mods)
end

CreateThread(function()
	while true do
		for veh in pairs(updateDelay) do
			if updateDelay[veh].delay and updateDelay[veh].delay > 0 then
				updateDelay[veh].delay = updateDelay[veh].delay - 1
				if updateDelay[veh].delay <= 0 then
					if updateDelay[veh].delay then
						if DoesEntityExist(veh) and veh ~= 0 and veh ~= nil then
							forceUpdateCar(veh, updateDelay[veh].mods)
						end
					end
					updateDelay[veh] = nil
				end
			end
		end
		Wait(10000)
	end
end)

RegisterNetEvent("jim-mechanic:forceProperties", function(vehicle, props) -- This forces updates of the vehicle from the person who updated it
	if NetToVeh(vehicle) ~= 0 and DoesEntityExist(NetToVeh(vehicle)) then
		SetVehicleModKit(NetToVeh(vehicle), 0)
		QBCore.Functions.SetVehicleProperties(NetToVeh(vehicle), props)
	end
end)

function inCar()
	local inCar = false
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		triggerNotify(nil, Loc[Config.Lan]["functions"].inCar, "error")
		inCar = false
	else inCar = true end
	return inCar
end

function outCar()
	local outCar = false
	if not IsPedSittingInAnyVehicle(PlayerPedId()) then
		triggerNotify(nil, Loc[Config.Lan]["functions"].outCar, "error")
		outCar = false
	else outCar = true end
	return outCar
end

function lockedCar(vehicle)
	local locked = false
	if GetVehicleDoorLockStatus(vehicle) >= 2 then
		triggerNotify(nil, Loc[Config.Lan]["functions"].locked, "error")
		locked = true
	else locked = false end
	return locked
end

function nearPoint(coords)
	if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then triggerNotify(nil, Loc[Config.Lan]["functions"].nearby, "error") near = false
	else near = true end
	return near
end

function locationChecks()
	local check = true
	if Config.Main.JobLocationRequired then
		if inLocation == "" then check = false
			triggerNotify(nil, Loc[Config.Lan]["functions"].shop, "error")
		end
	end
	return check
end


function previewLocationChecks()
	if not inpreview then triggerNotify(nil, "Can't Check Mods Here", "error") end
	return inpreview
end

function jobChecks()
	local check = true
	if Config.Main.ItemRequiresJob == true then check = false
		for _, v in pairs(Config.Main.JobRoles) do
			if v == PlayerJob.name then check = true end
		end
		if check == false then triggerNotify(nil, Loc[Config.Lan]["functions"].mechanic, "error") end
	end
	return check
end

function previewJobChecks()
	local check = false
	for _, v in pairs(Config.Main.JobRoles) do
		if v == PlayerJob.name then check = true break end
	end
	if check == false then
		triggerNotify(nil, Loc[Config.Lan]["functions"].mechanic, "error")
	end
	return check
end

function qblog(text)
	local Player = QBCore.Functions.GetPlayerData()
	TriggerServerEvent('qb-log:server:CreateLog', 'vehicleupgrades', GetCurrentResourceName() .. " - "..Player.charinfo.firstname.." "..Player.charinfo.lastname.."("..Player.source..") ["..Player.citizenid.."]", 'blue',	text)
	if Config.System.Debug then print("^5QBLog Message^7: ^3"..GetCurrentResourceName() .. " - "..Player.charinfo.firstname.." "..Player.charinfo.lastname.."("..Player.source..") ["..Player.citizenid.."]^7", text) end
end

function Checks()
	if not jobChecks() then return false end
	if not locationChecks() then return false end
	if not inCar() then return false end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return false end
	return true
end

function vehChecks()
	local vehicle = nil
	local Ped = PlayerPedId()
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end
	if lockedCar(vehicle) then return end
	if Config.Main.isVehicleOwned and not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then triggerNotify(nil, Loc[Config.Lan]["common"].owned, "error") return end
	return vehicle
end

function lookAtWheel(vehicle)
	local found = false local Pos = nil
	for _, v in pairs({"wheel_lf","wheel_rf","wheel_lm1","wheel_rm1","wheel_lm2","wheel_rm2","wheel_lm3","wheel_rm3","wheel_lr", "wheel_rr"}) do
		Pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
		if #(GetEntityCoords(PlayerPedId()) - Pos) <= 1.5 then	found = true break end
	end
	lookVeh(Pos)
	if not found then triggerNotify(nil, Loc[Config.Lan]["common"].nearwheel, "error") else return found end
end

function lookAtEngine(vehicle)
	local found = false local Pos = nil
	for _, v in pairs({"engine"}) do
		if (#(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 2.0) and (GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v)) ~= vec3(0,0,0)) then
			Pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v)) found = true break
		else found = true Pos = vehicle end
	end
	lookVeh(Pos)
	if not found then triggerNotify(nil, Loc[Config.Lan]["common"].nearengine, "error") else return found end
end

function trim(value) if not value then return nil end return (string.gsub(value, '^%s*(.-)%s*$', '%1')) end

--not a function, but a widely used event
RegisterNetEvent('jim-mechanic:client:Menu:Close', function() local Ped = PlayerPedId()
	emptyHands(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
	local vehicle = nil
	if IsPedSittingInAnyVehicle(PlayerPedId()) then	vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	else vehicle = getClosest(GetEntityCoords(PlayerPedId())) end
	for i = 0, 5 do	SetVehicleDoorShut(vehicle, i, false, true) end
	exports['qb-menu']:closeMenu()
end)

function emptyHands(playerPed, dpemote)
	if dpemote ~= nil then TriggerEvent('animations:client:EmoteCommandStart', {"c"}) ClearPedTasks(playerPed)
	else ClearPedTasks(playerPed) end
	for k, v in pairs(GetGamePool('CObject')) do
		for _, model in pairs({`prop_sponge_01`, `prop_weld_torch`, `prop_rag_01`, `prop_fib_clipboard`, `v_ind_cs_toolbox4`, `p_amb_clipboard_01`, `ng_proc_spraycan01b`, `idrp_racing_harness`}) do
			if GetEntityModel(v) == model then
				if IsEntityAttachedToEntity(playerPed, v) then
					unloadModel(model)
					DeleteObject(v)
					DetachEntity(v, 0, 0)
					SetEntityAsMissionEntity(v, true, true)
					Wait(100)
					DeleteEntity(v)
				end
			end
		end
	end
end

function getDamages(vehicle) local veh = { engine = 0, body = 0, windows = {}, doors = {}, wheels = {} }
	veh.engine = GetVehicleEngineHealth(vehicle)
	veh.body = GetVehicleBodyHealth(vehicle)
	for i = 0, 6 do
		veh.windows[i] = IsVehicleWindowIntact(vehicle, i)
	end
	for i = 0, 6 do
		veh.doors[i] = IsVehicleDoorDamaged(vehicle, i)
	end
	for i = 0, 15 do
		if IsVehicleTyreBurst(vehicle, i, false) then
			if IsVehicleTyreBurst(vehicle, i, true) then
				veh.wheels[i] = true
			else
				veh.wheels[i] = false
			end
		end
	end
	return veh
end

function doCarDamage(currentVehicle, veh)
	veh.engine += 0.0 veh.body += 0.0
	if veh.engine < 200.0 then veh.engine = 200.0 end if veh.engine > 1000.0 then veh.engine = 1000.0 end
	if veh.body < 150.0 then veh.body = 150.0 end if veh.body > 1000.0 then veh.body = 1000.0 end
    SetVehicleEngineHealth(currentVehicle, veh.engine)
    for k, v in pairs(veh.windows) do
        if v then return end
        RemoveVehicleWindow(currentVehicle, k)
    end
    for k, v in pairs(veh.doors) do
        if not v then return end
        SetVehicleDoorBroken(currentVehicle, k, true)
    end
	for k in pairs(veh.wheels) do
		SetVehicleTyreBurst(currentVehicle, 0, veh.wheels[k], 990.0)
	end
end

function nosBar(level)
	local bartable = {}
	for i = 1, 10 do bartable[i] = "<span style='color:green'>░</span>" end
	if level <= 91 then bartable[10] = "<span style='color:grey'>░</span>" end
	if level <= 81 then bartable[9] = "<span style='color:grey'>░</span>" end
	if level <= 71 then bartable[8] = "<span style='color:grey'>░</span>" for i = 1, 7 do bartable[i] = "<span style='color:yellow'>▓</span>" end end
	if level <= 61 then bartable[7] = "<span style='color:grey'>░</span>" end
	if level <= 51 then bartable[6] = "<span style='color:grey'>░</span>" end
	if level <= 41 then bartable[5] = "<span style='color:grey'>░</span>" end
	if level <= 31 then bartable[4] = "<span style='color:grey'>░</span>" for i = 1, 3 do bartable[i] = "<span style='color:red'>▓</span>" end end
	if level <= 21 then bartable[3] = "<span style='color:grey'>░</span>" end
	if level <= 11 then bartable[2] = "<span style='color:grey'>░</span>" end
	if level <= 1 then bartable[1] = "<span style='color:grey'>░</span>" end
	local bar = ""
	for i = 1, 10 do bar = bar..bartable[i] end
	if Config.System.Menu == "ox" then bar = "" end
	return bar
end

function progressBar(data)
	local result = nil
	lockInv(true)
	if data.cam then startTempCam(data.cam) end
	if Config.System.ProgressBar == "ox" then
		if exports.ox_lib:progressBar({	duration = Config.System.Debug and 1000 or data.time, label = data.label, useWhileDead = data.dead or false, canCancel = data.cancel or true,
			anim = { dict = data.dict, clip = data.anim, flag = (data.flag == 8 and 32 or data.flag) or nil, scenario = data.task }, disable = { combat = true }, }) then
			result = true
			lockInv(false)
			if data.cam then stopTempCam(data.cam) end
		else
			result = false
			lockInv(false)
			if data.cam then stopTempCam(data.cam) end
		end
	else
		QBCore.Functions.Progressbar("mechbar",	data.label,	Config.System.Debug and 1000 or data.time, data.dead, data.cancel or true,
			{ disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
			{ animDict = data.dict, anim = data.anim, flags = (data.flag == 8 and 32 or data.flag) or nil, task = data.task }, {}, {}, function()
				result = true
				lockInv(false)
				if data.cam then stopTempCam(data.cam) end
		end, function()
			result = false
				lockInv(false)
				if data.cam then stopTempCam(data.cam) end
		end, data.icon)
	end
	while result == nil do Wait(10) end
	return result
end

function checkRestriction() local Ped = PlayerPedId()
	local restrictions = nil, nil, nil
	for _, v in pairs(Config.Locations) do
		if inLocation == v.designatedName then
			if v.Restrictions and v.Restrictions then restrictions = v.Restrictions	end
			break
		end
	end
	if restrictions ~= nil then return restrictions
	else return false end
end

function enforceRestriction(type)
    local Restrictions = checkRestriction()
	local restrictionTable = {}
	if Config.Main.JobLocationRequired and Restrictions then
        for k, v in pairs (Restrictions.Allow) do restrictionTable[v] = true end
        if not restrictionTable[type] then
			local typeTable = {
				["perform"] = "You can't change performance in this location",
				["cosmetics"] = "You can't change cosmetics in this location" ,
				["nos"] = "You can't change NOS in this location",
				["repairs"] = "You can't repair in this location",
			}
			triggerNotify(nil, typeTable[type], "error") return false end
	end
	return true
end

function enforceClassRestriction(class)
    local Restrictions = checkRestriction()
	local restrictionTable = {}
	if Config.Main.JobLocationRequired and Restrictions then
        for k, v in pairs(Restrictions.Vehicle) do restrictionTable[v] = true end
        if not restrictionTable[class] then
			triggerNotify(nil, "You can't modify "..class.." at this location", "error") return false end
	end
	return true
end

function convertOxRGB(string)
	string = string:gsub("rgb", "[")
	string = string:gsub("%(", '"')
	string = string:gsub(",", '","')
	string = string:gsub("%)", '"]')
	string = string:gsub("%s", "")
	string = json.decode(string)
	return string
end

RegisterNetEvent('vehiclemod:client:fixEverything', function()
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            local plate = trim(GetVehicleNumberPlateText(veh))
            TriggerServerEvent("vehiclemod:server:fixEverything", plate)
        end
    end
end)