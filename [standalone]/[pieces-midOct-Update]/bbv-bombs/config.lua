Config = {}
Config.Debug = false

QBCore = exports['qb-core']:GetCoreObject()  -- uncomment if you use QBCore
-- ESX = exports["es_extended"]:getSharedObject() -- uncomment if you use ESX


Config.Settings = {
	Framework = 'QB', -- QB/ESX
	Target = "QB", -- OX/QB
	WebHook = "https://discord.com/api/webhooks/1157818153590603927/Mwi5RaUQzyMkMacb8_nD6wzgTLNa86EiM_SGNVksd1FbnGMew0XSqKGPuPkGJeHUSyQ9", -- Discord webhook 
	Prop = "prop_explosive_c4_screen", -- prop model name
	ItemName = "c4_bomb",
	Beeps = true, -- if set to true the bomb will play beeping sound
	PoliceAlert = true,
	Dispatch = 'ps', -- ps-dispatch supported only. if you want to use custom set it to custom and edit function AlertPolice().
}
