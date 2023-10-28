local resName,ESX,invName = ...

local module = {}

local useableItemHandlers = {
    ['mf-inventory'] = function(itemName,cb)
        ESX.RegisterUsableItem(itemName,function(source,a,b,c)
            local item = type(a) == "string" and c or b

            cb(source,item,function(count)
                ti.players.removeInventoryItem(source,itemName,count,item.slot)
            end)
        end)
    end,

    ['ox_inventory'] = function(itemName,cb)
        ESX.RegisterUsableItem(itemName,function(source,a,b,c)
            local item = type(a) == "table" and a or b

            cb(source,item,function(count)
                ti.players.removeInventoryItem(source,itemName,count,item.slot)
            end)
        end)
    end,

    ['qs-inventory'] = function(itemName,cb)
        ESX.RegisterUsableItem(itemName,function(source,a,b)
            local item = type(a) == "table" and a or b

            cb(source,{
                name = item.name,
                label = item.label,
                weight = item.weight,
                count = item.amount,
                metadata = item.info,
                slot = item.slot
            },function(count)
                TriggerEvent('inventory:server:removeItem',source,itemName,count,item.slot)
            end)
        end)        
    end,

    ['default'] = function(itemName,cb)
        ESX.RegisterUsableItem(itemName,function(source,a,b)
            local item = type(a) == "table" and a or b

            cb(source,item,function(count)
                ti.players.removeInventoryItem(source,itemName,count)
            end)
        end)    
    end
}

module.registerUseableItem = useableItemHandlers[invName] or useableItemHandlers.default

local sharedItems
local sharedItemsResource
local sharedItemsFileName
local sharedItemStrTemplate

local oxItemStrTemplate = [[
    ['%s'] = {
        label       = '%s',
        weight      = %s,
        stack       = %s,
        close       = %s,
        description = %s
    },
}
]]

local qsItemStrTemplate = [[
    ['%s'] = {
        ["name"]        = "%s",
        ["label"]       = "%s",
        ["weight"]      = %s,
        ["type"]        = "%s",
        ["image"]       = "%s",
        ["unique"]      = %s,
        ["useable"]     = %s,
        ["shouldClose"] = %s,
        ["combinable"]  = %s,
        ["description"] = "%s"
    },
}
]]

local ensureItemHandlers = {
    ['mf-inventory'] = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
        local dbRows = exports["oxmysql"]:executeSync("SELECT * FROM items WHERE name=@name",{['@name'] = name})

        if #dbRows == 0 then
            exports["oxmysql"]:executeSync("INSERT INTO items SET name=@name,label=@label,weight=@weight,rare=@rare,can_remove=@can_remove,degrademodifier=@degrademodifier,description=@description,`unique`=@unique",{
                ['@name'] = name,
                ['@label'] = label,
                ['@weight'] = weight,
                ['@rare'] = rare,
                ['@can_remove'] = canRemove,
                ['@degrademodifier'] = degradeModifier,
                ['@description'] = description,
                ['@unique'] = unique
            })

            print("A required item ("..name..") has been added to your database, you will need to restart for this to take effect.")
        end
    end,

    ['ox_inventory'] = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
        if not sharedItems then
            sharedItems = exports.ox_inventory:Items()
        end

        if not sharedItemStrTemplate then
            sharedItemStrTemplate = oxItemStrTemplate
        end

        local formatName = name:gsub("'", "\\'"):lower()

        if not sharedItems[formatName] then   
            local sharedItemsStr = LoadResourceFile("ox_inventory","data/items.lua")

            sharedItemsStr = (
                sharedItemsStr:sub(0,sharedItemsStr:len()-2) 
                .. 
                sharedItemStrTemplate:format(
                    name,
                    label:gsub("'", "\\'"):lower(),
                    tostring(weight),
                    tostring(not unique),
                    tostring(shouldClose),
                    description and ('"%s"'):format(description) or 'nil'
                )
            )

            SaveResourceFile("ox_inventory","data/items.lua",sharedItemsStr,sharedItemsStr:len())

            print("A required item ("..name..") has been added to your database, you will need to restart for this to take effect.")
        end
    end,

    ['qs-inventory'] = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
        if not sharedItems then
            sharedItemsResource = "qs-core"
            sharedItemsFileName = "config/config_items.lua"

            local f = LoadResourceFile(sharedItemsResource,sharedItemsFileName)
            
            if not f then 
                sharedItemsFileName = "shared/items.lua"
                f = LoadResourceFile(sharedItemsResource,sharedItemsFileName)
            end
            
            if not f then
                sharedItemsResource = "qs-inventory"
                f = LoadResourceFile(sharedItemsResource,sharedItemsFileName)
            end

            local env = {
                _G = _G,
                _ENV = setmetatable({},{__index = _G})
            }

            load(f,sharedItemsFileName,'bt',env)()

            sharedItems = env.QSShared and env.QSShared.Items or env.ItemList
        end

        if not sharedItemStrTemplate then
            sharedItemStrTemplate = qsItemStrTemplate
        end

        local formatName = name:gsub("'", "\\'"):lower()

        if not sharedItems[formatName] then   
            local sharedItemsStr = LoadResourceFile(sharedItemsResource,sharedItemsFileName)

            sharedItemsStr = (
                sharedItemsStr:sub(0,sharedItemsStr:len()-2) 
                .. 
                string.format(
                    sharedItemStrTemplate,
                    name,
                    name,
                    label:gsub("'", "\\'"):lower(),
                    tostring(weight),
                    typeof,
                    image,
                    tostring(unique),
                    tostring(useable),
                    tostring(shouldClose),
                    tostring(combinable),
                    description
                )
            )

            SaveResourceFile(sharedItemsResource,sharedItemsFileName,sharedItemsStr,sharedItemsStr:len())

            print("A required item ("..name..") has been added to your database, you will need to restart for this to take effect.")
        end
    end,

    ['default'] = function(name,label,weight,typeof,unique,image,useable,shouldClose,combinable,description,rare,canRemove,degradeModifier)
        local dbRows = exports["oxmysql"]:executeSync("SELECT * FROM items WHERE name=@name",{['@name'] = name})

        if #dbRows == 0 then
            exports["oxmysql"]:executeSync("INSERT INTO items SET name=@name,label=@label,weight=@weight,rare=@rare,can_remove=@can_remove",{
                ['@name'] = name,
                ['@label'] = label,
                ['@weight'] = weight,
                ['@rare'] = rare,
                ['@can_remove'] = canRemove
            })

            print("A required item ("..name..") has been added to your database, you will need to restart for this to take effect.")
        end
    end
}

module.ensureItem = ensureItemHandlers[invName] or ensureItemHandlers.default

module.ensureItems = function(...)
    for i=1,select("#",...),1 do
        local t = select(i,...)
        module.ensureItem(table.unpack(t))
    end
end

local getItemLabelHandlers = {
    ["ox_inventory"] = function(name)
        if not sharedItems then
            sharedItems = exports.ox_inventory:Items()
        end

        if not sharedItems[name] or not sharedItems[name].label then
            return ("UNKNOWN LABEL: " .. name)
        end

        return sharedItems[name].label
    end,    
    
    ['qs-inventory'] = function(name)
        if not sharedItems then
            local fileName = "config/config_items.lua"

            local f = LoadResourceFile("qs-core",fileName)
            
            if not f then 
                fileName = "shared/items.lua"
                f = LoadResourceFile("qs-core",fileName)
            end

            local env = {
                _G = _G,
                _ENV = setmetatable({},{__index = _G})
            }

            load(f,fileName,'bt',env)()

            sharedItems = env.QSShared.Items
        end

        if not sharedItems[name] or not sharedItems[name].label then
            return ("UNKNOWN LABEL: " .. name)
        end

        return sharedItems[name].label
    end,

    ["default"] = function(name)
        if name:sub(0,7):lower() == "weapon_" then
            return ESX.GetWeaponLabel(name) or ("UNKNOWN LABEL: " .. name)
        else
            return ESX.GetItemLabel(name) or ("UNKNOWN LABEL: " .. name)
        end
    end,
}

module.getItemLabel = getItemLabelHandlers[invName] or getItemLabelHandlers.default

local getItemImageHandlers = {
    ["ox_inventory"] = function(name)
        return "https://cfx-nui-ox_inventory/web/images/" .. name .. ".png"
    end,    
    
    ['qs-inventory'] = function(name)
        return "https://cfx-nui-qs-inventory/html/images/" .. name .. ".png"
    end,

    ['mf-inventory'] = function(name)
        return "https://cfx-nui-mf-inventory/nui/items/" .. name .. ".png"
    end,

    ["default"] = function(name)
        return ""
    end,
}

module.getItemImage = getItemImageHandlers[invName] or getItemImageHandlers.default

local registerStashHandlers = {
    ["ox_inventory"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items,groups,coords)
        if maxWeight then
            maxWeight = maxWeight * 1000
        end

        exports.ox_inventory:RegisterStash(identifier,label,maxSlots,maxWeight,nil,groups,coords)
    end,

    ["qs-inventory"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items)
        print("Qs-inventory does not have support for inventory registration.")
    end,

    ["mf-inventory"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items)
        exports["mf-inventory"]:createInventory(identifier,typeof,subtype,label,maxWeight,maxSlots,items)
    end,

    ["default"] = function(identifier,typeof,subtype,label,maxWeight,maxSlots,items)
    end
}

module.registerStash = registerStashHandlers[invName] or registerStashHandlers.default

module.loadStash = function(...)
    if invName ~= "ox_inventory" then return end
    module.registerStash(...)
end

local stashRefreshHandlers = {
    ["ox_inventory"] = function(prevIdentifier,newIdentifier)
        local prevInv = exports.ox_inventory:GetInventory(prevIdentifier)

        exports.ox_inventory:RegisterStash(newIdentifier,prevInv.label,prevInv.slots,prevInv.maxWeight)

        local newInv = exports.ox_inventory:GetInventory(newIdentifier)

        stash:Set("items", prevInv.items)

        exports.ox_inventory:Clear(prevIdentifier)
    end,

    ["qs-inventory"] = function(prevIdentifier,newIdentifier)
        print("Qs-inventory does not have support for inventory refreshing.")
    end,

    ["mf-inventory"] = function(prevIdentifier,newIdentifier)
        local prevInv = exports["mf-inventory"]:getInventory(prevIdentifier)

        exports["mf-inventory"]:createInventory(newIdentifier,prevInv.typeof,prevInv.subtype,prevInv.label,prevInv.maxWeight,prevInv.maxSlots,prevInv.items)

        exports["mf-inventory"]:deleteInventory(prevIdentifier)
    end,

    ["default"] = function(prevIdentifier,newIdentifier)
    end
}

module.refreshStash = stashRefreshHandlers[invName] or stashRefreshHandlers.default

local stashRemoveHandlers = {
    ["ox_inventory"] = function(identifier)
        local inventory = exports.ox_inventory:GetInventory(identifier)
        exports.ox_inventory:Clear(identifier)
    end,

    ["qs-inventory"] = function(identifier)
        print("Qs-inventory does not have support for inventory removal.")
    end,

    ["mf-inventory"] = function(identifier)
        exports["mf-inventory"]:deleteInventory(identifier)
    end,

    ["default"] = function(identifier)
    end
}

module.removeStash = stashRemoveHandlers[invName] or stashRemoveHandlers.default

local stashGetItemsHandlers = {
    ["ox_inventory"] = function(identifier)
        local inv = exports.ox_inventory:GetInventory(identifier)
        return inv and inv.items or {}
    end,

    ["qs-inventory"] = function(identifier)
        print("Qs-inventory does not have support for stashes.")
        return {}
    end,

    ["mf-inventory"] = function(identifier)
        local inv = exports["mf-inventory"]:getInventory(identifier)
        return inv and inv.items or {}
    end,

    ["default"] = function(identifier)
        return {}
    end
}

module.getStashItems = stashGetItemsHandlers[invName] or stashGetItemsHandlers.default

return module