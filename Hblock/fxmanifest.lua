fx_version 'adamant'
game 'gta5'


client_scripts {
    "src2/RMenu.lua",
    "src2/menu/RageUI.lua",
    "src2/menu/Menu.lua",
    "src2/menu/MenuController.lua",
    "src2/components/*.lua",
    "src2/menu/elements/*.lua",
    "src2/menu/items/*.lua",
    "src2/menu/panels/*.lua",
    "src2/menu/panels/*.lua",
    "src2/menu/windows/*.lua"
}

client_scripts {

    -- Hblock
    'Hblock/client/*.lua',

    -- Families
    'families/client/*.lua',

    -- Vagos
    'vagos/client/*.lua',

    -- Crips
    'crips/client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',

    -- Hblock
    'Hblock/server/*.lua',

    -- Families
    'families/server/*.lua', 

    -- Vagos
    'vagos/server/*.lua',     

    -- Crips
    'crips/server/*.lua'    
}

shared_scripts {
    'config.lua'
}
