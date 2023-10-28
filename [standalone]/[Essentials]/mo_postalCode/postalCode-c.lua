--[[--------------------------]]--
--[[  Created by Mo1810#4230  ]]--
--[[--------------------------]]--
local QBCore = exports['qb-core']:GetCoreObject()


RegisterCommand("postal", function(source, args, raw)
	if args[1] ~= nil then
		local postalCode = args[1]
		setWaypoint(postalCode)
	else
		QBCore.Functions.Notify(Config.Prefix.. "Marker Wasn't Set", "error")
	end
end, false)

function setWaypoint(postalCode)
	local postalCode_coords = vector2(0,0)
	for i = 1, #Config.postalcodes, 1 do
		if Config.postalcodes[i].code == postalCode then
			postalCode_coords = vector2(Config.postalcodes[i].x, Config.postalcodes[i].y)
		end
	end
	
	if postalCode_coords.x ~= 0.0 and postalCode_coords.y ~= 0.0then
		SetNewWaypoint(postalCode_coords.x, postalCode_coords.y)
		QBCore.Functions.Notify(Config.Prefix.. "" ..postalCode, "success")
	else
		QBCore.Functions.Notify(Config.Prefix.. "Marker Wasn't Set", "error")
	end
	
end

Citizen.CreateThread(function()	
	TriggerEvent('chat:addSuggestion', '/postal', 'set marker at target position', {
	    { name="postal code", help="postal code of target (e.g. 001)" }
	})
end)

--[[--------------------------]]--
--[[  Created by Mo1810#4230  ]]--
--[[--------------------------]]--