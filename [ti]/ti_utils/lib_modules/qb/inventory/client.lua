local invName = select(3,...)

local module = {}

local openStashHandlers = {
    ["ox_inventory"] = function(id)
        exports.ox_inventory:openInventory('stash', id)
    end,

    ["qs-inventory"] = function(id)
        print("Qs-inventory does not support stashes.")
    end,

    ["qb-inventory"] = function(id)
        TriggerEvent("inventory:client:SetCurrentStash", id)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", id)
    end
}

module.openStash = openStashHandlers[invName] or openStashHandlers["qb-inventory"]

return module