addEvent("N3xT.useItem", true)

addEventHandler("N3xT.useItem", root,
    function(item, quantia)
        local quantia = tonumber(quantia)
    
        for i, v in ipairs(config.itens) do
            if (v.nome == item) then
                if (v.tipo == "utilitarios") then
                    if (v.nome == "Bandagem") then
                        local health = getElementHealth(source)
                        if (health >= 100) then return messageS(source, "Sua saude já está cheia!", "error") end
                        if (health <= 80) then
                            setElementHealth(source, health + 20)
                            takeItem(source, item, 1)
                            messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        else
                            local soma = (100 - health)
                            setElementHealth(source, health + soma)
                            takeItem(source, item, 1)
                            messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        end

                    elseif (v.nome == "Medkit") then
                        local health = getElementHealth(source)
                        if (health >= 100) then return messageS(source, "Sua saude já está cheia!", "error") end
                        if (health <= 20) then
                            setElementHealth(source, health + 80)
                            takeItem(source, item, 1)
                            messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        else
                            local soma = (100 - health)
                            setElementHealth(source, health + soma)
                            takeItem(source, item, 1)
                            messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        end

                    elseif (v.nome == "Colete") then
                        local armor = getPedArmor(source)
                        if (armor >= 100) then return messageS(source, "Seu colete não está danificado!", "error") end
                        setPedArmor(source, 100)
                        takeItem(source, item, 1)
                        messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        
                    elseif (v.nome == "Gasolina") then
                        local veh = getPedOccupiedVehicle(source)
                        if (veh) then
                            local combustivel = getElementData(veh, "DNL:Combustivel") or 0
                            if (combustivel < 100) then
                                setElementData(veh, "DNL:Combustivel", 100)
                                takeItem(source, item, 1)
                                messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                            end
                        else
                            messageS(source, "Entre em um veículo para concluir essa ação!", "error")
                        end

                    elseif (v.nome == "Militec") then
                        local veh = getPedOccupiedVehicle(source)
                        if (veh) then
                            local health = getElementHealth(veh)
                            if (health >= 1000) then return messageS(source, "Seu veículo não está danificado!", "error") end
                            if (health <= 500) then
                                setElementHealth(veh, health + 500)
                                takeItem(source, item, 1)
                                messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                            else
                                local soma = (1000 - health)
                                setElementHealth(veh, health + soma)
                                takeItem(source, item, 1)
                                messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                            end
                        else
                            messageS(source, "Entre em um veículo para concluir essa ação!", "error")
                        end

                    elseif (v.nome == "Mira") then
                        if not (getElementData(source, "UsandoMira") == true) then
                            setElementData(source, "UsandoMira", true)
                            triggerClientEvent(source, "N3xT.onUseMira", source)
                            takeItem(source, item, 1)
                            messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        else
                            messageS(source, "Você já está usando uma Mira!", "error")
                        end

                    elseif (v.nome == "Kit Reparo") then
                        local veh = getPedOccupiedVehicle(source)
                        if (veh) then
                            local health = getElementHealth(veh)
                            if (health >= 1000) then return messageS(source, "Seu veículo não está danificado!", "error") end
                            fixVehicle(veh)
                            takeItem(source, item, 1)
                            messageS(source, "Você usou 1x #00ff7f"..item.." #ffffffcom sucesso.", "success")
                        else
                            messageS(source, "Entre em um veículo para concluir essa ação!", "error")
                        end
                    end

                elseif (v.tipo == "negro") then
                    if not isPedInVehicle(source) then
                        if (v.nome == "Algemas") then
                            triggerEvent("N3xT.useAlgemas", source)

                        elseif (v.nome == "Capuz") then
                            triggerEvent("N3xT.useCapuz", source)
                        end
                    else
                        messageS(source, "Saia do veículo para concluir essa ação!", "error")
                    end

                elseif (v.tipo == "mascaras") then
                    if not isPedInVehicle(source) then
                        triggerEvent("N3xT.useMasks", source, v.nome)
                    else
                        messageS(source, "Saia do veículo para concluir essa ação!", "error")
                    end

                elseif (v.tipo == "drogas") then
                    if not isPedInVehicle(source) then
                        triggerEvent("N3xT.useDrogas", source, v.nome)
                    else
                        messageS(source, "Saia do veículo para concluir essa ação!", "error")
                    end

                elseif (v.tipo == "armas") then
                    if not isPedInVehicle(source) then
                        triggerEvent("N3xT.useArmas", source, v.nome)
                    else
                        messageS(source, "Saia do veículo para concluir essa ação!", "error")
                    end

                elseif (v.tipo == "municao") then
                    if not isPedInVehicle(source) then
                        if (quantia) and (quantia >= 1) then
                            triggerEvent("N3xT.useAmmo", source, v.nome, quantia)
                        else
                            messageS(source, "Coloque uma quantidade válida!", "error")
                        end
                    else
                        messageS(source, "Saia do veículo para concluir essa ação!", "error")
                    end

                ---------------------------------
                ----- ITENS ADICIONAIS AQUI -----
                ---------------------------------
                elseif (v.tipo == "outros") then
                    
                    if (v.nome == "Capacete Preto") then
                        triggerEvent("Caio.onUseCapacete", source, v.nome)

                    elseif (v.nome == "Capacete Vermelho") then
                        triggerEvent("Caio.onUseCapacete", source, v.nome)

                    elseif (v.nome == "Capacete Rosa") then
                        triggerEvent("Caio.onUseCapacete", source, v.nome)

                    elseif (v.nome == "Capacete Azul") then
                        triggerEvent("Caio.onUseCapacete", source, v.nome)
                    elseif (v.nome == "Radio") then
                        triggerClientEvent(source, "N3xt.onOpenRadio", source)
                    elseif (v.nome == "Skate") then
                            triggerEvent("N3xT.useSkate", source)

                    end
                end
            end
        end
    end

)