local QBCore = select(2,...)

local module = {}

module.start = function(name,label,duration,useWhileDead,canCancel,disableControls,animation,prop,propTwo,onFinish,onCancel)
  exports['progressbar']:Progress({
    name = name:lower(),
    duration = duration,
    label = label,
    useWhileDead = useWhileDead,
    canCancel = canCancel,
    controlDisables = disableControls,
    animation = animation,
    prop = prop,
    propTwo = propTwo,
  }, function(cancelled)
    if not cancelled then
      if onFinish then
        onFinish()
      end
    else
      if onCancel then
        onCancel()
      end
    end
  end)
end

module.cancel = function()
  TriggerEvent("progressbar:client:cancel")
end

return module