mrk = createMarker(Config['Marker'][1], Config['Marker'][2], Config['Marker'][3] -1, 'cylinder', 1.6, 255, 255, 255, 50)

addEventHandler('onMarkerHit', mrk, function(element)
    if getElementType(element) == 'player' then
        triggerClientEvent(element, 'openPainel', element)
    end
end)

addEvent('onClothes', true)
addEventHandler('onClothes', root, function(player, infos)
    setElementModel(player, infos.idskin)
    outputChatBox('Você pegou a farda ( '..infos.nameSkin..' )', player, 255, 255, 255, true)
end)

addEvent('onPoliceCar', true)
addEventHandler('onPoliceCar', root, function(player, infos)
    if isElement(veh) then
        destroyElement(veh)
    end
    veh = createVehicle(infos.idcar, Config['PosVehicle'][1], Config['PosVehicle'][2], Config['PosVehicle'][3])
    setElementRotation(veh, 0, 0, Config['PosVehicle'][4])
    warpPedIntoVehicle(player, veh)
    outputChatBox('Você pegou a Viatura ( '..infos.nameViatura..' )', player, 255, 255, 255, true)
end)

addEvent('onWeaponArsenal', true)
addEventHandler('onWeaponArsenal', root, function(player, infos)
    giveWeapon(player, infos.idweapon, 100)
    outputChatBox('Você pegou a Arma ( '..infos.nameWeapon..' )', player, 255, 255, 255, true)
end)