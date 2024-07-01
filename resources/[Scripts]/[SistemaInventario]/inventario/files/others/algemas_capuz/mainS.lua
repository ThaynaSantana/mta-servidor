addEvent("N3xT.useAlgemas", true)
addEvent("N3xT.useCapuz", true)

addEventHandler("N3xT.useAlgemas", root,
    function()
        for i, v in ipairs(config.gruposalgemar) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                for _, player in ipairs(getElementsByType("player")) do
                    local x, y, z    = getElementPosition(player)
                    local x1, y1, z1 = getElementPosition(source)
                    if (getDistanceBetweenPoints3D(x1, y1, z1, x, y, z) <= 2) then
                        if (player ~= source) then
                            local name = getPlayerName(player)
                            if not (getElementData(player, "Algemado") == true) then
                                if not isPedInVehicle(player) then
                                    setElementData(player, "Algemado", true)
                                    setElementFrozen(player, true)
                                    takeItem(source, "Algemas", 1)
                                    messageS(source, "Você algemou o Jogador "..name.."#ffffff, para desalgemar #ff0000/desalgemar ID#ffffff.", "success")
                                    break
                                end
                            else
                                messageS(source, "Esse Jogador já está algemado!", "error")
                            end
                        end
                    else
                        messageS(source, "Você não está perto de um Jogador!", "error")
                    end
                end
            end
        end
    end
)

addCommandHandler("desalgemar",
    function(source, cmd, id)
        for i, v in ipairs(config.gruposalgemar) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                local id_v = tonumber(id)
                if (id_v) then
                    local player = getPlayerID(id_v)
                    if (player) then
                        if (getElementData(player, "Algemado") == true) then
                            local x, y, z    = getElementPosition(player)
                            local x1, y1, z1 = getElementPosition(source)
                            if (getDistanceBetweenPoints3D(x1, y1, z1, x, y, z) <= 2) then
                                if not isPedInVehicle(player) then
                                    removeElementData(player, "Algemado")
                                    setElementFrozen(player, false)
                                    setPedAnimation(player)
                                    giveItem(source, "Algemas", 1)
                                    break
                                end
                            else
                                messageS(source, "Chegue mais perto do Jogador!", "error")	
                            end
                        else
                            messageS(source, "Esse Jogador não está algemado!", "error")
                        end
                    else
                        messageS(source, "Jogador não encontrado!", "error")
                    end
                else
                    messageS(source, "Coloque um ID válido!", "error")
                end
            end
        end
    end
)

addEventHandler("N3xT.useCapuz", root,
    function()
        for _, v in ipairs(config.gruposcapuz) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                for _, player in ipairs(getElementsByType("player")) do
                    local x, y, z    = getElementPosition(player)
                    local x1, y1, z1 = getElementPosition(source)
                    if (getDistanceBetweenPoints3D(x1, y1, z1, x, y, z) <= 2) then
                        if (player ~= source) then
                            if not isPedInVehicle(player) then
                                if not (getElementData(player, "Encapuzado") == true) then
                                    local name = getPlayerName(player)
                                    setElementData(player, "Encapuzado", true)
                                    triggerClientEvent(player, "N3xT.onCapuz", player, 1)
                                    takeItem(source, "Capuz", 1)
                                    messageS(source, "Você encapuzou o Jogador "..name.."#ffffff, para desencapuzar #ff0000/retirarcapuz ID#ffffff.", "success")
                                    break
                                else
                                    messageS(source, "O Jogador já está encapuzado!", "error")
                                end
                            end
                        end
                    else
                        messageS(source, "Não foi possível encontrar um Jogador por perto!", "error")
                    end
                end
            end
        end 
    end
)

addCommandHandler("retirarcapuz",
    function(source, cmd, id)
        for i, v in ipairs(config.gruposcapuz) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                local id_v = tonumber(id)
                if (id_v) then
                    local player = getPlayerID(id_v)
                    if (player) then
                        if (getElementData(player, "Encapuzado") == true) then
                            local x, y, z    = getElementPosition(player)
                            local x1, y1, z1 = getElementPosition(source)
                            if (getDistanceBetweenPoints3D(x1, y1, z1, x, y, z) <= 2) then
                                if not isPedInVehicle(player) then
                                    removeElementData(player, "Encapuzado")
                                    triggerClientEvent(player, "N3xT.onCapuz", player, 2)
                                    giveItem(source, "Capuz", 1)
                                    break
                                end
                            else
                                messageS(source, "Chegue mais perto do Jogador!", "error")	
                            end
                        else
                            messageS(source, "Esse Jogador não está encapuzado!", "error")
                        end
                    else
                        messageS(source, "Jogador não encontrado!", "error")
                    end
                else
                    messageS(source, "Coloque um ID válido!", "error")
                end
            end
        end
    end
)