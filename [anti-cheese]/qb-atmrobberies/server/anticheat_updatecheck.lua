local banner = [[

888       888 Y88b   d88P                         d8888  .d8888b.  
888   o   888  Y88b d88P                         d88888 d88P  Y88b 
888  d8b  888   Y88o88P                         d88P888 888    888 
888 d888b 888    Y888P                         d88P 888 888        
888d88888b888    d888b                        d88P  888 888        
88888P Y88888   d88888b        888888        d88P   888 888    888 
8888P   Y8888  d88P Y88b                    d8888888888 Y88b  d88P 
888P     Y888 d88P   Y88b                  d88P     888  "Y8888P"  
                             🐌 v3.65


]]

RegisterServerEvent('wx_anticheat:checkUpdates')
AddEventHandler('wx_anticheat:checkUpdates',function(wait)
	Citizen.Wait(wait)
	if (GetCurrentResourceName() == 'wx_anticheat') then
		print('^'..math.random(0,9)..banner)
		print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
		print('^7[^3 WARN ^7] You should rename wx_anticheat to something else!')
		print('^7[^3 WARN ^7] This resource is discoverable by cheaters!')
		print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
	else
	  print(banner)
	end
	if Webhooks.WebHook == '' then
	  print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
		print('^7[CONFIG WARNING] You don\'t have your main webhook set up!')
		print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
	end
	if wx.appealDiscord == 'https://discord.gg/yourdiscord' then
	  print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
		print('^7[CONFIG WARNING] You haven\'t set up your appeal discord!')
		print("^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7")
	end
	print('^7[^2 OK ^7] ^7WX AntiCheat has been ^2started^7!')
	print('^7[^2 OK ^7] 👀 ^7Looking for ^3cheaters^7...')
	-- print("^7[^3 WARN ^7] ⛔ ^7You are currently running the ^3BETA^7 version of WX AntiCheat! This version is not intended for production server builds and may cause trouble! However if you want to test the new features early and/or report any bugs, feel free to continue!")
	function GetBannedPlayers()
	  MySQL.query('SELECT COUNT(*) FROM wx_anticheat', {}, function(response)
		if response then
		  -- print(json.encode(response[1]["COUNT(*)"]))
		  print('^7[^4 INFO ^7] ^7Banned cheaters so far: ^3'..json.encode(response[1]["COUNT(*)"])..'^7')
		end
	  end)
	end
	Citizen.CreateThread(
		function()
			print('^7[^4 INFO ^7] Checking for updates...')
			Citizen.Wait(1500)
			local curVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
			PerformHttpRequest('https://raw.githubusercontent.com/nwvh/wx_anticheatUpdate/main/version.json',function(code, res, headers)
				if code == 200 then
				local check = json.decode(res)
				if check.version ~= curVersion then
					print(([[^1
^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7
NEW VERSION ^3%s^7 HAS BEEN RELEASED!
Your Version: %s
What's New?

^3 %s^7

It's recommended to update ^1ASAP^7!
To update, please visit ^2https://keymaster.fivem.net/assets^7
select WX Anticheat and click DOWNLOAD. After the download finishes,
unzip the file. Next, delete the current resource folder where
your anticheat is installed and replace it with the one in the
.zip file. Restart the server and enjoy your new update!
^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^4~^6~^7
^0]]):format(check.version,curVersion,check.changelog))
				else
					print("^7[^4 INFO ^7] You are running the latest version of WX AntiCheat!")
				end
				else
					print("^7[^1 ERROR ^7] Couldn't check for updates!")
				end
			end,'GET')		
	end)
end)