local QBCore = exports[Config.Core]:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports[Config.Core]:GetCoreObject() end)

PlayerJob = {}
local bossroles = {}
local DutyList = {}
Peds = {}
Props = {}
Targets = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job end)
	if Config.Debug then print("^5Debug^7: ^3OnPlayerLoaded^7: ^2Grabbing new duty list from server") end
	local p = promise.new() QBCore.Functions.TriggerCallback('jim-closedshops:requestlist', function(cb) p:resolve(cb) end)
	TriggerEvent("jim-closedshops:ForceList", Citizen.Await(p))
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	for k in pairs(Config.Shops) do exports['qb-target']:RemoveZone("ClosedShop-['"..k.."']") end
	for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteEntity(v) end
	for _, v in pairs(Peds) do unloadModel(GetEntityModel(v)) DeletePed(v) end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)	PlayerJob = JobInfo
	if Config.Debug then print("^5Debug^7: ^3OnJobUpdate^7: ^2Sending job and duty update to server ^7['^6"..PlayerJob.name.."^7'] = ^6"..tostring(PlayerJob.onduty)) end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty
	Wait(1000)
	if Config.Debug then print("^5Debug^7: ^3SetDuty^7: ^2Sending duty change to server") end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job end)
	if Config.Debug then print("^5Debug^7: ^3onResourceStart^7: ^2Sending duty update to server ^7['^6"..PlayerJob.name.."^7'] = ^6"..tostring(PlayerJob.onduty)) end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

RegisterNetEvent("jim-closedshops:ForceList", function(newList)
	if not LocalPlayer.state.isLoggedIn then return end
	local needupdate = false
	for k, v in pairs(newList) do
		if v ~= DutyList[k] then
			if Config.Debug then print("^5Debug^7: ^4DutyList^7[^6"..k.."^7] ^2changing to^7: '^6"..tostring(v).."^7'") end
			DutyList[k] = v
			needupdate = true
		end
	end
	if needupdate then
		if Config.Debug then print("^5Debug^7: ^3ForceList^7: ^2Recieved Updated Duty List from server and updating ped/prop spawns") end
		for k, v in pairs(Config.Shops) do
			if QBCore.Shared.Jobs[k] then
				if v.enable then
					if DutyList[tostring(k)] then
						if Peds[k] or Props[k] then
							exports['qb-target']:RemoveZone("ClosedShop-['"..k.."']")
							DeletePed(Peds[k]) Peds[k] = nil
							DeleteEntity(Props[k]) Props[k] = nil
							Targets[k] = nil
						end
					elseif not DutyList[tostring(k)] then
						if v.ped then
							if not DoesEntityExist(Peds[k]) then
								DeletePed(Peds[k])
								Peds[k] = makePed(v.ped, v.location, 1, false) SetEntityInvincible(Peds[k], true) end
							if not Targets[k] then
								local min, max = GetModelDimensions(v.ped)
								Targets[k] =
									exports['qb-target']:AddBoxZone("ClosedShop-['"..k.."']",  vec3(v.location.x, v.location.y, v.location.z-1), max.y-min.y, max.x-min.x,
										{ name="ClosedShop-['"..k.."']", heading = v.location[4], debugPoly=Config.Debug, minZ=v.location.z-0.9, maxZ=v.location.z+0.8 },
										{ options = {
											{ event = "jim-closedshops:ShopMenu", icon = "fas fa-shop", label = Loc[Config.Lan].target["open"], stash = k, ped = Peds[k] },
											}, distance = 2.0 })
							end
						elseif v.prop then
							if not DoesEntityExist(Props[k]) then Props[k] = makeProp({prop = v.prop, coords = vec4(Config.Shops[k].location.x, Config.Shops[k].location.y, Config.Shops[k].location.z, Config.Shops[k].location.w+180.0)}, true, true) end
							if not Targets[k] then
								local min, max = GetModelDimensions(v.prop)
								Targets[k] =
									exports['qb-target']:AddBoxZone("ClosedShop-['"..k.."']", v.location.xyz, max.y-min.y, max.x-min.x,
									{ name="ClosedShop-['"..k.."']", heading = v.location.w, debugPoly=Config.Debug, minZ=v.location.z-0.9, maxZ=v.location.z+0.8 },
									{ options = {
										{ event = "jim-closedshops:ShopMenu", icon = "fas fa-shop", label = Loc[Config.Lan].target["open"], stash = k, ped = Props[k] },
										}, distance = 2.0 })
							end
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('jim-closedshops:ShopMenu', function(data)
	local p = promise.new() QBCore.Functions.TriggerCallback('jim-closedshops:server:GetStashItems', function(cb) p:resolve(cb) end, "closedStock_"..data.stash)
	local StashItems = Citizen.Await(p)
	if Config.Debug then print("^5Debug^7: ^2Retrieving stash info^7: ['^6closedStock_"..data.stash.."^7']") end
	local item = false

	local ShopMenu = {}
	local ShopBuild = {}
	if Config.Menu == "qb" then
		ShopMenu[#ShopMenu + 1] = { icon = "fas fa-shop", header = QBCore.Shared.Jobs[data.stash].label, isMenuHeader = true }
		ShopMenu[#ShopMenu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "jim-shops:CloseMenu" } }
	end
	if PlayerJob.name == data.stash and PlayerJob.isboss then
		ShopMenu[#ShopMenu + 1] = {
			icon = "fas fa-boxes-stacked",
			header = Loc[Config.Lan].menu["access"], txt = Loc[Config.Lan].menu["bossonly"],
			title = Loc[Config.Lan].menu["access"], description = Loc[Config.Lan].menu["bossonly"],
			event = "jim-closedshops:Stash", args = data,
			params = { event = "jim-closedshops:Stash", args = data }
		}
	end
	for _, v in pairs(StashItems) do
		--if http is not found in the link, adjust it to look for nui link, otherwise just leave it as it is
		if not ShopBuild[v.name] then ShopBuild[v.name] = { name = v.name, image = v.image, label = v.label, amount = v.amount }
		elseif ShopBuild[v.name] then ShopBuild[v.name].amount = ShopBuild[v.name].amount + v.amount end
	end
	for _, v in pairs(ShopBuild) do
		if Config.Shops[data.stash].itemlist[v.name] then
			if QBCore.Shared.Items[v.name] then
				local lb = "<br>" if Config.Menu == "ox" then lb = "\n" end
				local text = Loc[Config.Lan].menu["avail"]..": x"..v.amount..lb..Loc[Config.Lan].menu["cost"]..": $"..Config.Shops[data.stash].itemlist[v.name]
				ShopMenu[#ShopMenu + 1] = {
					icon = "nui://"..Config.img..QBCore.Shared.Items[v.name].image,
					header = v.label, txt = text,
					title = v.label, description = text, --ox_lib
					event = "jim-closedshops:Charge", --ox_lib
					args = { item = v.name, stash = data.stash, cost = Config.Shops[data.stash].itemlist[v.name], max = v.amount }, --ox_lib
					params = { event = "jim-closedshops:Charge", args = { item = v.name, stash = data.stash, cost = Config.Shops[data.stash].itemlist[v.name], max = v.amount } }
				}
				text, setheader = nil
			else print("^5Debug^7: ^1Can't ^2create menu entry^7: '^6"..v.name.."^7' - ^2Not found in ^4items^7.^4lua") end
		end
	end
	for k in pairs(Config.Shops[data.stash].itemlist) do for _, b in pairs(StashItems) do if b.name == k then item = true end end end
	if not item then
		ShopMenu[#ShopMenu + 1] = {
			disabled = true,
			isMenuHeader = true,
			header = Loc[Config.Lan].menu["closed"], txt = "",
			title = Loc[Config.Lan].menu["closed"],
		}
	end
	if Config.Menu == "ox" then
		exports.ox_lib:registerContext({id = 'ClosedShop', title = QBCore.Shared.Jobs[data.stash].label, position = 'top-right', options = ShopMenu })
		exports.ox_lib:showContext("ClosedShop")
	elseif Config.Menu == "qb" then
		exports['qb-menu']:openMenu(ShopMenu)
	end
	lookEnt(data.ped)
end)

RegisterNetEvent('jim-closedshops:Stash', function(data)
	local jobstash = nil if not data then jobstash = PlayerJob.name else jobstash = data.stash lookEnt(data.ped) end
	if #(GetEntityCoords(PlayerPedId())	- Config.Shops[jobstash].location.xyz) <= 5.0 then
		if PlayerJob.isboss then
			if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', "closedStock_"..jobstash) else
				if Config.Shops[jobstash].NoLimitStash then TriggerServerEvent("inventory:server:OpenInventory", "stash", "closedStock_"..jobstash, { maxweight = 4000000, slots = 100, })
				else TriggerServerEvent("inventory:server:OpenInventory", "stash", "closedStock_"..jobstash, { maxweight = 4000000, slots = countTable(Config.Shops[jobstash].itemlist), })	end
				TriggerEvent("inventory:client:SetCurrentStash", "closedStock_"..jobstash)
			end
		else triggerNotify(nil, Loc[Config.Lan].error["noaccess"], "error") return end
	else triggerNotify(nil, Loc[Config.Lan].error["toofar"], "error") return end
end)


RegisterNetEvent('jim-closedshops:Charge', function(data)
	if Config.Menu == "ox" then
		local dialog = exports.ox_lib:inputDialog(QBCore.Shared.Items[data.item].label, {
			{ type = 'number', label = Loc[Config.Lan].menu["tobuy"], description = Loc[Config.Lan].menu["avail"]..": "..data.max.." \n "..Loc[Config.Lan].menu["costper"]..": $"..data.cost },
			{ type = 'select', label = Loc[Config.Lan].menu["paytype"], options = { { value = "cash", label = Loc[Config.Lan].menu["cash"] }, { value = "bank", label = Loc[Config.Lan].menu["card"] } } },
		})
		if dialog then
			if QBCore.Shared.Items[data.item].unique then dialog[1] = 1 end
			if not dialog[1] then return end
			local amo = dialog[1] if string.find(tostring(amo), "-") then amo = string.gsub(tostring(amo), "-", "") dialog[1] = tonumber(amo) end
			if tonumber(dialog[1]) > tonumber(data.max) then TriggerEvent("jim-closedshops:Charge", data) triggerNotify(nil, Loc[Config.Lan].menu["notenough"], "error") return else
				TriggerServerEvent('jim-closedshops:GetItem', dialog[1], dialog[2], data.item, data.name, data.cost, data.stash)
				loadAnimDict('amb@prop_human_atm@male@enter')
				TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true)
				unloadAnimDict('amb@prop_human_atm@male@enter')
			end
		end
	else
		local settext = "- "..Loc[Config.Lan].menu["confirm"].." -<br><br>"..Loc[Config.Lan].menu["avail"]..": "..data.max.."<br> "..Loc[Config.Lan].menu["costper"]..": $"..data.cost.."<br><br>- "..Loc[Config.Lan].menu["paytype"].." -"
		local input = {}
		input[#input+1] = { type = 'radio', name = 'billtype', text = settext, options = { { value = "cash", text = Loc[Config.Lan].menu["cash"] }, { value = "bank", text = Loc[Config.Lan].menu["card"] } } }

		if not QBCore.Shared.Items[data.item].unique then input[#input+1] = { type = 'number', isRequired = true, name = 'amount', text = Loc[Config.Lan].menu["tobuy"] } end

		local img = QBCore.Shared.Items[data.item].image
		if string.find(img, "http") then else img = "nui://"..Config.img..img end
		local dialog = exports['qb-input']:ShowInput(
		{ header = "<center><p><img src="..img.." width=100px onerror='this.onerror=null; this.remove();'></p>"..QBCore.Shared.Items[data.item].label, submitText = Loc[Config.Lan].menu["pay"],
		inputs = input })

		if dialog then
			if QBCore.Shared.Items[data.item].unique then dialog.amount = 1 end
			if not dialog.amount then return end
			local amo = dialog.amount if string.find(tostring(amo), "-") then amo = string.gsub(tostring(amo), "-", "") dialog.amount = tonumber(amo) end
			if tonumber(dialog.amount) > tonumber(data.max) then TriggerEvent("jim-closedshops:Charge", data) triggerNotify(nil, Loc[Config.Lan].menu["notenough"], "error") return else
				TriggerServerEvent('jim-closedshops:GetItem', dialog.amount, dialog.billtype, data.item, data.name, data.cost, data.stash)
				loadAnimDict('amb@prop_human_atm@male@enter')
				TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true)
				unloadAnimDict('amb@prop_human_atm@male@enter')
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k, v in pairs(Config.Shops) do exports['qb-target']:RemoveZone("ClosedShop-['"..k.."']") end
		for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteEntity(v) end
		for _, v in pairs(Peds) do unloadModel(GetEntityModel(v)) DeletePed(v) end
	end
end)

