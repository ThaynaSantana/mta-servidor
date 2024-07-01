-- SPEED
Spawn = createMarker(1595.5343017578, -1709.9899902344, 5.890625 -1,"cylinder", 1.9, 255, 140, 0, 99)  ----- marker para pegar o carro
Destroy = createMarker(1586.3822021484, -1677.9672851562, 5.8969912528992 -1,"cylinder", 4.9, 128, 0, 0, 99)  ----- marker para destruir o carro

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "SPEED") ) then
 	veh[thePlayer] = createVehicle(596, 1596.0588378906, -1683.5079345703, 5.890625, 0, 0, 0)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "Viatura da speed criada com sucesso!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "Erro: Voce nao e da speed!!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VEICULO DESTRUIDO COM SUCESSO!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)
-- PMBA

Spawn = createMarker(1591.3642578125, -1709.8135986328, 5.890625 -1,"cylinder", 1.9, 255, 140, 0, 99)  ----- marker para pegar o carro
Destroy = createMarker(1586.3822021484, -1677.9672851562, 5.8969912528992 -1,"cylinder", 4.9, 128, 0, 0, 99)  ----- marker para destruir o carro

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "PMBA") ) then
 	veh[thePlayer] = createVehicle(597, 1596.0588378906, -1683.5079345703, 5.890625, 0, 0, 0)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "Viatura da pmba criada com sucesso!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "Erro: Voce nao e da pmba!!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VEICULO DESTRUIDO COM SUCESSO!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)

-- POLICIA CIVIL DE SP
Spawn = createMarker(1587.1693115234, -1709.7579345703, 5.890625 -1,"cylinder", 1.9, 255, 140, 0, 99)  ----- marker para pegar o carro
Destroy = createMarker(1586.3822021484, -1677.9672851562, 5.8969912528992 -1,"cylinder", 4.9, 128, 0, 0, 99)  ----- marker para destruir o carro

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "CORE") ) then
 	veh[thePlayer] = createVehicle(598, 1596.0588378906, -1683.5079345703, 5.890625, 0, 0, 0)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "Viatura da core criada com sucesso!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "Erro: Voce nao e da core!!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VEICULO DESTRUIDO COM SUCESSO!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)

-- BOPE
Spawn = createMarker(1583.2899169922, -1709.5776367188, 5.890625 -1,"cylinder", 1.9, 255, 140, 0, 99)  ----- marker para pegar o carro
Destroy = createMarker(1586.3822021484, -1677.9672851562, 5.8969912528992 -1,"cylinder", 4.9, 128, 0, 0, 99)  ----- marker para destruir o carro

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "BOPE") ) then
 	veh[thePlayer] = createVehicle(599, 1596.0588378906, -1683.5079345703, 5.890625, 0, 0, 0)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "Viatura da bope criada com sucesso!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "Erro: Voce nao e da bope!!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VEICULO DESTRUIDO COM SUCESSO!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)

-- RONDESP
Spawn = createMarker(1578.2553710938, -1709.6488037109, 5.890625 -1,"cylinder", 1.9, 255, 140, 0, 99)  ----- marker para pegar o carro
Destroy = createMarker(1586.3822021484, -1677.9672851562, 5.8969912528992 -1,"cylinder", 4.9, 128, 0, 0, 99)  ----- marker para destruir o carro

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "RONDESP") ) then
 	veh[thePlayer] = createVehicle(490, 1596.0588378906, -1683.5079345703, 5.890625, 0, 0, 0)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "Viatura da rondesp criada com sucesso!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "Erro: Voce nao e da rondesp!!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VEICULO DESTRUIDO COM SUCESSO!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)

-- PMERJ
Spawn = createMarker(1574.0881347656, -1709.7260742188, 5.890625 -1,"cylinder", 1.9, 255, 140, 0, 99)  ----- marker para pegar o carro
Destroy = createMarker(1586.3822021484, -1677.9672851562, 5.8969912528992 -1,"cylinder", 4.9, 128, 0, 0, 99)  ----- marker para destruir o carro

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


veh = {}
function spawnvtr ( thePlayer, comando, nick )
	if veh[thePlayer] and isElement( veh[thePlayer] ) then destroyElement ( veh[thePlayer] )
veh[thePlayer] = nil
end
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "PMERJ") ) then
 	veh[thePlayer] = createVehicle(566, 1596.0588378906, -1683.5079345703, 5.890625, 0, 0, 0)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "Viatura da pmerj criada com sucesso!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "Erro: Voce nao e da pmerj!!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VEICULO DESTRUIDO COM SUCESSO!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)