local module = {}

function module.getMoney(typeof, name)
    if typeof == "job" then
        exports["qb-management"]:GetAccount(name)
    elseif typeof == "group" then
        exports["qb-management"]:GetGangAccount(name)
    end
end

function module.addMoney(typeof, name, amount)
    if typeof == "job" then
        exports["qb-management"]:AddMoney(name, amount)
    elseif typeof == "group" then
        exports["qb-management"]:AddGangMoney(name, amount)
    end
end

function module.removeMoney(typeof, name, amount)
    if typeof == "job" then
        exports["qb-management"]:RemoveMoney(name, amount)
    elseif typeof == "group" then
        exports["qb-management"]:RemoveGangMoney(name, amount)
    end
end

return module