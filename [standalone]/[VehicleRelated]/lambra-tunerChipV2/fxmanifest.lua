fx_version 'cerulean'
game 'gta5'
version '1.0.1'

shared_scripts {
    'config.lua'
}

client_script 'client/sound.lua'
client_script 'client/main.lua'

server_script '@oxmysql/lib/MySQL.lua'
server_script 'server/sound.lua'
server_script 'server/main.lua'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/*.ogg',
    'html/script.js'
}

escrow_ignore {
    'config.lua',
}
dependency '/assetpacks'