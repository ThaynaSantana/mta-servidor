config = {
    ----------------------
    ----- INVENTARIO -----
    ----------------------

    bind = "b", -- Tecla que abre o inventário.

    give = "giveitem", -- Comando para setar item (Staff)
    take = "takeitem", -- Comando para retirar item (Staff)
    aclstaff = {"Admin", "Console"}, -- Grupos staff que pode usar o comando.

    itens = {
        -- Utilitários |
        [14] = {nome="JBL", peso=0.1, tipo="utilitarios", desc="Cura 20% da vida.", valor=3000, maxitem=10, image="files/gfx/utilities/jbl.png"},
        [15] = {nome="Colete", peso=0.0, tipo="utilitarios", desc="Colete de combate.", valor=15000, maxitem=99999999, image="files/gfx/utilities/colete.png"},
        [16] = {nome="Furadeira", peso=0.5, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=200, maxitem=10, image="files/gfx/utilities/furadeira.png"},
        [17] = {nome="Gasolina", peso=0.5, tipo="utilitarios", desc="Enche o tanque.", valor=45, maxitem=10, image="files/gfx/utilities/gasolina.png"},
        [18] = {nome="Medkit", peso=2.0, tipo="utilitarios", desc="Cura 80% da vida.", valor=4000, maxitem=10, image="files/gfx/utilities/medkit.png"},
        [19] = {nome="Militec", peso=0.3, tipo="utilitarios", desc="Arruma 50% do seu veículo.", valor=900, maxitem=10, image="files/gfx/utilities/militec.png"},
        [20] = {nome="Mira", peso=0.0, tipo="utilitarios", desc="Mira para armas.", valor=300, maxitem=10, image="files/gfx/utilities/mira.png"},
        [21] = {nome="Pendrive", peso=0.1, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=240, maxitem=5, image="files/gfx/utilities/pendrive.png"},
        [22] = {nome="Kit Reparo", peso=0.7, tipo="utilitarios", desc="Arruma 100% do seu veículo.", valor=1500, maxitem=10, image="files/gfx/utilities/repairkit.png"},
        [23] = {nome="Serra", peso=0.5, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=350, maxitem=5, image="files/gfx/utilities/serra.png"},
        [24] = {nome="Pá", peso=0.5, tipo="utilitarios", desc="Usa-se em certas ocasiões.", valor=500, maxitem=5, image="files/gfx/utilities/pa.png"},
        -- Máscaras |
        [25] = {nome="Diabo", peso=0.1, tipo="mascaras",valor=100, maxitem=1, image="files/gfx/masks/diabo.png"},
        [26] = {nome="Chapeu", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/chapeu.png"},
        [27] = {nome="Anonymous", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/anonymous.png"},
        [28] = {nome="Saco", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/saco.png"},
        [29] = {nome="Jedi", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/jedi.png"},
        [30] = {nome="Cachorro", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/cachorro.png"},
        [31] = {nome="Macaco", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/macaco.png"},
        [32] = {nome="Terror", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/terror.png"},
        [33] = {nome="Gas", peso=0.1, tipo="mascaras", valor=100, maxitem=1, image="files/gfx/masks/gas.png"},
        -- Negro |
        [34] = {nome="Algemas", peso=0.0, tipo="negro", desc="Usado para algemar jogadores.\n(O item necessita permissão para usar)", valor=12000, maxitem=3, image="files/gfx/black/algemas.png"},
        [35] = {nome="C4", peso=1.0, tipo="negro", desc="DESATIVADO.", valor=50000, maxitem=2, image="files/gfx/black/c4.png"},
        [36] = {nome="Capuz", peso=0.1, tipo="negro", desc="Usado para encapuzar jogadores.\n(O item necessita permissão para usar)", valor=300, maxitem=5, image="files/gfx/black/capuz.png"},
        [37] = {nome="Keys Invasão", peso=0.0, tipo="negro", desc="DESATIVADO.", valor=200000, maxitem=3, image="files/gfx/black/keysinvasao.png"},
        [38] = {nome="Logs Invasão", peso=0.0, tipo="negro", desc="DESATIVADO.", valor=100000, maxitem=3, image="files/gfx/black/logsinvasao.png"},
        -- Drogas |
        [39] = {nome="Fertilizante", peso=0.3, tipo="drogas", valor=2500, maxitem=3, image="files/gfx/drugs/fertilizante.png"},
        [40] = {nome="Semente Maconha", peso=0.0, tipo="drogas", valor=800, maxitem=8, image="files/gfx/drugs/smaconha.png"},
        [41] = {nome="Cocaína", peso=0.1, tipo="drogas", valor=9000, maxitem=5, image="files/gfx/drugs/cocaina.png"},
        [42] = {nome="Maconha", peso=0.1, tipo="drogas", maxitem=50, image="files/gfx/drugs/fmaconha.png"},
        -- Armas |
        [43] = {nome="Glock", peso=0.3, tipo="armas", desc="Arma de baixo porte.", valor=90000, maxitem=1, image="files/gfx/weapons/WEAPON_GLOCK.png"},
        [44] = {nome="38", peso=0.5, tipo="armas", desc="Arma de baixo porte.", valor=100000, maxitem=1, image="files/gfx/weapons/WEAPON_38.png"},
        [45] = {nome="MP5", peso=0.7, tipo="armas", desc="Indisponivel.", valor=200000, maxitem=1, image="files/gfx/weapons/WEAPON_MP5.png"},
        [46] = {nome="AK47", peso=1.0, tipo="armas", desc="Indisponivel.", valor=1000000, maxitem=1, image="files/gfx/weapons/WEAPON_AK47.png"},
        [47] = {nome="AR15", peso=1.0, tipo="armas", desc="Indisponivel.", valor=900000, maxitem=2, image="files/gfx/weapons/WEAPON_AR15.png"},
        [48] = {nome="DOZE", peso=2.0, tipo="armas", desc="Indisponivel.", valor=150000, maxitem=1, image="files/gfx/weapons/WEAPON_DOZE.png"},
        [49] = {nome="AR10", peso=2.0, tipo="armas", desc="Indisponivel.", valor=500000, maxitem=1, image="files/gfx/weapons/WEAPON_AR10.png"},
        [55] = {nome="Taser", peso=0.0, tipo="armas", desc="Arma de Choque", valor=200000, maxitem=2, image="files/gfx/weapons/WEAPON_TASER.png"},
        -- Munição |
        [50] = {nome="Munição 9mm", peso=0.0, tipo="municao", desc="Munição para armas de\nbaixo porte. (Glock, 38)", valor=50, maxitem=500, image="files/gfx/weapons/municao9mm.png"},
        [51] = {nome="Munição 556", peso=0.0, tipo="municao", desc="Indisponivel. (MP5)", valor=1, maxitem=22222, image="files/gfx/weapons/municao556.png"},
        [52] = {nome="Munição 762", peso=0.0, tipo="municao", desc="Indisponivel. (AK47, AR15)", valor=1, maxitem=500, image="files/gfx/weapons/municao762.png"},
        [53] = {nome="Munição Sniper", peso=0.0, tipo="municao", desc="Indisponivel. (Sniper)", valor=9012, maxitem=500, image="files/gfx/weapons/municaosnip.png"},
        [54] = {nome="Cartucho 12", peso=0.0, tipo="municao", desc="Indisponivel. (DOZE)", valor=1, maxitem=500, image="files/gfx/weapons/cartucho12.png"},
        -- Outros |
        [56] = {nome="Dinheiro Sujo", peso=0, tipo="outros", maxitem=99999999, image="files/gfx/others/dinheirosujo.png"},
        -- JBL
        [57] = {nome="JBL", peso=0.5, tipo="utilitarios", desc="DESATIVADO", valor=99999999, maxitem=2, image="files/gfx/utilities/jbl.png"},
        -- Fabrica Armas
        [58] = {nome="Polvora", peso=0, tipo="outros", maxitem=120, image="files/gfx/others/polvora.png"},
        [59] = {nome="Capsulas", peso=0, tipo="outros", maxitem=120, image="files/gfx/others/capsulas.png"},
        [60] = {nome="Molas", peso=0.1, tipo="outros", maxitem=10, image="files/gfx/others/molas.png"},
        [61] = {nome="Placa de Metal", peso=0.1, tipo="outros", maxitem=10, image="files/gfx/others/placa-metal.png"},
        [62] = {nome="Gatilho", peso=0.1, tipo="outros", maxitem=10, image="files/gfx/others/gatilho.png"},
        [63] = {nome="Corpo de MP5", peso=0.2, tipo="outros", maxitem=2, image="files/gfx/others/corpo-mp5.png"},
        [64] = {nome="Corpo de M4", peso=0.2, tipo="outros", maxitem=2, image="files/gfx/others/corpo-m4.png"},
        [65] = {nome="Corpo de AK-47", peso=0.2, tipo="outros", maxitem=2, image="files/gfx/others/corpo-ak47.png"},
        [66] = {nome="Corpo de Glock", peso=0.2, tipo="outros", maxitem=2, image="files/gfx/others/corpo-glock.png"},
        [67] = {nome="Corpo de Magnun", peso=0.2, tipo="outros", maxitem=2, image="files/gfx/others/corpo-magnum44.png"},
        -- Radinho
        [68] = {nome="Radio", peso=0.1, tipo="outros", maxitem=99999999, image="files/gfx/others/radio.png"},
        --Skate
        [69] = {nome="Pulmão", peso=0, tipo="outros", maxitem=10, image="files/gfx/others/pulmao.png"},
    },

    mochila = {nome="Mochila", peso="N/A", desc="Cabe até 10 KG.", valor=500, image="files/gfx/utilities/mochila.png"},

    deleteitem = 3, -- Tempo (minutos) para deletar itens dropados no chão.

    perderitem = true, -- Caso queira que perda os itens ao morrer coloque 'true' caso contrário deixe como 'false'.

    -------------------------------
    ----- LOJA DE UTILITARIOS -----
    -------------------------------

    markerutilitarios = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z.
       {2001.956, -1761.639, 13.598},
       {2268.204, -1668.718, 15.378},
    },

    ------------------------------
    ----- LOJA MERCADO NEGRO -----
    ------------------------------

    markernegro = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z.
        {-562.713, -181.707, 78.406},
        {2309.976, -1643.582, 14.827},
    },

    -------------------------
    ----- LOJA DE ARMAS -----
    -------------------------

    armasperm = false, -- Caso queira que a loja de armas seja por grupos coloque 'true' caso contrário deixe como 'false'.
    armasacl = {"Bandido"}, -- Caso seja por grupos coloque os mesmos que pode comprar.

    markerarmas = { -- Para adicionar mais lojas adicione mais uma linha com as posições x, y, z.
        {2158.4777832031,943.17712402344,10.8203125},
        {2400.200, -1981.984, 13.547},
    },

    ----------------------------
    ----- ASSALTO A BANCO ------
    ----------------------------

    moneyhacker = 50000, -- Valor que o hacker cobra para hackear o banco.
    moneyroubo = 1000000, -- Valor ganho pelo roubo.
    assaltarnovamente = 60, -- Minutos para assaltar o banco novamente.
    grupospolicia = {"Policial"}, -- Grupos policiais que irá ser chamado.

    ------------------
    ----- DROGAS -----
    ------------------

    dg = {
        {1548.4007568359,17.335012435913,24.1337585449222},
        {2020.673, -1110.590, 26.203},
    }, -- Marker pontos de drogas.
    efeitotime = 3, -- Tempo (minutos) que dura o efeito das drogas.

    -------------------------
    ----- DINHEIRO SUJO -----
    -------------------------

    ds = {-2188.78735, 2411.97363, 5.15625}, -- Marker limpar dinheiro sujo.

    -----------------------
    ----- PORTA MALAS -----
    -----------------------

    portamalasbind = "K", -- Tecla que abre o porta malas.
    portamalasveh = { -- Carros que tem porta malas.
        602,429,402,541,415,480,562,587,565,411,559,603,
        560,506,451,558,555,477,536,575,518,419,534,567,
        535,576,412,496,401,527,542,533,526,474,545,517,
        410,436,475,439,549,491,445,438,507,585,466,492,
        546,551,516,467,426,547,405,580,409,550,566,420,
        540,421,529,589,579,400,500,470,404,489,479,442,
        495,458,561,434,494,502,503,490,596,598,597,599,
        422,504,508,552,554,582,418,478,
    },

    --------------------
    ----- REVISTAR -----
    --------------------

    comandorevistar = "revis", -- Comando revistar inventário.
    gruposrevistar = {"Policial", "Policial2"}, -- Grupos que podem usar o comando.

    ------------------------
    ----- RETIRAR ITEM -----
    ------------------------

    comandoretirar = "reti", -- Comando para retirar item do inventário.
    gruposretirar = {"Policial", "Policial2"}, -- Grupos que podem usar o comando.

    ---------------------------
    ----- ALGEMAR & CAPUZ -----
    ---------------------------

    gruposalgemar = {"Policial", "Console"}, -- Grupos que podem usar algemas.
    gruposcapuz = {"Bandido", "Everyone"}, -- Grupos que podem usar capuz.

    ---------------
    ----- BAU -----
    ---------------

    baubind = "K", -- Tecla que abre o baú.
    bau = { -- Para adicionar mais baú's adicione mais uma linha com as posições x, y, z.
    {2494.5844726562,-1670.1866455078,13.335947036743, "GROTA"}, --GROTA
    {1483.995, -697.949, 94.75, "CV"}, -- CV


    },
}