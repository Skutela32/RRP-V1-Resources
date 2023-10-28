local module = {}

module.synchronised = {
    defaults = {
        sceneConfig = {
            position      = vector3(0.0,0.0,0.0),
            rotation      = vector3(0.0,0.0,0.0),
            rotOrder      = 2,
            useOcclusion  = false,
            loop          = false,
            unk1          = 1.0,
            animTime      = 0,
            animSpeed     = 1.0, 
        },

        pedConfig = {
            blendIn       = 1.0,
            blendOut      = 1.0,
            duration      = 0,
            flag          = 0,
            speed         = 1.0,
            unk1          = 0,
        },

        entityConfig = {
            blendIn       = 1.0,
            blendOut      = 1.0,
            flags         = 1,
        }
    },

    create = function(sceneConfig)    
        return NetworkCreateSynchronisedScene(
            sceneConfig.position.x,
            sceneConfig.position.y,
            sceneConfig.position.z,
            sceneConfig.rotation.x,
            sceneConfig.rotation.y,
            sceneConfig.rotation.z,
            sceneConfig.rotOrder,
            sceneConfig.useOcclusion,
            sceneConfig.loop,
            sceneConfig.unk1,
            sceneConfig.animTime,
            sceneConfig.animSpeed
        )
    end,

    sceneConfig = function(pos,rot,rotOrder,useOcclusion,loop,unk1,animTime,animSpeed)
        local _D = function(v1,v2) if v1 ~= nil then return v1 else return module.synchronised.defaults["sceneConfig"][v2]; end; end

        local conObj = {}
        conObj.position     = _D(pos,"position")
        conObj.rotation     = _D(rot,"rotation")
        conObj.rotOrder     = _D(rotOrder,"rotOrder")
        conObj.useOcclusion = _D(useOcclusion,"useOcclusion")
        conObj.loop         = _D(loop,"loop")
        conObj.unk1         = _D(unk1,"unk1")
        conObj.animTime     = _D(animTime,"animTime")
        conObj.animSpeed    = _D(animSpeed,"animSpeed")
        return conObj
    end,

    addPed = function(pedConfig)
        return NetworkAddPedToSynchronisedScene(pedConfig.ped,pedConfig.scene,pedConfig.animDict,pedConfig.animName,pedConfig.blendIn,pedConfig.blendOut,pedConfig.duration,pedConfig.flag,pedConfig.speed,pedConfig.unk1)
    end,

    pedConfig = function(ped,scene,animDict,animName,blendIn,blendOut,duration,flag,speed,unk1)
        if not ped      then print("[ti_utils] Scenes.Synchronised.PedConfig needs a ped as the first argument.");         return false; end
        if not scene    then print("[ti_utils] Scenes.Synchronised.PedConfig needs a scene as the second argument.");      return false; end
        if not animDict then print("[ti_utils] Scenes.Synchronised.PedConfig needs an animDict as the third argument.");   return false; end
        if not animName then print("[ti_utils] Scenes.Synchronised.PedConfig needs an animName as the fourth argument.");  return false; end

        local _D = function(v1,v2) if v1 ~= nil then return v1 else return module.synchronised.defaults["pedConfig"][v2]; end; end

        local conObj = {}
        conObj.ped          = ped
        conObj.scene        = scene
        conObj.animDict     = animDict
        conObj.animName     = animName
        conObj.blendIn      = _D(blendIn,"blendIn")
        conObj.blendOut     = _D(blendOut,"blendOut")
        conObj.duration     = _D(duration,"duration")
        conObj.flag         = _D(flag,"flag")
        conObj.speed        = _D(speed,"speed")
        conObj.unk1         = _D(unk1,"unk1")
        return conObj
    end,

    addEntity = function(entityConfig)
        return NetworkAddEntityToSynchronisedScene(entityConfig.entity,entityConfig.scene,entityConfig.animDict,entityConfig.animName,entityConfig.blendIn,entityConfig.blendOut,entityConfig.flags)
    end,

    entityConfig = function(entity,scene,animDict,animName,blendIn,blendOut,flags)
        if not entity   then print("[ti_utils] Scenes.Synchronised.EntityConfig needs a entity as the first argument.");      return false; end
        if not scene    then print("[ti_utils] Scenes.Synchronised.EntityConfig needs a scene as the second argument.");      return false; end
        if not animDict then print("[ti_utils] Scenes.Synchronised.EntityConfig needs an animDict as the third argument.");   return false; end
        if not animName then print("[ti_utils] Scenes.Synchronised.EntityConfig needs an animName as the fourth argument.");  return false; end

        local _D = function(v1,v2) if v1 ~= nil then return v1 else return module.synchronised.defaults["entityConfig"][v2]; end; end

        local conObj = {}
        conObj.entity       = entity
        conObj.scene        = scene
        conObj.animDict     = animDict
        conObj.animName     = animName
        conObj.blendIn      = _D(blendIn,"blendIn")
        conObj.blendOut     = _D(blendOut,"blendOut")
        conObj.flags        = _D(flags,"flags")
        return conObj
    end,

    start = function(scene)
        NetworkStartSynchronisedScene(scene)
    end,

    stop = function(scene)
        NetworkStopSynchronisedScene(scene)
    end,
}

return module