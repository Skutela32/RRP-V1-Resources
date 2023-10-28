local cbId = -1
local resName = select(1,...)
local asyncCallbacks,syncCallbacks = {},{}

local function getId()
  cbId = cbId + 1

  if cbId >= 65535 then
    cbId = 0
  end

  return cbId
end

local responseHandlers = {
  async = function(id,...)
    if not asyncCallbacks[id] then
      return
    end

    local cb = asyncCallbacks[id]

    asyncCallbacks[id] = nil

    cb(...)
  end,

  sync = function(id,...)
    if not syncCallbacks[id] then
      return
    end

    syncCallbacks[id].ret = {...}
    syncCallbacks[id].res = true
  end
}
  
RegisterNetEvent("ti_utils:callbacks:" .. resName .. ":responded",function(method,...)
  responseHandlers[method](...)
end)

-- API

local module = {}

module.async = function(name,cb,...)
  local id = getId()

  asyncCallbacks[id] = cb

  TriggerServerEvent("ti_utils:callbacks:" .. resName .. ":triggered","async",name,id,...)
end

module.sync = function(name,...)
  local id = getId()

  syncCallbacks[id] = {
    res = false,
    ret = false
  }

  TriggerServerEvent("ti_utils:callbacks:" .. resName .. ":triggered","sync",name,id,...)

  while not syncCallbacks[id].res do
    Wait(100)
  end

  local ret = syncCallbacks[id].ret

  syncCallbacks[id] = nil

  return table.unpack(ret)
end

return module
  