fx_version 'cerulean'
game 'gta5'

description 'containers'
version '1.0.0'


shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'config/containers.lua',
}

client_scripts {
	'client/main.lua',
	'client/containers.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	'server/containers.lua',
}

lua54 'yes'server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }