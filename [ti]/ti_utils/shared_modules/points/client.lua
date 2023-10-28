local trackingPoints = {}

-- MT

local pointMt = {}
pointMt.__index = pointMt

function pointMt:isPointInside(point)
  return (#(point - self.center) <= self.radius)
end

function pointMt:onPointInOut(fn,cb)
  table.insert(trackingPoints,{
    point = self,
    getPosition = fn,
    onPointInOut = cb
  })
end

function pointMt:destroy()
  for i=#trackingPoints,1,-1 do
    local t = trackingPoints[i]

    if t.point == self then
      table.remove(trackingPoints,i)
    end
  end

  self = nil
end

function pointMt:refreshPermissions(char,job,group)
  self.characterRestrictions  = char  or self.characterRestrictions
  self.jobRestrictions        = job   or self.jobRestrictions
  self.groupRestrictions      = group or self.groupRestrictions
end

-- Thread tracker

local function hasPermissions(t)
  return ti.players.hasPermissions(t.characterRestrictions,t.jobRestrictions,t.groupRestrictions)
end

local function canRender(v,plyVeh,isDriver)
  if plyVeh then
      if isDriver then
          if not v.point.renderAsDriver then
              return false
          end
      else
          if not v.point.renderAsPassenger then
              return false
          end
      end
  else
      if not v.point.renderOnFoot then
          return false
      end
  end

  return true
end

local function checkTrackingPoint(v,fnRets,plyVeh,isDriver)
  if not canRender(v,plyVeh,isDriver) then
    if v.point.isInside then
      v.point.isInside = false
      v.onPointInOut(false)
    end

    return
  end

  if not fnRets[v.getPosition] then
    fnRets[v.getPosition] = v.getPosition()
  end

  local dist = #(fnRets[v.getPosition] - v.point.center)

  if dist <= v.point.radius and hasPermissions(v.point) then
    if not v.point.isInside then
      v.point.isInside = true
      v.onPointInOut(true)
    end
  else
    if v.point.isInside then
      v.point.isInside = false
      v.onPointInOut(false)
    end
  end
end

Citizen.CreateThread(function()
  while true do
    local waitTime = 100

    if #trackingPoints > 0 then      
      local fnRets = {}

      local plyPed = PlayerPedId()
      local plyVeh = GetVehiclePedIsIn(plyPed)
      local isDriver = false

      if DoesEntityExist(plyVeh) then
        isDriver = (GetPedInVehicleSeat(plyVeh,-1) == plyPed)
      else
        plyVeh = false
      end

      for _,v in ipairs(trackingPoints) do
        checkTrackingPoint(v,fnRets,plyVeh,isDriver)
      end
    else
      waitTime = 1000
    end

    Wait(waitTime)
  end
end)

-- Module

local module = {}

module.new = function(center,radius,renderOnFoot,renderAsDriver,renderAsPassenger,characterRestrictions,jobRestrictions,groupRestrictions)
  return setmetatable({
    center                = center,
    radius                = radius,
    renderOnFoot          = renderOnFoot,
    renderAsDriver        = renderAsDriver,
    renderAsPassenger     = renderAsPassenger,
    characterRestrictions = characterRestrictions,
    jobRestrictions       = jobRestrictions,
    groupRestrictions     = groupRestrictions
  },pointMt)
end

module.getPlayerPosition = function()
  return GetEntityCoords(PlayerPedId())
end

return module