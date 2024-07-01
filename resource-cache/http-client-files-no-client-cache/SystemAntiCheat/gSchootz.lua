config = {
    ['Geral'] = {
        ['dataStaff'] = 'onProt', -- Elemenet data de staff para bypass
        ['maxWarnings'] = 3, -- Maximo de avisos para o suspeito ser kickado
    },
    ['Embed'] = {
        ['name'] = 'Arena Community | AntiCheat', -- Nome no embed do das log no discord
        ['image'] = 'https://cdn.discordapp.com/attachments/633009831124664341/1176889893226545152/logo_3.png?ex=663ed5e0&is=663d8460&hm=7bb8c9070600bc1710c738de44b46dd19e8e83c71205aefd4ae65208ce653117&', -- Imagem do embed
        ['color'] = 0x00000000, -- Cor do embed
    },
    ['modules'] = {

        -- State = true or false (Ativar ou desativar a função do anti cheat)
        -- keyAPI = Chave de api para antivpn (antivpn.net)
        -- commandWhitelist = Comando para adicionar algum jogador na whitelist
        -- webhook = Webhook para enviar os logs
        -- action = kick, ban, warning (Ação para o suspeito)
        -- byppass = Pessoas que podem fazer tal ação no servidor
        -- items = Utilização de recurdos do servidor bloqueado exemplo: (id de arma) (id de explosão) (id de veiculos) etc

        ['AntiVPN'] = {
            ['state'] = true,
            ['keyAPI'] = '', -- Key do antivpn
            ['commandWhitelist'] = 'addwhitelist',

            ['webhook'] = '',
        },

        ['Anti-Weapon'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['items'] = {
                [35] = true,
                [33] = true, 
                [36] = true, 
                [37] = true, 
                [38] = true, 
                [16] = true, 
                [18] = true, 
                [39] = true, 
                [40] = true,
            },

            ['webhook'] = '',
        },
        
        ['Anti-VBR'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },

        ['Anti-Invisible'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-Jetpack'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF", "Patrocinador"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-Fly'] = {
            ['state'] = true,
            ['action'] = 'warning',

            ["bypass"] = {
                ["acls"] = {"Console", 'STAFF'};
                ["element.data"] = {"onProt", "Grudado", "SQUADY.carregado"};
            };
            
            ['webhook'] = '',
        },
        ['Anti-Explosions'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['items'] = {
                [0] = true,
                [1] = true, 
                [2] = false, 
                [3] = true, 
                [4] = false, 
                [5] = true, 
                [6] = true, 
                [7] = true, 
                [8] = true, 
                [9] = false, 
                [10] = true, 
                [11] = true,
            },

            ['webhook'] = '',
        },
        ['Anti-Projectile'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-FastFire'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-Vehicle'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['items'] = {
                [425] = true,
                [520] = true, 
                [432] = true, 
                [590] = true, 
                [538] = true, 
                [570] = true, 
                [569] = true, 
                [537] = true, 
                [449] = true, 
                [464] = true,

            },

            ['webhook'] = '',
        },
        ['Anti-Speed'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-Executor'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-TriggerExists'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-ChangeData'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['items'] = {
                ['ID'] = true,
                ["vPoints"] = true,
                ["ID"] = true,
                ["Exp"] = true,
                ["Level"] = true,
                ["Emprego"] = true,
                ["onProt"] = true,
            },

            ['webhook'] = '',
        },
        ['Anti-CarFucker'] = {
            ['state'] = true,
            ['action'] = 'warning',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };
            
            ['webhook'] = '',
        },
        ['Anti-Block'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-Gui'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['webhook'] = '',
        },
        ['Anti-Trigger'] = {
            ['state'] = true,
            ['action'] = 'ban',

            ["bypass"] = {
                ["acls"] = {"Console", "STAFF"};
                ["element.data"] = {"onProt"};
            };

            ['Triggers'] = {
                ['PEGASUS_AC'] = {
                    ['Pegasus.DetectSpoofer'] = true,
                    ['Pegasus.detectCheaters'] = true,
                },
            };

            ['webhook'] = '',
        },
        ['Anti-Spoofer'] = {
            ['state'] = true,

            ['webhook'] = '',
        },
    },
}

notifyC = function(message, type)
    exports['FR_DxMessages']:addBox(message, type)
end

notifyS = function(player, message, type)
    exports['FR_DxMessages']:addBox(player, message, type)
end