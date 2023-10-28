local ESX = select(2,...)

local module = {
  showNotification = function(msg)
    ESX.ShowNotification(msg)
  end,

  drawText = function(msg)
    ESX.ShowNotification(msg)
  end,

  hideText = function()
  end
}

return module