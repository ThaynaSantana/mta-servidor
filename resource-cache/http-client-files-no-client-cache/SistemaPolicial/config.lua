
--https://discord.gg/sKBRNkA7fw

settings = {

    ['corporations'] = {

        [1] = {

            ['acl'] = 'bope', --ACL group 
            ['armor'] = {30,24,4, ['ammo'] = {90}, ['text'] = 'Você pegou uma arma [BOPE]'}, --Model id the weapon, amount the ammo and text
            ['skin'] = {1,285,10, ['text'] = 'Você pegou uma farda [BOPE]' }, -- Model id the skin and text
            ['vehicle'] = {596, ['zone'] = {1530.754, -1643.43, 5.891}, ['text'] = 'Você pegou uma viatura [BOPE]'}, -- Model id the vehicle, coordinate of spawn the vehicle and text
            ['marker'] = {1535.704, -1655.073, 5.891}, -- Coordinate of panel

        },

        [2] = {

            ['acl'] = 'gcm',
            ['armor'] = {31,23,4, ['ammo'] = {60}, ['text'] = 'Você pegou uma arma [GCM]'},
            ['skin'] = {22,23,50, ['text'] = 'Você pegou uma farda [GCM]'},
            ['vehicle'] = {422, ['zone'] = {1530.754, -1643.43, 5.891}, ['text'] = 'Você pegou uma viatura [GCM]' },
            ['marker'] = {1540.348, -1655.073, 5.891},

        },

    },

    ['theme'] = {116,77,169}, -- color of theme


    ['infobox'] = true, -- if you wants infobox leave = true 
    ['event'] = 'addNotify', -- event the of infobox


}

--Quiser criar mais paineis, só seguir a ordem.