local module = {}

function module.getMoney(typeof, name)
    local ret

    TriggerEvent("esx_addonaccount:getSharedAccount", "society_" .. name, function(acc)
        ret = acc and acc.money or 0
    end)

    while not ret do Wait(0) end

    return ret
end

function module.addMoney(typeof, name, amount)
    TriggerEvent("esx_addonaccount:getSharedAccount", "society_" .. name, function(acc)
        if not acc then return end
        acc.addMoney(amount)
    end)
end

function module.removeMoney(typeof, name, amount)
    TriggerEvent("esx_addonaccount:getSharedAccount", "society_" .. name, function(acc)
        if not acc then return end
        acc.removeMoney(amount)
    end)
end

return module