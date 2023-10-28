local SpawnedHeroinPlants = 0
local HeroinPlants = {}
local TSE = TriggerServerEvent
local inside = false

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(HeroinPlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

RegisterNetEvent("drc_drugs:heroin:menu", function(data)
	if data.menu == "HeroinProcess" then
		lib.registerContext({
			id = 'DrugsHeroinMenu',
			title = locale("table"),
			options = {
				[Config.Heroin.Process.header] = {
					arrow = false,
					description = Config.Heroin.Process.description,
					event = 'drc_drugs:heroin:progress',
					args = { menu = data.menu }
				}
			}
		})
		lib.showContext('DrugsHeroinMenu')
	end
end)

local HeroinField = CircleZone:Create(Config.Heroin.Field.coords, Config.Heroin.Field.radius, {
	name = Config.Heroin.Field.name,
	debugPoly = Config.Heroin.Field.debugPoly, useZ = true
})

function ValidateHeroinCoord(plantCoord)
	local validate = true
	if SpawnedHeroinPlants > 0 then
		for k, v in pairs(HeroinPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
	end
	return validate
end

function GetCoordZHeroin(x, y)
	local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 70.0
end

RegisterNetEvent("drc_drugs:heroin:progress")
AddEventHandler("drc_drugs:heroin:progress", function(data)
	if data.menu == "HeroinProcess" then
		lib.callback('drc_drugs:heroin:getitem', false, function(value)
			if value then
				if not lib.progressActive() then
					SetEntityCoords(cache.ped, Config.Heroin.Process.Teleport, false, false, false, true)
					TaskTurnPedToFaceCoord(cache.ped, Config.Heroin.Process.coords, 2000)
					if lib.progressBar({
						duration = Config.Crack.Process.Duration,
						label = locale("HeroinProcessing"),
						useWhileDead = false,
						canCancel = false,
						disable = {
							move = true,
							car = true,
							combat = true,
							mouse = false,
						},
						anim = {
							dict = "mini@drinking",
							clip = "shots_barman_b",
						},
						prop = {
							model = "bkr_prop_meth_sodium",
							pos = vec3(0.14, -0.35, -0.28),
							rot = vec3(-60.0, -20.0, -10.0),
							bone = 57005
						},
					}) then
						TSE("drc_drugs:heroin:giveitems", data.menu)
					end
				end
			else
				Notify("error", locale("error"), locale("RequiredItems"))
			end
		end, data.menu)
	end
end)

function GenerateHeroinCoords()
	while true do
		Wait(0)

		local heroinCoordX, heroinCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(math.floor(Config.Heroin.Field.radius * -1) + 2, math.floor(Config.Heroin.Field.radius) - 2)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(math.floor(Config.Heroin.Field.radius * -1) + 2, math.floor(Config.Heroin.Field.radius) - 2)

		heroinCoordX = Config.Heroin.Field.coords.x + modX
		heroinCoordY = Config.Heroin.Field.coords.y + modY

		local coordZ = GetCoordZHeroin(heroinCoordX, heroinCoordY)
		local coord = vector3(heroinCoordX, heroinCoordY, coordZ)

		if ValidateHeroinCoord(coord) then
			return coord
		end
	end
end

HeroinField:onPlayerInOut(function(isInside)
	if isInside then
		inside = true
		while SpawnedHeroinPlants < 15 do
			Wait(0)
			local heroinCoords = GenerateHeroinCoords()
			RequestModel(Config.Heroin.Field.prop)
			while not HasModelLoaded(Config.Heroin.Field.prop) do
				Wait(100)
			end
			local obj = CreateObject(Config.Heroin.Field.prop, heroinCoords.x, heroinCoords.y, heroinCoords.z, true, true, false)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(HeroinPlants, obj)
			SpawnedHeroinPlants = SpawnedHeroinPlants + 1
		end
	else
		inside = false
	end
end)

HeroinField:onPlayerInOut(function(isInside)
	if isInside then
		inside = true
	else
		inside = false
	end
end)

if Config.Target == "qtarget" then
	exports.qtarget:AddTargetModel(Config.Heroin.Field.prop, {
		options = {
			{
				action = function(entity)
					PickUpPoppy(entity)
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
		distance = 4
	})
elseif Config.Target == "qb-target" then
	exports['qb-target']:AddTargetModel(Config.Heroin.Field.prop, {
		options = {
			{
				type = "client",
				action = function(entity)
					PickUpPoppy(entity)
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
		distance = 4
	})
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if Config.Target == "qtarget" then
			exports.qtarget:RemoveZone('HeroinProcess')
		elseif Config.Target == "qb-target" then
			exports['qb-target']:RemoveZone('HeroinProcess')
		end
	end
end)

if Config.Target == "qtarget" then
	exports.qtarget:AddCircleZone("HeroinProcess", Config.Heroin.Process.coords, Config.Heroin.Process.radius,
		{ name = "HeroinProcess", debugPoly = Config.Debug, useZ = true },
		{ options = {
			{ event = "drc_drugs:heroin:menu", icon = "fas fa-prescription-bottle", label = locale("HeroinProcess"),
				menu = "HeroinProcess",
			}
		},
			distance = 2.5
		}
	)
elseif Config.Target == "qb-target" then
	exports['qb-target']:AddCircleZone("HeroinProcess", Config.Heroin.Process.coords, Config.Heroin.Process.radius,
		{ name = "HeroinProcess", debugPoly = Config.Debug, useZ = true },
		{ options = {
			{ type = "client", event = "drc_drugs:heroin:menu", icon = "fas fa-prescription-bottle",
				label = locale("HeroinProcess"),
				menu = "HeroinProcess",
			}
		},
			distance = 2.5
		}
	)
end

function PickUpPoppy(target)
	local nearbyID
	for i = 1, #HeroinPlants, 1 do
		local dist = #(GetEntityCoords(cache.ped) - GetEntityCoords(HeroinPlants[i]))
		if dist < 2 then
			nearbyID = i
		end
	end
	if IsPedOnFoot(cache.ped) then
		lib.callback('drc_drugs:heroin:getitem', false, function(value)
			if value then
				if not lib.progressActive() then
					if lib.progressBar({
						duration = Config.Heroin.Field.Duration,
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
						table.remove(HeroinPlants, nearbyID)
						SpawnedHeroinPlants = SpawnedHeroinPlants - 1
						TSE('drc_drugs:heroin:giveitems', "heroinPickup")
					end
				end
			else
				Notify("error", locale("error"), locale("RequiredTrowel"))
			end
		end, "heroinPickup")
	else
		Wait(500)
	end
end
