local module = {}

module.model = {}

module.model.exists = function(modelOrHash)
  local hash = type(modelOrHash) == 'number' and modelOrHash or GetHashKey(modelOrHash)

  if not IsModelInCdimage(hash) and not IsModelValid(hash) then
    return false,hash
  end

  return true,hash
end

module.model.loadAsync = function(modelOrHash,cb)
  local valid,hash = module.model.exists(modelOrHash)

  if not valid then
    return cb(false,hash)
  end

  RequestModel(hash)

  Citizen.CreateThread(function()
    while not HasModelLoaded(hash) do
      Wait(0)
    end

    cb(true,hash)
  end)
end

module.model.loadSync = function(modelOrHash)
  local valid,hash = module.model.exists(modelOrHash)

  if not valid then
    return false,hash
  end

  RequestModel(hash)

  while not HasModelLoaded(hash) do
    Wait(0)
  end

  return true,hash
end

module.animDict = {}

module.animDict.loadSync = function(ad)
  RequestAnimDict(ad)

  while not HasAnimDictLoaded(ad) do
    Wait(0)
  end
end

return module