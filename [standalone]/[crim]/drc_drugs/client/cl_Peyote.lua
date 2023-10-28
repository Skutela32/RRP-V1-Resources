local spawnedPeyoteLeaf = 0
local PeyotePlants = {}
local TSE = TriggerServerEvent
local inside = false

local PeyoteField = CircleZone:Create(Config.PeyoteField.coords, Config.PeyoteField.radius,
	{ name = Config.PeyoteField.name,
		debugPoly = Config.PeyoteField.debugPoly, useZ = true
	}
)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(PeyotePlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

PeyoteField:onPlayerInOut(function(isInside)
	if isInside then
		while spawnedPeyoteLeaf < 15 do
			Wait(0)
			local PeyoteCoords = GeneratePeyoteLeafCoords()
			RequestModel(Config.PeyoteField.prop)
			while not HasModelLoaded(Config.PeyoteField.prop) do
				Wait(100)
			end
			local obj = CreateObject(Config.PeyoteField.prop, PeyoteCoords.x, PeyoteCoords.y, PeyoteCoords.z, true,
				true, false)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(PeyotePlants, obj)
			spawnedPeyoteLeaf = spawnedPeyoteLeaf + 1
		end
	end
end)

PeyoteField:onPlayerInOut(function(isInside)
	if isInside then
		inside = true
	else
		inside = false
	end
end)

if Config.Target == "qtarget" then
	exports.qtarget:AddTargetModel(Config.PeyoteField.prop, {
		options = {
			{
				action = function(entity)
					PickUpPeyote(entity)
				end,
				icon = "fas fa-leaf",
				label = locale("pickup"),
				canInteract = function()
					if inside then
						return true
					end
				end
			},
		},
		distance = 3
	})
elseif Config.Target == "qb-target" then
	exports['qb-target']:AddTargetModel(Config.PeyoteField.prop, {
		options = {
			{
				type = "client",
				action = function(entity)
					PickUpPeyote(entity)
				end,
				icon = "fas fa-leaf",
				label = locale("pickup"),
				canInteract = function()
					if inside then
						return true
					end
				end
			},
		},
		distance = 3
	})
end

function GeneratePeyoteLeafCoords()
	while true do
		Wait(1)

		local PeyoteCoordX, PeyoteCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(math.floor(Config.PeyoteField.radius * -1) + 2, math.floor(Config.PeyoteField.radius) - 2)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(math.floor(Config.PeyoteField.radius * -1) + 2, math.floor(Config.PeyoteField.radius) - 2)
		PeyoteCoordX = Config.PeyoteField.coords.x + modX
		PeyoteCoordY = Config.PeyoteField.coords.y + modY

		local coordZ = GetCoordZPeyote(PeyoteCoordX, PeyoteCoordY)
		local coord = vector3(PeyoteCoordX, PeyoteCoordY, coordZ)

		if ValidatePeyoteLeafCoord(coord) then
			return coord
		end
	end
end

function GetCoordZPeyote(x, y)
	local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 20.0
end

function ValidatePeyoteLeafCoord(plantCoord)
	if spawnedPeyoteLeaf > 0 then
		local validate = true

		for k, v in pairs(PeyotePlants) do
			local dist = #(plantCoord - GetEntityCoords(v))
			if dist < 5 then
				validate = false
			end
		end
		local validdist = #(plantCoord - Config.PeyoteField.coords)
		if validdist > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function PickUpPeyote(target)
	local nearbyID
	for i = 1, #PeyotePlants, 1 do
		local dist = #(GetEntityCoords(cache.ped) - GetEntityCoords(PeyotePlants[i]))
		if dist < 2 then
			nearbyID = i
		end
	end
	if IsPedOnFoot(cache.ped) then
		lib.callback('drc_drugs:peyote:getitem', false, function(value)
			if value then
				if not lib.progressActive() then
					if lib.progressBar({
						duration = 10000,
						label = locale("pickingup"),
						useWhileDead = false,
						canCancel = true,
						disable = {
							move = true,
							car = true,
							combat = true,
							mouse = false,
						},
						anim = {
							scenario = "world_human_gardener_plant",
						},
					}) then
						TSE('drc_drugs:deleteprop', ObjToNet(target))
						SetEntityAsMissionEntity(target, false, true)
						DeleteObject(target)
						table.remove(PeyotePlants, nearbyID)
						spawnedPeyoteLeaf = spawnedPeyoteLeaf - 1
						TSE('drc_drugs:peyote:giveitems', "PeyotePickup")
					end
				end
			else
				Notify("error", locale("error"), locale("RequiredItems"))
			end
		end, "PeyotePickup")
	else
		Wait(500)
	end
end
