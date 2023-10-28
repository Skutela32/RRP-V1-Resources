local resName,ESX,invName = ...

local module = {}

module.start = function(cb,count,speed,duration,label)
  if invName == "mf-inventory" then
    exports["mf-inventory"]:startMinigame(count or 5,speed or 0.5,cb) 
  elseif invName == "ox_inventory" then
    local res = exports["ox_lib"]:progressBar({
      duration = duration or 5000,
      label = label or ""
    })

    cb(res)
  else
    Wait(duration or 5000)
    cb(true)
  end
end

return module