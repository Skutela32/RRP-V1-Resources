local resName,ESX,invName = ...

local module = {}

module.start = function(name,label,duration,useWhileDead,canCancel,disableControls,animation,prop,propTwo,onFinish,onCancel)
  if invName == "mf-inventory" then
    local count = 5
    local speed = 0.5

    exports["mf-inventory"]:startMinigame(count,speed,function(res)
      if res then 
        onFinish() 
      else 
        onCancel() 
      end
    end)
  elseif invName == "ox_inventory" then
    local res = exports["ox_lib"]:progressBar({
      duration = duration or 5000,
      label = label or ""
    })

    if res then
      onFinish()
    else
      onCancel()
    end
  else
    Wait(duration or 5000)
    onFinish(true)
  end
end

module.cancel = function()
end

return module