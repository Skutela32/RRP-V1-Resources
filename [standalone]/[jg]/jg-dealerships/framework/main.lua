QBCore, ESX = nil, nil
Framework = {
  Client = {},
  Server = {}
}

if Config.Framework == "QBCore" then
  QBCore = exports['qb-core']:GetCoreObject()
  Framework.VehiclesTable = "player_vehicles"
  Framework.PlayerId = "citizenid"
  Framework.PlayersTable = "players"
  Framework.PlayersTableId = "citizenid"
elseif Config.Framework == "ESX" then
  ESX = exports["es_extended"]:getSharedObject()
  Framework.VehiclesTable = "owned_vehicles"
  Framework.PlayerId = "owner"
  Framework.PlayersTable = "users"
  Framework.PlayersTableId = "identifier"
else
  error("You need to set the Config.Framework to either \"QBCore\" or \"ESX\"!")
end
