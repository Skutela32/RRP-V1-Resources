local registeredCallbacks = {}
local resName = select(1,...)
  
RegisterNetEvent("ti_utils:callbacks:" .. resName .. ":triggered",function(method,name,id,...)
  if not registeredCallbacks[name] then
    return error("callback does not exist with name (" .. tostring(name) .. ")",1)
  end

  local src = source

  registeredCallbacks[name](src,function(...)
    TriggerClientEvent("ti_utils:callbacks:" .. resName .. ":responded",src,method,id,...)
  end,...)
end)

-- API

local module = {}

module.register = function(name,cb)
  if registeredCallbacks[name] then
    return error("callback already registered with name (" .. tostring(name) .. ")",2)
  end

  registeredCallbacks[name] = cb
end

return module