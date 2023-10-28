local module = {}

function module.get()
    return exports["qb-core"]:GetCoreObject().Shared.Jobs
end

return module