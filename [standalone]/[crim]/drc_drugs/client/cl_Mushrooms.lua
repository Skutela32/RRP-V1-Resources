local spawnedMushroomsLeaf = 0
local MushroomsPlants = {}
local TSE = TriggerServerEvent
local inside = false

local MushroomsField = CircleZone:Create(Config.MushroomsField.coords, Config.MushroomsField.radius,
	{ name = Config.MushroomsField.name,
		debugPoly = Config.MushroomsField.debugPoly, useZ = true
	}
)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(MushroomsPlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

MushroomsField:onPlayerInOut(function(isInside)
	if isInside then
		while spawnedMushroomsLeaf < 10 do
			Wait(0)
			local MushroomsCoords = GenerateMushroomsLeafCoords()
			RequestModel(Config.MushroomsField.prop)
			while not HasModelLoaded(Config.MushroomsField.prop) do
				Wait(0)
			end
			local obj = CreateObject(Config.MushroomsField.prop, MushroomsCoords.x, MushroomsCoords.y, MushroomsCoords.z, true,
				true, false)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(MushroomsPlants, obj)
			spawnedMushroomsLeaf = spawnedMushroomsLeaf + 1
		end
	end
end)

MushroomsField:onPlayerInOut(function(isInside)
	if isInside then
		inside = true
	else
		inside = false
	end
end)

if Config.Target == "qtarget" then
	exports.qtarget:AddTargetModel(Config.MushroomsField.prop, {
		options = {
			{
				action = function(entity)
					PickUpMushroom(entity)
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
	exports['qb-target']:AddTargetModel(Config.MushroomsField.prop, {
		options = {
			{
				type = "client",
				action = function(entity)
					PickUpMushroom(entity)
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

function GenerateMushroomsLeafCoords()
	while true do
		Wait(1)

		local MushroomCoordX, MushroomCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(math.floor(Config.MushroomsField.radius * -1) + 2,
			math.floor(Config.MushroomsField.radius) - 2)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(math.floor(Config.MushroomsField.radius * -1) + 2,
			math.floor(Config.MushroomsField.radius) - 2)
		MushroomCoordX = Config.MushroomsField.coords.x + modX
		MushroomCoordY = Config.MushroomsField.coords.y + modY

		local coordZ = GetCoordZMushrooms(MushroomCoordX, MushroomCoordY)
		local coord = vector3(MushroomCoordX, MushroomCoordY, coordZ)
		if ValidateMushroomsLeafCoord(coord) then
			return coord
		end
	end
end

function GetCoordZMushrooms(x, y)
	local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 70.0
end

function ValidateMushroomsLeafCoord(plantCoord)
	local validate = true
	if spawnedMushroomsLeaf > 0 then
		for k, v in pairs(MushroomsPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
	end
	return validate
end

function PickUpMushroom(target)
	local nearbyID
	for i = 1, #MushroomsPlants, 1 do
		local dist = #(GetEntityCoords(cache.ped) - GetEntityCoords(MushroomsPlants[i]))
		if dist < 2 then
			nearbyID = i
		end
	end
	if IsPedOnFoot(cache.ped) then
		lib.callback('drc_drugs:mushroom:getitem', false, function(value)
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
						table.remove(MushroomsPlants, nearbyID)
						spawnedMushroomsLeaf = spawnedMushroomsLeaf - 1
						TSE('drc_drugs:mushroom:giveitems', "MushroomPickup")
					end
				end
			else
				Notify("error", locale("error"), locale("RequiredItems"))
			end
		end, "MushroomPickup")
	else
		Wait(500)
	end
end
