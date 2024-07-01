addEvent("N3xT.onStartPortaMalas", true)
addEvent("N3xT.onMovePortaMalas", true)

addEventHandler("N3xT.onStartPortaMalas", root,
    function(veh, x, y, z)
        if not isGuestAccount(getPlayerAccount(source)) then
            if not isPedInVehicle(source) then
                if (getVehicleDoorOpenRatio(veh, 1) == 0) then
                    setVehicleDoorOpenRatio(veh, 1, 1, 500)
                    triggerClientEvent(source, "N3xT.onPortaMalas", source, veh)
                    triggerClientEvent(source, "N3xT.onPortaMalasSound", source, x, y, z)
				else
                    setVehicleDoorOpenRatio(veh, 1, 0, 500)
                end
            end
	    else
		    messageS(source, "Você precisa estar logado para abrir o inventário!", "error")
        end
    end
)

addEventHandler("N3xT.onMovePortaMalas", root,
    function(veh, item, quantia, lado)
        if (veh) then
            if (lado == "player") then
                sourceGivePortaMalas(source, veh, item, quantia)
            elseif (lado == "vehicle") then
                vehicleGivePortaMalas(veh, source, item, quantia)
            end
        else
            messageC("Ocorreu um erro ao fazer a ação no porta malas!", "error")
        end
    end
)

function sourceGivePortaMalas(source, veh, item, quantia)
    local data = getElementData(source, item)
    if tonumber(data) and (data >= quantia) then
        local pesop   = getElementData(veh, "Peso") or 0
        local mochila = getElementData(veh, "Mochila") or 30
        local pesop2  = (findPesoByName(item) * quantia)
        local soma    = (pesop + pesop2)
        if (soma <= mochila) then
            local datap  = getElementData(veh, item) or 0
            local soma2  = (datap + quantia)
            local index  = getIndexByName(item)
            local peso = getElementData(source, "Peso")
            setElementData(source, item, data - quantia)
            setElementData(source, "Peso", peso - pesop2)
            setElementData(veh, item, soma2)
            setElementData(veh, "Peso", soma)
            triggerClientEvent(root, "N3xT.onRefreshGridPortaMalas", root, veh)
            messageS(source, "Você colocou "..quantia.."x #00ff7f"..item.." #ffffffno porta malas.", "success")
        else
            messageS(source, "O porta malas tem espaço para esse item!", "error")
        end
    else
        messageS(source, "Você não possuí essa quantidade!", "error")
    end
end

function vehicleGivePortaMalas(veh, source, item, quantia)
    local data = getElementData(veh, item)
    if tonumber(data) and (data >= quantia) then
        local pesop   = getElementData(source, "Peso") or 0
        local mochila = getElementData(source, "Mochila") or 4
        local pesop2  = (findPesoByName(item) * quantia)
        local soma    = (pesop + pesop2)
        if (soma <= mochila) then
            local datap  = getElementData(source, item) or 0
            local soma2  = (datap + quantia)
            local limite = getMaxItemByName(item)
            local index  = getIndexByName(item)
            if (soma2 <= limite) then
                if not isItemEquipped(source, item) then
                    local peso = getElementData(veh, "Peso")
                    setElementData(veh, item, data - quantia)
                    setElementData(veh, "Peso", peso - pesop2)
                    setElementData(source, item, soma2)
                    setElementData(source, "Peso", soma)
                    triggerClientEvent(root, "N3xT.onRefreshGridPortaMalas", root, veh)
                    messageS(source, "Você pegou "..quantia.."x #00ff7f"..item.." #ffffffno porta malas.", "success")
                else
                    messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
                end
            else
                messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
            end
        else
            messageS(source, "Sua mochila não tem espaço para esse item!", "error")
        end
    else
        messageS(source, "O porta malas não possuí essa quantidade!", "error")
    end
end