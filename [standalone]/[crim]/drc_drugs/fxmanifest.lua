fx_version 'cerulean'

game 'gta5'

version '1.0'

lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  'shared/*.lua',
}

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/CircleZone.lua',
  'client/*.lua',
}

server_scripts {
  'server/*.lua',
  '@oxmysql/lib/MySQL.lua',
}

files {
  'locales/*.json'
}
