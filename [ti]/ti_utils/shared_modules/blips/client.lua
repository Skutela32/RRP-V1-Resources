local blips = {}
local blipIds = {}

local function renderBlip(typeof,id,position,label,sprite,color,scale,display,alpha,highDetail,shortRange,width,height,heading)
  if typeof == "coords" then
    local blip = AddBlipForCoord(position)

    SetBlipSprite(blip,sprite)
    SetBlipColour(blip,color)
    SetBlipAlpha(blip,alpha)
    SetBlipScale(blip,scale)
    SetBlipDisplay(blip,display)
    SetBlipHighDetail(blip,highDetail)
    SetBlipAsShortRange(blip,shortRange)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip) 

    blipIds[id] = blip
  elseif typeof == "area" then
    local blip = AddBlipForArea(position.xyz,width,height)
    SetBlipColour(blip, color)
    SetBlipAlpha (blip, alpha)
    SetBlipHighDetail(blip, highDetail or true)
    SetBlipRotation(blip, heading)
    SetBlipDisplay(blip, display)

    blipIds[id] = blip
  end
end

local function removeBlip(id)
  RemoveBlip(blipIds[id])
  
  blipIds[id] = nil
end

local function isBlipRendered(id)
  return blipIds[id] ~= nil
end

local function hasPermissions(t)
  return ti.players.hasPermissions(t.characterRestrictions,t.jobRestrictions,t.groupRestrictions)
end

local function ensureBlip(id)
  local blip = blips[id]

  if hasPermissions(blip) then
    if not isBlipRendered(id) then
      local blipOpts = blip.blipOpts
      renderBlip(blip.typeof,id,blipOpts.position,blipOpts.label,blipOpts.sprite,blipOpts.color,blipOpts.scale,blipOpts.display,blipOpts.alpha,blipOpts.highDetail,blipOpts.shortRange,blipOpts.width,blipOpts.height,blipOpts.heading)
    end
  else
    if isBlipRendered(id) then
      removeBlip(id)
    end
  end
end

local function ensureBlips()  
  for id in pairs(blips) do
    ensureBlip(id)
  end
end

ti.players.trackUniqueId(ensureBlips)
ti.players.trackJob(ensureBlips)
ti.players.trackGroup(ensureBlips)

local module = {}

module.registerCoords = function(id,characterRestrictions,jobRestrictions,groupRestrictions,blipOpts)
  blips[id] = {
    typeof = "coords",
    id = id,
    characterRestrictions = characterRestrictions,
    jobRestrictions = jobRestrictions,
    groupRestrictions = groupRestrictions,
    blipOpts = blipOpts or {}
  }

  ensureBlip(id)
end

module.registerArea = function(id,characterRestrictions,jobRestrictions,groupRestrictions,blipOpts)
  blips[id] = {
    typeof = "area",
    id = id,
    characterRestrictions = characterRestrictions,
    jobRestrictions = jobRestrictions,
    groupRestrictions = groupRestrictions,
    blipOpts = blipOpts or {}
  }

  ensureBlip(id)
end

module.refresh = function(id,characterRestrictions,jobRestrictions,groupRestrictions)
  local blip = blips[id]

  if not blip then
    return
  end

  blip.characterRestrictions = characterRestrictions or blip.characterRestrictions
  blip.jobRestrictions = jobRestrictions or blip.jobRestrictions
  blip.groupRestrictions = groupRestrictions or blip.groupRestrictions

  ensureBlip(id)
end

module.remove = function(id)
  removeBlip(id)
  blips[id] = nil
end

return module