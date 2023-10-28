-- DO NOT TOUCH THE MANIFEST UNLESS YOU HAVE A REASON SPECIFIED BELOW
-- (please)

fx_version 'cerulean'
game 'gta5'
description 'Advanced, standalone AntiCheat for your FiveM server'
author 'wx / woox'
version '3.7'
lua54 'yes'

client_scripts {
	'client/anticheat_client.lua',
	'client/anticheat_antiafk.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'configs/anticheat_webhooks.lua',
	'server/anticheat_updatecheck.lua',
	'server/anticheat_server.lua',
	'admins/*.lua'
}

shared_scripts {
	'locale/anticheat_locale.lua',
	'configs/anticheat_config.lua',
	'ocr/anticheat_ocr.lua',
}

escrow_ignore {
    'configs/*.lua',
	'locale/*.lua',
	'SQL/*.sql',
}

server_exports {
	'ban',
	'whitelistPlayer',
	'removeWhitelist'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/index.js',
}

wx = "justbetter"