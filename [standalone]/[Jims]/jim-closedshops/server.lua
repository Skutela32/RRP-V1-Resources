local QBCore = exports[Config.Core]:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end QBCore = exports[Config.Core]:GetCoreObject() end)

local DutyList = {}

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() == r then TriggerEvent("jim-closedshops:server:makeList") end end)

QBCore.Commands.Add("closedstock", "Access Closed Shops Stock (Boss Only)", {}, false, function(source) TriggerClientEvent("jim-closedshops:Stash", source) end)

if Config.Inv == "ox" then for k in pairs(Config.Shops) do print(k) exports.ox_inventory:RegisterStash("closedStock_"..k, "closedStock_"..k, 20, 400000) end end

RegisterServerEvent("jim-closedshops:server:makeList", function()
	if Config.Debug then print("^5Debug^7: ^3makeList^7: ^2Creating fresh duty list^7") end
	for k in pairs(Config.Shops) do DutyList[tostring(k)] = false end
	for _, v in pairs(QBCore.Functions.GetPlayers()) do
		local Player = QBCore.Functions.GetPlayer(v)
		if Player then
			for l in pairs(Config.Shops) do
				if Player.PlayerData.job.name == l and Player.PlayerData.job.onduty then DutyList[tostring(l)] = true
				end end end end
end)

RegisterServerEvent("jim-closedshops:server:updatelist", function()
	TriggerEvent("jim-closedshops:server:makeList")
	if Config.Debug then print("^5Debug^7: ^3updatelist^7: ^2Updating players with refreshed duty list^7") end
	TriggerClientEvent("jim-closedshops:ForceList", -1, DutyList)
end)

QBCore.Functions.CreateCallback('jim-closedshops:requestlist', function(source, cb) cb(DutyList) end)

local function GetStashItems(stashId)
	local result, items = nil, {}
	if Config.Inv == "ox" then print("ox")
		result = exports.ox_inventory:GetInventory(stashId)
	elseif Config.Inv == "qs" then
		result = MySQL.Sync.fetchScalar('SELECT items FROM qs_stash WHERE stash = ?', { stashId })
	elseif Config.Inv == "qb" then
		result = MySQL.Sync.fetchScalar('SELECT items FROM stashitems WHERE stash = ?', { stashId })
	end
	if result then
		local stashItems = {}
		if Config.Inv == "ox" then stashItems = result.items else stashItems = json.decode(result) end
		if stashItems then
			for k, item in pairs(stashItems) do
				local itemInfo = QBCore.Shared.Items[item.name:lower()]
				if itemInfo then
					items[item.slot] = {
						name = itemInfo["name"],
						amount = tonumber(item.amount) or tonumber(item.count),
						info = item.info ~= nil and item.info or "",
						label = itemInfo["label"],
						description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
						weight = itemInfo["weight"],
						type = itemInfo["type"],
						unique = itemInfo["unique"],
						useable = itemInfo["useable"],
						image = itemInfo["image"],
						slot = item.slot,
					}
				end
			end
		end
	end
	return items
end

QBCore.Functions.CreateCallback('jim-closedshops:dutycheck', function(source, cb)
	local jobtable = {}
	for k, v in pairs(Config.Shops) do if v.enable then jobtable[tostring(k)] = false end end
	for _, id in pairs(QBCore.Functions.GetPlayers()) do
		local Player = QBCore.Functions.GetPlayer(id)
		if Player then
			for job in pairs(Config.Shops) do
				if Player.PlayerData.job.name == job and Player.PlayerData.job.onduty then
					jobtable[tostring(job)] = true
				end
			end
		end
	end
	if Config.Debug then print("^5Debug^7: ^dutycheck: ^6"..json.encode(jobtable).."^7") end
	cb(jobtable)
end)

RegisterServerEvent('jim-closedshops:GetItem', function(amount, billtype, item, name, price, job)
	local src = source
	if Config.Inv == "ox" then
		local balance = exports.ox_inventory:GetItem(src, "money", nil, true)
		local cost = (tonumber(price) * tonumber(amount))
		local canCash = (balance >= cost)
		local itemWeight = exports.ox_inventory:GetItem("closedStock_"..job, item, 1).weight * amount
		local canCarryWeight, _ = exports.ox_inventory:CanCarryWeight(src, itemWeight)
		if canCash and canCarryWeight then
			exports.ox_inventory:RemoveItem(src, "money", cost)
			if Config.Renewed then exports["Renewed-Banking"]:addAccountMoney(tostring(job), cost - (cost * 0.15))
			else exports["qb-management"]:AddMoney(tostring(job), cost - (cost * 0.15)) end
			if exports.ox_inventory:AddItem(src, item, amount) then exports.ox_inventory:RemoveItem("closedStock_"..job, item, amount) end
		end
	else
		local Player = QBCore.Functions.GetPlayer(src)
		local stashItems = GetStashItems("closedStock_"..job)
		if Config.Debug then print("^5Debug^7: ^3GetItem^7: ^2Retrieving stash info^7: ['^6closedStock_"..job.."^7']") end
		--Inventory space checks
		local totalWeight, maxWeight = GetTotalWeight(Player.PlayerData.items), 120000
		local balance = Player.Functions.GetMoney(tostring(billtype))
		if (totalWeight + (QBCore.Shared.Items[item].weight * amount)) > maxWeight then	triggerNotify(nil, Loc[Config.Lan].error["nospace"], "error", src)
		else
			--Money checks
			local cost = (tonumber(price) * tonumber(amount))
			if balance >= cost then
				Player.Functions.RemoveMoney(tostring(billtype), cost, 'ticket-payment')
				if Config.Renewed then
					exports["Renewed-Banking"]:addAccountMoney(tostring(job), cost - (cost * 0.15))
					if Config.Debug then print("^5Debug^7: ^3Renewed^7-^3Banking^7(^3Job^7): ^2Adding ^7$^6"..(cost - (cost * 0.15)).." ^2to account ^7'^6"..tostring(job).."^7'") end
				else
					exports["qb-management"]:AddMoney(tostring(job), cost - (cost * 0.15))
					if Config.Debug then print("^5Debug^7: ^3QB^7-^3Management^7(^3Job^7): ^2Adding ^7$^6"..(cost - (cost * 0.15)).." ^2to account ^7'^6"..tostring(job).."^7'") end
				end
			else
				triggerNotify(nil, Loc[Config.Lan].error["notenough"], "error", src) return end
				if Player.Functions.AddItem(item, amount) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end
				TriggerEvent("qb-log:server:CreateLog", "shops", "Purchase from "..job.." (ClosedShop) store", "blue","**" .. GetPlayerName(src) .. "**" .. " Purchased '**"..item.."**' x**"..amount.."** for a total of $**"..(tonumber(price) * tonumber(amount)).."** with **"..billtype.."**")
			--Update Boss Stash
			for k, v in pairs(stashItems) do
				if v.name == item then
					if (stashItems[k].amount - amount) <= 0 then stashItems[k] = nil else stashItems[k].amount = stashItems[k].amount - amount end
					TriggerEvent("qb-log:server:CreateLog", "stash", "Update Stash closedStock_"..job, "blue","**" .. GetPlayerName(src) .. "**" .. " Removed '**"..item.."**' x**"..amount.."**")
					TriggerEvent('jim-closedshops:server:SaveStashItems', "closedStock_"..job, stashItems) break
				end
			end
		end
	end
	local data = { stash = job, }
	TriggerClientEvent('jim-closedshops:ShopMenu', src, data)
end)

QBCore.Functions.CreateCallback('jim-closedshops:server:GetStashItems', function(source, cb, stashId) cb(GetStashItems(stashId)) end)

RegisterNetEvent('jim-closedshops:server:SaveStashItems', function(stashId, items)
	if Config.Inv == "qs" then
		MySQL.Async.insert('INSERT INTO qs_stash (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE stash = :stash', { ['stash'] = stashId, ['items'] = json.encode(items) })
	elseif Config.Inv == "qb" then
		MySQL.Async.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', { ['stash'] = stashId, ['items'] = json.encode(items) })
	end
end)

local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/jimathy/UpdateVersions/master/jim-closedshops.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion) end
		print(advice)
	end)
end
CheckVersion()