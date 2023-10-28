local resName,ESX,invName = ...

local uniqueId
local playerJob,playerGroup = {},{}
local playerInventory

local idTrackers,jobTrackers,groupTrackers = {},{},{}
local inventoryTrackers = {}

local module = {}

module.isReady = function()
  return ESX.IsPlayerLoaded()
end

module.awaitReadySync = function()
  while not ESX.IsPlayerLoaded() do
    Wait(500)
  end
end

module.awaitReadyAsync = function(cb)
  Citizen.CreateThread(function()
    while not ESX.IsPlayerLoaded() do
      Wait(500)
    end

    cb()
  end)
end

module.setClothes = function(clothes)  
  TriggerEvent('skinchanger:getSkin', function(skin)
    TriggerEvent('skinchanger:loadClothes', skin, clothes.skin)
    TriggerEvent('esx_skin:setLastSkin', skin)

    TriggerEvent('skinchanger:getSkin', function(skin)
      TriggerServerEvent('esx_skin:save', skin)
    end)
  end)
end

module.getName = function()
  local xPlayer = ESX.GetPlayerData()
  return xPlayer.firstName or xPlayer.firstname or "Unknown",xPlayer.lastName or xPlayer.lastname or "Unknown"
end

module.getUniqueId = function()
  return ESX.GetPlayerData().identifier
end

module.getJob = function()
  local job = ESX.GetPlayerData().job

  if not job then
    return
  end

  return job.name,job.grade,job.label,job.grade_name
end

module.getGroup = function()
  local gang = ESX.GetPlayerData().job

  if not gang then
    return
  end

  return gang.name,gang.grade
end

CreateThread(function()
  if type(Config) == "table" and Config.use_t1ger_gangs
  or type(config) == "table" and config.use_t1ger_gangs
  then
    module.awaitReadyAsync(function()
      TriggerServerEvent("ti_utils:getTigerGang")
    end)

    RegisterNetEvent("ti_utils:gotTigerGang", function(gangId, gangRank)
      playerGroup.name = gangId
      playerGroup.rank = gangRank
    
      for _,cb in ipairs(groupTrackers) do
        cb(playerGroup.name,playerGroup.rank)
      end
    end)

    RegisterNetEvent("gangsystem:client:setPlayerGangId", function(gangId)
      playerGroup.name = gangId
    
      for _,cb in ipairs(groupTrackers) do
        cb(playerGroup.name,playerGroup.rank)
      end
    end)

    RegisterNetEvent("gangsystem:client:setPlayerGangRank", function(gangRank)
      playerGroup.rank = gangRank
    
      for _,cb in ipairs(groupTrackers) do
        cb(playerGroup.name,playerGroup.rank)
      end
    end)

    module.getGroup = function()
      return playerGroup.name,playerGroup.rank
    end

    RegisterNetEvent("gangsystem:client:setGangs", function(gangs)
      local uid = module.getUniqueId()
      local inGroup = playerGroup.name ~= nil

      for id,gang in pairs(gangs) do
        if gang.leader == uid then
          playerGroup.name = id       
          playerGroup.rank = #gang.ranks    
  
          for _,cb in ipairs(groupTrackers) do
            cb(playerGroup.name,playerGroup.rank)
          end

          return
        end

        for _,member in ipairs(gang.members) do
          if member.identifier == uid then
            playerGroup.name = id       
            playerGroup.rank = member.rank     
    
            for _,cb in ipairs(groupTrackers) do
              cb(playerGroup.name,playerGroup.rank)
            end

            return
          end
        end
      end

      if inGroup then
        playerGroup.name = nil
        playerGroup.rank = nil
    
        for _,cb in ipairs(groupTrackers) do
          cb(playerGroup.name,playerGroup.rank)
        end

        return
      end
    end)
  end
end)

module.trackUniqueId = function(cb)
  table.insert(idTrackers,cb)

  local id = module.getUniqueId()

  cb(id)
end

module.trackJob = function(cb)
  table.insert(jobTrackers,cb)

  local name,rank = module.getJob()

  cb(name,rank)
end

module.trackGroup = function(cb)
  table.insert(groupTrackers,cb)

  local name,rank = module.getGroup()

  cb(name,rank)
end

module.trackInventoryChange = function(cb)
  table.insert(inventoryTrackers, cb)
end

module.hasPermissions = function(characterPermissions,jobPermissions,groupPermissions)
  if  not characterPermissions
  and not jobPermissions
  and not groupPermissions
  then
    return true
  end

  if jobPermissions then
    if jobPermissions[playerJob.name] and jobPermissions[playerJob.name] <= playerJob.rank then
      return true
    end
  end

  if groupPermissions then
    if groupPermissions[playerGroup.name] and groupPermissions[playerGroup.name] <= playerGroup.rank then
      return true
    end
  end

  if characterPermissions then
    for _,uid in ipairs(characterPermissions) do
      if uid == uniqueId then
        return true
      end
    end
  end
  
  return false
end

module.getAccounts = function()
  local playerData = ESX.GetPlayerData()

  local accounts = {}

  for k,v in pairs(playerData.accounts) do
    accounts[v.name] = v.money or v.amount or 0
  end

  if not accounts.cash and accounts.money then
    accounts.cash = accounts.money
  end

  return accounts
end

local invHandlers = {
  ["mf-inventory"] = function()
    local res,ret

    exports["mf-inventory"]:getInventoryItems(module.getUniqueId(),function(items)
      ret = items
      res = true
    end)

    while not res do
      Wait(0)
    end

    return ret
  end,

  ["qs-inventory"] = function()
    local items = ESX.GetPlayerData().inventory or {}

    for _,item in pairs(items) do
      item.metadata = item.info
      item.count = item.count or item.amount
    end

    return items
  end,

  ["default"] = function()
    return ESX.GetPlayerData().inventory or {}
  end
}

module.getInventory = function()
  return (invHandlers[invName] or invHandlers.default)() or {}
end

--
-- Internal Tracking
--

module.trackUniqueId(function(uid)
  uniqueId = uid
end)

module.trackJob(function(name,rank)
  playerJob = {
    name = name,
    rank = rank
  }
end)

module.trackGroup(function(name,rank)
  playerGroup = {
    name = name,
    rank = rank
  }
end)

module.awaitReadyAsync(function()
  playerInventory = module.getInventory()
end)

--
-- Change Handlers
--

local function checkInventoryChanged()
  if not playerInventory then
    playerInventory = module.getInventory()
  end

  Wait(0)
  
  local newInventory = module.getInventory()

  for k,v in pairs(playerInventory) do
    if type(newInventory[k]) ~= "table" then
      for _,cb in ipairs(inventoryTrackers) do
        cb("remove", v)
      end
    end
  end

  for k,v in pairs(newInventory) do
    if type(v) == "table" then
      if type(playerInventory[k]) ~= "table" then
        for _,cb in ipairs(inventoryTrackers) do
          cb("add", v)
        end
      elseif playerInventory[k].name ~= v.name then
        for _,cb in ipairs(inventoryTrackers) do
          cb("swap", v, playerInventory[k])
        end
      elseif playerInventory[k].count < v.count then
        for _,cb in ipairs(inventoryTrackers) do
          cb("add", v)
        end
      elseif playerInventory[k].count > v.count then
        for _,cb in ipairs(inventoryTrackers) do
          cb("remove", v)
        end
      end
    end
  end

  playerInventory = newInventory
end

--
-- Event Handling
--

RegisterNetEvent("esx:setJob",function(job)
  for _,cb in ipairs(jobTrackers) do
    cb(job.name,job.grade)
  end
end)

-- RegisterNetEvent("esx:setGroup",function(group)
--   for _,cb in ipairs(groupTrackers) do
--     cb(group.name,group.grade)
--   end
-- end)

RegisterNetEvent("esx:playerLoaded",function()
  Wait(0)

  local data = ESX.GetPlayerData()

  local jobName,jobRank = module.getJob()
  local groupName,groupRank = module.getGroup()

  for _,cb in ipairs(idTrackers) do
    cb(data.identifier)
  end

  for _,cb in ipairs(jobTrackers) do
    cb(jobName,jobRank)
  end

  for _,cb in ipairs(groupTrackers) do
    cb(groupName,groupRank)
  end
end)

RegisterNetEvent("ox_inventory:updateInventory", function()
  checkInventoryChanged()
end)

RegisterNetEvent("qs-core:setPlayerData", function()
  checkInventoryChanged()
end)

RegisterNetEvent("esx:updatePlayerData", function()
  checkInventoryChanged()
end)

RegisterNetEvent("inventory:client:UpdatePlayerInventory", function()
  checkInventoryChanged()
end)

return module