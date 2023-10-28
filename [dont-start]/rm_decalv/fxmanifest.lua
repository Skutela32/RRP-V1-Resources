fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    'shared/cfg.lua',
    'shared/utils.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    -- '@mysql-async/lib/MySQL.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

ui_page 'web/build/index.html'

replace_level_meta 'gta5'

files {
    'gta5.meta',
    'decals.dat',
    'web/build/**/*.*',
}

escrow_ignore {
    'shared/*.lua',
    'server/server.lua',
    'server/framework.lua',
    'stream/*.ytd',
}

dependency '/assetpacks'