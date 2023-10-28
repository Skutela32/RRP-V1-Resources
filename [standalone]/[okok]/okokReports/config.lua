Config = {}

Config.Debug = false

Config.Framework = 'STANDALONE' -- ESX / QB / STANDALONE

Config.UseNewStaffCheckMethod = false -- **QBCORE and ESX ONLY** true = will check if a player is staff in another way (this could fix problems with /repots command)

Config.QBPermissionsUpdate = false -- **QBCORE ONLY** - set it to true if you have the latest Permissions update

Config.ReportCommand = 'report' -- command for players to create a report

Config.AdminReportCommand = 'reports' -- command for admins to check the reports

Config.NotificationToggleCommand = 'rn' -- command to toggle the notifications

Config.UseSteamNames = false -- Uses the steam names insted of game names

Config.SaveRespondedReports = true -- This will save how many reports the admins complete in the database (for this you need to use the sql file and set your sql script in the fxmanifest.lua)

Config.Database = 'oxmysql' -- mysql-async / oxmysql / ghmattimysql (Used if Config.SaveRespondedReports is set to true)

Config.NoAdminAssistingText = 'None'

Config.TeleportBackAfterConcluding = true

Config.NewReportNotifyType = 'STANDALONE' -- QB or STANDALONE

Config.LatestSendNotifyToAdmin = true

Config.GetAllPlayersForNotify = false

Config.ReportCategoriesTranslation = { -- Translate report categories
    player = "Player Report",
    bug = "BUG",
	question = "Question"
}

Config.AdminGroups = { -- Used for ESX and QB
	'god',
	'superadmin',
	'admin',
	'mod'
}

-- Used to set the admins when using the STANDALONE version
-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.StandaloneStaffIdentifiers = { 
	-- Owners
	'discord:871902966540542002', -- Skutela32
	'discord:802961683039518760', -- Jimmy
	-- Development Managers
	'discord:431418648637210626', -- Pieces
	'discord:358631656908914688', -- Luke
	-- Staff Team
	'discord:696382875129610312', -- Shaneyy the smelly school child.
	'license:afcb60e46caab88d50041f17e21e3bd49c1c0740', -- Mase
	'discord:784115404876283924', -- Troy the waffler / config dev
	-- New Staff Mid October
	'discord:993248886141493319', -- Jayden
	'discord:382569284347363330', -- JJB
	'discord:984116185119477822', -- Jake
}

Config.Notifications = {
	['success_rep'] = {title = 'REPORT', text = 'You successfully created a report', time = 5000, type = 'success'},
	['adm_answered'] = {title = 'REPORT', text = 'An admin answered you', time = 5000, type = 'info'},
	['player_answered'] = {title = 'REPORT', text = '#${id} - ${name}  answered you', time = 5000, type = 'info'},
	['adm_assist'] = {title = 'REPORT', text = 'An admin is assisting you', time = 5000, type = 'info'},
	['rep_concluded'] = {title = 'REPORT', text = 'Your report has been concluded', time = 5000, type = 'success'},
	['rep_canceled'] = {title = 'REPORT', text = 'You have canceled your report', time = 5000, type = 'error'},
	['adm_rep_concluded'] = {title = 'REPORT', text = 'Report #${id} has been concluded', time = 5000, type = 'success'},
	-- ['new_rep'] = {title = 'REPORT', text = 'There is a new report', time = 5000, type = 'info'},
	-- ['rep_not_on'] = {title = 'REPORT', text = 'You have turned report notifications ON!', time = 5000, type = 'success'},
	-- ['rep_not_off'] = {title = 'REPORT', text = 'You have turned report notifications OFF!', time = 5000, type = 'error'},

	['new_rep'] = {title = 'REPORT', text = 'There is a new report! I REPEAT a new report!!', time = 5000, type = 'info'},
	['rep_not_on'] = {title = 'REPORT', text = 'Back On Doing Reports Then I Guess', time = 5000, type = 'success'},
	['rep_not_off'] = {title = 'REPORT', text = 'Hold Up, Your Not Doing Reports Anymore?', time = 5000, type = 'error'},
	
	['rep_not_exist'] = {title = 'REPORT', text = 'This report does not exist!', time = 5000, type = 'error'},
}

Config.CommandSuggestions = {
	['report'] = {text = 'Command to create or check your report'},
	['adm_report'] = {text = 'Command to check opened reports'},
	['adm_notifications'] = {text = 'Command to activate/deactivate new reports notification'},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to webhook.lua, line 1

Config.BotName = 'Logs' -- Write the desired bot name

Config.ServerName = 'RealRoleplayUK' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/1071768239895494776/1141487090056569012/RealRP_Logo.png' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

Config.ReportTitle = 'REPORT'

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.playerReportWebhookColor = '65280'

Config.bugReportWebhookColor = '16711680'

Config.questionReportWebhookColor = '49151'

Config.playerWebhookColor = '255'

Config.adminWebhookColor = '16746240'

Config.WebhookMessages = {
	-- Player
	['player_report'] = {action = 'Opened a report'},
	['bug_report'] = {action = 'Opened a report'},
	['question_report'] = {action = 'Opened a report'},
	['p_cancel_report'] = {action = 'Canceled a report', type = 'Report #${id}'},
	['p_answer_report'] = {action = 'Player answered report', type = 'Report #${id}'},

	-- Admin
	['a_answer_report'] = {action = 'Admin answered report', type = 'Report #${id}'},
	['a_bring_report'] = {action = 'Admin brought the player', type = 'Report #${id}'},
	['a_goto_report'] = {action = 'Admin went to the player', type = 'Report #${id}'},
	['a_closed_report'] = {action = 'Admin closed a report', type = 'Report #${id}'},
}