-- This module is for ModFreakz resource compatibility.
-- No further development will be done.

local targetResource

local qbRemoveHandlers = {
    point = function(target)
        return exports['qb-target']:RemoveZone(target.id)
    end,

    model = function(target)
        return exports['qb-target']:RemoveTargetModel(target.model)
    end,

    models = function(target)
        return exports['qb-target']:RemoveTargetModel(target.models)
    end,

    netEnt = function(target)
        return exports['qb-target']:RemoveTargetEntity(target.netId)
    end,

    localEnt = function(target)
        return exports['qb-target']:RemoveTargetEntity(target.entId)
    end,

    internalPolyZone = function(target)
        return exports['qb-target']:RemoveZone(target.id)
    end,

    internalBoxZone = function(target)
        return exports['qb-target']:RemoveZone(target.id)
    end,

    externalPolyZone = function(target)
        return exports['qb-target']:RemoveZone(target.id)
    end,

    externalBoxZone = function(target)
        return exports['qb-target']:RemoveZone(target.id)
    end,

    netEntBone = function(target)
        return exports['qb-target']:RemoveTargetBone(target.bone)
    end,

    netEntBones = function(target)
        return exports['qb-target']:RemoveTargetBone(target.bones)
    end,

    localEntBone = function(target)
        return exports['qb-target']:RemoveTargetBone(target.bone)
    end,

    localEntBones = function(target)
        return exports['qb-target']:RemoveTargetBone(target.bones)
    end,

    modelBone = function(target)
        return exports['qb-target']:RemoveTargetBone(target.bone)
    end,

    modelBones = function(target)
        return exports['qb-target']:RemoveTargetBone(target.bones)
    end,

    player = function(target)
        return exports['qb-target']:RemoveGlobalPlayer(target.id)
    end,

    object = function(target)
        return exports['qb-target']:RemoveGlobalObject(target.id)
    end,

    vehicle = function(target)
        return exports['qb-target']:RemoveGlobalVehicle(target.id)
    end,

    ped = function(target)
        return exports['qb-target']:RemoveGlobalPed(target.id)
    end,
}

local function setupQbOptions(target)
    for _,item in ipairs(target.items) do
        item.action = function(ent)
            (item.onSelect or target.onSelect)(target, item, ent)
        end
    end

    return {
        distance = target.radius,
        options = target.items
    }
end

local targetResources = {
    ["qb-target"] = {
        remove = function(target, type)
            return qbRemoveHandlers[type](target)
        end,

        addPoint = function(target)
            return exports['qb-target']:AddCircleZone(target.id, target.point, target.radius, {}, setupQbOptions(target))
        end,

        addModel = function(target)
            return exports['qb-target']:AddTargetModel(target.model, setupQbOptions(target))
        end,

        addModels = function(target)
            return exports['qb-target']:AddTargetModel(target.models, setupQbOptions(target))
        end,

        addNetEnt = function(target)
            return exports['qb-target']:AddTargetEntity(target.netId, setupQbOptions(target))
        end,

        addLocalEnt = function(target)
            return exports['qb-target']:AddTargetEntity(target.entId, setupQbOptions(target))
        end,

        addInternalPolyZone = function(target)
            return exports['qb-target']:AddPolyZone(target.id, target.points, target.options, setupQbOptions(target))
        end,

        addInternalBoxZone = function(target)
            return exports['qb-target']:AddBoxZone(target.id, target.center, target.length, target.width, target.options, setupQbOptions(target))
        end,

        addExternalPolyZone = function(target)
            exports['qb-target']:AddPolyZone(target.id, target.points, target.options, setupQbOptions(target))
            return function() end
        end,

        addExternalBoxZone = function(target)
            exports['qb-target']:AddBoxZone(target.id, target.center, target.length, target.width, target.options, setupQbOptions(target))
            return function() end
        end,

        addNetEntBone = function(target)
            exports['qb-target']:AddTargetBone(target.bone, setupQbOptions(target))
            return function() end
        end,

        addNetEntBones = function(target)
            exports['qb-target']:AddTargetBone(target.bones, setupQbOptions(target))
           return function() end
        end,

        addLocalEntBone = function(target)
            exports['qb-target']:AddTargetBone(target.bone, setupQbOptions(target))
            return function() end
        end,

        addLocalEntBones = function(target)
            exports['qb-target']:AddTargetBone(target.bones, setupQbOptions(target))
            return function() end
        end,

        addModelBone = function(target)
            exports['qb-target']:AddTargetBone(target.bone, setupQbOptions(target))
            return function() end
        end,

        addModelBones = function(target)
            exports['qb-target']:AddTargetBone(target.bones, setupQbOptions(target))
            return function() end
        end,

        addPlayer = function(target)
            return exports['qb-target']:AddGlobalPlayer(setupQbOptions(target))
        end,

        addObject = function(target)
            return exports['qb-target']:AddGlobalObject(setupQbOptions(target))
        end,

        addVehicle = function(target)
            return exports['qb-target']:AddGlobalVehicle(setupQbOptions(target))
        end,

        addPed = function(target)
            return exports['qb-target']:AddGlobalPed(setupQbOptions(target))
        end,
    },

    ["meta_target"] = {
        remove = function(target)
            return exports.meta_target:removeTarget(target.id)
        end,

        addPoint = function(target)
            return exports.meta_target:addPoint(target.id, target.title, target.icon, target.point, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,
 
        addModel = function(target)
            return exports.meta_target:addModel(target.id, target.title, target.icon, target.model, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addModels = function(target)
            return exports.meta_target:addModels(target.id, target.title, target.icon, target.models, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addNetEnt = function(target)
            return exports.meta_target:addNetEnt(target.id, target.title, target.icon, target.netId, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addLocalEnt = function(target)
            return exports.meta_target:addLocalEnt(target.id, target.title, target.icon, target.entId, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addInternalPolyZone = function(target)
            return exports.meta_target:addInternalPoly(target.id, target.title, target.icon, target.points, target.options, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addInternalBoxZone = function(target)
            return exports.meta_target:addInternalBoxZone(target.id, target.title, target.icon, target.center, target.length, target.width, target.options, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addExternalPolyZone = function(target)
            return exports.meta_target:addExternalPoly(target.id, target.title, target.icon, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addExternalBoxZone = function(target)
            return exports.meta_target:addExternalBoxZone(target.id, target.title, target.icon, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addNetEntBone = function(target)
            return exports.meta_target:addNetEntBone(target.id, target.title, target.icon, target.netId, target.bone, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addNetEntBones = function(target)
            return exports.meta_target:addNetEntBones(target.id, target.title, target.icon, target.netId, target.bones, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addLocalEntBone = function(target)
            return exports.meta_target:addLocalEntBone(target.id, target.title, target.icon, target.entId, target.bone, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addLocalEntBones = function(target)
            return exports.meta_target:addLocalEntBones(target.id, target.title, target.icon, target.entId, target.bones, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addModelBone = function(target)
            return exports.meta_target:addModelBone(target.id, target.title, target.icon, target.model, target.bone, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addModelBones = function(target)
            return exports.meta_target:addModelBones(target.id, target.title, target.icon, target.model, target.bones, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addPlayer = function(target)
            return exports.meta_target:addPlayer(target.id, target.title, target.icon, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addObject = function(target)
            return exports.meta_target:addObject(target.id, target.title, target.icon, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addVehicle = function(target)
            return exports.meta_target:addVehicle(target.id, target.title, target.icon, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,

        addPed = function(target)
            return exports.meta_target:addPed(target.id, target.title, target.icon, target.radius, target.onSelect, target.items, target.vars, false, target.canInteract)
        end,
    },
}

local targetConvar = GetConvar("ti_utils_target", "none")

if targetConvar ~= "none" then
    targetResource = targetConvar
else
    for resource in pairs(targetResources) do
        if GetResourceState(resource) ~= "missing" then
            targetResource = resource
            break
        end
    end
end

if not targetResource then
    return
end

return targetResources[targetResource]