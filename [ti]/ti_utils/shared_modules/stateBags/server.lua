local resName = select(1,...)

local bagConstructors = {
    entity = Entity,
    player = Player
}

local function getBag(typeof,target)
    return bagConstructors[typeof](target)
end

local function set(typeof,target,key,value)
    local bag = getBag(typeof,target)

    if not bag then
        return
    end

    bag.state[key] = value
end

local function get(typeof,target,key)
    local bag = getBag(typeof,target)

    if not bag then
        return
    end

    return bag.state[key]
end

RegisterNetEvent("ti_utils:" .. resName .. ":stateBags:init",function(typeof,target,key,value)   
    if typeof == "entity" then
        local start = GetGameTimer()

        while
                (NetworkGetEntityFromNetworkId(target) == -1)
            and (GetGameTimer() - start <= 5000)
        do
            Wait(0)
        end

        if NetworkGetEntityFromNetworkId(target) == -1 then
            return
        end

        target = NetworkGetEntityFromNetworkId(target)

        EnsureEntityStateBag(target)
    end

    local bag = getBag(typeof,target)

    if not bag then
        return
    end

    bag.state[key] = value
end)

local module = {
    get = get,
    set = set,
    getBag = getBag
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