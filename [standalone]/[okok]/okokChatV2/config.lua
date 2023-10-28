Config = {}

--------------------------------
-- [Discord Logs]

Config.EnableDiscordLogs = false

Config.IconURL = ""

Config.ServerName = ""

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.WebhookColor = "16741888"

--------------------------------
-- [Staff Groups]

Config.StaffGroups = { -- Groups that can access the different staff chats (/staff, /staffo, /sa)
	'god',
	'superadmin',
	'admin',
	'mod'
}

--------------------------------
-- [General]

Config.AllowPlayersToClearTheirChat = true

Config.ClearChatCommand = 'clear'

Config.EnableHideChat = false

Config.HideChatCommand = 'hide'

Config.ShowIDOnMessage = false -- Shows the player ID on every message that is sent

Config.ShowIDOnMessageForEveryone = false -- true: shows the player ID for everyone | false: shows it only for staffs

Config.ClearChatMessageTitle = 'SYSTEM'

Config.ClearChatMessage = 'The chat has been cleared!'

-- [Date Format]

Config.DateFormat = '%H:%M' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

--------------------------------
-- [Time Out]

Config.TimeOutPlayers = false

Config.TimeOutCommand = "mute"

Config.RemoveTimeOutCommand = "unmute"

Config.ShowTimeOutMessageForEveryone = false

Config.TimeOutIcon = 'fas fa-gavel'

Config.MessageTitle = 'SERVER'

Config.TimeOutMessages = {
	['muted_for'] = '<b>{3}</b> has been muted for <b>{1}</b> minutes',
	['you_muted_for'] = 'You muted <b>{3}</b> for <b>{1}</b> minutes',
	['been_muted_for'] = 'You have been muted for <b>{0}</b> minutes',

	['you_unmuted'] = 'You unmuted <b>{2}</b>',
	['been_unmuted'] = 'You have been unmuted',

	['muted_message'] = 'You are muted for <b>{0}</b>',
	['seconds'] = ' seconds',
	['minutes'] = ' minutes',
	['hours'] = ' hours',
}

--------------------------------
-- [Me/Do/Try]

Config.Distance = 150

Config.Duration = 5000 -- Text duration (in ms)

Config.TextFont = 0 -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors#DrawText_Fonts

Config.TextScale = 0.5

--------------------------------
-- [Me]

Config.EnableMe = false

Config.MeCommand = 'me'

Config.MeTextColor = { r = 100, g = 100, b = 230, a = 255 }

--------------------------------
-- [Do]

Config.EnableDo = false

Config.DoCommand = 'do'

Config.DoTextColor = { r = 100, g = 230, b = 100, a = 255 }

--------------------------------
-- [Try]

Config.EnableTry = false

Config.TryCommand = 'try'

Config.TryTextColor = { r = 230, g = 100, b = 100, a = 255 }

--------------------------------
-- [Job]

Config.JobChat = false

Config.JobCommand = 'jobc'

Config.JobIcon = 'fas fa-briefcase'

--------------------------------
-- [Private Message]

Config.EnablePM = false

Config.PMCommand = 'pm'

Config.PMIcon = 'fas fa-comment'

Config.PMMessageTitle = "PM"

--------------------------------
-- [OOC]

Config.EnableOOC = false

Config.OOCCommand = 'ooc'

Config.OOCDistance = 20.0

Config.OOCIcon = 'fas fa-door-open'

Config.OOCMessageTitle = 'OOC'

Config.OOCMessageWithoutCommand = false -- true: sends OOC message without command (/ooc) | false: doesn't send any message without it being a command

--------------------------------
-- [Staff]

Config.EnableStaffCommand = false

Config.StaffCommand = 'staff'

Config.StaffMessageTitle = 'STAFF'

Config.StaffIcon = 'fas fa-shield-alt'

Config.AllowStaffsToClearEveryonesChat = true

Config.ClearEveryonesChatCommand = 'clearall'

Config.StaffSteamName = true

Config.ShowStaffMessageWhenHidden = true

-- [Staff Only]

Config.EnableStaffOnlyCommand = false

Config.StaffOnlyCommand = 'staffo'

Config.StaffOnlyMessageTitle = 'STAFF ONLY'

Config.StaffOnlyIcon = 'fas fa-eye-slash'

Config.StaffOnlySteamName = true

-- [Server Announcement]

Config.EnableServerAnnouncement = false

Config.ServerAnnouncementCommand = 'sa'

Config.AnnouncementIcon = 'fas fa-exclamation-circle'

Config.AnnouncementMessageTitle = 'SERVER'

--------------------------------
-- [Advertisements]

Config.EnableAdvertisementCommand = false

Config.AdvertisementCommand = 'ad'

Config.AdvertisementPrice = 10000

Config.AdvertisementCooldown = 5 -- in minutes

Config.AdvertisementIcon = 'fas fa-ad'

--------------------------------
-- [Anonymous/Dark]

Config.EnableAnonymousCommand = false

Config.AnonymousCommand = 'anon'

Config.AnonymousPrice = 1000

Config.AnonymousCooldown = 5 -- in minutes

Config.WhatJobsCantSeeAnonymousChat = {
	'police',
	'ambulance',
}

Config.AnonymousIcon = 'fas fa-mask'

--------------------------------
-- [Twitch]

Config.EnableTwitchCommand = false

Config.TwitchCommand = 'twitch'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.TwitchList = {
	'steam:110000118a12j8a', -- Example, change this
}

Config.TwitchIcon = 'fab fa-twitch'

--------------------------------
-- [Youtube]

Config.EnableYoutubeCommand = false

Config.YoutubeCommand = 'youtube'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.YoutubeList = {
	'steam:110000118a12j8a', -- Example, change this
}

Config.YoutubeIcon = 'fab fa-youtube'

--------------------------------
-- [Twitter]

Config.EnableTwitterCommand = false

Config.TwitterCommand = 'twitter'

Config.TwitterIcon = 'fab fa-twitter'

--------------------------------
-- [Police]

Config.EnablePoliceCommand = false

Config.PoliceCommand = 'police'

Config.PoliceJobName = 'police'

Config.PoliceIcon = 'fas fa-bullhorn'

--------------------------------
-- [Ambulance]

Config.EnableAmbulanceCommand = false

Config.AmbulanceCommand = 'ambulance'

Config.AmbulanceJobName = 'ambulance'

Config.AmbulanceIcon = 'fas fa-ambulance'

--------------------------------
-- [Auto Message]

Config.EnableAutoMessage = false

Config.AutoMessageTime = 60 -- (in minutes) will send messages every x minutes 

Config.AutoMessages = {
	"Don't Forget To Join The Discord",
	"https://discord.gg/MZCjNNFNDv",
}

--------------------------------
-- [Notifications]

Config.NotificationsText = {
	['disable_chat'] = { title = 'SYSTEM', message = 'You disabled the chat', time = 5000, type = 'info'},
	['enable_chat'] = { title = 'SYSTEM', message = 'You enabled the chat', time = 5000, type = 'info'},
	['ad_success'] = { title = 'ADVERTISEMENT', message = 'Advertisement successfully made for ${price}€', time = 5000, type = 'success'},
	['ad_no_money'] = { title = 'ADVERTISEMENT', message = "You don't have enough money to make an advertisement", time = 5000, type = 'error'},
	['ad_too_quick'] = { title = 'ADVERTISEMENT', message = "You can't advertise so quickly", time = 5000, type = 'info'},
	['mute_not_adm'] = { title = 'SYSTEM', message = 'You are not an admin', time = 5000, type = 'error'},
	['mute_id_inv'] = { title = 'SYSTEM', message = 'The id is invalid', time = 5000, type = 'error'},
	['mute_time_inv'] = { title = 'SYSTEM', message = 'The mute time is invalid', time = 5000, type = 'error'},
	['alr_muted'] = { title = 'SYSTEM', message = 'This person is already muted', time = 5000, type = 'error'},
	['alr_unmuted'] = { title = 'SYSTEM', message = 'This person is already unmuted', time = 5000, type = 'error'},
	['an_success'] = { title = 'ANONYMOUS', message = 'Advertisement successfully made for price€', time = 5000, type = 'success'},
	['an_no_money'] = { title = 'ANONYMOUS', message = "You don't have enough money to make an advertisement", time = 5000, type = 'error'},
	['an_too_quick'] = { title = 'ANONYMOUS', message = "You can't advertise so quickly", time = 5000, type = 'error'},
	['an_not_allowed'] = { title = 'ANONYMOUS', message = "You are not allowed to send messages in the anonymous chat", time = 5000, type = 'error'},
	['is_muted'] = { title = 'ANONYMOUS', message = "This player is muted", time = 5000, type = 'error'},
}

Config.WebhookText = {
	['clear_all'] = 'Cleared all chats',
	['staff_msg'] = 'Staff message',
	['staff_chat_msg'] = 'Staff chat message',
	['sv_an'] = 'Server announcement',
	['ad'] = 'Advertisement',
	['twitch'] = 'Twitch',
	['youtube'] = 'Youtube',
	['twitter'] = 'Twitter',
	['police'] = 'Police',
	['ambulance'] = 'Ambulance',
	['job_chat'] = 'Job chat [${job}]',
	['pm_chat'] = 'Private Message to ${name} [${id}]',
	['ooc'] = 'OOC',
	['muted'] = 'Muted [${id}]',
	['muted_for'] = 'For ${muteTime} minutes',
	['unmuted'] = 'Unmuted [${id}]',
	['p_unmuted'] = 'Player has been unmuted',
	['anon'] = 'Anonymous',
}