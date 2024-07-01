local base = createMarker (2495.474, -1690.722, 14.766 -1, "cylinder", 1.1, 0,0,0,255)

function abrirPainelGROTA (source)
  if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("GROTA")) then
    triggerClientEvent(source, "openPainelGROTA", getRootElement())
  end
end
addEventHandler ("onMarkerHit", base, abrirPainelGROTA)

--------------------------------------------------------
------------ [ VEICULOS ]------------------------------

function GROTAskin01()
 if getElementModel(source) == 44 then
   setElementModel(source,44)
   else
   setElementModel(source,44)
   end
end
addEvent("GROTAsetskin01",true)
addEventHandler("GROTAsetskin01",getRootElement(),GROTAskin01)


function GROTAskin02()
 if getElementModel(source) == 217 then
   setElementModel(source,217)
   else
   setElementModel(source,217)
   end
end
addEvent("GROTAsetskin02",true)
addEventHandler("GROTAsetskin02",getRootElement(),GROTAskin02)


function GROTAskin03()
 if getElementModel(source) == 45 then
   setElementModel(source,45)
   else
   setElementModel(source,45)
   end
end
addEvent("GROTAsetskin03",true)
addEventHandler("GROTAsetskin03",getRootElement(),GROTAskin03)


veh = {}
function GROTAcar()
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(598, 2480.572, -1702.436, 13.53, 0, 0, 352.686)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("GROTAcarspawn",true)
addEventHandler("GROTAcarspawn",root,GROTAcar)

function cardespawnGROTA ()---------DESTRUIR CARRO
destroyElement ( veh[source] )
end
addEvent ("destroycarGROTA", true)
addEventHandler ("destroycarGROTA", getRootElement(), cardespawnGROTA)
--------------------