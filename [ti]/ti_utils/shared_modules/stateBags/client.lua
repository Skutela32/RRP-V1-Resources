local resName = select(1,...)
local initEvent = "ti_utils:" .. resName .. ":stateBags:init"
local listenerCache = {}

local function onChange(bagFilter,bagName,key,value)
    local listeners = listenerCache[key]

    if not listeners then
        return
    end

    for _,cb in ipairs(listeners.global) do
        cb(bagName,bagFilter,key,value)
    end

    if not listeners.filtered[bagFilter] then
        return
    end

    for _,cb in ipairs(listeners.filtered[bagFilter]) do
        cb(bagName,bagFilter,key,value)
    end
end

local function onChangeEntity(bagName,...)
    local bagFilter = tonumber(bagName:gsub("entity:",""),10)
    local entityId = NetworkGetEntityFromNetworkId(bagFilter)

    onChange(bagFilter,entityId,...)
end

local function onChangePlayer(bagName,...)
    local bagFilter = tonumber(bagName:gsub("player:",""),10)
    onChange(bagFilter,bagName,...)
end

local changeHandlers = {
    entity = onChangeEntity,
    player = onChangePlayer
}

local function addGlobalListener(keyFilter,cb)
    table.insert(listenerCache[keyFilter].global,cb)
end

local function addFilteredListener(keyFilter,bagFilter,cb)
    local listeners = listenerCache[keyFilter]

    if not listeners.filtered[bagFilter] then
        listeners.filtered[bagFilter] = {}
    end

    table.insert(listeners.filtered[bagFilter],cb)
end

local function initListener(keyFilter,changeCb)
    listenerCache[keyFilter] = {
        global   = {},
        filtered = {}
    }

    AddStateBagChangeHandler(keyFilter,nil,changeCb)
end

local function isListenerInitialized(keyFilter)
    return listenerCache[keyFilter] ~= nil
end

local function on(typeof,keyFilter,bagFilter,cb)
    if not isListenerInitialized(keyFilter) then
        initListener(keyFilter,changeHandlers[typeof])
    end

    if bagFilter then
        addFilteredListener(keyFilter,bagFilter,cb)
    else
        addGlobalListener(keyFilter,cb)
    end
end

local bagConstructors = {
    entity = Entity,
    player = Player
}

local function getBag(typeof,target)
    return bagConstructors[typeof](target)
end

local function set(typeof,target,key,value,replicate)
    local bag = getBag(typeof,target)

    if not bag then
        return
    end

    if replicate then
        if value ~= nil and bag.state[key] == nil and NetworkGetEntityIsNetworked(target) then
            local netId = NetworkGetNetworkIdFromEntity(target)

            TriggerServerEvent(initEvent,typeof,netId,key,value)

            local startTime = GetGameTimer()

            while 
                not getBag(typeof,target).state[key] 
                and GetGameTimer() - startTime <= 5000
            do
                Wait(0)
            end

            return
        end
    end

    bag.state:set(key,value,replicate)
end

local function get(typeof,target,key)
    local bag = getBag(typeof,target)

    if not bag then
        return
    end

    return bag.state[key]
end

local module = {
    on = on,
    get = get,
    set = set,
    getBag = getBag,
}

local entity = {}
local player = {}

for ref,fn in pairs(module) do
    entity[ref] = function(...)
        fn("entity",...)
    end

    player[ref] = function(...)
        fn("player",...)
    end
end

module.entity = entity
module.player = player

return module