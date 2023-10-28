fx_version 'bodacious'
game 'gta5'

description 'TebIT - Utilities'
version '1.0.0'

lua54 'yes'
versioning 'no'

files {
  'modules.json',

  'init.lua',

  'lib_modules/**',
  'shared_modules/**',
}

escrow_ignore {
  'lib_modules/*/**.lua',
  'shared_modules/*/**.lua'
}
dependency '/assetpacks'