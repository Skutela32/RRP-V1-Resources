-- ReaperAC | Do not touch this
shared_script "@ReaperAC/reaper-nwds22ojonydaz91p2dg.lua"

fx_version 'adamant'

game 'gta5'

author 'okok' -- Discord: okok#3488
description 'okokNotify'
version '1.0'

ui_page 'html/ui.html'

client_scripts {
	'client.lua',
}

files {
	'html/*.*'
}

export 'Alert'
client_script "@Badger-Anticheat/acloader.lua"