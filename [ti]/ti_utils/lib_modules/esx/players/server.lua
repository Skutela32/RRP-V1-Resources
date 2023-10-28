local resName,ESX,invName = ...

local module = {}
local Inventory = exports[invName]

module.getUniqueId = function(source)
  return ESX.GetPlayerFromId(source).identifier
end

module.getLicense = function(source)
  return ESX.GetPlayerFromId(source).identifier
end

module.checkLicense = function(source, licenseName)
  local res,ret

  TriggerEvent("esx_license:checkLicense", source, licenseName, function(hasLicense)
    ret = hasLicense
    res = true
  end)

  while not res do
    Wait(0)
  end

  return ret
end

module.getClothes = function(source)
  local clothes = {}
  local done = false

  TriggerEvent('esx_datastore:getDataStore', 'property', module.getUniqueId(source), function(store)
    local count = store.count('dressing')

    for i=1, count, 1 do
      local entry = store.get('dressing', i)

      clothes[i] = {
        index = i,
        label = entry.label,
        skin = entry.skin
      }
    end

    done = true
  end)

  while not done do
    Wait(0)
  end

  return clothes
end

module.removeClothes = function(source,outfit)
  local uid = module.getUniqueId(source)

  TriggerEvent('esx_datastore:getDataStore', 'property', uid, function(store)
    local dressing = store.get('dressing')
    
    table.remove(dressing, outfit.index)

    store.set('dressing', dressing)
  end)
end

module.getName = function(source)
  local player = ESX.GetPlayerFromId(source)

  if not player or not player.get then return '','' end

  return player.get('firstName') or player.get('firstname'),player.get('lastName') or player.get('lastname')
end

module.getJob = function(source)
  local player = ESX.GetPlayerFromId(source)

  if not player then
    return
  end

  local job = player.job

  if not job or not job.grade then
    return
  end

  return job.name,job.grade
end

if type(Config) == "table" and Config.use_t1ger_gangs
or type(config) == "table" and config.use_t1ger_gangs
then
  RegisterNetEvent("ti_utils:getTigerGang", function()
    local src = source

    local gangId = exports['t1ger_gangsystem']:GetPlayerGangId(src)
    local gangRank = exports['t1ger_gangsystem']:GetPlayerGangRank(src)

    TriggerClientEvent("ti_utils:gotTigerGang", src, gangId, gangRank)
  end)

  module.getGroup = function(source)
    local src = source    

    local gangId = exports['t1ger_gangsystem']:GetPlayerGangId(src)
    local gangRank = exports['t1ger_gangsystem']:GetPlayerGangRank(src)

    return gangId,gangRank
  end
else
  module.getGroup = function(source)
    local player = ESX.GetPlayerFromId(source)

    if not player then
      return
    end

    local group = player.job

    if not group or not group.grade then
      return
    end

    return group.name,group.grade
  end
end

module.getDutyCount = function(jobName)
  return #ESX.GetExtendedPlayers("job",jobName)
end

module.notifyPlayer = function(source,msg,typeof)
  TriggerClientEvent('esx:showNotification',source,msg)
end

module.getAccounts = function(source)
  local playerData = ESX.GetPlayerFromId(source)

  local accounts = {}

  for k,v in pairs(playerData.accounts) do
    accounts[v.name] = v.money or v.amount or 0
  end

  if not accounts.cash and accounts.money then
    accounts.cash = accounts.money
  end

  return accounts
end

module.getAccountMoney = function(source,account)
  return module.getAccounts(source)[account]
end

module.addAccountMoney = function(source,account,amount)
  if account == "cash" then
    account = "money"
  end

  return ESX.GetPlayerFromId(source).addAccountMoney(account,amount)
end

module.addAccountMoneyOffline = function(identifier,accountName,amount)
  local rows = exports.oxmysql:executeSync("SELECT * FROM users WHERE identifier = ?", {identifier})

  if not rows or not rows[1] then return end

  local accounts = json.decode(rows[1].accounts)

  accounts[accountName] = (accounts[accountName] or 0) + amount

  local accountsStr = json.encode(accounts)

  exports.oxmysql:executeSync("UPDATE users SET accounts = ? WHERE identifier = ?", {accountsStr, identifier})
end

module.removeAccountMoney = function(source,account,amount)
  if account == "cash" then
    account = "money"
  end
  
  return ESX.GetPlayerFromId(source).removeAccountMoney(account,amount)
end

module.hasPermissions = function(source,characterPermissions,jobPermissions,groupPermissions)
  if  not characterPermissions
  and not jobPermissions
  and not groupPermissions
  then
    return true
  end

  local uniqueId = module.getUniqueId(source)

  if characterPermissions then
    for _,uid in ipairs(characterPermissions) do
      if uid == uniqueId then
        return true
      end
    end
  end

  local jobName,jobRank = module.getJob(source)

  if jobPermissions then
    if jobPermissions[jobName] and jobPermissions[jobName] <= jobRank then
      return true
    end
  end

  local groupName,groupRank = module.getGroup(source)

  if groupPermissions then
    if groupPermissions[groupName] and groupPermissions[groupName] <= groupRank then
      return true
    end
  end
  
  return false
end

module.getSource = function(identifier)
  local player = ESX.GetPlayerFromIdentifier(identifier)

  if not player then
    return
  end

  return player.source or player.src
end

module.canCarryItem = function(source,item,count)
  local ply = ESX.GetPlayerFromId(source)
  return ply.canCarryItem(item,count)
end

--
-- INV HANDLERS
--

local getInventoryItemsHandlers = {
  ["mf-inventory"] = function(source)
    return Inventory:getInventoryItems(module.getUniqueId(source))
  end,

  ["default"] = function(source)
    return ESX.GetPlayerFromId(source).getInventory(false)
  end
}

local getItems = getInventoryItemsHandlers[invName] or getInventoryItemsHandlers.default

module.getInventory = function(source)
  local items = getItems(source) or {}
  local ret = {}

  for slot,item in pairs(items) do
    if type(item) == "table" then
      table.insert(ret,{
        name = item.name,
        label = item.label or item.name,
        count = item.count or item.amount,
        slot = item.slot or slot,
        metadata = item.metadata or item.info or item.data or {}
      })
    end
  end

  return ret
end

local addInventoryItemHandlers = {
  ["mf-inventory"] = function(source,name,count,metadata)
    return Inventory:addInventoryItem(module.getUniqueId(source),name,count,source,100.0,metadata)
  end,

  ["default"] = function(source,name,count,metadata)
    return ESX.GetPlayerFromId(source).addInventoryItem(name,count,metadata)
  end
}

module.addInventoryItem = addInventoryItemHandlers[invName] or addInventoryItemHandlers.default

local removeInventoryItemHandlers = {
  ["mf-inventory"] = function(source,name,count,slot)
    local uid = module.getUniqueId(source)

    if slot then
      if count then
        return Inventory:removeCountAtSlot(uid,slot,name,count,source)
      else
        return Inventory:removeItemAtSlot(uid,slot,name,source)
      end
    else
      return Inventory:removeInventoryItem(uid,name,count,source)
    end
  end,

  ["default"] = function(source,name,count,slot)
    return ESX.GetPlayerFromId(source).removeInventoryItem(name,count,false,slot)
  end
}

module.removeInventoryItem = removeInventoryItemHandlers[invName] or removeInventoryItemHandlers.default

local getInventoryItemBySlotHandlers = {
  ["mf-inventory"] = function(source,slot)
    local uid = module.getUniqueId(source)
    local items = Inventory:getInventoryItems(uid)
    return items[slot]
  end,

  ["ox_inventory"] = function(source,slot)
    return Inventory:GetSlot(source,slot)
  end,

  ["default"] = function() end
}

module.getInventoryItemBySlot = getInventoryItemBySlotHandlers[invName] or getInventoryItemBySlotHandlers.default

local getInventoryItemsByNameHandlers = {
  ["mf-inventory"] = function(source,name)
    local uid = module.getUniqueId(source)  
    local items = Inventory:getInventoryItems(uid)

    local res = {}

    for slot,item in pairs(items) do
      if type(item) == "table" and item.name and item.name == name then
        item.slot = slot
        table.insert(res,item)
      end
    end

    return res
  end,

  ["default"] = function(source,name)
    local inv = module.getInventory(source)
    local res = {}

    for _,item in pairs(inv) do
      if type(item) == "table" and item.name == name then
        table.insert(res,item)
      end
    end

    return res
  end
}

module.getInventoryItemsByName = getInventoryItemsByNameHandlers[invName] or getInventoryItemsByNameHandlers.default

local getInventoryItemByNameHandlers = {
  ["mf-inventory"] = function(source,name)
    local uid = module.getUniqueId(source)  
    return Inventory:getInventoryItem(uid,name)
  end,

  ["ox_inventory"] = function(source,name)
    local item = Inventory:GetItem(source,name,nil,false)    
    return item and item.name and item or item and item[1]
  end,

  ["default"] = function(source,name)
    return ESX.GetPlayerFromId(source).getInventoryItem(name)
  end
}

module.getInventoryItemByName = getInventoryItemByNameHandlers[invName] or getInventoryItemByNameHandlers.default

local clearInventoryHandlers = {
  ["mf-inventory"] = function(source)
    return Inventory:deleteInventory(module.getUniqueId(source))
  end,

  ["ox_inventory"] = function(source,name)
    return Inventory:ClearInventory(source)    
  end,

  ["default"] = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
  end
}

module.clearInventory = function(source)
  return QBCore.Functions.GetPlayer(source).Functions.ClearInventory()
end

local jobTrackers = {}

module.trackJobs = function(cb, jobs)
  jobs = jobs or {"all"}
  table.insert(jobTrackers, {cb = cb, jobs = jobs})
end

local function contains(t, value)
  for _,v in ipairs(t) do
    if v == value then
      return true
    end
  end
end

local function onJobUpdate(source, job)
  local name = job and job.name
  local grade = job and job.grade

  for _,tracker in ipairs(jobTrackers) do
    if (not job and contains(tracker.jobs, "nil")) or tracker.jobs[1] == "all" or contains(tracker.jobs, name) then
      tracker.cb(source, name, grade)
    end
  end
end

AddEventHandler('esx:setJob', onJobUpdate)

AddEventHandler('esx:playerLoaded', function(_, playerData)
  onJobUpdate(playerData.source, playerData.job)
end)

AddEventHandler('playerDropped', function()
  onJobUpdate(source, nil)
end)

return module