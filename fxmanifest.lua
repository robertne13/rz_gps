fx_version 'cerulean'
game 'gta5'
description 'RGamez.net - GPS SYS'
version '1.00'

this_is_a_map 'yes'

ui_page {
    'html/index.html',
}

postal_file('new-postals.json')

files {
	'html/index.html',
    'html/app.js',
    'html/style.css',
    'new-postals.json',
}

client_script {
    'config.lua',
    'client.lua'
}

lua54 'yes'