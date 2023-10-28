name "Jim-ClosedShops"
author "Jimathy"
version "1.8"
description "Closed Shop Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

client_scripts { 'client.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'server.lua', }
shared_scripts { 'config.lua', 'functions.lua', 'locales/*.lua' }
escrow_ignore { 'client.lua', 'config.lua', 'server.lua', 'locales/*.lua' }
dependency '/assetpacks'