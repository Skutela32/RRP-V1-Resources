local ESX = select(2,...)

local module = {}

module.hide = function()
	TriggerEvent("esx_status:setDisplay",0.0)
	ESX.UI.HUD.SetDisplay(0.0)
	DisplayRadar(false)
end

module.show = function()
	TriggerEvent("esx_status:setDisplay",1.0)
	ESX.UI.HUD.SetDisplay(1.0)
	DisplayRadar(true)
end

return module