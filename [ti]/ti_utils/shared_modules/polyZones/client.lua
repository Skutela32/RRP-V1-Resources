local glm = require 'glm'

local trackingZones = {}

-- MT

local zoneMt = {}
zoneMt.__index = zoneMt

function zoneMt:isPointInside(point)
    return self.polygon:contains(point,self.height)
end

function zoneMt:onPointInOut(fn,cb)
  table.insert(trackingZones,{
    zone = self,
    getPosition = fn,
    onPointInOut = cb
  })
end

function zoneMt:destroy()
  for i=#trackingZones,1,-1 do
    local t = trackingZones[i]

    if t.zone == self then
      table.remove(trackingZones,i)
    end
  end

  self = nil
end

function zoneMt:refreshPermissions(characterRestrictions,jobRestrictions,groupRestrictions)
  self.characterRestriction = characterRestrictions or self.characterRestriction
  self.jobRestrictions = jobRestrictions or self.jobRestrictions
  self.groupRestrictions = groupRestrictions or self.groupRestrictions
end

-- Thread tracker

local function hasPermissions(t)
    return ti.players.hasPermissions(t.characterRestriction,t.jobRestriction,t.groupRestriction)
end

local function checkTrackingPoint(v,fnRets)
    if not fnRets[v.getPosition] then
        fnRets[v.getPosition] = v.getPosition()
    end

    local isInside = v.zone:isPointInside(fnRets[v.getPosition])

    if isInside then
        if not v.isInside then
            if hasPermissions(v.zone) then
                v.isInside = true
                v.onPointInOut(true)
            end
        end
    else
        if v.isInside then
            v.isInside = false
            v.onPointInOut(false)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local waitTime = 100
        local fnRets = {}

        if #trackingZones > 0 then      
            for _,v in ipairs(trackingZones) do
                checkTrackingPoint(v,fnRets)
            end
        else
            waitTime = 1000
        end

        Wait(waitTime)
    end
end)

-- Module

local module = {}

module.new = function(points,height,characterRestrictions,jobRestrictions,groupRestrictions)
    return setmetatable({
        polygon = glm.polygon.new(points),
        height = height,
        characterRestrictions = characterRestrictions,
        jobRestrictions = jobRestrictions,
        groupRestrictions = groupRestrictions
    },zoneMt)
end

module.getPlayerPosition = function()
  return GetEntityCoords(PlayerPedId())
end

return module
