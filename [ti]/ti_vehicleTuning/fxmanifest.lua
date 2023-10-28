description 'TebIT - Vehicle Tuning'
version '1.0.0'

fx_version 'bodacious'
game 'gta5'

lua54 'yes'

ui_page 'nui/index.html'
ui_preload 'yes'

util_modules {
  'callbacks',
  'vehicles',
  'players',
  'notifications',
  'streaming',
  'locales',
  'stateBags',
  'inventory',
  'polyZones'
}

shared_scripts {  
  '@ti_utils/init.lua',
  'data/*.lua',
  'config.lua',
  'labels.lua',
}

client_scripts {
  'client/curve.lua',
  'client/engine.lua',
  'client/tune.lua',

  'client/main.lua',
  'client/push.lua',
}

server_scripts {
  'server/main.lua',
}

dependencies {
  'ti_utils'
}

files {
  'nui/index.html',
  'nui/graph.js',
  'nui/tuning.png',
  'nui/*.png',
  'nui/fa.js',
}

escrow_ignore {
  'config.lua',
  'labels.lua',
  'data/*.lua',
}
dependency '/assetpacks'