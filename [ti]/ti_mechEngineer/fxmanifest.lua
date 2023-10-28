description 'TebIT - Mechanical Engineer'
version '1.0.0'

fx_version 'bodacious'
game 'gta5'

lua54 'yes'

util_modules {
  '*'
}

shared_scripts {
  '@ti_utils/init.lua',
  'labels.lua',
  'config.lua',
  'data/*.lua',
  'shared/*.lua',
}

client_scripts {
  'client/*.lua',
}

server_scripts {
  'server/*.lua',
}

dependencies {
  'ti_utils',
  'ti_vehicleTuning'
}

escrow_ignore {
  'data/*.lua',
  'labels.lua',
  'config.lua',
  'shared/*.lua',
}
dependency '/assetpacks'