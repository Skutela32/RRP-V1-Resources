local QBCore = select(2,...)

local module = {}

module.start = function(cb)
  TriggerEvent('qb-lockpick:client:openLockpick',cb)
end

return module