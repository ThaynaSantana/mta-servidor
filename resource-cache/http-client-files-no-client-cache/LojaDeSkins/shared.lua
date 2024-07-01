config = {
    money = {false, 'char:money'}, -- {(true para usar elementData e false para usar o dinheiro do jogo), elementDataDoDinheiro}

    shops = {-- {X, Y, Z, {R, G, B, A}, {BlipID (se colocar false n tem blip), BlipName}, Interior, Dimensão, {Ped X, Ped Y, Ped Z, Ped Dimensão, Ped Interior},},
        {1125.5593261719,-1548.4848632812,22.749420166016, {130, 150, 255, 255}, {45, 'Loja de Skins'}, 0, 0, {1093.204, -1493.704, 15.685, 0, 0},},
    },

    shopTabs = {
        'Skins Masculinas',
        'Skins Femininas',
    },
    
    shopSubTabs = {
        ['Skins Masculinas'] = {
            {'Masculina [1]', 108, 500},
            {'Masculina [2]', 121, 500},
            {'Masculina [3]', 122, 500},
            {'Masculina [4]', 123, 500},
            {'Masculina [5]', 100, 500},
            {'Masculina [6]', 103, 500},
            {'Masculina [5]', 120, 500},
            {'Masculina [5]', 101, 500},
        },
        ['Skins Femininas'] = {
            {'Feminina [1]', 107, 500},
            {'Feminina [2]', 105, 500},
            {'Feminina [3]', 106, 500},
            {'Feminina [4]', 104, 500},
        },
    },
}

--[[function notify(player, type2, message)
    if player and type2 and message then
        local type = {
            ['info'] = 'important',
            ['success'] = 'check',
            ['error'] = 'cancel'
        }

        if type[type2] then
            triggerClientEvent(player, 'DataShowCreateNotification', player, type[type2], message)
        end
    end
end--]]