local invName = select(3,...)

local module = {}

local openStashHandlers = {
    ["ox_inventory"] = function(id)
        exports.ox_inventory:openInventory('stash', id)
    end,

    ["qs-inventory"] = function(id)
        print("Qs-inventory does not support stashes.")
    end,

    ["mf-inventory"] = function(id)
        exports["mf-inventory"]:openOtherInventory(id)
    end,

    ["default"] = function(id)
    end,
}

module.openStash = openStashHandlers[invName] or openStashHandlers["default"]

return module