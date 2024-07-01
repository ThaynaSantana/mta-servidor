function criminal ()
local dinheiro = getPlayerMoney(source)
if (dinheiro >= 2500) then
setPlayerWantedLevel (source,0)
takePlayerMoney(source, 2500)
outputChatBox("#1C86EE[INFO] #FFFFFFSua ficha criminal foi limpa por #00FF00R$2500", source, 255, 255, 255, true)
else
outputChatBox("#1C86EE[INFO] #FFFFFFVocê não tem dinheiro suficiente para limpar sua ficha criminal",source,255,255,255,true)
outputChatBox("#1C86EE[INFO] #FFFFFFPreço: #00FF00R$2500",source,255,255,255,true)
end
end
addEvent("criminal", true)
addEventHandler("criminal", root, criminal)

createBlip(1544,-1675,14,30)
local crime = createMarker(1544,-1675,12.5, "cylinder", 1.5,30, 144, 255, 50)

function abrir(source)
triggerClientEvent (source, "ficha2", source)
end
addEventHandler ("onMarkerHit", crime, abrir)

createBlip(2043,-1429,18,30)
local crime2 = createMarker(2043,-1429,16.2, "cylinder", 1.5,30, 144, 255, 50)

function abrir2(source)
triggerClientEvent (source, "ficha2", source)
end
addEventHandler ("onMarkerHit", crime2, abrir2)

createBlip(1186,-1324,14,30)
local crime3 = createMarker(1186,-1324,12.5, "cylinder", 1.5,30, 144, 255, 50)

function abrir3(source)
triggerClientEvent (source, "ficha2", source)
end
addEventHandler ("onMarkerHit", crime3, abrir3)