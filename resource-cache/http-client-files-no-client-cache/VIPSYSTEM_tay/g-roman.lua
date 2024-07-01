--[[


    ██████╗  ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗   ██╗
    ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝██║   ██║
    ██████╔╝██║   ██║██╔████╔██║███████║██╔██╗ ██║██║  ██║█████╗  ██║   ██║
    ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║██╔══╝  ╚██╗ ██╔╝
    ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████╗ ╚████╔╝ 
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ╚═══╝  


]]--
--[[
                https://discord.gg/KXV2GHtJtg                              


PROCURANDO SCRIPTS, MAPAS, MODELAGENS EXCLUSIVOS?
NOSSA COMUNIDADE ESTÁ SEMPRE ATIVA SOLTANDO VARIOS MODS DE GRAÇA!

LINK DE CONVITE PERMANENTE:

https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
]]

system = {
    ['language'] = "pt-BR", -- Linguagem principal do sistema.
    ['bind'] = "F5", -- Tecla para abrir o Painel VIP.
    
    ['database'] = {
        ['type'] = "sqlite", -- Tipo do banco de dados (sqlite ou mysql).
        ['infos'] = { -- Informações do banco de dados (apenas para MySQL).
            ['options'] = "autoreconnect=0",
            ['dbname'] = "database",
            ['host'] = "127.0.0.1",
            ['user'] = "root",
            ['pw'] = "Mj71h%*2h19,."
        }
    },
    
    ['site-automatic'] = {
        --[[
            As opções abaixo estão disponíveis apenas para usuários da Prisma Market

            - Discord: https://discord.gg/Krz6Jk8uMY
            - Site: https://prismamarket.com.br/
        --]]

        ['use'] = false, -- Caso queira ativações automáticas com o site (disponível somente para usuários da Prisma Market) deixe a opção como "true", caso ao contrário deixe "false".
        ['url'] = "https://romanscripter.com.br/", -- URL do seu site de vendas dentro da Prisma Market.
        ['slogan'] = "Roman Store Inc." -- Slogan do seu site de vendas dentro da Prisma Market.
    },

    ['webhook'] = {
        ['keys'] = {['use'] = false, ['link'] = ""}, -- Opção caso queira ou não utilizar o sistema, link da webhook do canal do Discord para logs.
        ['addVip'] = {['use'] = false, ['link'] = ""}, -- Opção caso queira ou não utilizar o sistema, link da webhook do canal do Discord para logs.
        ['remVip'] = {['use'] = false, ['link'] = ""}, -- Opção caso queira ou não utilizar o sistema, link da webhook do canal do Discord para logs.
        ['expired'] = {['use'] = false, ['link'] = ""}, -- Opção caso queira ou não utilizar o sistema, link da webhook do canal do Discord para logs.
        ['activate'] = {['use'] = false, ['link'] = ""}, -- Opção caso queira ou não utilizar o sistema, link da webhook do canal do Discord para logs.
    },

    ['keys-command'] = "usarkey", -- Comando para utilizar a key VIP.

    ['salary'] = {
        ['use'] = true, -- Avisar para todos quando o salário for resgatado, utilize "true", ou caso ao contrário, utilize "false".
        ['message'] = "#990000[Brasilia RP] #FFFFFFO(A) #FFFF00${user} #FFFFFFresgatou o seu salário diário de seu VIP!" -- Mensagem que será enviada caso a opção de cima seja "true".
    },

    ['manager'] = {
        ['open'] = "gerenciar", -- Comando para abrir o gerenciador de VIPS.
        ['permissions'] = {"Console", "STAFF"} -- Permissões para abrir o gerenciador de VIPS.
    },

    ['active'] = {
        ['chat'] = {['use'] = true, ['message'] = "O(A) #FFFF00${user} #FFFFFF(#FFFF00${id}#FFFFFF) acabou de ativar um(a) #FFFF00${product}#FFFFFF."}, -- Opção caso queira ou não utilizar o sistema, mensagem que será enviada no chat ao ativar algum benefício.
        ['screen'] = {['use'] = true, ['message'] = "O(A) #FFFF00${user} #FFFFFF(#FFFF00${id}#FFFFFF) acabou de ativar um(a) #FFFF00${product}#FFFFFF."} -- Opção caso queira ou não utilizar o sistema, mensagem que será mostrada na tela ao ativar algum benefício.
    },

    ['musics'] = {
        [1] = {['path'] = "assets/archives/sounds/sound-um.mp3", ['volume'] = 0.4},
        [2] = {['path'] = "assets/archives/sounds/sound-dois.mp3", ['volume'] = 0.4},
        [3] = {['path'] = "assets/archives/sounds/sound-tres.mp3", ['volume'] = 0.4},
        [4] = {['path'] = "assets/archives/sounds/sound-cinco.mp3", ['volume'] = 0.4},
        [5] = {['path'] = "assets/archives/sounds/sound-quatro.mp3", ['volume'] = 0.4},
    },

    ['vips'] = {
        [1] = {
            ['name'] = "Bronze", -- Nome do primeiro VIP.
            ['salary'] = 8000, -- Salário diário do VIP.
            ['permission'] = "Bronze", -- Nome da ACL que representa o VIP.

            ['items'] = {
                ['vehicles'] = { -- ID do veículo e nome de exibição.
                    {['id'] = 480, ['name'] = "Carro I"},
                },

                ['weapons'] = { -- ID da arma e nome de exibição.
                    {['id'] = 22, ['name'] = "Glock"},
                    {['id'] = 1, ['name'] = "Soco Inglês"},
                },

                ['persons'] = { -- ID da skin e nome de exibição.
                    {['id'] = 85, ['name'] = "Skin executivo I"},
                },

                ['others'] = { -- Nome de exibição e função para pegar.
                    {
                        ['name'] = "Vida", 
                        ['func'] = function(element)
                            setElementHealth(element, 70);
                            return true;
                        end
                    },
                    {
                        ['name'] = "Colete", 
                        ['func'] = function(element)
                            setPedArmor(element, 70);
                            return true;
                        end
                    },
                }
            }
        },

        [2] = {
            ['name'] = "Platinum", -- Nome do segundo VIP.
            ['salary'] = 15000, -- Salário diário do VIP.
            ['permission'] = "Platinum", -- Nome da ACL que representa o VIP.

            ['items'] = {
                ['vehicles'] = { -- ID do veículo e nome de exibição.
                    {['id'] = 489, ['name'] = "Carro I"},
                    {['id'] = 522, ['name'] = "Carro II"},
                },

                ['weapons'] = { -- ID da arma e nome de exibição.
                    {['id'] = 22, ['name'] = "Glock"},
                    {['id'] = 10, ['name'] = "Bega"},
                    {['id'] = 1, ['name'] = "Soco Inglês"},
                },

                ['persons'] = { -- ID da skin e nome de exibição.
                    {['id'] = 85, ['name'] = "Skin executivo I"},
                    {['id'] = 95, ['name'] = "Skin panico II"},
                },

                ['others'] = { -- Nome de exibição e função para pegar.
                    {
                        ['name'] = "Vida", 
                        ['func'] = function(element)
                            setElementHealth(element, 100);
                            return true;
                        end
                    },
                    {
                        ['name'] = "Colete", 
                        ['func'] = function(element)
                            setPedArmor(element, 100);
                            return true;
                        end
                    },
                }
            }
        },

        [3] = {
            ['name'] = "Gold", -- Nome do terceiro VIP.
            ['salary'] = 30000, -- Salário diário do VIP.
            ['permission'] = "Gold", -- Nome da ACL que representa o VIP.

            ['items'] = {
                ['vehicles'] = { -- ID do veículo e nome de exibição.
                    {['id'] = 581, ['name'] = "Moto I"},
                    {['id'] = 429, ['name'] = "Carro I"},
                    {['id'] = 602, ['name'] = "Carro II"},
                },

                ['weapons'] = { -- ID da arma e nome de exibição.
                    {['id'] = 22, ['name'] = "Glock"},
                    {['id'] = 29, ['name'] = "MP5"},
                    {['id'] = 25, ['name'] = "Shotgun"},
                    {['id'] = 1, ['name'] = "Soco Inglês"},
                },

                ['persons'] = { -- ID da skin e nome de exibição.
                    {['id'] = 12, ['name'] = "Skin girl I"},
                    {['id'] = 300, ['name'] = "Skin kratos II"},
                    {['id'] = 302, ['name'] = "Skin kid III"},
                },

                ['others'] = { -- Nome de exibição e função para pegar.
                    {
                        ['name'] = "Vida", 
                        ['func'] = function(element)
                            setElementHealth(element, 100);
                            return true;
                        end
                    },
                    {
                        ['name'] = "Colete", 
                        ['func'] = function(element)
                            setPedArmor(element, 100);
                            return true;
                        end
                    },
                    {
                        ['name'] = "Farol Colorido",
                        ['func'] = "rgb headlight" -- Para ativar a função de farol colorido, utilize esse texto.
                    },
                    {
                        ['name'] = "Veículo Colorido",
                        ['func'] = "rgb vehicle"  -- Para ativar a função de veículo colorido, utilize esse texto.
                    },
                }
            }
        },

        [4] = {
            ['name'] = "Ametista", -- Nome do quarto VIP.
            ['salary'] = 60000, -- Salário diário do VIP.
            ['permission'] = "Ametista", -- Nome da ACL que representa o VIP.

            ['items'] = {
                ['vehicles'] = { -- ID do veículo e nome de exibição.
                    {['id'] = 521, ['name'] = "Moto I"},
                    {['id'] = 469, ['name'] = "Moto II"},
                    {['id'] = 411, ['name'] = "Carro I"},
                    {['id'] = 541, ['name'] = "Carro II"},
                },

                ['weapons'] = { -- ID da arma e nome de exibição.
                    {['id'] = 31, ['name'] = "M4A1"},
                    {['id'] = 30, ['name'] = "AK-47"},
                    {['id'] = 23, ['name'] = "Glock Silenciador"},
                    {['id'] = 25, ['name'] = "Shotgun"},
                    {['id'] = 1, ['name'] = "Soco Inglês"},
                },

                ['persons'] = { -- ID da skin e nome de exibição.
                    {['id'] = 11, ['name'] = "Skin boi I"},
                    {['id'] = 12, ['name'] = "Skin girl II"},
                    {['id'] = 95, ['name'] = "Skin panico III"},
                    {['id'] = 302, ['name'] = "Skin kid IV"},
                    {['id'] = 33, ['name'] = "Skin unicorn V"},
                },

                ['others'] = { -- Nome de exibição e função para pegar.
                    {
                        ['name'] = "Vida", 
                        ['func'] = function(element)
                            setElementHealth(element, 100);
                            return true;
                        end
                    },
                    {
                        ['name'] = "Colete", 
                        ['func'] = function(element)
                            setPedArmor(element, 100);
                            return true;
                        end
                    },
                    --{
                    --    ['name'] = "JetPack", 
                    --    ['func'] = function(element)
                    --        setPedWearingJetpack(element, (not isPedWearingJetpack(element)));
                    --        return true;
                    --    end
                    --},
                    {
                        ['name'] = "Blindagem",
                        ['func'] = function(element)
                            if (isPedInVehicle(element)) then
                                setVehicleDamageProof(getPedOccupiedVehicle(element), (not isVehicleDamageProof(element)));
                                return true;
                            end
                        end
                    },
                    {
                        ['name'] = "Farol Colorido",
                        ['func'] = "rgb headlight" -- Para ativar a função de farol colorido, utilize esse texto.
                    },
                    {
                        ['name'] = "Veículo Colorido",
                        ['func'] = "rgb vehicle"  -- Para ativar a função de veículo colorido, utilize esse texto.
                    }
                }
            }
        },
    }
};

products = {
    --[[
        TIPOS DE PRODUTOS:
        
        vehicle
        money
        vip

    --]]

    ['addProduct'] = {
        ['Bronze'] = {
            ['days'] = 30,
            ['type'] = "vip",
            ['name'] = "VIP Bronze",
            ['func'] = function(element)
                aclGroupAddObject(aclGetGroup(system['vips'][1].permission), "user."..(getAccountName(getPlayerAccount(element))));
                others.giveMoney(element, 50000);
                return true;
            end,
        },

        ['Platinum'] = {
            ['days'] = 30,
            ['type'] = "vip",
            ['name'] = "VIP Platinum",
            ['func'] = function(element)
                aclGroupAddObject(aclGetGroup(system['vips'][2].permission), "user."..(getAccountName(getPlayerAccount(element))));
                others.giveMoney(element, 100000);
                return true;
            end
        },

        ['Gold'] = {
            ['days'] = 30,
            ['type'] = "vip",
            ['name'] = "VIP Gold",
            ['func'] = function(element)
                aclGroupAddObject(aclGetGroup(system['vips'][3].permission), "user."..(getAccountName(getPlayerAccount(element))));
                others.giveMoney(element, 150000);
                return true;
            end
        },

        ['Ametista'] = {
            ['days'] = 30,
            ['type'] = "vip",
            ['name'] = "VIP Ametista",
            ['func'] = function(element)
                aclGroupAddObject(aclGetGroup(system['vips'][4].permission), "user."..(getAccountName(getPlayerAccount(element))));
                others.giveMoney(element, 200000);
                return true;
            end
        },

        ['200k (Dinheiro)'] = {
            ['type'] = "money",
            ['name'] = "SetMoney de 200k",
            ['func'] = function(element)
                others.giveMoney(element, 200000);
                return true;
            end
        },

        ['Nissan GTR'] = {
            ['type'] = "vehicle",
            ['name'] = "Nissan GTR",
            ['func'] = function(element)
                exports['[RS]DealerShip']:addVehicleToPlayer(element, 429);
                return true;
            end
        }
    },

    ['removeProduct'] = {
        ['Bronze'] = function(account)
            aclGroupRemoveObject(aclGetGroup(system['vips'][1].permission), "user."..(account));
            return true;
        end,

        ['Platinum'] = function(account)
            aclGroupRemoveObject(aclGetGroup(system['vips'][2].permission), "user."..(account));
            return true;
        end,

        ['Gold'] = function(account)
            aclGroupRemoveObject(aclGetGroup(system['vips'][3].permission), "user."..(account));
            return true;
        end,

        ['Ametista'] = function(account)
            aclGroupRemoveObject(aclGetGroup(system['vips'][4].permission), "user."..(account));
            return true;
        end
    }
};

language = {
    ['pt-BR'] = {
        -- PANEL

        ['title'] = "PAINEL VIP - Brasilia Roleplay",
        ['subtitle'] = "Acesse os seus benefícios.",

        ['others window'] = "Outros",
        ['weapons window'] = "Armas",
        ['vehicle window'] = "Veículos",
        ['persons window'] = "Personagens",

        ['get salary'] = "Você resgatou o seu salário diário.",
        ['get others'] = "Você resgatou um(a) ${item} de seu VIP!",
        ['get person'] = "Você resgatou um(a) ${item} de seu VIP!",
        ['get weapon'] = "Você resgatou um(a) ${item} de seu VIP!",
        ['get vehicle'] = "Você resgatou um(a) ${item} de seu VIP!",

        ['warning get benefit'] = "Para que o benefício seja utilizado, você deverá clicar 2x (duas) vezes em cima dele.",
        ['warning cooldown salary'] = "Você está em cooldown! Aguarde ${cooldown} para resgatar seu salário novamente!",

        -- MANAGER

        ['window keys'] = "Keys",
        ['window manager'] = "Gerenciador",
        ['button rem vip'] = "Remover VIP",
        ['button add vip'] = "Adicionar VIP",

        -- MANAGER (ADD VIP)

        ['add vip title'] = "Selecione o VIP desejado:",

        ['add vip edit id'] = "ID do jogador",
        ['add vip edit duration'] = "Tempo (em dias)",

        ['add vip button add'] = "Adicionar VIP",
        ['add vip button cancel'] = "Cancelar",

        ['add vip warning edit'] = "Você não preencheu os campos!",
        ['add vip warning select'] = "Você não selecionou o VIP!",
        ['add vip warning player offline'] = "O(A) jogador(a) não foi encontrado(a)!",

        ['add vip warning added'] = "O benefício foi adicionado para o(a) jogador(a).",

        
        -- MANAGER (REM VIP)

        ['remove vip warning select'] = "Você não selecionou nenhum item da lista!",
        ['remove vip warning removed'] = "Você removeu o benefício do(a) jogador(a)!",

        -- KEYS

        ['button rem key'] = "Remover Key",
        ['button add key'] = "Adicionar Key",

        -- KEYS (ADD KEY)

        ['add key title'] = "Selecione o VIP desejado:",

        ['add key edit key'] = "Insira a Key",
        ['add key edit duration'] = "Tempo (em dias)",

        ['add key button add'] = "Adicionar Key",
        ['add key button cancel'] = "Cancelar",

        ['add key warning edit'] = "Você não preencheu os campos!",
        ['add key warning select'] = "Você não selecionou o VIP!",
        ['add key warning key exists'] = "A key inserida já existe em nosso banco de dados!",

        ['add key warning added'] = "A key inserida foi criada em nosso banco de dados.",

        
        -- KEYS (REM KEY)

        ['remove key warning select'] = "Você não selecionou nenhum item da lista!",
        ['remove key warning removed'] = "Você removeu a key de nosso banco de dados!",

        -- KEYS (USE KEY)

        ['use key warning insert'] = "Você não informou uma key!",
        ['use key warning key used'] = "Você acabou de usar uma key VIP!",
        ['use key warning not exists'] = "A key informada não existe!",

        -- ACTIVATOR

        ['product expired'] = "O seu #FFFF00${product} #FFFFFFexpirou! Renove seu plano em nosso site (#FFFF00"..(system['site-automatic'].url).."#FFFFFF).",
        ['product activated product'] = "Você acabou de adquirir um(a) ${product}!",
        ['product activated user'] = "Parabéns, ${user}",
    }
};

others = {
    ['managerHud'] = function(element, state)
        return setPlayerHudComponentVisible("all", state);
    end,

    ['getPlayerID'] = function(element)
        return getElementData(element, "ID") or "N/A";
    end,

    ['giveMoney'] = function(element, amount)
        return givePlayerMoney(element, amount);
    end
};

notify = {
    ['warning'] = "warning",
    ['success'] = "success",
    ['error'] = "error",
    ['info'] = "info"
};

geral = {
    ['sNotify'] = function(element, message, type)
        return exports.FR_DxMessages:addBox(element, message, type)
    end,

    ['cNotify'] = function(element, message, type)
        return triggerEvent("addBox", element, message, notify[type]);
    end
};

function getSystemLanguage(index)
    return language[system['language']][index];
end



--[[


    ██████╗  ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗   ██╗
    ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝██║   ██║
    ██████╔╝██║   ██║██╔████╔██║███████║██╔██╗ ██║██║  ██║█████╗  ██║   ██║
    ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║██╔══╝  ╚██╗ ██╔╝
    ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████╗ ╚████╔╝ 
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ╚═══╝  


]]--
--[[
███╗   ███╗████████╗ █████╗    ███████╗ █████╗     ███╗   ███╗ ██████╗ ██████╗ ███████╗
████╗ ████║╚══██╔══╝██╔══██╗██╗██╔════╝██╔══██╗    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
██╔████╔██║   ██║   ███████║╚═╝███████╗███████║    ██╔████╔██║██║   ██║██║  ██║███████╗
██║╚██╔╝██║   ██║   ██╔══██║██╗╚════██║██╔══██║    ██║╚██╔╝██║██║   ██║██║  ██║╚════██║
██║ ╚═╝ ██║   ██║   ██║  ██║╚═╝███████║██║  ██║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████║
╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════    
                                                                                                                
   NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!   
                https://discord.gg/KXV2GHtJtg                              


PROCURANDO SCRIPTS, MAPAS, MODELAGENS EXCLUSIVOS?
NOSSA COMUNIDADE ESTÁ SEMPRE ATIVA SOLTANDO VARIOS MODS DE GRAÇA!

MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO
MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO
MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO
MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO

LINK DE CONVITE PERMANENTE:

https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
]]
