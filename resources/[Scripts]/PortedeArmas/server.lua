open = createMarker ( 256.46814, 69.46166, 1003.64063 -1, "cylinder", 1.5, 16, 111, 231, 50) 
setElementInterior(open,6)

function AbrirPanel (source)
		triggerClientEvent(source, "AbrirPorte", getRootElement())
	end
addEventHandler( "onMarkerHit", open, AbrirPanel )


----     Parte M4 -------------

function Porte ()
	local PorteArmas = getElementData(source, "TS:PorteDeArmas") or "Não"
	local Procurado = getPlayerWantedLevel(source)
	if PorteArmas == "Sim" then 
	msgFeniX(source, "Você já possui Porte de Armas !", "info")
	else
	if Procurado > 0 then
	msgFeniX(source, "Você esta sendo procurado, portando não pode tirar Porte de Armas !", "info")
	else
	if getPlayerMoney(source) >= 2000 then
	if isElementWithinMarker(source, open) then
	msgFeniX(source, "Para iniciar o teste clique outra vez em Adquirir !", "info")
	takePlayerMoney(source, 1000)
    if not isElementWithinMarker(source, open) then
	msgFeniX(source, "Você não esta no Marker !", "error")
   else
	setElementData (source, "TS:Permitido", "Permitido")
	end
end
else
msgFeniX(source, "Você não possui Dinheiro !", "error")
end
end
end
end
addEvent("Porte", true)
addEventHandler("Porte", getRootElement(), Porte)


--[[                               
                                   ################################################
                                   #                     DxMensagem               #                                                                
                                   ################################################
--]]

function msgFeniX(source, text, type)
	exports.dxmessages:outputDx(source, text, type)
end