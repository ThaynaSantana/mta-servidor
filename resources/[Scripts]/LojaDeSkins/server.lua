local markers = createElement('moren1n_clothesShop')
local identifyMarkers = {}

addEventHandler('onResourceStart', resourceRoot, function()
    for i, v in ipairs(config.shops) do
        local marker = Marker(v[1], v[2], v[3], 'cylinder', 1.0, 0, 0, 0, 0)
        Marker(v[1], v[2], v[3] - 1.0, 'cylinder', 1.0, v[4][1], v[4][2], v[4][3], v[4][4])

        local blip = nil

        if v[5][1] then
            local blip = createBlipAttachedTo(marker, v[5][1])
            blip:setData('blipName', v[5][2])
        end

        marker:setInterior(v[6])
        marker:setDimension(v[7])
        if blip then
            blip:setInterior(v[6])
            blip:setDimension(v[7])
        end

        marker:setParent(markers)
        identifyMarkers[marker] = i
    end
end)

addEventHandler('onMarkerHit', markers, function(player, dim)
    if dim then
        if isElement(player) and getElementType(player) == 'player' and not getPedOccupiedVehicle(player) then
            triggerClientEvent(player, 'moren1n_clothesShop', player, true, identifyMarkers[source])
        end
    end
end)

addEvent('moren1n_clothesShop', true)
addEventHandler('moren1n_clothesShop', root, function(player, type, tab, id)
    if player and type then
        if type == 'buy' then
            if tab and id then
                local lineC = config.shopSubTabs[tab][id]
                if lineC then
                    if player:getModel() ~= lineC[2] then
                        if utilMoney(player, 'verify', lineC[3]) then
                            utilMoney(player, 'remove', lineC[3])

                            player:setModel(lineC[2])

                            exports.bcr_infobox:addNotification(player, 'Você comprou a skin '..lineC[1]..'.', 'Sucesso')
                        else
                            exports.bcr_infobox:addNotification(player,'Você não tem dinheiro.', "Erro")
                        end
                    else
                        exports.bcr_infobox:addNotification(player,'Você já está com essa skin.', "Erro")
                    end
                end
            else
                exports.bcr_infobox:addNotification(player, 'Selecione uma skin da lista.', 'Informação')
            end
        end
    end
end)

function utilMoney(player, type, arg1)
    if config.money[1] then
        money = (player:getData(config.money[2]) or 0)
    else
        money = player:getMoney()
    end
    if type == 'verify' then
        if money >= arg1 then
            return true
        else
            return false
        end
    elseif type == 'add' then
        if config.money[1] then
            player:setData(config.money[2], money + arg1)
        else
            player:giveMoney(arg1)
        end
    elseif type == 'remove' then
        if config.money[1] then
            player:setData(config.money[2], money - arg1)
        else
            player:takeMoney(arg1)
        end
    elseif type == 'get' then
        return money
    end
end