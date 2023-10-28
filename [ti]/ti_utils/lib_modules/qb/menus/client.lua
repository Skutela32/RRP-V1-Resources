local QBCore = select(2,...)
local QBMenu = exports['qb-menu']

local module = {}

module.preview = function(data)
  QBMenu:showHeader({
    {
      header = data.label,
      icon = data.icon,
      txt = data.text,
      params = {
        event = data.retEvent,
        args = data.retArgs
      }
    }
  })
end

module.open = function(data)
  local eles = {}

  for k,v in ipairs(data) do
    table.insert(eles,{
      isMenuHeader = v.isHeader,
      header = v.label,
      icon = v.icon,
      txt = v.text,
      disabled = v.disabled,
      params = {
        event = v.retEvent,
        args = v.retArgs
      }
    })
  end

  QBMenu:openMenu(eles)
end

module.close = function()
  QBMenu:closeMenu()
end

module.input = function(data)
  return exports["qb-input"]:ShowInput(data)
end

return module