local QBCore = select(2,...)

local module = {}

module.getUniqueId = function(source)
  local ply = QBCore.Functions.GetPlayer(source)

  if not ply then
    return
  end

  return ply.PlayerData.citizenid
end

module.getLicense = function(source)
  local ply = QBCore.Functions.GetPlayer(source)

  if not ply then
    return
  end

  return ply.PlayerData.license
end

module.checkLicense = function(source, licenseName)
  local item = module.getInventoryItemByName(source, licenseName)
  
  if item and item.count > 0 then
    return true
  else
    return false
  end
end

module.getClothes = function(source)
  return exports.oxmysql:executeSync('SELECT * FROM player_outfits WHERE citizenid = ?', { module.getUniqueId(source) })
end

module.removeClothes = function(source,outfit)
  MySQL.query('DELETE FROM player_outfits WHERE citizenid = ? AND outfitname = ? AND outfitId = ?', {
    module.getUniqueId(source),
    outfit.outfitname,
    outfit.outfitId
  })
end

module.canCarryItem = function(source,item,count)
  return true
end

module.getInventory = function(source)
  local res = {}
  local ply = QBCore.Functions.GetPlayer(source)

  if not ply then
    return
  end

  local items = ply.PlayerData.items

  for slot,item in pairs(items) do
    if type(item) == "table" then
      table.insert(res,{
        name = item.name,
        label = item.label,
        count = item.count or item.amount,
        slot = slot,
        metadata = item.info or item.metadata or item.data
      })
    end
  end

  return res
end

module.getName = function(source)
  local player = QBCore.Functions.GetPlayer(source)

  if not player then
    return '',''
  end

  local charInfo = player.PlayerData.charinfo

  if not charInfo or not charInfo.firstname or not charInfo.lastname then 
    return '','' 
  end

  return charInfo.firstname,charInfo.lastname
end

module.getJob = function(source)
  local player = QBCore.Functions.GetPlayer(source)

  if not player then
    return
  end

  local job = player.PlayerData.job

  if not job or not job.grade then
    return
  end

  return job.name,job.grade.level
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
    local player = QBCore.Functions.GetPlayer(source)
  
    if not player then
      return
    end
  
    local group = player.PlayerData.gang
  
    if not group or not group.grade then
      return
    end
  
    return group.name,group.grade.level
  end
end

module.getDutyCount = function(jobName)
  return QBCore.Functions.GetDutyCount(jobName)
end

module.addInventoryItem = function(source,name,count,metadata)
  return QBCore.Functions.GetPlayer(source).Functions.AddItem(name,count,false,metadata)
end

module.removeInventoryItem = function(source,name,count,slot)
  return QBCore.Functions.GetPlayer(source).Functions.RemoveItem(name,count,slot)
end

module.getInventoryItemBySlot = function(source,slot)
  local item = QBCore.Functions.GetPlayer(source).Functions.GetItemBySlot(slot)

  local res = false

  if type(item) == "table" then
    res = {
      name = item.name,
      label = item.label,
      count = item.count or item.amount,
      slot = slot,
      metadata = item.info or item.metadata or item.data
    }
  end

  return res
end

module.getInventoryItemsByName = function(source,name)
  local items = QBCore.Functions.GetPlayer(source).Functions.GetItemsByName(name)

  local res = {}

  for slot,item in pairs(items) do
    if type(item) == "table" then 
      table.insert(res,{
        name = item.name,
        label = item.label,
        count = item.count or item.amount,
        slot = item.slot or slot,
        metadata = item.info or item.metadata or item.data
      })
    end
  end

  return res
end

module.getInventoryItemByName = function(source,name)
  local item = QBCore.Functions.GetPlayer(source).Functions.GetItemByName(name)

  local res = false

  if type(item) == "table" then
    res = {
      name = item.name,
      label = item.label,
      count = item.count or item.amount,
      slot = item.slot,
      metadata = item.info or item.metadata or item.data
    }
  end

  return res
end

module.notifyPlayer = function(source,msg,typeof)
  TriggerClientEvent('QBCore:Notify',source,msg,typeof or "primary")
end

module.getAccounts = function(source)
  local ply = QBCore.Functions.GetPlayer(source)

  local accounts = {}

  for k,v in pairs(ply.PlayerData.money) do
    accounts[k] = v
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
  return QBCore.Functions.GetPlayer(source).Functions.AddMoney(account,amount)
end

module.addAccountMoneyOffline = function(uid,accountName,amount)
  local rows = exports.oxmysql:executeSync("SELECT * FROM players WHERE citizenid = ?", {uid})

  if not rows or not rows[1] then return end

  local accounts = json.decode(rows[1].money)

  accounts[accountName] = (accounts[accountName] or 0) + amount

  local accountsStr = json.encode(accounts)

  exports.oxmysql:executeSync("UPDATE players SET money = ? WHERE citizenid = ?", {accountsStr, uid})
end

module.removeAccountMoney = function(source,account,amount)
  return QBCore.Functions.GetPlayer(source).Functions.RemoveMoney(account,amount)
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
  local player = QBCore.Functions.GetPlayerByCitizenId(identifier)

  if not player then
    return
  end

  return player.PlayerData.source
end

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
  if job and not job.onduty then
    job = nil
  end

  local name = job and job.name
  local grade = job and job.grade.level

  for _,tracker in ipairs(jobTrackers) do
    if (not job and contains(tracker.jobs, "nil")) or tracker.jobs[1] == "all" or contains(tracker.jobs, name) then
      tracker.cb(source, name, grade)
    end
  end
end

AddEventHandler('QBCore:Server:OnJobUpdate', onJobUpdate)

AddEventHandler('QBCore:Player:SetPlayerData', function(playerData)
  onJobUpdate(playerData.source, playerData.job)
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(data)
  onJobUpdate(data.PlayerData.source, data.PlayerData.job)
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(player)
  onJobUpdate(player, nil)
end)

AddEventHandler('playerDropped', function()
  onJobUpdate(source, nil)
end)

return module