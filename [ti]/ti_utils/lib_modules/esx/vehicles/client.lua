local ESX = select(2,...)

local module = {}

module.isEmpty = function(veh,startIndex)
  for i=(startIndex or-1),GetVehicleModelNumberOfSeats(GetEntityModel(veh))-2,1 do
    if not IsVehicleSeatFree(veh,i) then
      return false,i
    end
  end

  return true
end

module.getNativeData = function(veh)  
  local model = GetEntityModel(veh)
  local class = GetVehicleClass(veh)
  local upgrades = ti.vehicles.getProperties(veh)
  
  upgrades.dirtLevel = 0.0

  local vehSpeed      = GetVehicleEstimatedMaxSpeed(veh)
  local vehAccel      = GetVehicleAcceleration(veh)*10
  local vehBraking    = GetVehicleMaxBraking(veh)*10
  local vehTraction   = GetVehicleMaxTraction(veh)*10

  local maxSpeed      = GetVehicleClassEstimatedMaxSpeed(class)
  local maxAccel      = GetVehicleClassMaxAcceleration(class)*10
  local maxBraking    = GetVehicleClassMaxBraking(class)*10
  local maxTraction   = GetVehicleClassMaxTraction(class)*10

  local accelPct = math.floor((vehAccel / maxAccel) * 100)
  local brakingPct = math.floor((vehBraking / maxBraking) * 100)
  local tractionPct = math.floor((vehTraction / maxTraction) * 100)

  local stats = {
      {
          name = "maxSpeed",
          label = "Maximum Speed",
          valueLabel = math.floor(vehSpeed * 3.6) .. " kph",
          min = 0,
          max = maxSpeed,
          value = vehSpeed
      },
      {
          name = "acceleration",
          label = "Acceleration",
          valueLabel = accelPct .. "%",
          min = 0,
          max = maxAccel,
          value = vehAccel
      },
      {
          name = "braking",
          label = "Braking",
          valueLabel = brakingPct .. "%",
          min = 0,
          max = maxBraking,
          value = vehBraking
      },
      {
          name = "traction",
          label = "Traction",
          valueLabel = tractionPct .. "%",
          min = 0,
          max = maxTraction,
          value = vehTraction
      },
  }

  return stats,upgrades
end

module.setProperties = function(veh,props)
  ESX.Game.SetVehicleProperties(veh,props)

  if props.fuelLevel and props.fuelType and GetResourceState("ti_fuel"):find("start") then
    exports.ti_fuel:setFuel(veh,props.fuelLevel,props.fuelType)
  end
end

module.getProperties = function(veh)
  local props = ESX.Game.GetVehicleProperties(veh)

  if GetResourceState("ti_fuel"):find("start") then
    local fuelLevel,fuelType = exports.ti_fuel:getFuel(veh)

    props.fuelLevel = fuelLevel or props.fuelLevel or 50.0
    props.fuelType  = fuelType  or props.fuelType  or "RON91"
  end

  props.name = GetDisplayNameFromVehicleModel(props.model)

  return props
end

module.getPlate = function(veh)
  return GetVehicleNumberPlateText(veh):gsub("%s+","")
end

module.getStats = function(veh)
  local stats = {}

  return stats
end

module.spawnAsync = function(model,cb,pos,head,networked)
  ti.streaming.model.loadAsync(model,function(loaded,hash)
    if not loaded then
      return cb()
    end

    head = head or 0.0
    networked = networked or false

    local vehicle = CreateVehicle(hash,pos.x,pos.y,pos.z,head,networked,false)

    if networked then
      local id = NetworkGetNetworkIdFromEntity(vehicle)
      SetNetworkIdCanMigrate(id,true)
      SetEntityAsMissionEntity(vehicle,true,false)
    end

    SetVehicleHasBeenOwnedByPlayer(vehicle,true)
    SetVehicleNeedsToBeHotwired(vehicle,false)
    SetVehRadioStation(vehicle,'OFF')
    SetVehicleFuelLevel(vehicle,100.0)
    
    SetModelAsNoLongerNeeded(hash)

    cb(vehicle)
  end)
end

module.spawnSync = function(model,pos,head,networked)
  local loaded,hash = ti.streaming.model.loadSync(model)

  if not loaded then
    return
  end

  head = head or 0.0
  networked = networked or false

  local vehicle = CreateVehicle(hash,pos.x,pos.y,pos.z,head,networked,false)

  if networked then
    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id,true)
    SetEntityAsMissionEntity(vehicle,true,false)
  end

  SetVehicleHasBeenOwnedByPlayer(vehicle,true)
  SetVehicleNeedsToBeHotwired(vehicle,false)
  SetVehRadioStation(vehicle,'OFF')
  SetVehicleFuelLevel(vehicle,100.0)

  SetModelAsNoLongerNeeded(hash)

  return vehicle
end

module.spawnNetworkedAsync = function(model,cb,pos,head)
  pos = pos or vector3(0,0,0)
  head = head or 0.0

  ti.callbacks.async("ti_utils:vehicles:spawnNetworked", function(netId)
    while not NetworkDoesEntityExistWithNetworkId(netId) do
      Wait(0)
    end
    
    local vehicle = NetworkGetEntityFromNetworkId(netId)

    SetEntityAsMissionEntity(vehicle,true,true)
    SetVehicleHasBeenOwnedByPlayer(vehicle,true)
    SetVehicleNeedsToBeHotwired(vehicle,false)
    SetVehRadioStation(vehicle,'OFF')
    SetVehicleFuelLevel(vehicle,100.0)

    cb(vehicle)
  end,model,pos,head)
end

module.spawnNetworkedSync = function(model,pos,head)
  pos = pos or vector3(0,0,0)
  head = head or 0.0

  local netId = ti.callbacks.sync("ti_utils:vehicles:spawnNetworked",model,pos,head)

  while not NetworkDoesEntityExistWithNetworkId(netId) do
    Wait(0)
  end

  local vehicle = NetworkGetEntityFromNetworkId(netId)

  SetEntityAsMissionEntity(vehicle,true,true)
  SetVehicleHasBeenOwnedByPlayer(vehicle,true)
  SetVehicleNeedsToBeHotwired(vehicle,false)
  SetVehRadioStation(vehicle,'OFF')
  SetVehicleFuelLevel(vehicle,100.0)

  return vehicle
end

module.destroy = function(veh)
  if not DoesEntityExist(veh) then
    return
  end

  SetEntityAsMissionEntity(veh, true, true)
  DeleteVehicle(veh)
end

local sharedList

RegisterNetEvent("ti_utils:gotSharedVehicleList",function(list)
  for model,veh in pairs(list) do
    veh.brand = GetMakeNameFromVehicleModel(veh.hash)
  end

  sharedList = list
end)

module.awaitSharedList = function()
  while not sharedList do
      Wait(0)
  end

  return sharedList
end

module.getSharedList = function()
  if not sharedList then
    TriggerServerEvent("ti_utils:" .. GetCurrentResourceName() .. ":getSharedVehicleList")

    return module.awaitSharedList()
  end

  return sharedList
end

return module