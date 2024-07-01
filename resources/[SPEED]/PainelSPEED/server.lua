local base = createMarker (1579.86, -1635.232, 13.555 -1, "cylinder", 1.1, 0,0,0,255)

function abrirPainelSPEED (source)
  if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("SPEED")) then
    triggerClientEvent(source, "openPainelSPEED", getRootElement())
  end
end
addEventHandler ("onMarkerHit", base, abrirPainelSPEED)

--------------------------------------------------------
------------ [ VEICULOS ]------------------------------

function SPEEDskin01()
 if getElementModel(source) == 51 then
   setElementModel(source,51)
   else
   setElementModel(source,51)
   end
end
addEvent("SPEEDsetskin01",true)
addEventHandler("SPEEDsetskin01",getRootElement(),SPEEDskin01)


function SPEEDskin02()
 if getElementModel(source) == 55 then
   setElementModel(source,55)
   else
   setElementModel(source,55)
   end
end
addEvent("SPEEDsetskin02",true)
addEventHandler("SPEEDsetskin02",getRootElement(),SPEEDskin02)


function SPEEDskin03()
 if getElementModel(source) == 52 then
   setElementModel(source,52)
   else
   setElementModel(source,52)
   end
end
addEvent("SPEEDsetskin03",true)
addEventHandler("SPEEDsetskin03",getRootElement(),SPEEDskin03)


veh = {}
function SPEEDcar()
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(596, 1591.48, -1628.276, 13.383, 0, 0, 90.125)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("SPEEDcarspawn",true)
addEventHandler("SPEEDcarspawn",root,SPEEDcar)



function cardespawnSPEED ()---------DESTRUIR CARRO
destroyElement ( veh[source] )
end
addEvent ("destroycarSPEED", true)
addEventHandler ("destroycarSPEED", getRootElement(), cardespawnSPEED)
--------------------