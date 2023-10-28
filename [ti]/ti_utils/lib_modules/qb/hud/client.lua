local module = {}

module.hide = function()
	DisplayRadar(false)
end

module.show = function()
	DisplayRadar(true)
end

return module