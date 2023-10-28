local QBCore = select(2,...)
local invName = select(3,...)

local module = {}

local useableItemHandlers = {
    ['ox_inventory'] = function(itemName,cb)
        QBCore.Functions.CreateUseableItem(itemName,function(source,a,b,c)
            local item = type(a) == "table" and a or b

            cb(source,{
                name = item.name,
                label = item.label,
                weight = item.weight,
                count = item.count or item.amount,
                metadata = item.metadata or item.data or item.info,
                slot = item.slot
            },function(count)
                ti.players.removeInventoryItem(source,itemName,count,item.slot)
            end)
        end)
    end,

    ['qs-inventory'] = function(itemName,cb)
        QBCore.Functions.CreateUseableItem(itemName,function(source,a,b)
            local item = type(a) == "table" and a or b

            cb(source,{
                name = item.name,
                label = item.label,
                weight = item.weight,
                count = item.count or item.amount,
                metadata = item.metadata or item.data or item.info,
                slot = item.slot
            },function(count)
                TriggerEvent('inventory:server:removeItem',source,itemName,count,item.slot)
            end)
        end)        
    end,

    ['qb-inventory'] = function(itemName,cb)
        QBCore.Functions.CreateUseableItem(itemName,function(source,item)
            cb(source,{
                name = item.name,
                label = item.label,
                weight = item.weight,
                count = item.count or item.amount,
                metadata = item.metadata or item.data or item.info,
                slot = item.slot
            },function(count)
                ti.players.removeInventoryItem(source,itemName,count,item.slot)
            end)
        end)
    end
}

module.registerUseableItem = useableItemHandlers[invName] or useableItemHandlers["qb-inventory"]

module.ensureItem = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
    if not QBCore.Shared.Items[name] then
        QBCore.Functions.AddItem(name,{            
            ['name'] = name,             
            ['label'] = label,          
            ['weight'] = weight,     
            ['type'] = typeof,    
            ['image'] = image,       
            ['unique'] = unique,    
            ['useable'] = useable,   
            ['shouldClose'] = shouldClose,    
            ['combinable'] = combinable,   
            ['description'] = description
        })
    end
end

module.ensureItems = function(...)
    for i=1,select("#",...),1 do
        local t = select(i,...)
        module.ensureItem(table.unpack(t))
    end
end

module.getItemLabel = function(name)
    return QBCore.Shared.Items[name].label
end

module.getItemImage = function(name)
    return "https://cfx-nui-qb-inventory/html/images/" .. name .. ".png"
end

local registerStashHandlers = {
    ["ox_inventory"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items,groups,coords)
        exports.ox_inventory:RegisterStash(identifier,label,maxSlots,maxWeight,nil,groups,coords)
    end,

    ["qs-inventory"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items)
        print("Qs-inventory does not have support for inventory registration.")
    end,

    ["qb-inventory"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items)
        TriggerEvent("qb-inventory:server:SaveStashItems", identifier, items)
    end
}

module.registerStash = registerStashHandlers[invName] or registerStashHandlers["qb-inventory"]

module.loadStash = function(...)
    if invName ~= "ox_inventory" then return end
    module.registerStash(...)
end

local stashRefreshHandlers = {
    ["ox_inventory"] = function(prevIdentifier,newIdentifier)
        local prevInv = exports.ox_inventory:GetInventory(prevIdentifier)

        exports.ox_inventory:RegisterStash(newIdentifier,prevInventory.label,prevInv.slots,prevInv.maxWeight)

        local newInv = exports.ox_inventory:GetInventory(newIdentifier)

        stash:Set("items", prevInv.items)

        exports.ox_inventory:Clear(prevIdentifier)
    end,

    ["qs-inventory"] = function(prevIdentifier,newIdentifier)
        print("Qs-inventory does not have support for inventory refreshing.")
    end,

    ["qb-inventory"] = function(prevIdentifier,newIdentifier)
        QBCore.Functions.TriggerCallback("qb-inventory:server:GetStashItems", false, function(items)
            TriggerEvent("qb-inventory:server:SaveStashItems", newIdentifier, items)
        end, prevIdentifier)
    end
}

module.refreshStash = stashRefreshHandlers[invName] or stashRefreshHandlers["qb-inventory"]

local stashRemoveHandlers = {
    ["ox_inventory"] = function(identifier)
        exports.ox_inventory:Clear(identifier)
    end,

    ["qs-inventory"] = function(identifier)
        print("Qs-inventory does not have support for inventory removal.")
    end,

    ["qb-inventory"] = function(identifier)
    end
}

module.removeStash = stashRemoveHandlers[invName] or stashRemoveHandlers["qb-inventory"]

local stashGetItemsHandlers = {
    ["ox_inventory"] = function(identifier)
        local inv = exports.ox_inventory:GetInventory(identifier)

        return inv and inv.items or {}
    end,

    ["qs-inventory"] = function(identifier)
        print("Qs-inventory does not have support for stashes.")
    end,

    ["qb-inventory"] = function(identifier)
        local result

        QBCore.Functions.TriggerCallback("qb-inventory:server:GetStashItems", false, function(items)
            result = items or {}
        end, identifier)

        while not result do Wait(0) end

        return result
    end
}

module.getStashItems = stashGetItemsHandlers[invName] or stashGetItemsHandlers["qb-inventory"]

return module