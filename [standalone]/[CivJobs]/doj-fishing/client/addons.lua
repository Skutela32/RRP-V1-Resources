
local QBCore = exports['qb-core']:GetCoreObject()

--============================================================== Sell/Gear Menus

RegisterNetEvent('doj:client:SellLegalFish')
AddEventHandler('doj:client:SellLegalFish', function()
    exports['qb-menu']:openMenu({
		{
            header = "Pearl's Seafood Restaurant",
            isMenuHeader = true
        },
        {
            header = "Sell Mackerel",
            txt = "Current Price: $"..Config.mackerelPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 1
            }
        },
        {
            header = "Sell Codfish",
            txt = "Current Price: $"..Config.codfishPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 2
            }
        },
		{
            header = "Sell Bass",
            txt = "Current Price: $"..Config.bassPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 3 
            }
        },
        {
            header = "Sell Flounder",
            txt = "Current Price: $"..Config.flounderPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 4
            }
        },
		{
            header = "Sell Stingray",
            txt = "Current Price: $"..Config.stingrayPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 5
            }
        },		
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:SellillegalFish')
AddEventHandler('doj:client:SellillegalFish', function() 
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			local charinfo = QBCore.Functions.GetPlayerData().charinfo
			QBCore.Functions.Notify('Welcome, '..charinfo.firstname..' '..charinfo.lastname)
			exports['qb-menu']:openMenu({
				{
					header = "Pearl's Seafood Restaurant",
					isMenuHeader = true
				},
				{
					header = "Sell Dolphin",
					txt = "Current Price: $"..Config.dolphinPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 1
					}
				},
				{
					header = "Sell Tiger Shark",
					txt = "Current Price: $"..Config.sharktigerPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 2
					}
				},
				{
					header = "Sell Hammerhead Shark",
					txt = "Current Price: $"..Config.sharkhammerPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 3
					}
				},
				{
					header = "Sell Orca",
					txt = "Current Price: $"..Config.killerwhalePrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 4
					}
				},
				{
					header = "Close",
					txt = "",
					params = {
						event = "qb-menu:closeMenu"
					}
				},
			})
		else
			QBCore.Functions.Notify('You cannot sell to us at the moment, sorry for the inconvenience', 'error', 3500)
		end
	end, "pearlscard")
end)
