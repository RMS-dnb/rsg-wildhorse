fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
lua54 'yes'

author 'Re-edit by RMS_dnb'
author 'Original code by Mr.SMURF'
description 'rsg-wildhorse'

shared_scripts
{
    '@ox_lib/init.lua',
    '@rsg-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts
{
    'client/client.lua'
}

server_scripts
{
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua'
}

dependencies {
    'rsg-core',
    'ox_lib',
}