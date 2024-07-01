local bike = {}


addEvent('Pedro.alugarBike', true)
addEventHandler('Pedro.alugarBike', root, 
    function(player, money)
        if getPlayerMoney(player) >= money then 
            if isElement(bike[player]) then 
                destroyElement(bike[player])
            end
            takePlayerMoney(player, money)
            local pos = {getElementPosition(player)}
            bike[player] = createVehicle(config.IDbike, pos[1] + 5, pos[2], pos[3])
            warpPedIntoVehicle(player, bike[player])
            triggerClientEvent(player, 'Pedro.printAluguel', player)
            message(player, 'Você alugou uma bicicleta, caso fique fora dela por 1 minuto será devolvida.', 'success')
        else 
            message(player, 'Você não tem dinheiro suficiente.', 'error')
        end
    end
)

Timer = {}
addEventHandler('onVehicleStartExit', root, 
    function(ped)
        if isElement(bike[ped]) then 
            if (source == bike[ped]) then 
                if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
                Timer[ped] = setTimer(function()
                    if isElement(bike[ped]) then 
                        destroyElement(bike[ped])
                    end
                end, config.Tempo * 60000, 1)
            end
        end
    end
)

addEventHandler('onPlayerQuit', root, 
    function()
        if isElement(bike[source]) then 
            destroyElement(bike[source])
        end
    end
)

addEventHandler('onVehicleStartEnter', root, 
    function(ped)
        if isElement(bike[ped]) then
            if (source == bike[ped]) then 
                if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
            end
        end
    end
)
------------------------------------------------------------------------------------------------------------------------------------------------------------
local pontos = {}
local index = {}

for i, v in ipairs(config.locais) do 
    pontos[i] = exports["i9_marker"]:createMarker("bike", Vector3 {v[1], v[2], v[3]-0.9})

    addEventHandler('onMarkerHit', pontos[i], 
        function(player)
            if isElement(player) and (getElementType(player) == 'player') then 
                triggerClientEvent(player, 'Pedro.printAluguel', player)
            end
        end
    )
end

function message(player, text, type)
    triggerClientEvent(player, "addBox", player, text, type)
end