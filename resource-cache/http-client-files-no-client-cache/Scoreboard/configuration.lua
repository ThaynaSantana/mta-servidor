config = {
    toggleKey = 'tab'; -- Tecla para abrir o scoreboard.
    cooldown = 4; -- Tempo de espera para abrir o scoreboard novamente.
    eventNotification = 'MST.sendPlayerNotification'; -- Evento da notificação.
    colorServer = {0, 255, 50}; -- Cor {R, G, B} do servidor.
    services = { -- Serviços que serão exibidos.
        mechanic = 'capone:mechanic'; -- Element data do serviço de mecânico.
        police = 'capone:police'; -- Element data do serviço de polícia.
        ambulance = 'capone:ambulance'; -- Element data do serviço de ambulância.
    };
    elementAvatar = 'ic-avatar'; -- Element data do avatar.
    elementId = 'ID'; -- Element data do ID.
    elementLevel = 'level'; -- Element data do level.
}

-- resource's function's
function createEventHandler (eventName, ...)
    addEvent (eventName, true)
    addEventHandler (eventName, ...)
end

function getCountFromServices (service)
    if (not service) then
        return outputDebugString ('['..getResourceName (getThisResource ( ))..']: Falha ao contar serviços, serviço não especificado.', 4, 255, 50, 50)
    end
    if (not config.services[service]) then
        return outputDebugString ('['..getResourceName (getThisResource ( ))..']: Falha ao contar serviços, serviço não encontrado.', 4, 255, 50, 50)
    end
    local count = 0;
    for _, v in ipairs (getElementsByType ('player')) do
        if (getElementData (v, config.services[service])) then
            count = count + 1;
        end
    end
    return count
end

function sendMessage (srctype, ...)
    if (not srctype) then
        return outputDebugString ('['..getResourceName (getThisResource ( ))..']: Falha ao enviar mensagem, tipo de origem não especificado.', 4, 255, 50, 50)
    end
    if (srctype == 'client') then
        triggerEvent (config.eventNotification, localPlayer, ...)
        return true
    elseif (srctype == 'server') then
        local element, message, type = ...
        triggerClientEvent (element, config.eventNotification, ...)
        return true
    end
end