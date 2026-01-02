fx_version 'cerulean'
game 'gta5'

author 'TonNom'
description 'HUD Faim et Soif - ESX Ready'
version '1.0.0'

-- Dépendances ESX
dependency 'es_extended'
dependency 'esx_status'

-- Scripts clients et serveurs
client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

-- UI
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
