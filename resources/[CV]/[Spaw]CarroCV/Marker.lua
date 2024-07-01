Spawn = createMarker(2510.2302246094,-1554.2442626953,24.055364608765 -1,"cylinder", 1.9, 255, 140, 0, 99)
Destroy = createMarker(2517.201171875,-1555.6759033203,24.055364608765 -2,"cylinder", 5.0, 128, 0, 0, 99)

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
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "CV") ) then
 	veh[thePlayer] = createVehicle(579, 2523.3598632813,-1553.4541015625,24.055364608765, -0, 0, 0.93193572759628)
 	warpPedIntoVehicle ( thePlayer, veh[thePlayer] )
 	exports._infobox:addNotification(thePlayer, "VOCE PEGOU O CARRO DA CV CUIDADO COM OS CANA!", "success")
 else
 	exports._infobox:addNotification(thePlayer, "VAZA FDP VC NÃO É DA CV PARA PEGAR O CARRO COMÉDIA!", "error")
	end
end
addEventHandler("onMarkerHit", Spawn, spawnvtr)


function destroyvtr ( thePlayer )
if veh[thePlayer] and isElement(veh[thePlayer]) then
destroyElement (veh[thePlayer])
exports._infobox:addNotification(thePlayer, "VOCE DESTRUI O CARRO DA CV!!", "success")
else
end
end
addEventHandler("onMarkerHit", Destroy, destroyvtr)