-- WX ANTICHEAT SERVER SIDE CODE
local detected = {}
local whitelistedPlayers = {}
-- [ Base entity creation thread ]
local explosionCounter
local vehCounter
local PedCounter
local PropCounter
Citizen.CreateThread(
    function()
        explosionCounter = {}
        vehCounter = {}
        PedCounter = {}
        PropCounter = {}
    end
)

-- [ Permission checking function ]
local function isAdmin(playerId)
    -- local admin = IsPlayerAceAllowed(playerId, wx.adminAce)
    -- if admin == 1 or admin then return true end
    -- return false
    local steam,license,discord,fivem = nil,nil,nil,nil
    for k, v in pairs(GetPlayerIdentifiers(playerId)) do
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steam = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
        fivem = v
      end
    end

    for k,v in pairs(Admins) do

      if v.Identifiers.discord then
        local admindiscord = nil
        if not string.find(v.Identifiers.discord,'discord:') then admindiscord = "discord:"..v.Identifiers.discord
        else admindiscord = v.Identifiers.discord end
        if discord == admindiscord then return true end
      end

      if v.Identifiers.license then
        local adminlicense = nil
        if not string.find(v.Identifiers.license,'license:') then adminlicense = "license:"..v.Identifiers.license
        else adminlicense = v.Identifiers.license end
        if license == adminlicense then return true end
      end

      if v.Identifiers.steam then
        local adminsteam = nil
        if not string.find(v.Identifiers.steam,'steam:') then adminsteam = "steam:"..v.Identifiers.adminsteam
        else adminsteam = v.Identifiers.steam end
        if steam == adminsteam then return true end
      end
    end

    return false
end

local function isInTable(table, value)
  for i = 1, #table do
    if table[i] == value then
      return true
    end
  end
  return false
end

local function removeFromTable(table, value)
  for index, v in pairs(table) do
    if v == value then
      table.remove(table, index)
    end
  end
end

-- [ Startup stuff ]

-- old banner
-- local banner = [[                                                                                                                               
--  __    ____  __         _             _     _     ___   _                      _   
-- / / /\ \ \ \/ /        /_\    _ __   | |_  (_)   / __\ | |__     ___    __ _  | |_ 
-- \ \/  \/ /\  /        //_\\  | '_ \  | __| | |  / /    | '_ \   / _ \  / _` | | __|
--  \  /\  / /  \       /  _  \ | | | | | |_  | | / /___  | | | | |  __/ | (_| | | |_ 
--   \/  \/ /_/\_\      \_/ \_/ |_| |_|  \__| |_| \____/  |_| |_|  \___|  \__,_|  \__|
                                                                                                                                                                                                                                                                                                                                                             
-- ]]
-- local banner = [[                                                                                                                               
                                                                                               
-- `8.`888b                 ,8' `8.`8888.      ,8'                    .8.           ,o888888o.    
--  `8.`888b               ,8'   `8.`8888.    ,8'                    .888.         8888     `88.  
--   `8.`888b             ,8'     `8.`8888.  ,8'                    :88888.     ,8 8888       `8. 
--    `8.`888b     .b    ,8'       `8.`8888.,8'                    . `88888.    88 8888           
--     `8.`888b    88b  ,8'         `8.`88888'                    .8. `88888.   88 8888           
--      `8.`888b .`888b,8'          .88.`8888.                   .8`8. `88888.  88 8888           
--       `8.`888b8.`8888'          .8'`8.`8888.                 .8' `8. `88888. 88 8888           
--        `8.`888`8.`88'          .8'  `8.`8888.               .8'   `8. `88888.`8 8888       .8' 
--         `8.`8' `8,`'          .8'    `8.`8888.             .888888888. `88888.  8888     ,88'  
--          `8.`   `8'          .8'      `8.`8888.           .8'       `8. `88888.  `8888888P'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
-- ]]
-- local banner = [[                                                                                                                               
                                                                                            
-- I8,        8        ,8I      8b        d8                     db               ,ad8888ba,   
-- `8b       d8b       d8'       Y8,    ,8P                     d88b             d8"'    `"8b  
--  "8,     ,8"8,     ,8"         `8b  d8'                     d8'`8b           d8'            
--   Y8     8P Y8     8P            Y88P                      d8'  `8b          88             
--   `8b   d8' `8b   d8'            d88b                     d8YaaaaY8b         88             
--    `8a a8'   `8a a8'           ,8P  Y8,                  d8""""""""8b        Y8,            
--     `8a8'     `8a8'           d8'    `8b                d8'        `8b        Y8a.    .a8P  
--      `8'       `8'           8P        Y8              d8'          `8b        `"Y8888Y"'   
                                                                                            
--                                           Version 3.0
--                                             B E T A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
-- ]]


-- [ Webhook functions ]
function ACLogs(log,playerName,reason,steam,license,discord,ip)
  local embed = {
    {
        ["color"] = Webhooks.WebhookColor,
        ["title"] = "["..log.."] Player has been detected!",
    ["fields"] = {
      {
        ["name"]= "Player Name",
        ["value"]= playerName,
        ["inline"] = true
      },
      {
        ["name"]= "Reason",
        ["value"]= reason,
        ["inline"] = true
      },
      {
        ["name"]= "Steam ID",
        ["value"]= steam,
        ["inline"] = true
      },
      {
        ["name"]= "License",
        ["value"]= license,
        ["inline"] = true
      },
      {
        ["name"]= "Discord ID",
        ["value"]= discord,
        ["inline"] = true
      },
      {
        ["name"]= "IP Address",
        ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
        ["inline"] = true
      },
    },
    ["footer"] = {
      ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
      ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
    }
  }
}
    PerformHttpRequest(Webhooks.Webhook, function(err, text, headers) end, "POST",json.encode({username = "🛡️ WX ANTICHEAT 🛡️",embeds = embed,avatar_url = "https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png"}),{["Content-Type"] = "application/json"})
end


function ChatLogs(playerName, message, steam, license, discord, ip)
  local embed = {
        {
            ["color"] = Webhooks.WebhookColor,
            ["title"] = "**Chat Message**",
        ["fields"] = {
          {
            ["name"]= "Player Name",
            ["value"]= playerName,
            ["inline"] = true
          },
          {
            ["name"]= "Message",
            ["value"]= message,
            ["inline"] = true
          },
          {
            ["name"]= "Steam ID",
            ["value"]= steam,
            ["inline"] = true
          },
          {
            ["name"]= "License",
            ["value"]= license,
            ["inline"] = true
          },
          {
            ["name"]= "Discord ID",
            ["value"]= discord,
            ["inline"] = true
          },
          {
            ["name"]= "IP Address",
            ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
            ["inline"] = true
          },
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.ChatWebhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function ObjectLogs(playerName, object, steam, license, discord, ip)
  local embed = {
        {
            ["color"] = Webhooks.WebhookColor,
            ["title"] = "**Object Created**",
        ["fields"] = {
          {
            ["name"]= "Player Name",
            ["value"]= playerName,
            ["inline"] = true
          },
          {
            ["name"]= "Object",
            ["value"]= message,
            ["inline"] = true
          },
          {
            ["name"]= "Steam ID",
            ["value"]= steam,
            ["inline"] = true
          },
          {
            ["name"]= "License",
            ["value"]= license,
            ["inline"] = true
          },
          {
            ["name"]= "Discord ID",
            ["value"]= discord,
            ["inline"] = true
          },
          {
            ["name"]= "IP Address",
            ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
            ["inline"] = true
          },
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.ObjectWebhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end


function ExplosionLogs(playerName, explosionType, audible, visible, damagescale, position, info, ids)
  local embed = {
        {
            ["color"] = Webhooks.WebhookColor,
            ["title"] = "**Explosion Created**",
        ["fields"] = {
          {
            ["name"]= "Player Name",
            ["value"]= playerName,
            ["inline"] = true
          },
          {
            ["name"]= "Explosion Type",
            ["value"]= explosionType,
            ["inline"] = true
          },
          {
            ["name"]= "Audible",
            ["value"]= audible,
            ["inline"] = true
          },
          {
            ["name"]= "Invisible",
            ["value"]= visible,
            ["inline"] = true
          },
          {
            ["name"]= "Damage Scale",
            ["value"]= damagescale,
            ["inline"] = true
          },
          {
            ["name"]= "Position",
            ["value"]= position,
            ["inline"] = true
          },
          {
            ["name"]= "Full Informations",
            ["value"]= info,
            ["inline"] = true
          },
          {
            ["name"]= "Player Identifiers",
            ["value"]= ids,
            ["inline"] = true
          },
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.ExplosionWebhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end


function ResourceLog(status,resource)
  local embed = {
        {
            ["color"] = Webhooks.WebhookColor,
            ["title"] = "Resource has been "..status,
        ["fields"] = {
          {
            ["name"]= "Resource Name",
            ["value"]= resource,
            ["inline"] = true
          },
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.ResourceWebhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end




function BannedLogs(player,reason,banid,steam,discord,license,ip)
  local embed = {
        {
            ["color"] = Webhooks.WebhookColor,
            ["title"] = Locale.ConnBlocked,
        ["fields"] = {
          {
            ["name"]= "Player Name",
            ["value"]= player,
            ["inline"] = true
          },
          {
            ["name"]= "Reason",
            ["value"]= reason,
            ["inline"] = true
          },
          {
            ["name"]= "Ban ID",
            ["value"]= banid,
            ["inline"] = true
          },
          {
            ["name"]= "Steam ID",
            ["value"]= steam,
            ["inline"] = true
          },
          {
            ["name"]= "Discord",
            ["value"]= discord,
            ["inline"] = true
          },
          {
            ["name"]= "License",
            ["value"]= license,
            ["inline"] = true
          },
          {
            ["name"]= "IP Address",
            ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
            ["inline"] = true
          },
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.ResourceWebhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function OtherLogs(admin,reason)
  local embed = {
        {
            ["color"] = Webhooks.WebhookColor,
            ["title"] = "**Admin has been detected - Ignoring...**",
        ["fields"] = {
          {
            ["name"]= "Admin Name",
            ["value"]= admin,
            ["inline"] = true
          },
          {
            ["name"]= "Reason",
            ["value"]= reason,
            ["inline"] = true
          }
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.Webhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function Started()
    local embed = {
        {
            ["color"] = 5814783,
            ["title"] = Locale.StartedTitle,
            ["description"] = Locale.StartedDesc,
            ["author"] = {
              ["name"] = "WX AntiCheat",
              ["url"] = "https://0wx.tebex.io/",
              ["icon_url"] = "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230"
            },
            ["footer"] = {
              ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
              ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
            }

        }
    }
    PerformHttpRequest(Webhooks.WebHook, function(err, text, headers) end, "POST",json.encode({username = "🛡️ WX ANTICHEAT 🛡️",embeds = embed,avatar_url = "https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png"}),{["Content-Type"] = "application/json"})
end
function ConnectLogs(player,steam,license,discord,ip)
  local embed = {
        {
            ["color"] = 2017589,
            ["title"] = Locale.Connecting,
            ["author"] = {
              ["name"] = "WX AntiCheat",
              ["url"] = "https://0wx.tebex.io/",
              ["icon_url"] = "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230"
            },
        ["fields"] = {
          {
            ["name"]= "Player Name",
            ["value"]= player,
            ["inline"] = true
          },
          {
            ["name"]= "Steam ID",
            ["value"]= steam,
            ["inline"] = true
          },
          {
            ["name"]= "License",
            ["value"]= license,
            ["inline"] = true
          },
          {
            ["name"]= "Discord",
            ["value"]= "<@"..discord..">",
            ["inline"] = true
          },
          {
            ["name"]= "IP Address",
            ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
            ["inline"] = true
          },
        },
        ["thumbnail"] = {
          ["url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        },
        ["footer"] = {
          ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.WebHookConnect, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end
function DisconnectLogs(player,reason,steam,license,discord,ip)
  local embed = {
        {
            ["color"] = 13380909,
            ["title"] = Locale.Disconnected,
            ["author"] = {
              ["name"] = "WX AntiCheat",
              ["url"] = "https://0wx.tebex.io/",
              ["icon_url"] = "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230"
            },
        ["fields"] = {
          {
            ["name"]= "Player Name",
            ["value"]= player,
            ["inline"] = true
          },
          {
            ["name"]= "Disconnect Reason",
            ["value"]= reason,
            ["inline"] = true
          },
          {
            ["name"]= "Steam ID",
            ["value"]= steam,
            ["inline"] = true
          },
          {
            ["name"]= "License",
            ["value"]= license,
            ["inline"] = true
          },
          {
            ["name"]= "Discord",
            ["value"]= "<@"..discord..">",
            ["inline"] = true
          },
          {
            ["name"]= "IP Address",
            ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
            ["inline"] = true
          },
        },
        ["footer"] = {
          ["text"] = "🌠 [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
          ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
        }
      }
    }

  PerformHttpRequest(Webhooks.WebHookConnect, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function BanLogs(message)
    local embed = {
        {
            ["color"] = 5814783,
            ["title"] = Locale.BannedByAdmin,
            ["description"] = message,
            ["footer"] = {
              ["text"] = "🌠 WX AntiCheat - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
              ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
            }

        }
    }
    PerformHttpRequest(Webhooks.WebHook, function(err, text, headers) end, "POST",json.encode({username = "🛡️ WX ANTICHEAT 🛡️",embeds = embed,avatar_url = "https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png"}),{["Content-Type"] = "application/json"})
end

-- [ Ban ID Generation (really dumb) ]
local function generateBanID()
    local a,b,c,d,e,f,g,h
    if math.random(0,1) == 1 then
      a = string.char(math.random(65, 65 + 25))
    else
      a = math.random(0,9)
    end
    b = string.char(math.random(65, 65 + 25))
    c = string.char(math.random(65, 65 + 25))
    if math.random(0,1) == 1 then
      d = string.char(math.random(65, 65 + 25))
    else
      d = math.random(0,9)
    end
    e = string.char(math.random(65, 65 + 25))
    f = string.char(math.random(65, 65 + 25))
    if math.random(0,1) == 1 then
      g = string.char(math.random(65, 65 + 25))
    else
      g = math.random(0,9)
    end
    if math.random(0,1) == 1 then
      h = string.char(math.random(65, 65 + 25))
    else
      h = math.random(0,9)
    end
  
    local banID = a..b..c..d.."-"..e..f..g..h
    return banID


end

-- [ Fake Triggers ]
if wx.fakeTriggers then
    for k,v in pairs(wx.triggerList) do
      if string.lower(v.type) == 'server' then
        RegisterServerEvent(k)
        AddEventHandler(k,function()
            TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", source, Locale.Trigger:format(k))
        end)
      end
    end
end

for k,v in pairs(wx.TriggerValues) do
  AddEventHandler(k,function(amount)
    if amount > v then
      TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", source, Locale.TriggerValue:format(k,amount))
    end
  end)
end

-- [ Blacklisted Server-Side stuff]
if wx.antiParticles then
  AddEventHandler(
      "ptFxEvent",
      function(sender, data)
          for k, v in pairs(wx.Particles) do
              if v == data.effectHash then
                  CancelEvent() 
                  TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.Particle:format(v))
              end
          end
          for b, n in pairs(wx.Assets) do
              if n == data.assetHash then
                  CancelEvent()
                  TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.Asset:format(n))
              end
          end
      end
  )
end
local explosions = {}
local peds = {}
local vehicles = {}

if wx.explosionLimit then
  Citizen.CreateThread(function ()
    while true do
      Citizen.Wait(wx.maxExplosionsInterval)
      explosions = {}
    end
  end)
end

if wx.pedLimit then
  Citizen.CreateThread(function ()
    while true do
      Citizen.Wait(wx.maxPedInterval)
      peds = {}
    end
  end)
end

if wx.vehicleLimit then
  Citizen.CreateThread(function ()
    while true do
      Citizen.Wait(wx.maxVehicleInterval)
      vehicles = {}
    end
  end)
end

AddEventHandler('explosionEvent', function(sender, ev)
  explosions[sender] = (explosions[sender] or 0) + 1
  -- print(explosions[sender])
  if wx.antiExplosion then
  for k, v in ipairs(wx.explosionList) do
      if ev.explosionType == v then
        CancelEvent()
        TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.Explosion:format(v))
      end
    end
    if wx.cancelOtherExplosions then
      for k, v in ipairs(wx.explosionList) do
        if ev.explosionType ~= v then
          CancelEvent()
        end
      end
    end
  end
  if wx.antiExplosionMods then
    if ev.isAudible == false then
      TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.InaudibleExplosion)
    end
    if ev.isInvisible == true then
      TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.InvisibleExplosion)
    end
    if ev.damageScale > 1.0 then
      TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.BoostedExplosion)
    end
  end

  if wx.explosionLimit then
    if explosions[sender] > wx.maxExplosions then
      CancelEvent()
      TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", sender, Locale.ExplosionSpam:format(explosions[sender],wx.maxExplosionsInterval))
    end
  end
  if ev.ownerNetId == 0 then
    CancelEvent()
  end
end)

AddEventHandler("entityCreating", function(entity)
  if DoesEntityExist(entity) then
    local _src = NetworkGetEntityOwner(entity)
    vehicles[_src] = (vehicles[_src] or 0) + 1
    local model = GetEntityModel(entity)
    local _entitytype = GetEntityPopulationType(entity)
    if _src == nil or not _src then -- If the entity doesn't belong to any player delete it
      CancelEvent()
    end
    if GetEntityType(entity) == 2 then
      if wx.AntiBlacklistedVehiclesSpawn then
        for k,v in pairs(wx.vehicleBlacklist) do
            if model == GetHashKey(k) and v then
                TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", _src, Locale.VehicleSpawn:format(model))
                CancelEvent()
            end
        end
      end
      if GetEntitySpeed(entity) > wx.maxCreatingSpeed then
        CancelEvent()
      end
      -- if wx.vehicleLimit then
      --   if vehicles[_src] > wx.maxVehicles then
      --     CancelEvent()
      --     TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", _src, Locale.VehSpam:format(vehicles[_src],wx.maxVehicleInterval))
      --   end
      -- end
    end
  end
end)



  AddEventHandler('entityCreating', function(id)
      local model
      local owner
      local eType
      if DoesEntityExist(id) then
        model = GetEntityModel(id)
        eType = GetEntityType(id)
        owner = NetworkGetEntityOwner(id)
      end
      --[[
      3 = Object
      2 = Vehicle
      1 = Ped
      --]]
      if eType == 3 then
        if wx.antiObjects then
          for k,v in pairs(wx.objectBlacklist) do
              if model == GetHashKey(v) and owner ~= 0 then
                  CancelEvent()
                  TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", owner, Locale.Object:format(v))
              end
          end
          local speed = GetEntityVelocity(id)
          if #(speed-vector3(0,0,0)) > 100.0 then
              CancelEvent()
          end
        end
      end
      if wx.antiPeds then
        if eType == 1 then
          peds[owner] = (peds[owner] or 0) + 1
          for i, v in pairs(wx.pedBlacklist) do
              if model == GetHashKey(v) then
                if not detected[owner] or wx.Debug then
                  TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", owner, Locale.Ped:format(v))
                end
                  CancelEvent()
              end
              if model == GetHashKey("mp_m_niko_01") then
                  TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", owner, Locale.Ped.." - [mp_m_niko_01]")
                  CancelEvent()
              end
          end
          if wx.pedLimit then
            if peds[owner] > wx.maxPeds then
              CancelEvent()
              if not detected[owner] or wx.Debug then
                TriggerEvent("wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1", owner, Locale.PedSpam:format(peds[owner],wx.maxPedInterval))
              end
            end
          end
        end
      end
  end)


local help = [[
^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7
[WX ANTICHEAT HELP]

(optional argument)
<required argument>

wx update - [Checks for updates]
wx reload - [Reloads all the configuration files without needing to restart the script]
wx banlist - [Check how many players have been banned so far]

wx (help) - [Shows this help menu]
wx ban <id> (reason) - [Bans specified player]
wx unban <ban id> - [Unbans specified player]


wx clearvehicles - [Clears every vehicle on the server]
wx clearpeds - [Clears every ped on the server]
wx clearobjects - [Clears every object on the server]
wx clearall - [Clears everything on the server]

^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7

]]

local function reloadConfig(config)
  local resourceName = GetCurrentResourceName()
  local mod = LoadResourceFile(resourceName, config)

  if not mod then
      print("ERROR: THE CONFIG IS INVALID: " .. config)
      return
  end

  local modload, e = load(mod)
  if not modload then
      print("CONFIG RELOAD ERROR: " .. e)
      return
  end

  modload()
end

RegisterCommand("wx",function(source,args)
  if source == 0 then
    if args[1] == 'ban' then
        local target = args[2]
        if GetPlayerName(target) ~= nil then
          local reason = "[CONSOLE] "..table.concat(args, " ", 3)
          local banID = generateBanID()
            local playername = GetPlayerName(target)
            local HWID = GetPlayerToken(target, 1)
            local HWID2 = GetPlayerToken(target, 2)
            local HWID3 = GetPlayerToken(target, 3)
            local HWID4 = GetPlayerToken(target, 4)
            local HWID5 = GetPlayerToken(target, 5)
            if HWID5 == nil then HWID5 = "Not Found" end
            if HWID4 == nil then HWID4 = "Not Found" end
            if HWID3 == nil then HWID3 = "Not Found" end
            if HWID2 == nil then HWID2 = "Not Found" end
            if HWID == nil then HWID = "Not Found" end
            local discord = "Not Found"
            local ip = "Not Found"
            local fivem = "Not Found"
            local xboxlive = "Not Found"
            for k, v in pairs(GetPlayerIdentifiers(target)) do
              if string.sub(v, 1, string.len("steam:")) == "steam:" then
                steam = v
              elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
              elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xbl = v
              elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
              elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
                  xboxlive = v
              elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
                  fivem = v
              elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                ip = v
              end
            end
            local ip = ip:gsub('ip:', '')
            local discord = discord:gsub('discord:', '')
            MySQL.Async.execute("INSERT INTO wx_anticheat (reason, banID, playerName, discordid, steamid, ip, license, HWID, HWID2, HWID3, HWID4, HWID5) VALUES (@reason, @banID, @name, @discord, @steam, @ip, @license, @HWID,@HWID2,@HWID3,@HWID4,@HWID5)", {['@reason'] = reason,['@banID'] = banID, ['@HWID'] = HWID, ['@HWID2'] = HWID2, ['@HWID3'] = HWID3, ['@HWID4'] = HWID4, ['@HWID5'] = HWID5, ['@name'] = playername, ['@ip'] = ip, ['@steam'] = steam, ['@license'] = license, ['@discord'] = discord})
            DropPlayer(target, "\n🛡️ WX ANTICHEAT 🛡️\n\nYou have been manually banned by an admin!\nReason: "..reason.."\nBan ID: "..banID)
          else
            print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
            print("Player with this ID is not online!")
            print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
          end
    elseif args[1] == 'unban' then
      local banID = tostring(args[2])
      MySQL.Async.execute('DELETE FROM wx_anticheat WHERE banID = @banID',{ ['banID'] = banID},function(affectedRows)
        if affectedRows ~= 0 then
          print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
          print("[WX-BANS] Player ban with ID "..banID.." was removed!")
          print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
        else
          print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
          print("Couldn't find ban with the specified Ban ID!")
          print("Usage: acunban BAN-ID\n\nExample: acunban ABCD-1234")
          print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
        end
      end)
    elseif args[1] == 'clearvehicles' then
      for i, veh in pairs(GetAllVehicles()) do
        DeleteEntity(veh)
      end
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
      print("All vehicles has been deleted!")
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
    elseif args[1] == 'clearpeds' then
      for i, ped in pairs(GetAllPeds()) do
        DeleteEntity(ped)
      end
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
      print("All peds has been deleted!")
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
    elseif args[1] == 'clearobjects' then
      for i, obj in pairs(GetAllObjects()) do
        DeleteEntity(obj)
      end
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
      print("All objects has been deleted!")
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
    elseif args[1] == 'clearall' then
      for i, obj in pairs(GetAllObjects()) do
        DeleteEntity(obj)
      end
      for i, ped in pairs(GetAllPeds()) do
        DeleteEntity(ped)
      end
      for i, veh in pairs(GetAllVehicles()) do
        DeleteEntity(veh)
      end
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
      print("Everything has been deleted!")
      print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
    elseif args[1] == 'update' then
      TriggerEvent('wx_anticheat:checkUpdates',0)
    elseif args[1] == 'reload' then
      
      print('^7[^4 INFO ^7] 🔄 Reloading main config...')
      Citizen.SetTimeout(math.random(100,300),function ()
        reloadConfig("configs/anticheat_config.lua")
        print('^7[^4 INFO ^7] ✅ Main config has been reloaded!')
      end)
      print('^7[^4 INFO ^7] 🔄 Reloading webhook config...')
      Citizen.SetTimeout(math.random(100,300),function ()
        reloadConfig("configs/anticheat_webhooks.lua")
        print('^7[^4 INFO ^7] ✅ Webhooks has been reloaded!')
      end)
      print('^7[^4 INFO ^7] 🔄 Reloading OCR config...')
      Citizen.SetTimeout(math.random(100,300),function ()
        reloadConfig("configs/anticheat_ocr.lua")
        print('^7[^4 INFO ^7] ✅ OCR config has been reloaded!')
      end)
      Citizen.SetTimeout(500,function ()
        print('^7[^4 INFO ^7] ✅ All configs has been reloaded!')
      end)
    elseif args[1] == 'banlist' then
      GetBannedPlayers()
    else
      print(help)
    end
  else
    if not isAdmin(source) then
      print("[^1WX^7-^6AC^7] You don't have permissions to use this command!")
    else
      print("[^1WX^7-^6AC^7] Anticheat commands can be only run from the server console or rcon")
    end
  end
  
  end,false)
-- -- [ Commands ]
-- RegisterCommand("acban", function(source, args, rawCommand, target, reason)
--     if isAdmin(source) then
--     local target = tonumber(args[1])
--     local reason = "[MANUAL BAN] "..table.concat(args, " ", 2)
--     local banID = generateBanID()
--         local playername = GetPlayerName(target)
--         local HWID = GetPlayerToken(target, 1)
--         local HWID3 = GetPlayerToken(target, 3)
--         local HWID4 = GetPlayerToken(target, 4)
--         local HWID5 = GetPlayerToken(target, 5)
--         if HWID5 == nil then HWID5 = "Not Found" end
--         if HWID4 == nil then HWID4 = "Not Found" end
--         if HWID3 == nil then HWID3 = "Not Found" end
--         if HWID2 == nil then HWID2 = "Not Found" end
--         if HWID == nil then HWID = "Not Found" end
--         local discord = "Not Found"
--         local ip = "Not Found"
--         for k, v in pairs(GetPlayerIdentifiers(target)) do
--             if string.sub(v, 1, string.len("steam:")) == "steam:" then
--               steam = v
--             elseif string.sub(v, 1, string.len("license:")) == "license:" then
--               license = v
--             elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
--               xbl = v
--             elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
--               discord = v
--             elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
--                 xboxlive = v
--             elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
--                 fivem = v
--               elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
--                 ip = v
--               end
--             end
--         TriggerClientEvent('chat:addMessage', -1, {
--           template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(170, 10, 10); border-radius: 5px; font-size: 15px;"> <b>ANTI-CHEAT</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: -6.5px; padding-top: 2.5px; padding-right: -3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Player <b>{0}</b> was banned by <b>{1}</b>. Reason: <b>{2}</b></font></div>',
--           args = {GetPlayerName(target), GetPlayerName(source), reason }
--         })
--         MySQL.Async.execute("INSERT INTO wx_anticheat (reason, banID, name, discord, steam, ip, license, HWID, HWID2, HWID3, HWID4, HWID5) VALUES (@reason, @banID, @name, @discord, @steam, @ip, @license, @HWID,@HWID2,@HWID3,@HWID4,@HWID5)", {['@reason'] = reason,['@banID'] = banID, ['@HWID'] = HWID, ['@HWID2'] = HWID2, ['@HWID3'] = HWID3, ['@HWID4'] = HWID4, ['@HWID5'] = HWID5, ['@name'] = playername, ['@ip'] = ip, ['@steam'] = steam, ['@license'] = license, ['@discord'] = discord})
--         DropPlayer(target, "\n🛡️ WX ANTICHEAT 🛡️\n\nYou have been manually banned by an admin!\nReason: "..reason.."\nBan ID: "..banID)    
--         BanLogs("Admin "..GetPlayerName(source).." banned "..GetPlayerName(target).."\nReason: "..reason)
    
-- end
-- end)

RegisterCommand("clearvehicles", function(source, rawCommand)
  if isAdmin(source) then
      print('Removing all vehicles...')
      for i, veh in pairs(GetAllVehicles()) do
        DeleteEntity(veh)
      end
  end
end,false)

RegisterCommand("clearpeds", function(source, rawCommand)
  if isAdmin(source) then
      print('Removing all NPCs and Peds')
      for i, peds in pairs(GetAllPeds()) do
        DeleteEntity(peds)
      end
  end
end)

RegisterCommand("clearobjects", function(source, rawCommand)
  if isAdmin(source) then
      print('Deleting all player made objects')
      for i, objs in pairs(GetAllObjects()) do
        DeleteEntity(objs)
      end
  end
end)
RegisterCommand("clearserver", function(source, rawCommand)
  if isAdmin(source) then
      print('Cleaning server of EVERYTHING...')
      for i, objs in pairs(GetAllObjects()) do
        DeleteEntity(objs)
      end
      for i, peds in pairs(GetAllPeds()) do
        DeleteEntity(peds)
      end
      for i, veh in pairs(GetAllVehicles()) do
        DeleteEntity(veh)
      end
  end
end)

-- [ Blacklisted messages ]
if wx.messageBlacklist then
  AddEventHandler("chatMessage", function(source, author, message)
    if(IsPlayerAceAllowed(source, "wxAC.bypass")) then return else -- Don't detect bypassed players
      CancelEvent()
      local finalmessage = message:lower()
      finalmessage = finalmessage:gsub(" ", "")
      finalmessage = finalmessage:gsub("'", "")
      local lastchar = "Not Found"
      local output = "Not Found"
      for char in finalmessage:gmatch(".") do
        if(char ~= lastchar) then
          output = output .. char
        end
        lastchar = char
      end

      for _,v in pairs(wx.blockedWords) do
        if string.find(string.lower(message),v)  then
          local steam = "Not Found"
          local license = GetPlayerIdentifiers(source)[1]
          local discord = "Not Found"
          local ip = "Not Found"
          for k, v in pairs(GetPlayerIdentifiers(source)) do
              if string.sub(v, 1, string.len("steam:")) == "steam:" then
                steam = v
              elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
              elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xbl = v
              elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
              elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
                  xboxlive = v
              elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
                  fivem = v
                elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                  ip = v
                end
              end
                  if not wx.punishType == 'LOG' or not wx.Debug or not isAdmin(source) then
                    DropPlayer(source, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BlacklistedWord.." - ["..message.."]")
                  end
                  TriggerClientEvent('chat:addMessage', -1, {
                    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.75); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #e63946; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-shield-halved"></i> <b>WX ANTI-CHEAT</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Player <b>{0}</b> has been kicked! Reason: Blacklisted Word - [{1}]</font></div>',

                    -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(170, 10, 10); border-radius: 5px; font-size: 15px;"> <b>ANTI-CHEAT</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: -6.5px; padding-top: 2.5px; padding-right: -3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Player <b>{0}</b> has been kicked! Reason: Blacklisted Word: <b>{1}</b></font></div>',
                    args = {author, message }
                  })
                  local ip = ip:gsub('ip:', '')
                  ACLogs("KICKED",author,"Blacklisted Word - [**"..message.."**]",steam,license,discord,ip)
        end
      end
    end
  end)
end

function ExtractIdentifiers(src)
  local identifiers = {
      steam = "Not Found",
      ip = "Not Found",
      discord = "Not Found",
      license = "Not Found",
      xbl = "Not Found",
      live = "Not Found"
  }

  --Loop over all identifiers
  for i = 0, GetNumPlayerIdentifiers(src) - 1 do
      local id = GetPlayerIdentifier(src, i)

      --Convert it to a nice table.
      if string.find(id, "steam") then
          identifiers.steam = id
      elseif string.find(id, "ip") then
          identifiers.ip = id
      elseif string.find(id, "discord") then
          identifiers.discord = id
      elseif string.find(id, "license") then
          identifiers.license = id
      elseif string.find(id, "xbl") then
          identifiers.xbl = id
      elseif string.find(id, "live") then
          identifiers.live = id
      elseif string.find(id, "fivem") then
          identifiers.fivem = id
      end
  end

  return identifiers
end

RegisterNetEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1')
AddEventHandler('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1',function (playerID,reason)
  if not isAdmin(playerID) or wx.Debug then -- Make sure that the player is not an admin or whitelisted
    if not isInTable(whitelistedPlayers, playerID) then
      -- [ Get player's name ]
      local playername = GetPlayerName(playerID)

      -- [ Get the punish method from the config ]
      local punish = wx.punishType

      -- [ Generate the Ban ID ]
      local banID = generateBanID()

      -- [ Get player's HWIDs ]
      local HWID = GetPlayerToken(playerID, 1)
      local HWID2 = GetPlayerToken(playerID, 2)
      local HWID3 = GetPlayerToken(playerID, 3)
      local HWID4 = GetPlayerToken(playerID, 4)
      local HWID5 = GetPlayerToken(playerID, 5)
      if HWID5 == nil then HWID5 = "Not Found" end
      if HWID4 == nil then HWID4 = "Not Found" end
      if HWID3 == nil then HWID3 = "Not Found" end
      if HWID2 == nil then HWID2 = "Not Found" end
      if HWID == nil then HWID = "Not Found" end

      -- [ Get player's identifiers ]
      local steam = "Not Found"
      local ip = "Not Found"
      local discord = "Not Found"
      local license = "Not Found"
      local fivem = "Not Found"

      for k, v in pairs(GetPlayerIdentifiers(playerID)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          discord = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
          fivem = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          ip = v
        end
      end


      -- [ Strip player identifiers to only the needed ID ]
      steam = steam:gsub('steam:', '')
      discord = discord:gsub('discord:', '')
      if string.find(license,'license:') then
        license = license:gsub('license:', '')
      elseif string.find(license,'license2:') then
        license = license:gsub('license2:', '')
      end
      fivem = fivem:gsub('fivem:', '')
      ip = ip:gsub('ip:', '')

      -- [ Chat Messages ]
      if wx.chatMessages then
        TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.75); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #e63946; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-shield-halved"></i> <b>'..Locale.ChatPrefix..'</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">'..Locale.Detected:format('{0}','{1}')..'</font></div>',
          args = { GetPlayerName(playerID), reason }
        })
      end

      -- [ Punish the player ]
      if string.lower(punish) == 'log' then

        if wx.screenshots then -- Screenshot method
          TriggerEvent('wx_anticheat:screenshot', playerID, banID, playername, reason, license, discord, steam, fivem, ip)
        else -- Text only method
          ACLogs("LOG",playername,reason,steam,license,discord,ip)
        end

      elseif string.lower(punish) == 'kick' then
        if wx.screenshots then
          TriggerEvent('wx_anticheat:screenshot', playerID, banID, playername, reason, license, discord, steam, fivem, ip)
          if wx.showReason then
            DropPlayer(playerID, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedKick:format(reason, banID))
          else
            DropPlayer(playerID, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedNoReason:format(banID))
          end
        else
          ACLogs("KICK",playername,reason,steam,license,discord,ip)
        end
      elseif string.lower(punish) == 'ban' then
        -- [ Insert him into the banlist (database) ]
        MySQL.Async.execute("INSERT INTO wx_anticheat (reason, banID, playerName, discordid, steamid, ip, license, HWID, HWID2, HWID3, HWID4, HWID5) VALUES (@reason, @banID, @name, @discord, @steam, @ip, @license, @HWID,@HWID2,@HWID3,@HWID4,@HWID5)", {['@reason'] = reason,['@banID'] = banID, ['@HWID'] = HWID, ['@HWID2'] = HWID2, ['@HWID3'] = HWID3, ['@HWID4'] = HWID4, ['@HWID5'] = HWID5, ['@name'] = playername, ['@ip'] = ip, ['@steam'] = steam, ['@license'] = license, ['@discord'] = discord})

        if wx.screenshots then
          TriggerEvent('wx_anticheat:screenshot', playerID, banID, playername, reason, license, discord, steam, fivem, ip)
        else
          ACLogs("BAN",playername,reason,steam,license,discord,ip)
          if wx.showReason then
            DropPlayer(playerID, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedKick:format(reason, banID))
          else
            DropPlayer(playerID, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedNoReason:format(banID))
          end
        end
      end
    end
  else
    if wx.adminDetections then
      OtherLogs(GetPlayerName(playerID),reason)
    end
  end
end)

RegisterNetEvent('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU')
AddEventHandler('wx_anticheat:server:clientXkzuqBwmTjN7Gab4QzuN9QYZJ1WxxU',function (reason)
  local playerID = source
  if not isAdmin(source) or wx.Debug then -- Make sure that the player is not an admin or whitelisted
    if not isInTable(whitelistedPlayers,source) then

      -- [ Get player's name ]
      local playername = GetPlayerName(playerID)

      -- [ Get the punish method from the config ]
      local punish = wx.punishType

      -- [ Generate the Ban ID ]
      local banID = generateBanID()

      -- [ Get player's HWIDs ]
      local HWID = GetPlayerToken(playerID, 1)
      local HWID2 = GetPlayerToken(playerID, 2)
      local HWID3 = GetPlayerToken(playerID, 3)
      local HWID4 = GetPlayerToken(playerID, 4)
      local HWID5 = GetPlayerToken(playerID, 5)
      if HWID5 == nil then HWID5 = "Not Found" end
      if HWID4 == nil then HWID4 = "Not Found" end
      if HWID3 == nil then HWID3 = "Not Found" end
      if HWID2 == nil then HWID2 = "Not Found" end
      if HWID == nil then HWID = "Not Found" end

      -- [ Get player's identifiers ]
      local steam = "Not Found"
      local ip = "Not Found"
      local discord = "Not Found"
      local license = "Not Found"
      local fivem = "Not Found"

      for k, v in pairs(GetPlayerIdentifiers(playerID)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          discord = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
          fivem = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          ip = v
        end
      end

      -- [ Strip player identifiers to only the needed ID ]
      steam = steam:gsub('steam:', '')
      discord = discord:gsub('discord:', '')
      license = license:gsub('license:', '')
      fivem = fivem:gsub('fivem:', '')
      ip = ip:gsub('ip:', '')

      -- [ Chat Messages ]
      if wx.chatMessages then
        TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.75); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #e63946; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-shield-halved"></i> <b>'..Locale.ChatPrefix..'</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">'..Locale.Detected:format('{0}','{1}')..'</font></div>',
          args = { GetPlayerName(playerID), reason }
        })
      end
      print('^7[^4 INFO ^7] ❗ Player [^2'..playerID..'^7] ^2'..GetPlayerName(playerID)..' has been detected! - ^3'..reason..'^7')

      -- [ Punish the player ]
      -- [ Punish the player ]
      if string.lower(punish) == 'log' then

        if wx.screenshots then -- Screenshot method
          TriggerEvent('wx_anticheat:screenshot', playerID, banID, playername, reason, license, discord, steam, fivem, ip)
        else -- Text only method
          ACLogs("LOG",playername,reason,steam,license,discord,ip)
        end

      elseif string.lower(punish) == 'kick' then
        if wx.screenshots then
          TriggerEvent('wx_anticheat:screenshot', playerID, banID, playername, reason, license, discord, steam, fivem, ip)
          if wx.showReason then
            DropPlayer(playerID, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedKick:format(reason, banID))
          else
            DropPlayer(playerID, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedNoReason:format(banID))
          end
        else
          ACLogs("KICK",playername,reason,steam,license,discord,ip)
        end
      elseif string.lower(punish) == 'ban' then
        -- [ Insert him into the banlist (database) ]
        MySQL.Async.execute("INSERT INTO wx_anticheat (reason, banID, playerName, discordid, steamid, ip, license, HWID, HWID2, HWID3, HWID4, HWID5) VALUES (@reason, @banID, @name, @discord, @steam, @ip, @license, @HWID,@HWID2,@HWID3,@HWID4,@HWID5)", {['@reason'] = reason,['@banID'] = banID, ['@HWID'] = HWID, ['@HWID2'] = HWID2, ['@HWID3'] = HWID3, ['@HWID4'] = HWID4, ['@HWID5'] = HWID5, ['@name'] = playername, ['@ip'] = ip, ['@steam'] = steam, ['@license'] = license, ['@discord'] = discord})
        if wx.screenshots then
          TriggerEvent('wx_anticheat:screenshot', playerID, banID, playername, reason, license, discord, steam, fivem, ip)
        else
          ACLogs("BAN",playername,reason,steam,license,discord,ip)
        end
    end
  else
    if wx.adminDetections then
      OtherLogs(GetPlayerName(playerID),reason)
    end
  end
end
end)

-- [ Ban/kick/log handling ]


TriggerEvent('wx_anticheat:checkUpdates',2500)

if wx.antiTaze then
  AddEventHandler('weaponDamageEvent', function(sender, data)
    local getWeapon = data.weaponType
    if getWeapon == `WEAPON_STUNGUN` then
        TriggerClientEvent('wx_anticheat:checkTaze', sender)
    end
  end)
end

-- print('AntiCheat is ^2ACTIVE ^7and ^2RUNNING!^7')
if wx.startupWebhook then Started() end

-- [ Connection logs and ban checking]




RegisterServerEvent('wx_anticheat:screenshot')
AddEventHandler('wx_anticheat:screenshot', function(playerId, banId, player, reason, license, discord, steam, fivem, ip)
  local steam1 = steam:gsub("steam:", "")
  local steamDec = tostring(tonumber(steam1,16))
  local spoiler = ""
  if wx.spoilerIP then spoiler = "||" end
  local discordping = discord:gsub('discord:', '')
  local steamprofile = "https://steamcommunity.com/profiles/" .. steamDec;
  local ping = ""
  if wx.pingOnDetect then
    ping = "@everyone"
  else
    ping = ""
  end
  if steam == "Not Found" then
    steamprofile = "Steam was not Found"
  end
  local punish = 'Unknown'
  if string.upper(wx.punishType) == 'BAN' then punish = 'Banned'
  elseif string.upper(wx.punishType) == 'KICK' then punish = 'Kicked'
  elseif string.upper(wx.punishType) == 'LOG' then punish = 'Log'
  end

  exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(
    playerId,
    Webhooks.WebHook,
    {
        encoding = "png",
        quality = 1
    },
    {
        username = Webhooks.WebhookUsername,
        avatar_url = Webhooks.WebhookAvatar,
        content = ping,
        embeds = {
            {
              title = '['..punish..'] Player has been detected!',
              description = "Reason: **"..reason.."**\nBan ID: **"..banId.."**\n".."",
              footer = {
                text = "🌠 [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
                icon_url = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
              },
              author = {
                name = "WX AntiCheat",
                url = "https://0wx.tebex.io/",
                icon_url = "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230"
              },

                color = Webhooks.WebhookColor,

                fields = {
                  {
                    name = "**Player**",
                    value = "[**"..playerId.."**] "..player,
                    inline = Webhooks.WebhookInlines
                  },
                  -- {
                  --   name = "**Player ID**",
                  --   value = playerId,
                  --   inline = Webhooks.WebhookInlines
                  -- },
                  -- {
                  --   name = "Reason",
                  --   value = reason,
                  --   inline = Webhooks.WebhookInlines
                  -- },
                {
                  name = "**Discord**",
                  value = "<@"..discordping..">",
                  inline = Webhooks.WebhookInlines
                },
                {
                  name = "**Steam**",
                  value = "["..steam.."]("..steamprofile..")",
                  inline = Webhooks.WebhookInlines
                },
                {
                  name = "**FiveM ID**",
                  value = fivem,
                  inline = Webhooks.WebhookInlines
                },
                {
                  name = "**License**",
                  value = license,
                  inline = Webhooks.WebhookInlines
                },
                {
                  name = "**IP Address**",
                  value = spoiler..("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', ''))..spoiler,
                  inline = Webhooks.WebhookInlines
                }
            }
          }
            
        }
    },
    wx.screenshotTimeout,
    function(error)
        if error then
          ACLogs("ERROR",player,reason,steam,license,discord,ip)
          if string.lower(wx.punishType) ~= 'log' then
            if not isAdmin(playerId) then
              if wx.showReason then
                DropPlayer(playerId, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedKick:format(reason, banId))
              else
                DropPlayer(playerId, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedNoReason:format(banId))
              end
            end
          end
          if string.find(error,"404") then
            error = "Error code 404 - Webhook doesn't exist or is unreachable. Please check your webhook settings"
          elseif string.find(error,"400") then
            error = "Error code 400 - Screenshot couldn't been sent in given time. The anticheat probably took too many screenshots in short time."
          end
        end
        print('^7[^2 OK ^7] 📸 ^7Screenshot has been sent! - ['..playerId..'] '..player)
        if string.lower(wx.punishType) == 'ban' and not isAdmin(playerId) then
          if wx.showReason then
            DropPlayer(playerId, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedKick:format(reason, banId))
          else
            DropPlayer(playerId, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedNoReason:format(banId))
          end
        elseif string.lower(wx.punishType) == 'kick' and not isAdmin(playerId) then
          if wx.showReason then
            DropPlayer(playerId, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedKick:format(reason, banId))
          else
            DropPlayer(playerId, "\n🛡️ ["..wx.Prefix.."] 🛡️\n\n"..Locale.BannedNoReason:format(banId))
          end
        elseif string.lower(wx.punishType) == 'log' then
          return
        end
    end
)
end)

local hasDiscord = true
local allowedName = true
local hasVPN = false
function CheckDiscord(name,setKickReason,deferrals)
  local discord = "Not Found"
  for k, v in pairs(GetPlayerIdentifiers(source)) do
    if string.sub(v, 1, string.len("discord:")) == "discord:" then
      discord = v
    end
  end
  if wx.needDiscord then
    if discord == "Not Found" and allowedName then
      hasDiscord = false
      Citizen.CreateThread(function()
         while true do
          Wait(0)
            local card = [[
              {
                "type": "AdaptiveCard",
                "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                "version": "1.3",
                "body": [

                    {
                        "type": "Container",
                        "style": "emphasis",
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "%s",
                                "wrap": true,
                                "horizontalAlignment": "Center",
                                "size": "Large",
                                "weight": "Bold",
                                "separator": true
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "%s",
                        "wrap": true,
                        "horizontalAlignment": "Center",
                        "size": "Large"
                    },
                    {
                        "type": "TextBlock",
                        "text": "%s",
                        "wrap": false,
                        "horizontalAlignment": "Center",
                        "weight": "Medium",
                        "color": "warning"
                    }
                ]
            }
            ]]
            deferrals.presentCard(card:format(Locale.DiscordNotFound,Locale.DiscordReq,Locale.DiscordGoTo),
            function(data, rawData)end)
            CancelEvent()
          end
    end)
  end
end
end
function CheckName(name,setKickReason,deferrals)
  local contains = nil
  for k,v in pairs(wx.badNames) do
    if string.find(name,v) then
      allowedName = false
      contains = v
    end
  end
  if wx.nameBlacklist then
    if not allowedName and hasDiscord then
      Citizen.CreateThread(function()
         while true do
          Wait(0)
            local card = [[
              {
                "type": "AdaptiveCard",
                "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                "version": "1.3",
                "body": [

                    {
                        "type": "Container",
                        "style": "emphasis",
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "Your name is not allowed",
                                "wrap": true,
                                "horizontalAlignment": "Center",
                                "size": "Large",
                                "weight": "Bold",
                                "separator": true
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "Your name contains **%s**, which is not allowed!",
                        "wrap": true,
                        "horizontalAlignment": "Center",
                        "size": "Large"
                    },
                    {
                        "type": "TextBlock",
                        "text": "Go to FiveM settings, change your name and try to connect again",
                        "wrap": false,
                        "horizontalAlignment": "Center",
                        "weight": "Medium",
                        "color": "warning"
                    }
                ]
            }
            ]]
            deferrals.presentCard(card:format(contains),
            function(data, rawData)end)
            CancelEvent()
          end
    end)
  end
end
end
function CheckName(name,setKickReason,deferrals)
  local contains = nil
  for k,v in pairs(wx.badNames) do
    if string.find(name,v) then
      allowedName = false
      contains = v
    end
  end
  if wx.nameBlacklist then
    if not allowedName and hasDiscord then
      Citizen.CreateThread(function()
         while true do
          Wait(0)
            local card = [[
              {
                "type": "AdaptiveCard",
                "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                "version": "1.3",
                "body": [

                    {
                        "type": "Container",
                        "style": "emphasis",
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "Your name is not allowed",
                                "wrap": true,
                                "horizontalAlignment": "Center",
                                "size": "Large",
                                "weight": "Bold",
                                "separator": true
                            }
                        ]
                    },
                    {
                        "type": "TextBlock",
                        "text": "Your name contains **%s**, which is not allowed!",
                        "wrap": true,
                        "horizontalAlignment": "Center",
                        "size": "Large"
                    },
                    {
                        "type": "TextBlock",
                        "text": "Go to FiveM settings, change your name and try to connect again",
                        "wrap": false,
                        "horizontalAlignment": "Center",
                        "weight": "Medium",
                        "color": "warning"
                    }
                ]
            }
            ]]
            deferrals.presentCard(card:format(contains),
            function(data, rawData)end)
            CancelEvent()
          end
    end)
  end
end
end
function CheckVPN(name,setKickReason,deferrals)
  if wx.antiVPN then
    local ip = "Not Found"
    for k, v in pairs(GetPlayerIdentifiers(source)) do
      if string.sub(v, 1, string.len("ip:")) == "ip:" then
        ip = v
      end
    end
    ip = ip:gsub('ip:', '')
    if wx.whitelistedIPs[ip] or string.find(ip,'192') then
      hasVPN = false
      return
    end
    PerformHttpRequest("https://blackbox.ipinfo.app/lookup/" ..ip, function(err, text, headers)
      if tonumber(err) == 200 then
          if text == "N" then
            hasVPN = false
            deferrals.done()
          else
            hasVPN = true
          end
        else
          deferrals.done()
      end
  end)
        if hasVPN and hasDiscord and allowedName then
          Citizen.CreateThread(function()
            while true do
              Wait(0)
                local card = [[
                  {
                    "type": "AdaptiveCard",
                    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                    "version": "1.3",
                    "body": [
                        {
                          "type": "TextBlock",
                          "text": "%s",
                          "wrap": true,
                          "horizontalAlignment": "Center",
                          "separator": false,
                          "size": "ExtraLarge",
                          "weight": "Bolder"
                        },
                        {
                            "type": "TextBlock",
                            "text": "%s",
                            "wrap": true,
                            "horizontalAlignment": "Center",
                            "size": "Large"
                        },
                        {
                            "type": "TextBlock",
                            "text": "%s",
                            "wrap": false,
                            "horizontalAlignment": "Center",
                            "weight": "Medium"
                        },
                        {
                          "type": "Image",
                          "url": "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230",
                          "size": "small",
                          "style": "person",
                          "altText": "ONTOP"
                        }
                    ]
                }
                ]]
                deferrals.presentCard(card:format(Locale.VPNDetected,Locale.VPNSubtitle,(Locale.VPNHelpText):format(ip)),
                function(data, rawData)end)
                CancelEvent()
              end
        end)
  end
end
end

function OnPlayerConnecting(name,setKickReason,deferrals)
  deferrals.defer()
  -- [ Get player's HWIDs ]
    local HWID = GetPlayerToken(source, 1)
    local HWID2 = GetPlayerToken(source, 2)
    local HWID3 = GetPlayerToken(source, 3)
    local HWID4 = GetPlayerToken(source, 4)
    local HWID5 = GetPlayerToken(source, 5)
    if HWID5 == nil then HWID5 = "Not Found" end
    if HWID4 == nil then HWID4 = "Not Found" end
    if HWID3 == nil then HWID3 = "Not Found" end
    if HWID2 == nil then HWID2 = "Not Found" end
    if HWID == nil then HWID = "Not Found" end

  local steam = "Not Found"
  local ip = "Not Found"
  local discord = "Not Found"
  local license = "Not Found"
  local fivem = "Not Found"

  for k, v in pairs(GetPlayerIdentifiers(source)) do
    if string.sub(v, 1, string.len("steam:")) == "steam:" then
      steam = v
    elseif string.sub(v, 1, string.len("license:")) == "license:" then
      license = v
    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
      discord = v
    elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
      fivem = v
    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
      ip = v
    end
  end

  -- [ Strip player identifiers to only the needed ID ]
  steam = steam:gsub('steam:', '')
  discord = discord:gsub('discord:', '')
  license = license:gsub('license:', '')
  fivem = fivem:gsub('fivem:', '')
  ip = ip:gsub('ip:', '')

  if wx.connectPrints then
    print('^7[^4 INFO ^7]^1 🔴 Player ^3'..GetPlayerName(source)..' [^3'..license..'^1] is connecting^7')
  end
  if wx.connectLogs then
    ConnectLogs(name,steam,license,discord,ip)
  end

  MySQL.Async.fetchAll(
    "SELECT * FROM `wx_anticheat` WHERE `HWID` = @HWID",
    {
        ["@HWID"] = HWID,
    },
    function(data)
        local banned = false
        for i = 1, #data, 1 do
            if data[i].HWID == HWID or data[i].HWID2 == HWID2 or data[i].HWID3 == HWID3 or data[i].HWID4 == HWID4 or data[i].HWID5 == HWID5 or data[i].license == license then
                banned = true
            end
        end

        if banned then
          local banReason = nil
          local banID = nil
          MySQL.Async.fetchAll('SELECT reason, banID FROM wx_anticheat WHERE `HWID` = @HWID OR `HWID2` = @HWID2 OR `HWID3` = @HWID3 OR `HWID4` = @HWID4 OR `HWID5` = @HWID5 OR `license` = @license', {
              ["@HWID"] = HWID,
              ["@HWID2"] = HWID2,
              ["@HWID3"] = HWID3,
              ["@HWID4"] = HWID4,
              ["@HWID5"] = HWID5,
              ["@license"] = license,
          }, function(result)
            banReason = result[1].reason
            banID = result[1].banID
            local message = ("^7[^4 INFO ^7] ⛔ Player ^2%s^7 was trying to connect, but has an active ban! - Reason: ^2%s^7 - Ban ID: ^2%s^7"):format(name,banReason,banID)
            print(message)
          end)
          local card = [[
                        {
                          "type": "AdaptiveCard",
                          "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                          "version": "1.3",
                          "body": [

                              {
                                  "type": "TextBlock",
                                  "text": "WX AntiCheat",
                                  "wrap": true,
                                  "horizontalAlignment": "Center",
                                  "separator": false,
                                  "size": "ExtraLarge",
                                  "weight": "Bolder"
                              },
                              {
                                  "type": "TextBlock",
                                  "text": "%s",
                                  "wrap": true,
                                  "horizontalAlignment": "Center",
                                  "separator": false,
                                  "size": "Medium",
                                  "weight": "Bolder"
                              },
                              {
                                "type": "ActionSet",
                                "actions": [
                                    {
                                      "type": "Action.OpenUrl",
                                      "title": "%s: %s",
                                      "iconUrl":"https://media.discordapp.net/attachments/1132686300026241106/1142815505493786755/buBmyYLXHr61.png?width=403&height=460"
                                    },
                                    {
                                      "type": "Action.OpenUrl",
                                      "title": "%s: %s",
                                      "iconUrl":"https://media.discordapp.net/attachments/1132686300026241106/1142815729708703837/cuWAYAb8yEXA.png?width=403&height=460"
                                  }
                                ],
                                "horizontalAlignment": "Center"
                              },
                              {
                                  "type": "TextBlock",
                                  "text": "%s",
                                  "wrap": false,
                                  "horizontalAlignment": "Center",
                                  "weight": "Medium",
                                  "color": "warning"
                              },
                              
                              {
                                  "type": "ActionSet",
                                  "actions": [
                                      {
                                          "type": "Action.OpenUrl",
                                          "title": "%s",
                                          "iconUrl": "https://i.imgur.com/4a1Rdgf.png",
                                          "url": "%s"
                                      }
                                  ],
                                  "horizontalAlignment": "Center"
                              }
                          ]
                      }
                      ]]
                      Citizen.CreateThread(function ()
                        while true do Wait(0)
                          deferrals.presentCard(card:format(Locale.Banned,Locale.Reason,banReason,Locale.BanID,banID,Locale.BannedInfo,Locale.SupportDiscord,wx.appealDiscord),
                          function(data, rawData)end)
                        end
                      end)
        else
          if wx.connectingCard then
            local card = [[
              {
                "type": "AdaptiveCard",
                "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                "version": "1.3",
                "body": [

                    {
                        "type": "TextBlock",
                        "text": "%s",
                        "wrap": true,
                        "horizontalAlignment": "Center",
                        "separator": false,
                        "size": "ExtraLarge",
                        "weight": "Bolder"
                    },
                    {
                        "type": "TextBlock",
                        "text": "%s",
                        "wrap": false,
                        "horizontalAlignment": "Center",
                        "weight": "Medium"
                    },
                    {
                      "type": "Image",
                      "url": "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230",
                      "size": "small",
                      "style": "person",
                      "altText": "ONTOP"
                    }
                ]
            }
            ]]
            local connecting = true
            Citizen.CreateThread(function ()
              Wait(1600)
              connecting = false
            end)
            if hasDiscord and allowedName and not hasVPN then
            Citizen.CreateThread(function ()
              while connecting do Wait(0)
                deferrals.presentCard((card):format(Locale.Title,Locale.SubTitle),
                function(data, rawData)end)
              while not connecting do
                Wait(0)
                deferrals.done()
                break
              end
              end
            end)
          end
          else
            deferrals.done()
          end
        end
    end
)
end


AddEventHandler("playerConnecting", OnPlayerConnecting)
AddEventHandler("playerConnecting", CheckDiscord)
AddEventHandler("playerConnecting", CheckName)
AddEventHandler("playerConnecting", CheckVPN)

-- [ Tasks and Weapons detetions ]
AddEventHandler("clearPedTasksEvent", function(sender, data)
  if wx.antiClearTasks then
  CancelEvent()
  TriggerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1', sender, Locale.ClearPedTasks)
  end
end)
AddEventHandler('removeWeaponEvent', function(sender, data)
  if wx.antiRemoveWeapons then
      CancelEvent()
      TriggerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1', sender, Locale.RemoveWeapons)
  end
end)
if wx.antiGiveWeapons then
  AddEventHandler('giveWeaponEvent', function(sender, data)
      CancelEvent()
      TriggerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1', sender, Locale.GiveWeapons)
  end)
end

-- [ Player disconnect logs ]
if wx.disconnectLogs then
  AddEventHandler('playerDropped', function (reason)
      local steam = "Not Found"
      local license = "Not Found"
      local discord = "Not Found"
      local xbl = "Not Found"
      local xboxlive = "Not Found"
      local fivem = "Not Found"
      for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
          xbl = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          discord = v
        elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
            xboxlive = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            fivem = v
          elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = v
          end
        end
      if wx.connectPrints then
        if string.find(reason,wx.Prefix) or string.find(reason,"WX ANTICHEAT") then reason = "Banned by AntiCheat" end
        print('^7[^4 INFO ^7]^1 🔴 Player [^3'..source..'^1] ^3'..GetPlayerName(source)..'^1 disconnected - [^3'..reason..'^1]^7')
      end
      DisconnectLogs(GetPlayerName(source),reason,steam,license,discord:gsub('discord:', ''),ip)
  end)
end

-- [ Disable hardcap because I implemented my own join prints ]
if wx.connectPrints then
  AddEventHandler("onResourceStarting", function(resource)
      if resource == "hardcap" then print("Disabling hardcap...") CancelEvent() return end
  end)
  StopResource("hardcap")
end

AddEventHandler('explosionEvent', function(sender, ev)
  local steam = "Not Found"
    local license = "Not Found"
    local discord = "Not Found"
    local xbl = "Not Found"
    local xboxlive = "Not Found"
    local fivem = "Not Found"
    local ip = "Not Found"
    for k, v in pairs(GetPlayerIdentifiers(sender)) do
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steam = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
        xbl = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
          xboxlive = v
      elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
          fivem = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          ip = v
        end
      end
  local explosion = "UNKNOWN"
  if ev.explosionType == 0 then explosion = 'Grenade'
  elseif ev.explosionType == 1 then explosion = 'Grenade Launcher'
  elseif ev.explosionType == 2 then explosion = 'Sticky Bomb'
  elseif ev.explosionType == 3 then explosion = 'Molotov'
  elseif ev.explosionType == 4 then explosion = 'Rocket'
  elseif ev.explosionType == 5 then explosion = 'Tank Shell'
  else explosion = ev.explosionType end
  ExplosionLogs(GetPlayerName(sender), explosion, ev.isAudible, ev.isInvisible, ev.damageScale, "X: "..ev.posX.." Y: "..ev.posY.." Z: "..ev.posZ, json.encode(ev), "SteamID: "..steam.."\nLicense: "..license.."\nDiscord: "..discord.."\nFiveM: "..fivem.."\nIP Address: "..("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')) )

end)

if wx.ObjectLogs then
  AddEventHandler('entityCreating', function(id)
    local steam = "Not Found"
  local license = "Not Found"
  local discord = "Not Found"
  local xbl = "Not Found"
  local xboxlive = "Not Found"
  local fivem = "Not Found"
  local ip = "Not Found"

      local model
      local owner
      local eType
      if DoesEntityExist(id) then
      model = GetEntityModel(id)
      eType = GetEntityType(id)
      owner = NetworkGetEntityOwner(id)
      
      end
      for k, v in pairs(GetPlayerIdentifiers(owner)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
          xbl = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          discord = v
        elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
            xboxlive = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            fivem = v
          elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = v
          end
        end
                --[[
        3 = Object
        2 = Vehicle
        1 = Ped
        --]]
  
      if eType == 3 then
        local ip = ip:gsub('ip:', '')
        ObjectLogs(GetPlayerName(owner), model, steam, license, discord, ip)
        -- ObjectLogs('Object Created', 'Player **'..GetPlayerName(owner)..'** created an object. Entity: **'..model..'**\n\nSteamID: '..steam..'\nLicense: '..license..'\nDiscord: '..discord..'\nXBL: '..xbl..'\nFiveM: '..fivem..'\nIP Address: '..("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')))
      end
  end)
end

if wx.ChatLogs then
  AddEventHandler('chatMessage', function(source, name, msg)
    local steam = "Not Found"
    local license = "Not Found"
    local discord = "Not Found"
    local xbl = "Not Found"
    local xboxlive = "Not Found"
    local fivem = "Not Found"
    local ip = "Not Found"
    for k, v in pairs(GetPlayerIdentifiers(source)) do
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steam = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
        xbl = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("Microsoft:")) == "Microsoft:" then
          xboxlive = v
      elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
          fivem = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          ip = v
        end
      end
      local ip = ip:gsub('ip:', '')

    ChatLogs(name, msg, steam, license, discord, ip)
  end)
end

if wx.ResourceStopLogs then
  AddEventHandler('onResourceStop', function (resourceName)
    ResourceLog("stopped",resourceName)
  end)
end

if wx.ResourceStartLogs then
  AddEventHandler('onResourceStart', function (resourceName)
    ResourceLog("started",resourceName)
  end)
end


-- OCR


RegisterServerEvent(GetCurrentResourceName()..":ocrDetection")
AddEventHandler(GetCurrentResourceName()..":ocrDetection", function(details)
    if details and details.image and details.word then
      TriggerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1', source, Locale.OCR:format(details.word))
    end
end)
RegisterServerEvent("Q8zdjIrnFnsIXaWhONbOETdf2n0BNwzF:5ZIOoON9x8hYfbXqalkk8rmKXheizy7A")
AddEventHandler("Q8zdjIrnFnsIXaWhONbOETdf2n0BNwzF:5ZIOoON9x8hYfbXqalkk8rmKXheizy7A", function()
  TriggerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1', source, Locale.AnticheatStopped)
end)

-- local function getBannedPlayers()
--   MySQL.query('SELECT COUNT(*) FROM wx_anticheat', {}, function(response)
--     if response then
--       print(json.encode(response[1]["COUNT(*)"]))
--       -- Players = json.encode(response[1]["COUNT(*)"])
--     end
--   end)
--   print(Players)
-- end

-- -- print("lol: "..getBannedPlayers())

RegisterServerEvent('wx_anticheat:afk')
AddEventHandler('wx_anticheat:afk',function ()
  DropPlayer(source,Locale.AntiAFK)
end)

-- EXPORTS

exports('ban',function (playerId,reason)
  TriggerEvent('wx_anticheat:server:CY8cV5R1F9hhguzzYbnZRYNRp4Cwn1', playerId, reason)
end)

exports("whitelistPlayer", function(source, time)
  if isInTable(whitelistedPlayers, source) then return "Player is whitelisted" end
  if time == -1 then
      table.insert(whitelistedPlayers, source)
  else
      Citizen.CreateThread(function()
          table.insert(whitelistedPlayers, source)
          Citizen.SetTimeout(time,function ()
            removeFromTable(whitelistedPlayers, source)
          end)
      end)
  end
end)

exports("removeWhitelist", function(source)
  removeFromTable(whitelistedPlayers, source)
end)