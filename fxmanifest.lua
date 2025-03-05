fx_version 'cerulean'
lua54 'yes'
game 'gta5'

shared_script 'config.lua'

client_scripts {
    '@ox_lib/init.lua',
    'client/client.lua'
}

server_scripts {
    '@ox_lib/init.lua',
    '@es_extended/locale.lua',
    'server/server.lua'
}

dependency 'ox_lib'
dependency 'es_extended'