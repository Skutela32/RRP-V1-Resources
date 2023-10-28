local previewing, stoppreview, properties, carMeta = false, false, nil, {}

local wheelCats = {
	{ id = 0, name = Loc[Config.Lan]["rims"].label1 },
	{ id = 1, name = Loc[Config.Lan]["rims"].label2 },
	{ id = 2, name = Loc[Config.Lan]["rims"].label3 },
	{ id = 3, name = Loc[Config.Lan]["rims"].label4 },
	{ id = 4, name = Loc[Config.Lan]["rims"].label5 },
	{ id = 5, name = Loc[Config.Lan]["rims"].label6 },
	{ id = 7, name = Loc[Config.Lan]["rims"].label7 },
	{ id = 8, name = Loc[Config.Lan]["rims"].label8 },
	{ id = 9, name = Loc[Config.Lan]["rims"].label9 },
	{ id = 10, name = Loc[Config.Lan]["rims"].label10 },
	{ id = 11, name = Loc[Config.Lan]["rims"].label11 },
	{ id = 12, name = Loc[Config.Lan]["rims"].label12 },
	{ id = 6, name = Loc[Config.Lan]["rims"].label13 },
	{ id = 7, name = Loc[Config.Lan]["rims"].label14 },
}

local function printDifferences(vehicle, properties, newproperties)
	local veh = carMeta["search"]
	local vehplate = "["..trim(properties.plate).."]"
	local vehlist = {}
	local modlist = {}
	qblog("Finished Previewing: [**"..carMeta["plate"].."**]")
	SetVehicleWindowTint(vehicle, properties["windowTint"]) -- Had issues resetting the windows if changed, manually do it here
	if properties["color1"] ~= newproperties["color1"] then
		if type(newproperties["color1"]) ~= "table" then
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if newproperties["color1"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].primary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metallic..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metallic..")", ["item"] = Loc[Config.Lan]["paint"].primary.." - "..QBCore.Shared.Items["paintcan"].label } end end
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do if newproperties["color1"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].primary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].matte..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].matte..")", ["item"] = Loc[Config.Lan]["paint"].primary.." - "..QBCore.Shared.Items["paintcan"].label } end end
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do if newproperties["color1"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].primary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metals..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metals..")", ["item"] = Loc[Config.Lan]["paint"].primary.." - "..QBCore.Shared.Items["paintcan"].label } end end
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsChameleon) do if newproperties["color1"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].primary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].chameleon..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].chameleon..")", ["item"] = Loc[Config.Lan]["paint"].primary.." - "..QBCore.Shared.Items["paintcan"].label } end end
		end
	end
	if properties["color2"] ~= newproperties["color2"] then
		if type(newproperties["color2"]) ~= "table" then
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if newproperties["color2"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].secondary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metallic..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metallic..")", ["item"] = Loc[Config.Lan]["paint"].secondary.." - "..QBCore.Shared.Items["paintcan"].label } end end
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do if newproperties["color2"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].secondary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].matte..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].matte..")", ["item"] = Loc[Config.Lan]["paint"].secondary.." - "..QBCore.Shared.Items["paintcan"].label } end end
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do if newproperties["color2"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].secondary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metals..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metals..")", ["item"] = Loc[Config.Lan]["paint"].secondary.." - "..QBCore.Shared.Items["paintcan"].label } end end
			for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsChameleon) do if newproperties["color2"] == v.id then
			vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].secondary.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].chameleon..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].chameleon..")", ["item"] = Loc[Config.Lan]["paint"].secondary.." - "..QBCore.Shared.Items["paintcan"].label } end end
		end
	end
	if properties["pearlescentColor"] ~= newproperties["pearlescentColor"] then
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if newproperties["pearlescentColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].pearl.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metallic..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metallic..")", ["item"] = Loc[Config.Lan]["paint"].pearl.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do if newproperties["pearlescentColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].pearl.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].matte..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].matte..")", ["item"] = Loc[Config.Lan]["paint"].pearl.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do if newproperties["pearlescentColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].pearl.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metals..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metals..")", ["item"] = Loc[Config.Lan]["paint"].pearl.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsChameleon) do if newproperties["pearlescentColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].pearl.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].chameleon..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].chameleon..")", ["item"] = Loc[Config.Lan]["paint"].pearl.." - "..QBCore.Shared.Items["paintcan"].label } end end
	end
	if properties["wheelColor"] ~= newproperties["wheelColor"] then
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if newproperties["wheelColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].wheel.." Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metallic..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metallic..")", ["item"] = Loc[Config.Lan]["paint"].wheel.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do if newproperties["wheelColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].wheel.."Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].matte..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].matte..")", ["item"] = Loc[Config.Lan]["paint"].wheel.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do if newproperties["wheelColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].wheel.."Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metals..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metals..")", ["item"] = Loc[Config.Lan]["paint"].wheel.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsChameleon) do if newproperties["wheelColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].wheel.."Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].chameleon..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].chameleon..")", ["item"] = Loc[Config.Lan]["paint"].wheel.." - "..QBCore.Shared.Items["paintcan"].label } end end
	end
	if properties["dashboardColor"] ~= newproperties["dashboardColor"] then
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if newproperties["dashboardColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].dashboard.."Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metallic..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metallic..")", ["item"] = Loc[Config.Lan]["paint"].dashboard.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do if newproperties["dashboardColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].dashboard.."Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].matte..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].matte..")", ["item"] = Loc[Config.Lan]["paint"].dashboard.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do if newproperties["dashboardColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].dashboard.."Color - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metals..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metals..")", ["item"] = Loc[Config.Lan]["paint"].dashboard.." - "..QBCore.Shared.Items["paintcan"].label } end end
	end
	if properties["interiorColor"] ~= newproperties["interiorColor"] then
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if newproperties["interiorColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].interior.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metallic..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metallic..")", ["item"] = Loc[Config.Lan]["paint"].interior.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do if newproperties["interiorColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].interior.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].matte..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].matte..")", ["item"] = Loc[Config.Lan]["paint"].interior.." - "..QBCore.Shared.Items["paintcan"].label } end end
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do if newproperties["interiorColor"] == v.id then
		vehlist[#vehlist+1] = Loc[Config.Lan]["paint"].interior.." - [ "..v.name.." ("..Loc[Config.Lan]["paint"].metals..") ]" modlist[#modlist+1] = {['type'] = v.name.." ("..Loc[Config.Lan]["paint"].metals..")", ["item"] = Loc[Config.Lan]["paint"].interior.." - "..QBCore.Shared.Items["paintcan"].label } end end
	end
	if properties["modFrontWheels"] ~= newproperties["modFrontWheels"] then
		for i = 1, #wheelCats do if newproperties["wheels"] == wheelCats[i].id then name = wheelCats[i].name end end
		originalWheel = GetVehicleWheelType(vehicle)
		SetVehicleWheelType(vehicle, newproperties["wheels"])
		if GetLabelText(GetModTextLabel(vehicle, 23, (newproperties["modFrontWheels"]))) == "NULL" then
			vehlist[#vehlist+1] = "Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 23, (newproperties["modFrontWheels"]))).." ("..newproperties["modFrontWheels"]..") ("..name..") ]"
			modlist[#modlist+1] = {['type'] = "("..name..")", ["item"] = "Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 23, (newproperties["modFrontWheels"]))).." ("..newproperties["modFrontWheels"]..") - "..QBCore.Shared.Items["rims"].label }
		else
			vehlist[#vehlist+1] = "Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 23, (newproperties["modFrontWheels"]))).." ("..name..") ]"
			modlist[#modlist+1] = {['type'] = "("..name..")", ["item"] = "Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 23, (newproperties["modFrontWheels"]))).." ] - "..QBCore.Shared.Items["rims"].label }
		end
		SetVehicleWheelType(vehicle, originalWheel)
	end
	if properties["modBackWheels"] ~= newproperties["modBackWheels"] then
		for i = 1, #wheelCats do if (newproperties["wheels"]+1) == wheelCats[i].id then name = wheelCats[i].name end end
		originalWheel = GetVehicleWheelType(vehicle)
		SetVehicleWheelType(vehicle, newproperties["wheels"])
		--vehlist[#vehlist+1] = "Back Wheels -[ "..GetLabelText(GetModTextLabel(vehicle, 24, (newproperties["modBackWheels"]))).." - ("..name..") ]"
		if GetLabelText(GetModTextLabel(vehicle, 23, (newproperties["modFrontWheels"]))) == "NULL" then
			vehlist[#vehlist+1] = "Back Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 24, (newproperties["modBackWheels"]))).." ("..newproperties["modBackWheels"]..") ("..name..") ]"
			modlist[#modlist+1] = {['type'] = "("..name..")", ["item"] = "Back Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 24, (newproperties["modBackWheels"]))).." ("..newproperties["modBackWheels"]..") - "..QBCore.Shared.Items["rims"].label }
		else
			vehlist[#vehlist+1] = "Back Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 24, (newproperties["modBackWheels"]))).." ("..name..") ]"
			modlist[#modlist+1] = {['type'] = "("..name..")", ["item"] = "Back Wheels - [ "..GetLabelText(GetModTextLabel(vehicle, 24, (newproperties["modBackWheels"]))).." ] - "..QBCore.Shared.Items["rims"].label  }
		end
		SetVehicleWheelType(vehicle, originalWheel)
	end
	if properties["plateIndex"] ~= newproperties["plateIndex"] then
		for k, v in pairs(Loc[Config.Lan].vehiclePlateOptions) do
			if newproperties["plateIndex"] == v.id then
				vehlist[#vehlist+1] = Loc[Config.Lan]["police"].plates.." - [ "..v.name.." ]"
				modlist[#modlist+1] = {['type'] = "("..v.name..")", ["item"] = Loc[Config.Lan]["police"].plates.." - "..QBCore.Shared.Items["customplate"].label }
			end
		end
	end
	if properties["windowTint"] ~= newproperties["windowTint"] then
		local name = ""
		if newproperties["windowTint"] == 0 then name = "Stock"
		else
			for k, v in pairs(Loc[Config.Lan].vehicleWindowOptions) do
				if v.id == newproperties["windowTint"] then name = v.name end
			end
		end
		vehlist[#vehlist+1] = Loc[Config.Lan]["windows"].menuheader.." - [ "..name.." ] - "
		modlist[#modlist+1] = {['type'] = "("..name..")", ["item"] = Loc[Config.Lan]["windows"].menuheader.." - "..QBCore.Shared.Items["tint_supplies"].label }
	end

	for k, v in pairs(newproperties["extras"]) do
		if properties["extras"][k] ~= newproperties["extras"][k] then
			vehlist[#vehlist+1] = Loc[Config.Lan]["police"].extras.." - [ Extra: "..k..": "..(v and "ON" or "OFF").." ] - "
			modlist[#modlist+1] = {['type'] = "(Extra: "..k..": "..(v and "ON" or "OFF")..")", ["item"] = Loc[Config.Lan]["police"].extras.." - "..QBCore.Shared.Items["externals"].label }
		end
	end
	local conTable = {
		["modSpoilers"] = { mod = 0, label = Loc[Config.Lan]["check"].label15, item = QBCore.Shared.Items["spoiler"].label },
		["modFrontBumper"] = { mod = 1, label = Loc[Config.Lan]["check"].label16, item = QBCore.Shared.Items["bumper"].label },
		["modRearBumper"] = { mod = 2, label = Loc[Config.Lan]["check"].label17, item = QBCore.Shared.Items["bumper"].label },
		["modSideSkirt"] = { mod = 3, label = Loc[Config.Lan]["check"].label18, item = QBCore.Shared.Items["skirts"].label },
		["modExhaust"] = { mod = 4, label = Loc[Config.Lan]["check"].label19, item = QBCore.Shared.Items["exhaust"].label },
		["modGrille"] = { mod = 6, label = Loc[Config.Lan]["check"].label20, item = QBCore.Shared.Items["bumper"].label },
		["modHood"] = { mod = 7, label = Loc[Config.Lan]["check"].label21, item = QBCore.Shared.Items["hood"].label },
		["modFender"] = { mod = 8, label = Loc[Config.Lan]["check"].label22, item = QBCore.Shared.Items["skirts"].label },
		["modRightFender"] = { mod = 9, label = Loc[Config.Lan]["check"].label26, item = QBCore.Shared.Items["skirts"].label },
		["modRoof"] = { mod = 10, label = Loc[Config.Lan]["check"].label24, item = QBCore.Shared.Items["roof"].label },
		["modPlateHolder"] = { mod = 25, label = Loc[Config.Lan]["check"].label25, item = QBCore.Shared.Items["customplate"].label },
		["modVanityPlate"] = { mod = 26, label = Loc[Config.Lan]["check"].label26, item = QBCore.Shared.Items["customplate"].label },
		["modTrimA"] = { mod = 27, label = Loc[Config.Lan]["check"].label27, item = QBCore.Shared.Items["externals"].label },
		["modTrimB"] = { mod = 44, label = Loc[Config.Lan]["check"].label28, item = QBCore.Shared.Items["externals"].label },
		["modTrunk"] = { mod = 37, label = Loc[Config.Lan]["check"].label29, item = QBCore.Shared.Items["externals"].label },
		["modEngineBlock"] = { mod = 39, label = Loc[Config.Lan]["check"].label30, item = QBCore.Shared.Items["externals"].label },
		["modAirFilter"] = { mod = 40, label = Loc[Config.Lan]["check"].label31, item = QBCore.Shared.Items["externals"].label },
		["modStruts"] = { mod = 41, label = Loc[Config.Lan]["check"].label32, item = QBCore.Shared.Items["externals"].label },
		["modArchCover"] = { mod = 42, label = Loc[Config.Lan]["check"].label33, item = QBCore.Shared.Items["externals"].label },
		["modFrame"] = { mod = 5, label = Loc[Config.Lan]["check"].label34, item = QBCore.Shared.Items["rollcage"].label },
		["modOrnaments"] = { mod = 28, label = Loc[Config.Lan]["check"].label35, item = QBCore.Shared.Items["internals"].label },
		["modDashboard"] = { mod = 29, label = Loc[Config.Lan]["check"].label36, item = QBCore.Shared.Items["internals"].label },
		["modDial"] = { mod = 30, label = Loc[Config.Lan]["check"].label37, item = QBCore.Shared.Items["internals"].label },
		["modDoorSpeaker"] = { mod = 31, label = Loc[Config.Lan]["check"].label38, item = QBCore.Shared.Items["internals"].label },
		["modSeats"] = { mod = 32, label = Loc[Config.Lan]["check"].label39, item = QBCore.Shared.Items["seat"].label },
		["modSteeringWheel"] = { mod = 33, label = Loc[Config.Lan]["check"].label40, item = QBCore.Shared.Items["internals"].label },
		["modShifterLeavers"] = { mod = 34, label = Loc[Config.Lan]["check"].label41, item = QBCore.Shared.Items["internals"].label },
		["modAPlate"] = { mod = 35, label = Loc[Config.Lan]["check"].label42, item = QBCore.Shared.Items["internals"].label },
		["modSpeakers"] = { mod = 36, label = Loc[Config.Lan]["check"].label43, item = QBCore.Shared.Items["internals"].label },
		["modHydrolic"] = { mod = 38, label = Loc[Config.Lan]["check"].label44, item = QBCore.Shared.Items["externals"].label },
		["modAerials"] = { mod = 43, label = Loc[Config.Lan]["check"].label45, item = QBCore.Shared.Items["externals"].label },
		["modTank"] = { mod = 45, label = Loc[Config.Lan]["check"].label46, item = QBCore.Shared.Items["externals"].label },
		["modLivery"] = { mod = 48, label = Loc[Config.Lan]["police"].livery, item = QBCore.Shared.Items["livery"].label },
	}

	for k, v in pairs(newproperties) do
		if properties[k] ~= newproperties[k] then
			for l in pairs(conTable) do
				if conTable[k] then
					local label = GetLabelText(GetModTextLabel(vehicle, conTable[k].mod, (newproperties[k])))
					vehlist[#vehlist+1] = conTable[k].label..tostring(newproperties[k]+1)..". "..label.." ]"
					modlist[#modlist+1] = {['type'] = "("..label..")", ["item"] = conTable[k].label..tostring(newproperties[k]+1 .." ] - "..conTable[k].item)}
					break
				end
			end
		end
	end
	local hasPhone = false
	for _, v in pairs(Config.Previews.PhoneItems) do
		if HasItem(v) then hasPhone = true break end end

    if Config.Previews.PreviewPhone and hasPhone then
		if vehlist[1] then local newlist = ""
			local eventTable = {
				["gks"] = "gksphone:NewMail",
				["qs"] = "qs-smartphone:server:sendNewMail",
				["qb"] = "qb-phone:server:sendNewMail",
				["roadphone"] = "roadphone:receiveMail",
				--["lb"] = "roadphone:receiveMail",
			}
			local br = Config.Previews.PhoneMail == "roadphone" and "\n" or "<br>"
			for i = 1, #vehlist do newlist = newlist..br..vehlist[i] end
			TriggerServerEvent(eventTable[Config.Previews.PhoneMail], {
				sender = vehplate,
				subject = veh,
				message = veh..Loc[Config.Lan]["police"].plates..": "..vehplate..br..br..Loc[Config.Lan]["previews"].changes..#vehlist..br.." ----------------------- "..br..newlist,
				button = {}
			})
		end
	elseif not Config.Previews.PreviewPhone or not hasPhone then
		if vehlist[1] then
			local info = { veh = veh, vehplate = vehplate, vehlist = vehlist }
			TriggerServerEvent("jim-mechanic:server:giveList", info)
		end
	end
	if Config.Discord.DiscordPreview then
		if modlist[1] then
			local shopName = " - Unknown"
			local thumb = "http://clipart-library.com/image_gallery2/Spanner-PNG-Image.png"
			local htmllink = Config.Discord.DiscordDefault
			local colour = 16753920
			for k, v in pairs(Config.Locations) do
				if inLocation == v.designatedName then
					if v.discord.link ~= "" then
						shopName = " - "..(v.blip and v.blip.label or "N/A")
						thumb = v.payments.img
						htmllink = v.discord.link
						colour = v.discord.colour
					end
					break
				end
			end

			TriggerServerEvent("jim-mechanic:server:discordLog", { veh = veh, vehplate = vehplate, modlist = modlist, shopName = shopName, htmllink = htmllink, colour = colour, thumb = thumb})
		end
	end
end

RegisterNetEvent("jim-mechanic:client:giveList", function(item)
	local list = {}
	local newlist = ""
	for i = 1, #item.info["vehlist"] do newlist = newlist..item.info["vehlist"][i]..br end
	list[#list+1] = { isMenuHeader = true, disabled = Config.System.Menu == "ox",
		header = item.info["veh"], txt = Loc[Config.Lan]["police"].plates..": "..item.info["vehplate"]..br..Loc[Config.Lan]["previews"].changes..(#item.info["vehlist"]),
		title = item.info["veh"], description = Loc[Config.Lan]["police"].plates..": "..item.info["vehplate"]..br..Loc[Config.Lan]["previews"].changes..(#item.info["vehlist"])
	}
	if Config.System.Menu == "qb" then
		list[#list+1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "jim-mechanic:client:Menu:Close" }, }
	end
	list[#list+1] = { isMenuHeader = true, disabled = Config.System.Menu == "ox", header = "", txt = newlist, title = "Mods:", description = newlist,  }
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = item.info["vehplate"], position = 'top-right', options = list }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(list) end
end)

local camTable = {}
local currentCam = 2
function startPreviewCamera(vehicle)
	local vehcoords = GetEntityCoords(vehicle)
	for k, v in ipairs({
		GetOffsetFromEntityInWorldCoords(vehicle, 1.8, 3.5, 2.0), -- Front
		GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 4.0, 0.5),
		GetOffsetFromEntityInWorldCoords(vehicle, -1.8, 3.5, 2.0),

		GetOffsetFromEntityInWorldCoords(vehicle, -3.5, 0.0, 0.5), -- Left
		GetOffsetFromEntityInWorldCoords(vehicle, -2.6, 0.0, 3.0), -- Left

		GetOffsetFromEntityInWorldCoords(vehicle, -1.8, -3.5, 2.0), -- Back
		GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -5.0, 0.5),
		GetOffsetFromEntityInWorldCoords(vehicle, 1.8, -3.5, 2.5),

		GetOffsetFromEntityInWorldCoords(vehicle, 3.5, 0.0, 0.5), -- Right
		GetOffsetFromEntityInWorldCoords(vehicle, 2.6, 0.0, 3.0), -- Right
	}) do
		camTable[k] = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", v.x, v.y, v.z, 0.0, 0.0, 180.0, 60.00, false, 0)
		PointCamAtCoord(camTable[k], vehcoords.x, vehcoords.y, vehcoords.z)
	end
	SetCamActive(camTable[currentCam], true)
	RenderScriptCams(true, true, 2000, true, true)
	triggerNotify(nil, "Camera Enabled", "success")
end

local currentPlate = nil
--A function to detect if the person editing is in the driver seat or not
local function preview(Ped, vehicle)
	if not previewing then
		inpreview = true
		previewing = true
		qblog("Used `/preview` in: [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
		TriggerServerEvent("jim-mechanic:server:preview", true, VehToNet(vehicle), trim(GetVehicleNumberPlateText(vehicle)))
		FreezeEntityPosition(vehicle, true)
		if Config.Previews.hardCam then startPreviewCamera(vehicle) end
	else return end
	properties = QBCore.Functions.GetVehicleProperties(vehicle)
	currentPlate = trim(GetVehicleNumberPlateText(vehicle))
	if not Config.Overrides.disablePreviewPlate then
		TriggerServerEvent("jim-mechanic:server:changePlate", VehToNet(vehicle), "PREVIEWZ")
	end
	while previewing do
		if GetSeatPedIsIn(vehicle) ~= -1 then previewing = false end
		if not previewing or stoppreview == true then
			if Config.Previews.hardCam then
				for i = 1, #camTable do
					SetCamActive(camTable[i], true)
					DestroyCam(camTable[i], true)
				end
				camTable = {}
				currentCam = 2
				RenderScriptCams(false, true, 2000, true, true)
			end
			inpreview = false
			previewing = false
			stoppreview = false
			if DoesEntityExist(vehicle) then
				FreezeEntityPosition(vehicle, false)
				TriggerServerEvent("jim-mechanic:server:preview", false)
				local newproperties = QBCore.Functions.GetVehicleProperties(vehicle)
				QBCore.Functions.SetVehicleProperties(vehicle, properties)
				SetVehicleEngineOn(vehicle, true, false, false)
				if newproperties == nil then return	else
				printDifferences(vehicle, properties, newproperties)
				if not Config.Overrides.disablePreviewPlate then
					TriggerServerEvent("jim-mechanic:server:changePlate", VehToNet(vehicle), currentPlate)
				end end
			end
			currentPlate = nil
			break
		end
		Wait(1000)
	end
end

RegisterNetEvent("jim-mechanic:preview:exploitfix", function(vehicle, resetprop)
	if Config.System.Debug then print("^5Debug^7: ^3Preview: ^2Using client to reset vehicle properties of abandoned vehicle^7") end
	QBCore.Functions.SetVehicleProperties(NetToVeh(vehicle), resetprop)
	FreezeEntityPosition(NetToVeh(vehicle), false)
end)

RegisterNetEvent("jim-mechanic:preview:stop", function() stoppreview = true end)

RegisterNetEvent('jim-mechanic:client:Preview:Menu', function() local validMods, Menu, vehicle, hasExtra, Ped = {}, {}, nil, false, PlayerPedId()
	if Config.Previews.PreviewJob then if not previewJobChecks() then return end end
	if Config.Previews.PreviewLocation then if not previewLocationChecks() then return end end
	if not outCar() then return end
	if IsPedInAnyVehicle(Ped, false) then
		vehicle = GetVehiclePedIsIn(Ped, false) pushVehicle(vehicle)
		if GetPedInVehicleSeat(vehicle, -1) ~= Ped then return end
		carMeta = { ["search"] = searchCar(vehicle), ["class"] = getClass(vehicle), ["plate"] = trim(GetVehicleNumberPlateText(vehicle)), ["price"] = searchPrice(vehicle), ["dist"] = searchDist(vehicle), }

		Menu[#Menu+1] = { header = (Config.System.Menu == "qb") and carMeta["search"] or "", icon = "fas fa-camera",
			txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
			title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
			params = { event = "jim-mechanic:client:Preview:Camera", args = { event = "jim-mechanic:client:Preview:Menu" }, },
			event = "jim-mechanic:client:Preview:Camera", args = { event = "jim-mechanic:client:Preview:Menu" },
		}

		if Config.System.Menu == "qb" then Menu[#Menu+1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "jim-mechanic:client:Menu:Close" }, } end

		Menu[#Menu+1] = { icon = "fas fa-ban",	header = "", txt = "Stop Previewing", params = { event = "jim-mechanic:preview:stop" }, title = "Stop Previewing", event = "jim-mechanic:preview:stop", }

		Menu[#Menu+1] = {
			header = "", txt = Loc[Config.Lan]["paint"].menuheader, params = { event = "jim-mechanic:client:Preview:Paint" },
			title = Loc[Config.Lan]["paint"].menuheader, event = "jim-mechanic:client:Preview:Paint",
		}
		Menu[#Menu+1] = {
			header = "", txt = Loc[Config.Lan]["police"].plates, params = { event = "jim-mechanic:client:Preview:Plates" },
			title = Loc[Config.Lan]["police"].plates, event = "jim-mechanic:client:Preview:Plates",
		}

		if GetNumVehicleMods(vehicle, 48) > 0 or GetVehicleLiveryCount(vehicle) > -1 then
			Menu[#Menu+1] = {
				header = "", txt = Loc[Config.Lan]["police"].livery, params = { event = "jim-mechanic:client:Preview:Livery" },
				title = Loc[Config.Lan]["police"].livery, event = "jim-mechanic:client:Preview:Livery",
			}
		end
		Menu[#Menu+1] = {
			header = "", txt = Loc[Config.Lan]["rims"].menuheader, params = { event = "jim-mechanic:client:Preview:Rims:Check" },
			title = Loc[Config.Lan]["rims"].menuheader, event = "jim-mechanic:client:Preview:Rims:Check",
		}

		local extraCount = 0
		for i = 0, 14 do extraCount += tonumber(DoesExtraExist(vehicle, i)) or 0 end
		if extraCount > 0 then
			local isDamaged, text = false, ""
			if GetVehicleBodyHealth(vehicle) < 950 or GetVehicleEngineHealth(vehicle) < 990 or GetVehiclePetrolTankHealth(vehicle) < 980 then isDamaged = true text = " - Vehicle Damaged" end
			Menu[#Menu+1] = {
				header = "", txt = Loc[Config.Lan]["police"].extras, params = { event = "jim-mechanic:client:Preview:Extras:Check" },
				title = Loc[Config.Lan]["police"].extras..text, event = "jim-mechanic:client:Preview:Extras:Check", disabled = isDamaged
			}
		end

		local list = {
			--Exterior
			{ id = 0, name = Loc[Config.Lan]["check"].label15 }, { id = 1, name = Loc[Config.Lan]["check"].label16 }, { id = 2, name = Loc[Config.Lan]["check"].label17 }, { id = 3, name = Loc[Config.Lan]["check"].label18 },
			{ id = 4, name = Loc[Config.Lan]["check"].label19 }, { id = 6, name = Loc[Config.Lan]["check"].label20 }, { id = 7, name = Loc[Config.Lan]["check"].label21 }, { id = 8, name = Loc[Config.Lan]["check"].label22 },
			{ id = 9, name = Loc[Config.Lan]["check"].label23 }, { id = 10, name = Loc[Config.Lan]["check"].label24 }, { id = 25, name = Loc[Config.Lan]["check"].label25 }, { id = 26, name = Loc[Config.Lan]["check"].label26 },
			{ id = 27, name = Loc[Config.Lan]["check"].label27 }, { id = 44, name = Loc[Config.Lan]["check"].label28 }, { id = 37, name = Loc[Config.Lan]["check"].label29 }, { id = 39, name = Loc[Config.Lan]["check"].label30 },
			{ id = 40, name = Loc[Config.Lan]["check"].label31 }, { id = 41, name = Loc[Config.Lan]["check"].label32 }, { id = 42, name = Loc[Config.Lan]["check"].label33 },
			--Interior
			{ id = 5, name = Loc[Config.Lan]["check"].label34 }, { id = 28, name = Loc[Config.Lan]["check"].label35 }, { id = 29, name = Loc[Config.Lan]["check"].label36 }, { id = 30, name = Loc[Config.Lan]["check"].label37 },
			{ id = 31, name = Loc[Config.Lan]["check"].label38 }, { id = 32, name = Loc[Config.Lan]["check"].label39 }, { id = 33, name = Loc[Config.Lan]["check"].label40 }, { id = 34, name = Loc[Config.Lan]["check"].label41 },
			{ id = 35, name = Loc[Config.Lan]["check"].label42 }, { id = 36, name = Loc[Config.Lan]["check"].label43 }, { id = 38, name = Loc[Config.Lan]["check"].label44 }, { id = 43, name = Loc[Config.Lan]["check"].label45 },
			{ id = 45, name = Loc[Config.Lan]["check"].label46 },
		}

		for i = 1, #list do
			if GetNumVehicleMods(vehicle, list[i].id) ~= 0 then
				Menu[#Menu+1] = {
					header = "", txt = list[i].name..Loc[Config.Lan]["common"].amountoption..(GetNumVehicleMods(vehicle, list[i].id)+1).." ]", params = { event = "jim-mechanic:client:Preview:Multi", args = list[i] },
					title = list[i].name..Loc[Config.Lan]["common"].amountoption..(GetNumVehicleMods(vehicle, list[i].id)+1).." ]", event = "jim-mechanic:client:Preview:Multi", args = list[i]
				}
			end
		end

		if not IsThisModelABike(GetEntityModel(vehicle)) then
			Menu[#Menu+1] = {
				header = "", txt = Loc[Config.Lan]["windows"].menuheader, params = { event = "jim-mechanic:client:Preview:Windows:Check" },
				title = Loc[Config.Lan]["windows"].menuheader, event = "jim-mechanic:client:Preview:Windows:Check",
			}
		end
		if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
		elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
		preview(Ped, vehicle)
	end
end)

RegisterNetEvent("jim-mechanic:client:Preview:Camera", function(data)
	if Config.Previews.hardCam then
		local prevCam = currentCam
		currentCam += 1
		currentCam = currentCam < 1 and countTable(camTable) or currentCam
		currentCam = currentCam > countTable(camTable) and 1 or currentCam
		SetCamActiveWithInterp(camTable[currentCam], camTable[prevCam], 800, 0, 0)
	else Wait(3000) end
	TriggerEvent(data.event, data.data)
end)

RegisterNetEvent("jim-mechanic:client:Preview:Multi", function(data) local validMods, Menu, icon, disabled, stockinstall, Ped = {}, {}, "", false, "", PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false)
		for i = 1, GetNumVehicleMods(vehicle, data.id) do
			if GetVehicleMod(vehicle, data.id) == (i-1) then txt = Loc[Config.Lan]["common"].current else txt = "" end
			validMods[i] = { id = (i - 1), name = GetLabelText(GetModTextLabel(vehicle, data.id, (i - 1))), install = txt }
		end
	end
	if GetVehicleMod(vehicle, data.id) == -1 then stockinstall = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else stockinstall = ""	end

	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Multi" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Multi" }, }

	Menu[#Menu+1] = { isMenuHeader = true, disabled = (Config.System.Menu == "ox"),
		header = "", txt = data.name.." "..Loc[Config.Lan]["common"].amountoption..(#validMods+1).." ]",
		title = data.name.." "..Loc[Config.Lan]["common"].amountoption..(#validMods+1).." ]",
	}
	Menu[#Menu+1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu" }, title = Loc[Config.Lan]["common"].ret , event = "jim-mechanic:client:Preview:Menu" }
	Menu[#Menu+1] = { icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
		header = "0. "..Loc[Config.Lan]["common"].stock, txt = stockinstall, params = { event = "jim-mechanic:client:Preview:Multi:Apply", args = { id = -1, mod = data.id, name = data.name }, },
		title = "0 - "..Loc[Config.Lan]["common"].stock, description = stockinstall, event = "jim-mechanic:client:Preview:Multi:Apply", args = { id = -1, mod = data.id, name = data.name },
	}

	for k, v in pairs(validMods) do
		local icon, disabled = "", false
		if GetVehicleMod(vehicle, data.id) == v.id then icon = "fas fa-check" disabled = true end
		Menu[#Menu + 1] = { icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
			header = k..". "..v.name, txt = v.install, params = { event = 'jim-mechanic:client:Preview:Multi:Apply', args = { id = tostring(v.id), mod = data.id, name = data.name }, } ,
			title = k.." - "..v.name, description = v.install, event = 'jim-mechanic:client:Preview:Multi:Apply', args = { id = tostring(v.id), mod = data.id, name = data.name },
		}
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = Loc[Config.Lan]["police"].header, position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Multi:Apply', function(data) local Ped, coords, returndata = PlayerPedId(), GetEntityCoords(PlayerPedId()), { id = data.mod, name = data.name }
	if IsPedInAnyVehicle(Ped, false) then	vehicle = GetVehiclePedIsIn(Ped, false) end
	local modName = GetLabelText(GetModTextLabel(vehicle, data.mod, tonumber(data.id)))
	if modName == "NULL" then modName = Loc[Config.Lan]["common"].stock end
	if GetVehicleMod(vehicle, data.mod) ~= tonumber(data.id) then SetVehicleMod(vehicle, data.mod, tonumber(data.id)) end
	TriggerEvent('jim-mechanic:client:Preview:Multi', returndata)
end)

RegisterNetEvent('jim-mechanic:client:Preview:Livery', function(data) local stockinstall, Menu, validMods, amountMods, vehicle, Ped = "", {}, {}, 0, nil, PlayerPedId()
	if not data then data = {} end
	if IsPedInAnyVehicle(Ped, false) then	vehicle = GetVehiclePedIsIn(Ped, false)
        if GetNumVehicleMods(vehicle, 48) == 0 and GetVehicleLiveryCount(vehicle) ~= 0 then
			oldlivery = true
			for i = 0, GetVehicleLiveryCount(vehicle)-1 do
				if GetVehicleLivery(vehicle) == (i) then txt = Loc[Config.Lan]["common"].current
				elseif GetVehicleLivery(vehicle) ~= (i) then txt = "" end
				if i ~= 0 then validMods[i] = { id = i, name = Loc[Config.Lan]["police"].livery.." "..i, install = txt } end
			end
			amountMods = GetVehicleLiveryCount(vehicle)
		else
			oldlivery = false
			for i = 1, GetNumVehicleMods(vehicle, 48) do
				local modName = GetLabelText(GetModTextLabel(vehicle, 48, (i - 1)))
				if GetVehicleMod(vehicle, 48) == (i-1) then txt = Loc[Config.Lan]["common"].current
				elseif GetVehicleMod(vehicle, 48) ~= (i-1) then txt = "" end
				validMods[i] = { id = (i - 1), name = modName, install = txt }
				amountMods = (GetNumVehicleMods(vehicle, 48)+1)
			end
		end
	end
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Livery" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Livery" },
	}
	Menu[#Menu + 1] = { isMenuHeader = true, disabled = (Config.System.Menu == "ox"),
		header = "", txt = Loc[Config.Lan]["police"].livery.." - [ "..Loc[Config.Lan]["common"].amountoption..amountMods.." ]",
		title = Loc[Config.Lan]["police"].livery.." - [ "..Loc[Config.Lan]["common"].amountoption..amountMods.." ]",
	}
	if data and data.close then
		if Config.System.Menu == "qb" then Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "jim-mechanic:client:Menu:Close" } } end
	else
		Menu[#Menu + 1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu" }, title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Menu", }
	end

	if oldlivery then
		if GetVehicleLivery(vehicle) == 0 then stockinstall = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else stockinstall = "" end
		Menu[#Menu + 1] = {
			icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
			header = "0. "..Loc[Config.Lan]["common"].stock, txt = stockinstall, params = { event = "jim-mechanic:client:Preview:Apply", args = { id = tostring(0), old = true, close = data.close } },
			title = "0 - "..Loc[Config.Lan]["common"].stock, description = stockinstall, event = "jim-mechanic:client:Preview:Apply", args = { id = tostring(0), old = true, close = data.close } }
		for k,v in pairs(validMods) do
			local icon = "" local disabled = false
			if GetVehicleLivery(vehicle) == v.id then icon = "fas fa-check" disabled = true end
			Menu[#Menu + 1] = { icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
				header = k..". "..v.name, txt = v.install, params = { event = 'jim-mechanic:client:Preview:Apply', args = { id = tostring(v.id), old = true, close = data.close } },
				title = k.." - "..v.name, description = v.install, event = 'jim-mechanic:client:Preview:Apply', args = { id = tostring(v.id), old = true, close = data.close }
			}
		end
	elseif not oldlivery then
		if GetVehicleMod(vehicle, 48) == -1 then stockinstall = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else stockinstall = "" end
		Menu[#Menu + 1] = {
			isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and GetVehicleMod(vehicle, 48) == -1),
			header = "0. "..Loc[Config.Lan]["common"].stock, txt = stockinstall, params = { event = "jim-mechanic:client:Preview:Apply", args = { id = tostring(-1), close = data.close } },
			title = "0 - "..Loc[Config.Lan]["common"].stock, description = stockinstall, event = "jim-mechanic:client:Preview:Apply", args = { id = tostring(-1), close = data.close } }
		for k,v in pairs(validMods) do
			local icon = "" local disabled = false
			if GetVehicleMod(vehicle, 48) == v.id then icon = "fas fa-check" disabled = true end
			Menu[#Menu + 1] = { icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
				header = k..". "..v.name, txt = v.install, params = { event = 'jim-mechanic:client:Preview:Apply', args = { id = tostring(v.id), close = data.close } },
				title = k.." - "..v.name, description = v.install, event = 'jim-mechanic:client:Preview:Apply', args = { id = tostring(v.id), close = data.close }
			}
		end
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Apply', function(data) local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	local label = GetModTextLabel(vehicle, 48, tonumber(data.id))
	local modName = GetLabelText(label)
	if data.old then
		if modName == "NULL" then modName = Loc[Config.Lan]["livery"].oldMod end
		if GetVehicleLivery(vehicle) == tonumber(data.id) then
			triggerNotify(nil, data.id..Loc[Config.Lan]["common"].already, "error")
			TriggerEvent('jim-mechanic:client:Preview:Livery')
			return
		end
	else
		if modName == "NULL" then modName = Loc[Config.Lan]["common"].stock end
		if GetVehicleMod(vehicle, 48) == tonumber(data.id) then
			triggerNotify(nil, modName..Loc[Config.Lan]["common"].already, "error")
			TriggerEvent('jim-mechanic:client:Preview:Livery')
			return
		end
	end
	if data.old then
		if tonumber(data.id) == 0 then SetVehicleMod(vehicle, 48, -1, false) SetVehicleLivery(vehicle, 0)
		else SetVehicleMod(vehicle, 48, -1, false) SetVehicleLivery(vehicle, tonumber(data.id))
		end
	elseif not data.old then
		if tonumber(data.id) == -1 then
			SetVehicleMod(vehicle, 48, -1, false) SetVehicleLivery(vehicle, -1)
		else
			SetVehicleMod(vehicle, 48, tonumber(data.id), false) SetVehicleLivery(vehicle, -1)
		end
	end
	if data.close then TriggerEvent('jim-mechanic:client:Preview:Livery', { close = true })
	else TriggerEvent('jim-mechanic:client:Preview:Livery') end
	oldlivery = nil
end)

RegisterNetEvent('jim-mechanic:client:Preview:Plates', function() local PlateMenu, vehicle, Ped = {}, nil, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false)
		if DoesEntityExist(vehicle) then
			PlateMenu[#PlateMenu+1] = { icon = "fas fa-camera",
				header = (Config.System.Menu == "qb") and carMeta["search"] or "",
				txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
				title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
				params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Plates" }, },
				event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Plates" },
			}
			PlateMenu[#PlateMenu + 1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu" }, title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Menu", }

			for k, v in pairs(Loc[Config.Lan].vehiclePlateOptions) do
				local icon = "" local disabled = false
				if GetVehicleNumberPlateTextIndex(vehicle) == v.id then installed = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else installed = "" end
				PlateMenu[#PlateMenu + 1] = { icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
					header = k..". "..v.name, txt = installed, params = { event = 'jim-mechanic:client:Preview:Plates:Apply', args = v.id },
					title = k.." - "..v.name, description = installed, event = 'jim-mechanic:client:Preview:Plates:Apply', args = v.id,
				}
			end
			if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = PlateMenu }) exports.ox_lib:showContext("Menu")
			elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(PlateMenu) end
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Plates:Apply', function(index) local vehicle, Ped = nil, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	if GetVehicleNumberPlateTextIndex(vehicle) == tonumber(index) then triggerNotify(nil, Loc[Config.Lan]["common"].already, "error") TriggerEvent('jim-mechanic:client:Preview:Plates')
	elseif GetVehicleNumberPlateTextIndex(vehicle) ~= tonumber(index) then
		SetVehicleNumberPlateTextIndex(vehicle, index)
		TriggerEvent('jim-mechanic:client:Preview:Plates')
	end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Paint', function() local vehicle, Menu, validMods, Ped = nil, {}, {}, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	local setTable = {
		["Prim"] = vehPrimaryColour, ["Seco"] = vehSecondaryColour,
		["Pear"] = vehPearlescentColour, ["Whee"] = vehWheelColour,
		["Inte"] = GetVehicleInteriorColor(vehicle),
		["Dash"] = GetVehicleDashboardColour(vehicle), }
	for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do
		for id, paint in pairs(setTable) do if paint == v.id then setTable[id] = Loc[Config.Lan]["paint"].metallic.." "..v.name end end
	end
	for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do
		for id, paint in pairs(setTable) do if paint == v.id then setTable[id] = Loc[Config.Lan]["paint"].matte.." "..v.name end end
	end
	for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do
		for id, paint in pairs(setTable) do if paint == v.id then setTable[id] = v.name end end
	end
	for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsChameleon) do
		for id, paint in pairs(setTable) do if paint == v.id then setTable[id] = v.name end end
	end
	for id, paint in pairs(setTable) do
		if type(paint) == "number" then setTable[id] = Loc[Config.Lan]["common"].stock end
	end
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paint" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paint" },
	}
	Menu[#Menu+1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu", }, title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Menu", }
	Menu[#Menu+1] = {
		header = Loc[Config.Lan]["paint"].primary, txt = Loc[Config.Lan]["common"].current..": "..setTable["Prim"], params = { event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].primary, },
		title = Loc[Config.Lan]["paint"].primary, description = Loc[Config.Lan]["common"].current..": "..setTable["Prim"], event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].primary, }
	Menu[#Menu+1] = {
		header = Loc[Config.Lan]["paint"].secondary, txt = Loc[Config.Lan]["common"].current..": "..setTable["Seco"], params = { event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].secondary, },
		title = Loc[Config.Lan]["paint"].secondary, description = Loc[Config.Lan]["common"].current..": "..setTable["Seco"], event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].secondary, }
	Menu[#Menu+1] = {
		header = Loc[Config.Lan]["paint"].pearl, txt = Loc[Config.Lan]["common"].current..": "..setTable["Pear"], params = { event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].pearl, },
		title = Loc[Config.Lan]["paint"].pearl, description = Loc[Config.Lan]["common"].current..": "..setTable["Pear"], event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].pearl, }
	Menu[#Menu+1] = {
		header = Loc[Config.Lan]["paint"].wheel, txt = Loc[Config.Lan]["common"].current..": "..setTable["Whee"], params = { event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].wheel, },
		title = Loc[Config.Lan]["paint"].wheel, description = Loc[Config.Lan]["common"].current..": "..setTable["Whee"], event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].wheel, }
	if not IsThisModelABike(GetEntityModel(vehicle)) then
		Menu[#Menu+1] = {
			header = Loc[Config.Lan]["paint"].interior, txt = Loc[Config.Lan]["common"].current..": "..setTable["Inte"], params = { event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].interior, },
			title = Loc[Config.Lan]["paint"].interior, description = Loc[Config.Lan]["common"].current..": "..setTable["Inte"],event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].interior, }
		Menu[#Menu+1] = {
			header = Loc[Config.Lan]["paint"].dashboard, txt = Loc[Config.Lan]["common"].current..": "..setTable["Dash"], params = { event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].dashboard, },
			title = Loc[Config.Lan]["paint"].dashboard, description = Loc[Config.Lan]["common"].current..": "..setTable["Dash"],event = "jim-mechanic:client:Preview:Paints:Choose", args = Loc[Config.Lan]["paint"].dashboard, }
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Paints:Choose', function(data) local vehicle, Menu, validMods, Ped = nil, {}, {}, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Choose" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Choose" },
	}
	Menu[#Menu+1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, title = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Paint" }, event = "jim-mechanic:client:Preview:Paint" }

	Menu[#Menu+1] = { header = Loc[Config.Lan]["paint"].classic, title = Loc[Config.Lan]["paint"].classic,
		params = { event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].classic } }, event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].classic } }
	Menu[#Menu+1] = { header = Loc[Config.Lan]["paint"].metallic, title = Loc[Config.Lan]["paint"].metallic,
		params = { event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].metallic } }, event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].metallic } }
	Menu[#Menu+1] = { header = Loc[Config.Lan]["paint"].matte, title = Loc[Config.Lan]["paint"].matte,
		params = { event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].matte } }, event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].matte } }
	Menu[#Menu+1] = { header = Loc[Config.Lan]["paint"].metals, title = Loc[Config.Lan]["paint"].metals,
		params = { event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].metals } }, event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].metals } }

	if Config.Overrides.ChameleonPaints and (data ~= Loc[Config.Lan]["paint"].interior and data ~= Loc[Config.Lan]["paint"].dashboard) then
		Menu[#Menu+1] = {
			header = Loc[Config.Lan]["paint"].chameleon, title = Loc[Config.Lan]["paint"].chameleon,
			params = { event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].chameleon } }, event = "jim-mechanic:client:Preview:Paints:Choose:Colour", args = { paint = data, finish = Loc[Config.Lan]["paint"].chameleon } }
	end

	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Paints:Choose:Colour', function(data) local vehicle, Menu, colourCheck, Ped = nil, {}, {}, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	local setTable = {
		[Loc[Config.Lan]["paint"].primary] = vehPrimaryColour, [Loc[Config.Lan]["paint"].secondary] = vehSecondaryColour,
		[Loc[Config.Lan]["paint"].pearl] = vehPearlescentColour, [Loc[Config.Lan]["paint"].wheel] = vehWheelColour,
		[Loc[Config.Lan]["paint"].dashboard] = GetVehicleInteriorColor(vehicle), [Loc[Config.Lan]["paint"].interior] = GetVehicleDashboardColour(vehicle), }
	local colourCheck = setTable[data.paint]
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Choose:Colour" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Choose:Colour" },
	}
	Menu[#Menu+1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, title = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Paint" }, event = "jim-mechanic:client:Preview:Paint" }
	local colourTable = {
		[Loc[Config.Lan]["paint"].classic] = Loc[Config.Lan].vehicleResprayOptionsClassic,
		[Loc[Config.Lan]["paint"].metallic] = Loc[Config.Lan].vehicleResprayOptionsClassic,
		[Loc[Config.Lan]["paint"].matte] = Loc[Config.Lan].vehicleResprayOptionsMatte,
		[Loc[Config.Lan]["paint"].metals] = Loc[Config.Lan].vehicleResprayOptionsMetals,
		[Loc[Config.Lan]["paint"].chameleon] = Loc[Config.Lan].vehicleResprayOptionsChameleon,
	}
	for k, v in pairs(colourTable[data.finish]) do local icon, installed, disabled = "", "", false
		if colourCheck == v.id then installed = Loc[Config.Lan]["common"].current icon = "fas fa-check" disabled = true else installed = "" end
		Menu[#Menu + 1] = { icon = icon, isMenuHeader = disabled, disabled = (Config.System.Menu == "ox" and disabled),
		header = k..". "..v.name, txt = installed, params = { event = 'jim-mechanic:client:Preview:Paints:Apply', args = { paint = data.paint, id = v.id, name = v.name, finish = data.finish } },
		title = k.." - "..v.name, description = installed, event = 'jim-mechanic:client:Preview:Paints:Apply', args = { paint = data.paint, id = v.id, name = v.name, finish = data.finish } }
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Paints:Apply', function(data) local Ped, coords = PlayerPedId(), GetEntityCoords(PlayerPedId())
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
	local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
	if data.paint == Loc[Config.Lan]["paint"].primary then ClearVehicleCustomPrimaryColour(vehicle) SetVehicleColours(vehicle, data.id, vehSecondaryColour)
	elseif data.paint == Loc[Config.Lan]["paint"].secondary then ClearVehicleCustomSecondaryColour(vehicle) SetVehicleColours(vehicle, vehPrimaryColour, data.id)
	elseif data.paint == Loc[Config.Lan]["paint"].pearl then SetVehicleExtraColours(vehicle, data.id, vehWheelColour)
	elseif data.paint == Loc[Config.Lan]["paint"].wheel then SetVehicleExtraColours(vehicle, vehPearlescentColour, data.id)
	elseif data.paint == Loc[Config.Lan]["paint"].dashboard then SetVehicleDashboardColour(vehicle, data.id)
	elseif data.paint == Loc[Config.Lan]["paint"].interior then SetVehicleInteriorColour(vehicle, data.id) end
	TriggerEvent('jim-mechanic:client:Preview:Paints:Choose:Colour', data)
end)

--WHEELS
local wheelType = {
	[0] = Loc[Config.Lan]["rims"].label1, [1] = Loc[Config.Lan]["rims"].label2, [2] = Loc[Config.Lan]["rims"].label3, [3] = Loc[Config.Lan]["rims"].label4,
	[4] = Loc[Config.Lan]["rims"].label5, [5] = Loc[Config.Lan]["rims"].label6, [6] = Loc[Config.Lan]["rims"].label15, [7] = Loc[Config.Lan]["rims"].label7,
	[8] = Loc[Config.Lan]["rims"].label8, [9] = Loc[Config.Lan]["rims"].label9, [10] = Loc[Config.Lan]["rims"].label10, [11] = Loc[Config.Lan]["rims"].label11,
	[12] = Loc[Config.Lan]["rims"].label12,
}

RegisterNetEvent('jim-mechanic:client:Preview:Rims:Apply', function(data) local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
	if not data.bike then SetVehicleMod(vehicle, 23, tonumber(data.mod), true) else SetVehicleMod(vehicle, 24, tonumber(data.mod), false) end
	if data.mod == -1 then TriggerEvent('jim-mechanic:client:Preview:Rims:Check', data) else TriggerEvent('jim-mechanic:client:Preview:Rims:SubMenu', data) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Rims:Check', function() local Menu, Ped = {}, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then	vehicle = GetVehiclePedIsIn(Ped, false) end
	if IsThisModelABike(GetEntityModel(vehicle)) then cycle = true else cycle = false end
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Rims:Check" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Rims:Check" },
	}
	Menu[#Menu + 1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu" }, title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Menu", }

	if not cycle then

		Menu[#Menu + 1] = { icon = GetVehicleMod(vehicle, 23) ~= -1 and "fa-solid fa-rotate-left" or nil, isMenuHeaader = (GetVehicleMod(vehicle, 23) == -1), disabled = (GetVehicleMod(vehicle, 23) == -1),
			header = Loc[Config.Lan]["common"].stock,
			txt = (GetVehicleMod(vehicle, 23) == -1) and Loc[Config.Lan]["common"].current, params = { event = "jim-mechanic:client:Preview:Rims:Apply",  args = { mod = -1, wheeltype = 0, } },
			title = Loc[Config.Lan]["common"].stock,
			description = (GetVehicleMod(vehicle, 23) == -1) and Loc[Config.Lan]["common"].current, event = "jim-mechanic:client:Preview:Rims:Apply", args = { mod = -1, wheeltype = 0, }
		}
		for k, v in pairs(wheelType) do
			Menu[#Menu+1] = {
				header = v, params = { event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = k, bike = false } },
				title = v, event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = k, bike = false },
			}
		end
	end
	if cycle then
		Menu[#Menu+1] = {
			header = Loc[Config.Lan]["rims"].label13, params = { event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = 6, bike = false } },
			title = Loc[Config.Lan]["rims"].label13, event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = 6, bike = false }
		}
		Menu[#Menu+1] = {
			header = Loc[Config.Lan]["rims"].label14, params = { event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = 6, bike = true } },
			title = Loc[Config.Lan]["rims"].label14, event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = 6, bike = true }
		}
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Rims:Choose', function(data) local vehicle, validMods, originalWheel, Menu, Ped = {}, {}, 0, {}, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	originalWheel = tonumber(GetVehicleWheelType(vehicle))
	SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
	for i = 1, (GetNumVehicleMods(vehicle, 23) +1) do
		local modName = GetLabelText(GetModTextLabel(vehicle, 23, (i-1)))
		if not validMods[modName] then
			validMods[modName] = {}
			validMods[modName][#validMods[modName]+1] = { id = (i-1), name = modName, }
		elseif validMods[modName] then
			if validMods[modName][1] then
				local name = modName
				if modName == "NULL" then name = modName.." ("..(i-1)..")" end
				validMods[modName][#validMods[modName]+1] = { id = (i-1), name = name.." - Var "..(#validMods[modName]+1), }
			else
				validMods[modName][#validMods[modName]+1] = { id = validMods[modName].id, name = validMods[modName].name.." - Var 1",  }
				validMods[modName][#validMods[modName]+1] = { id = (i-1), name = modName.." - Var "..(#validMods[modName]+1), }
			end
		end
	end

	if validMods["NULL"] then validMods[Loc[Config.Lan]["rims"].labelcustom] = validMods["NULL"] validMods["NULL"] = nil end

	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Rims:Choose" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Rims:Choose" },
	}
	if Config.System.Menu == "qb" then Menu[#Menu + 1] =  {
		isMenuHeader = true, header = Loc[Config.Lan]["rims"].menuheader.."<br>("..string.upper(wheelType[data.wheeltype])..")"
	}
	end
	Menu[#Menu + 1] = {
		icon = "fas fa-circle-arrow-left",
		header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Rims:Check" },
		title = Loc[Config.Lan]["common"].ret,  event = "jim-mechanic:client:Preview:Rims:Check"
	}

	if data.wheeltype == 6 then
		Menu[#Menu + 1] = {
			icon = GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) ~= -1 and "fa-solid fa-rotate-left" or nil,
			isMenuHeaader = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1), disabled = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1),
			header = Loc[Config.Lan]["common"].stock,
			txt = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and Loc[Config.Lan]["common"].current, params = { event = "jim-mechanic:client:Preview:Rims:Apply",  args = { mod = -1, wheeltype = 6, bike = data.bike } },
			title = Loc[Config.Lan]["common"].stock,
			description = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and Loc[Config.Lan]["common"].current, event = "jim-mechanic:client:Preview:Rims:Apply", args = { mod = -1, wheeltype = 6, bike = data.bike }
		}
	end

	for k, v in pairsByKeys(validMods) do
		Menu[#Menu + 1] = {
			header = k, txt = Loc[Config.Lan]["common"].amountoption..#validMods[k], params = { event = 'jim-mechanic:client:Preview:Rims:SubMenu', args = { mod = v.id, wheeltype = data.wheeltype, wheeltable = validMods[k], bike = data.bike, label = wheelType[data.wheeltype] } },
			title = k, description = Loc[Config.Lan]["common"].amountoption..#validMods[k], event = "jim-mechanic:client:Preview:Rims:SubMenu", args = { mod = v.id, wheeltype = data.wheeltype, wheeltable = validMods[k], bike = data.bike, label = wheelType[data.wheeltype] },
		}
	end
	SetVehicleWheelType(vehicle, originalWheel)
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Rims:SubMenu', function(data)	local Menu, Ped = {}, PlayerPedId()
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) pushVehicle(vehicle) end
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Rims:SubMenu" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Rims:SubMenu" },
	}
	if Config.System.Menu == "qb" then
		Menu[#Menu + 1] = { isMenuHeader = true, header = Loc[Config.Lan]["rims"].menuheader.."<br>("..string.upper(data.label)..")", txt = Loc[Config.Lan]["common"].amountoption..#data.wheeltable.."<br>"..Loc[Config.Lan]["common"].current..": "..GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23))), }
	end
	Menu[#Menu + 1] = {
		icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = data.wheeltype, bike = data.bike } },
		title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Rims:Choose", args = { wheeltype = data.wheeltype, bike = data.bike }
	}
	for i=1, #data.wheeltable do
		Menu[#Menu + 1] = { isMenuHeader = (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype), disabled = (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype),
			header = data.wheeltable[i].name,
			txt = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype)) and Loc[Config.Lan]["common"].current,
			params = { event = 'jim-mechanic:client:Preview:Rims:Apply', args = { mod = data.wheeltable[i].id, wheeltype = data.wheeltype, wheeltable = data.wheeltable, bike = data.bike, label = data.label } },
			title = data.wheeltable[i].name,
			description = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id) and (GetVehicleWheelType(vehicle) == data.wheeltype)) and Loc[Config.Lan]["common"].current,
			event = "jim-mechanic:client:Preview:Rims:Apply", args = { mod = data.wheeltable[i].id, wheeltype = data.wheeltype, wheeltable = data.wheeltable, bike = data.bike, label = data.label },
		}
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu })	exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

--Windows
RegisterNetEvent('jim-mechanic:client:Preview:Windows:Apply', function(data) local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then	vehicle = GetVehiclePedIsIn(Ped, false) end
	if GetVehicleWindowTint(vehicle) == tonumber(data.mod) then triggerNotify(nil, data.name..Loc[Config.Lan]["common"].already, "error") TriggerEvent('jim-mechanic:client:Preview:Windows:Check')
	elseif GetVehicleWindowTint(vehicle) ~= tonumber(data.mod) then SetVehicleWindowTint(vehicle, tonumber(data.mod)) TriggerEvent('jim-mechanic:client:Preview:Windows:Check') end
	emptyHands(Ped)
end)

RegisterNetEvent('jim-mechanic:client:Preview:Windows:Check', function(data) local Menu, validMods, getTint, Ped = {}, {}, 0, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
		getTint = GetVehicleWindowTint(vehicle)
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Windows:Check" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Paints:Windows:Check" },
	}
	if Config.System.Menu == "qb" then
		Menu[#Menu+1] = { header = Loc[Config.Lan]["windows"].menuheader, title = Loc[Config.Lan]["windows"].menuheader, isMenuHeader = true, disabled = (Config.System.Menu == "ox" and disabled) }
	end
	Menu[#Menu + 1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu" }, title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Menu", }
	if GetVehicleWindowTint(vehicle) <= 0 then stockinstall = Loc[Config.Lan]["common"].current stockIcon = "fas fa-check" stockDisabled = true end
	for l, b in pairs(Loc[Config.Lan].vehicleWindowOptions) do local txt, disabled, icon = "", false, ""
		if GetVehicleWindowTint(vehicle) == b.id then txt = Loc[Config.Lan]["common"].current disabled = true icon = "fas fa-check" end
		validMods[l] = { mod = b.id, name = b.name, window = true, install = txt, disabled = disabled, icon = icon }
	end
	Menu[#Menu+1] = {
		icon = icon, isMenuHeader = GetVehicleWindowTint(vehicle) <= 0, disabled = (Config.System.Menu == "ox" and GetVehicleWindowTint(vehicle) <= 0),
		header = "0. "..Loc[Config.Lan]["common"].stock, txt = (GetVehicleWindowTint(vehicle) <= 0 and Loc[Config.Lan]["common"].current or nil),
		params = { event = "jim-mechanic:client:Preview:Windows:Apply", args = { mod = -1, id = -1, }},
		title = "0 - "..Loc[Config.Lan]["common"].stock, description = (GetVehicleWindowTint(vehicle) <= 0 and Loc[Config.Lan]["common"].current or nil), event = "jim-mechanic:client:Preview:Windows:Apply",
		args = { mod = -1, id = -1, },
	}
	for l, b in pairs(validMods) do
		Menu[#Menu+1] = {
			icon = b.icon, isMenuHeader = b.disabled, disabled = (Config.System.Menu == "ox" and b.disabled),
			header = l..". "..b.name, txt = b.install,
			params = { event = "jim-mechanic:client:Preview:Windows:Apply", args = b },
			title = l.." - "..b.name, description = b.install,
			event = "jim-mechanic:client:Preview:Windows:Apply", args = b
		}
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu })	exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)

RegisterNetEvent('jim-mechanic:client:Preview:Extras:Apply', function(data) local Ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(Ped, false)
	local veh = getDamages(vehicle)
	if IsVehicleExtraTurnedOn(vehicle, data.mod) then SetVehicleExtra(vehicle, data.mod, 1)
	else SetVehicleExtra(vehicle, data.mod, 0) SetVehicleFixed(vehicle) end
	doCarDamage(vehicle, veh)
	Wait(100)
	SetVehicleEngineHealth(vehicle, veh.engine)
	SetVehicleBodyHealth(vehicle, veh.body)
	TriggerEvent('jim-mechanic:client:Preview:Extras:Check')
end)


RegisterNetEvent('jim-mechanic:client:Preview:Extras:Check', function(data) local Menu, validMods, getTint, Ped = {}, {}, 0, PlayerPedId()
	if IsPedInAnyVehicle(Ped, false) then vehicle = GetVehiclePedIsIn(Ped, false) end
	Menu[#Menu+1] = { icon = "fas fa-camera",
		header = (Config.System.Menu == "qb") and carMeta["search"] or "",
		txt = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		title = "Class: "..carMeta["class"]..br..Loc[Config.Lan]["check"].plate.." "..carMeta["plate"]..br..Loc[Config.Lan]["check"].value..carMeta["price"]..br..carMeta["dist"],
		params = { event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Extras:Check" }, },
		event = "jim-mechanic:client:Preview:Camera", args = { data = data, event = "jim-mechanic:client:Preview:Extras:Check" },
	}
	if Config.System.Menu == "qb" then
		Menu[#Menu+1] = { header = Loc[Config.Lan]["windows"].menuheader, title = Loc[Config.Lan]["windows"].menuheader, isMenuHeader = true, disabled = (Config.System.Menu == "ox" and disabled) }
	end
	Menu[#Menu + 1] = { icon = "fas fa-circle-arrow-left", header = "", txt = Loc[Config.Lan]["common"].ret, params = { event = "jim-mechanic:client:Preview:Menu" }, title = Loc[Config.Lan]["common"].ret, event = "jim-mechanic:client:Preview:Menu", }
	for i = 0, 14 do
		if DoesExtraExist(vehicle, i) then hadMod = true
		if IsVehicleExtraTurnedOn(vehicle, i) then icon = "fas fa-check" else icon = "" end
		validMods[i] = { mod = i, name = "Extra "..i, install = txt, icon = icon, } end
	end
	for l, b in pairs(validMods) do
		Menu[#Menu+1] = {
			icon = b.icon,
			header = l..". "..b.name, txt = b.install,
			params = { event = "jim-mechanic:client:Preview:Extras:Apply", args = b },
			title = l.." - "..b.name, description = b.install,
			event = "jim-mechanic:client:Preview:Extras:Apply", args = b
		}
	end
	if Config.System.Menu == "ox" then exports.ox_lib:registerContext({id = 'Menu', title = carMeta["search"], position = 'top-right', options = Menu })	exports.ox_lib:showContext("Menu")
	elseif Config.System.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
end)