local registeredCallbacks = {}
local resName = select(1,...)
  
RegisterNetEvent("ti_utils:callbacks:" .. resName .. ":triggered",function(method,name,id,...)
  local registered = registeredCallbacks[name]

  if not registered then
    return error("callback does not exist with name (" .. tostring(name) .. ")",1)
  end

  local src = source

  registered.callback(src,function(...)
    if registered.latent then
      TriggerLatentClientEvent("ti_utils:callbacks:" .. resName .. ":responded",src,registered.rate,method,id,...)
    else
      TriggerClientEvent("ti_utils:callbacks:" .. resName .. ":responded",src,method,id,...)
    end
  end,...)
end)

-- API

local module = {}

module.register = function(name,cb)
  if registeredCallbacks[name] then
    return error("callback already registered with name (" .. tostring(name) .. ")",2)
  end

  registeredCallbacks[name] = {callback = cb}
end

module.registerLatent = function(name,cb,rate)
  if registeredCallbacks[name] then
    return error("callback already registered with name (" .. tostring(name) .. ")",2)
  end

  registeredCallbacks[name] = {latent = true, callback = cb, rate = rate or 50000}
end

return module