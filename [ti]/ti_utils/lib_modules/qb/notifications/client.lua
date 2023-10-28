local QBCore = select(2,...)

local module = {
  showNotification = function(msg,typeof,time)
    time   = time   or 3000
    typeof = typeof or "primary"

    QBCore.Functions.Notify(msg,typeof,time)
  end,

  drawText = function(msg,alignment)
    alignment = alignment or "left"
    
    exports["qb-core"]:DrawText(msg,alignment)
  end,

  hideText = function()
    exports["qb-core"]:HideText()
  end
}

return module