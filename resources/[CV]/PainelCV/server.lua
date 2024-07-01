local base = createMarker (1505.359, -695.076, 94.75 -1, "cylinder", 1.1, 0,0,0,255)

function abrirPainelCV (source)
  if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("CV")) then
    triggerClientEvent(source, "openPainelCV", getRootElement())
  end
end
addEventHandler ("onMarkerHit", base, abrirPainelCV)

--------------------------------------------------------
------------ [ VEICULOS ]------------------------------

function CVskin01()
 if getElementModel(source) == 200 then
   setElementModel(source,200)
   else
   setElementModel(source,200)
   end
end
addEvent("CVsetskin01",true)
addEventHandler("CVsetskin01",getRootElement(),CVskin01)


function CVskin02()
 if getElementModel(source) == 201 then
   setElementModel(source,201)
   else
   setElementModel(source,201)
   end
end
addEvent("CVsetskin02",true)
addEventHandler("CVsetskin02",getRootElement(),CVskin02)

veh = {}
function CVcar()
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(579, 1484.986, -688.963, 94.75, 0, 0, 274.835)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("CVcarspawn",true)
addEventHandler("CVcarspawn",root,CVcar)

function cardespawnCV ()---------DESTRUIR CARRO
destroyElement ( veh[source] )
end
addEvent ("destroycarCV", true)
addEventHandler ("destroycarCV", getRootElement(), cardespawnCV)
--------------------