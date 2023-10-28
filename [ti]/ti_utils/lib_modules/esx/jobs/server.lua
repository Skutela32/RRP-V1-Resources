local ESX = select(2, ...)

local module = {}

function module.get()
    return ESX.GetJobs()
end

return module