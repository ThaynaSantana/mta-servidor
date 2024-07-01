Config = {
    ComandoCriarBau = "bau",
    ACL = "Console",
    Baus = {
        --======================== POLICIA ========================--
        [1] = {
            Posicao = {303.62, -1835.164, 3.754},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 0, -- interior
            Dimensao = 0, --dimenção
            Acls = {
                {"Gang", true}, -- MEMBROS RADIOPTR --ACL 
            },
        },
        [2] = {
            Posicao = {1606.6627, 690.3939, 12.6563},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"RADIOPTR_DONO", true}, -- DONOS RADIOPTR
            },
        },
        [3] = {
            Posicao = {1606.0339, 755.2200, 12.7512},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"SPEED", true}, -- MEMBROS SPEED
            },
        },
        [4] = {
            Posicao = {1606.0104, 760.9144, 12.7563},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"SPEED_DONO", true}, -- DONOS SPEED
            },
        },
        [5] = {
            Posicao = {1728.4777, 758.7711, 12.7512},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"INVESTIGATIVA", true}, -- MEMBROS INVESTIGATIVA
            },
        },
        [6] = {
            Posicao = {1728.4777, 753.1920, 12.7563},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"INVESTIGATIVA_DONO", true}, -- DONOS INVESTIGATIVA
            },
        },
        [7] = { 
            Posicao = {1728.5777, 692.4033, 12.7512},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"TATICA", true}, -- MEMBROS TATICA
            },
        },
        [8] = { 
            Posicao = {1728.5787 ,686.8369, 12.7563},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"TATICA_DONO", true}, -- DONOS TATICA
            },
        },
        [9] = { 
            Posicao = {0,0,0},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"DETRAN", true}, -- MEMBROS DETRAN
            },
        },
        [10] = { 
            Posicao = {0,0,0},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"DETRAN_DONO", true}, -- DONOS DETRAN
            },
        },
        --======================== GANGs ========================--
        [11] = {
            Posicao = {2143.0488,1621.5957,1002.1},
            Rotacao = {0,0,0},
            Peso = 100,
            Interior = 1,
            Dimensao = 0,
            Acls = {
                {"CV", true},
            },
        },
        [12] = {
            Posicao = {2492.783, -1670.213, 13.336},
            Rotacao = {0, 0, 356.734},
            Peso = 100,
            Interior = 1,
            Dimensao = 0,
            Acls = {
                {"GROTA", true},
            },
        },
        [13] = {
            Posicao = {2143.0488,1621.5957,1002.1},
            Rotacao = {0,0,0},
            Peso = 100,
            Interior = 1,
            Dimensao = 15,
            Acls = {
                {"Bahamas", true},
            },
        },
        [14] = {
            Posicao = {2140.5, 1629.4433, 994.8},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 1,
            Dimensao = 15,
            Acls = {
                {"DonoBahamas", true},
            },
        },
        [15] = {
            Posicao = {349.5791, 303.3212, 999.8},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 6,
            Dimensao = 1,
            Acls = {
                {"Vanilla", true},
            },
        },
        [16] = {
            Posicao = {343.2148,301.2460,1000.5955},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 6,
            Dimensao = 1,
            Acls = {
                {"DonoVanilla", true},
            },
        },
        [17] = {
            Posicao = {349.5791, 303.3212, 999.8},
            Rotacao = {0,0,-90},
            Peso = 100,
            Interior = 6,
            Dimensao = 2,
            Acls = {
                {"Avengers", true},
            },
        },
        [18] = {
            Posicao = {343.2148,301.2460,1000.5955},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 6,
            Dimensao = 2,
            Acls = {
                {"DonoAvengers", true},
            },
        },
        [19] = {
            Posicao = {69.763, -310.07, 2.8},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"MECANICO", true},
            },
        },
        [20] = {
            Posicao = {69.763, -309.07, 2.8},
            Rotacao = {0,0,90},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"MECANICO_DONO", true},
            },
        },
        [21] = {
            Posicao = {1599.207, 1791.189, 10.727},
            Rotacao = {0,0,355},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"SAMU", true},
            },
        },
        [22] = {
            Posicao = {1609.413, 1757.333, 10.727},
            Rotacao = {0,0,355},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"SAMU_DONO", true},
            },
        },
        [23] = {
            Posicao = {360.65, -2072.511, 10.253},
            Rotacao = {0,0,360},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"KFood", true},
            },
        },
        [24] = {
            Posicao = {363.328, -2072.512, 10.253},
            Rotacao = {0,0,360},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"DonoKFood", true},
            },
        },
        [25] = {
            Posicao = {372.429, -2072.824, 11.270},
            Rotacao = {0,0,300},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"KFood", true},
            },
        },
        [26] = {
            Posicao = {1752.742, -1780.393, 13.722},
            Rotacao = {0,0,180},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"KMotors", true},
            },
        },
        [27] = {
            Posicao = {1750.065, -1780.268, 13.722},
            Rotacao = {0,0,180},
            Peso = 100,
            Interior = 0,
            Dimensao = 0,
            Acls = {
                {"KMotorsDono", true},
            },
        },
    },
    AjustandoImagens = {
        ["chip"] = {94,121},
    },
}