--
-- Interaction Points Registry
--

local interactionPoints = {}

local function addObjectToRegistry(obj)
    interactionPoints[obj.id] = obj
end

local function removeObjectFromRegistry(obj)
    interactionPoints[obj.id] = nil
end

--
-- Interaction Point Constructors
--

local constructors = {
    ["menu"]         = Menu,
    ["marker"]       = Marker,
    ["3d_text"]      = T3D,
    ["help_text"]    = HelpText,
}

--
-- Module Constructor Methods
--

local function createPoint(center, radius, characterRestrictions, jobRestrictions, groupRestrictions)
    return ti.points.new(
        center,
        radius,
        true,
        true,
        true,
        characterRestrictions,
        jobRestrictions,
        groupRestrictions
    )
end

local function createObject(id, center, radius, onInOut, onInteract, characterRestrictions, jobRestrictions, groupRestrictions)
    local obj = {
        id          = id,
        center      = center,
        radius      = radius,
        ips         = {},
        point       = createPoint(center, radius, characterRestrictions, jobRestrictions, groupRestrictions),
        interacted  = 0,
        on_in_out   = onInOut,
    }

    function obj:onInteract()
        local now = GetGameTimer()

        if now == obj.interacted then
            return
        end

        obj.interacted = now

        onInteract(obj)
    end

    return obj
end

local function createInteractionPoints(obj, ips)
    for _,ip in ipairs(ips) do
        local constructor = constructors[ip.typeof]

        if not constructor then
            print("Invalid constructor for: " .. obj.id .. ", type: " .. ip.typeof)
        else
            table.insert(obj.ips, constructor(obj, ip, obj.onInteract))
        end
    end
end

local function createInOutCallback(obj)
    obj.point:onPointInOut(ti.points.getPlayerPosition, function(isInside)
        obj.is_inside = isInside

        if isInside then
            Citizen.CreateThread(function()
                while obj.is_inside do
                    local dist = #(GetEntityCoords(PlayerPedId()) - obj.center)

                    for _,ip in ipairs(obj.ips) do
                        ip:render(dist)
                    end

                    Wait(0)
                end
            end)
        else
            for _,ip in ipairs(obj.ips) do
                ip:stop()
            end
        end

        if obj.on_in_out then
            obj.on_in_out(isInside)
        end
    end)
end

--
-- Meta Object Method Caller
--

local function callMetaObject(self, fnName)
    for _,ip in ipairs(self.ips) do
        local fn = ip[fnName]

        if fn then
            fn(ip)
        end
    end
end

--
-- Meta Object
--

local metaObject = {}

metaObject.__index = metaObject

function metaObject:render()
end

function metaObject:hide()
    callMetaObject(self, "hide")
end

function metaObject:reveal()
    callMetaObject(self, "reveal")
end

function metaObject:delete()
    callMetaObject(self, "delete")
    removeObjectFromRegistry(self)
end

--
-- Meta Object Constructor
--

local function createMetaObject(obj)
    return setmetatable(obj, metaObject)
end

--
-- Return Module
--

local module = {}

local defaultRestrictions = {}
local defaultOnInOut = function() end
local defaultOnInInteract = function() end

function module.add(data, onInOut, onInteract)
    local restrictions = data.restrictions or defaultRestrictions
    onInOut = onInOut or defaultOnInOut
    onInteract = onInteract or defaultOnInInteract

    local obj = createObject(data.id, data.center, data.radius, onInOut, onInteract, restrictions.characters, restrictions.job, restrictions.group)

    createInteractionPoints(obj, data.ips)
    createInOutCallback(obj)

    addObjectToRegistry(obj)
 
    return createMetaObject(obj)
end

function module.remove(id)
    local object = interactionPoints[id]

    if not object then return end

    removeObjectFromRegistry(object)
end

return module