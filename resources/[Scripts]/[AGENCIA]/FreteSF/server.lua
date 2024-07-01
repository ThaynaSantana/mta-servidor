MarkerSafeEntregadorDeEtanol = createMarker( 864.363, -1235.901, 14.841, "cylinder", 100, 0, 255, 0, 0)

EntregadorDeEtanolPickup = createPickup ( 864.363, -1235.901, 14.841, 3, 1210)
MarkerEntregadorDeEtanol = createMarker ( 864.363, -1235.901, 14.841, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerEntregadorDeEtanol, EntregadorDeEtanolPickup, 0, 0, -1 )

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", EntregadorDeEtanolPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "hq"
cmd2 = "profissao"

local HQEntregadorDeEtanolBlip = createBlip ( 864.363, -1235.901, 14.841 )
setElementVisibleTo ( HQEntregadorDeEtanolBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQEntregadorDeEtanolBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Entregador De Etanol" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "Entregador De Etanol" then
	if isElementVisibleTo ( HQEntregadorDeEtanolBlip, source ) then
	setElementVisibleTo ( HQEntregadorDeEtanolBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQEntregadorDeEtanolBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd1, ComandoHQ )

function AceitarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
if getElementData ( source, "AirNew>Encaminhamento" ) == "Entregador De Etanol" then
setElementData ( source, "AirNew>Encaminhamento", false )
setElementData ( source, "Emprego", "Entregador De Etanol" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Transportador#FFFFFF. Digite: #FFFF00/profissao", "success")
else
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
end
end

function RecusarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
if isElementVisibleTo ( HQEntregadorDeEtanolBlip, source ) then
setElementVisibleTo ( HQEntregadorDeEtanolBlip, source, false )
end
removeElementData ( source, "Emprego", "Entregador De Etanol" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "Entregador De Etanol" then
playSoundFrontEnd ( ThePlayer, 43 )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/hq #FFFFFF- Para marcar/desmarcar o seu local de trabalho", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/rotas #FFFFFF- Abre a lista de rotas disponíveis", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFEntre no caminhão, selecione uma rota, aperte F11 e siga até o #FF0000checkpoint", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSe você abandonar o caminhão, será demitido!", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
end
end
addCommandHandler(cmd2, ComandosProf )

function emarker(marker,md) 
	if (md) then
	  if isPedInVehicle ( source ) then return end
		if marker == MarkerEntregadorDeEtanol then
		    if getElementData ( source, "Emprego" ) == "Entregador De Etanol" then
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para se demitir")
			bindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		else
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para aceitar o emprego")
			bindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
		end
	 end
  end	
end
addEventHandler("onPlayerMarkerHit",getRootElement(),emarker)

function lmarker(marker,md)
	if (md) then
		if marker == MarkerEntregadorDeEtanol then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function CriarVeiculosComData ()
VeiculosComDataEntregadorDeEtanol = {
createVehicle(408, 869, -1257.654, 15, 0, 0, 270 ),
createVehicle(408, 869, -1257.654+5, 15, 0, 0, 270 ),
createVehicle(408, 869, -1257.654+10, 15, 0, 0, 270 ),
createVehicle(408, 869, -1257.654+15, 15, 0, 0, 270 ),

}

for i, veh in ipairs(VeiculosComDataEntregadorDeEtanol) do
setElementData ( veh, "Emprego", "Entregador De Etanol" )
setVehicleDamageProof(veh,true)
setVehicleColor( veh, 0, 0, 0 )
setVehiclePlateText ( veh, "RPGAMING" )
addEventHandler("onVehicleStartEnter", veh, VerificarEmprego )
local tx, ty, tz = getElementPosition(veh)
local rx, ry, rz = getElementRotation(veh)
setVehicleRespawnPosition(veh, tx, ty, tz, rx, ry, rz)
end
end
addEventHandler("onResourceStart", resourceRoot, CriarVeiculosComData )

function VerificarEmprego (thePlayer, seat)
local Jogador = getElementData(thePlayer, "Emprego" )
if seat == 0 then
    if Jogador == "Entregador De Etanol" then	
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Transportadores#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataEntregadorDeEtanol) do
        if isEmpty( veh ) then 
                respawnVehicle ( veh ) 
            end 
        end 
    end
setTimer(respawnVehicles, 20000,0)

function isEmpty( vehicle ) 
    local passengers = getVehicleMaxPassengers( vehicle ) 
    if type( passengers ) == 'number' then 
        for seat = 0, passengers do 
            if getVehicleOccupant( vehicle, seat ) then 
                return false 
            end 
        end 
    end 
    return true 
end

atualrotnumberETANOL = {}
ppcikETANOL = {}
blips = {}

rotasETANOL = {
	["Easter Bay Airport - R$5999"] = {
		{-1425.415, -291.822, 14.148},
	},
	["Battery Point - R$6599"] = {
		{-2641.771, 1376.431, 7.151},
	},
}

pay = {
	["Easter Bay Airport - R$5999"] = 5999,
	["Battery Point - R$6599"] = 6599,
}

function ifPlayerEnterOnMarker(markerHit,matchingDimension)
	if isPedInVehicle(source) then
		if markerHit == ppcikETANOL[source] then
			if (matchingDimension) then
				if isElement(ppcikETANOL[source]) then
					local rname = getElementData(source,"rtnameEtanol") or nil
					if rname == nil then return end
					destroyElement(ppcikETANOL[source])
					triggerClientEvent(source,"AirNew>JOBEntregadorDeEtanol>blips<Client",source,false)
					local vh = getPedOccupiedVehicle(source)
					
					toggleAllControls ( source, false )
					setControlState ( source, "handbrake", true )
					
					if atualrotnumberETANOL[source] <= #rotasETANOL[rname] then
					    exports.dxmessages:outputDx(source, "Descarregando Frete... Aguarde!", "info")
						setTimer(gerarrota,1250,1,source)
					elseif atualrotnumberETANOL[source] == #rotasETANOL[rname]+1 then
						setElementData(source,"rtnameEtanol",rname)
						atualrotnumberETANOL[source] = 1
						local rec = pay[rname]
						givePlayerMoney(source,tonumber(rec))	
						local vh = getPedOccupiedVehicle(source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFCaminhão descarregado! Você recebeu #FFFF00R$"..rec.." #FFFFFFpor finalizar o transporte!", "success") end,1250,1,source)
						setTimer(function(source) toggleAllControls ( source, true ) end, 2500,1, source )
						setTimer(function(source) setControlState ( source, "handbrake", false ) end, 1250,1, source )
						setElementData(source,"rtnameEtanol",nil)	
					end

					
				end

			end	
		end
	end
end
addEventHandler("onPlayerMarkerHit",getRootElement(),ifPlayerEnterOnMarker)

function VerificarCairBike(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  local rname = getElementData(player,"rtnameEtanol") or nil
  if rname == nil then
  triggerClientEvent ( "Desligar:AntiQueda", player )
  else
  triggerClientEvent ( "Ligar:AntiQueda", player )
  end
 end		
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Entregador De Etanol" then
			   VerificarCairBike(pl)
			end
		end
	end
end,
3000,0)

function pickjobEtanol(source)
	if not isElement(source) then return end
	local im = isPedInVehicle(source)
	if im == false then return end	
	local job = getElementData(source,"Emprego") or false
	if job == "Entregador De Etanol" then
	local vh = getPedOccupiedVehicle(source)
	if isElement(vh) then
		local x,y = getElementPosition(vh)
		local x1,y1 = getElementPosition(source)
		local dist = getDistanceBetweenPoints2D(x,y,x1,y1)
		local isMarkerSafe = isElementWithinMarker(vh,MarkerSafeEntregadorDeEtanol)
		local id = getElementModel(vh)
		local seat = getPedOccupiedVehicleSeat(source)
		if dist > 0 then return end
		if id == 408 then		
			if seat == 0 then
				if isMarkerSafe == false then return end
				triggerClientEvent(source,"AirNew>JOBEntregadorDeEtanol>AbrirPainel<Client",source,rotasETANOL)
			end
		end
	end
end
end
addCommandHandler("rotas",pickjobEtanol)

function receivert(source,rotaname)
	if isElement(ppcikETANOL[source]) then
		destroyElement(ppcikETANOL[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDeEtanol>blips<Client",source,false)
	setElementData(source,"rtnameEtanol",rotaname)
	atualrotnumberETANOL[source] = 1
	gerarrota(source)
end
addEvent("AirNew>request>Startrota>Server>EntregadorDeEtanol", true)
addEventHandler("AirNew>request>Startrota>Server>EntregadorDeEtanol",getRootElement(), receivert)

function gerarrota(source)
	local rname = getElementData(source,"rtnameEtanol") or nil
	if rname == nil then return end
	if not isElement(ppcikETANOL[source]) and isPedInVehicle(source) then
		local vh = getPedOccupiedVehicle(source)
		toggleAllControls ( source, true )
		setControlState ( source, "handbrake", false )
		local id = tonumber(atualrotnumberETANOL[source])
		local x,y,z = rotasETANOL[rname][id][1],rotasETANOL[rname][id][2],rotasETANOL[rname][id][3]
		ppcikETANOL[source] = createMarker (x, y,z, "checkpoint", 4, 255, 0, 0, 50,source)
		triggerClientEvent(source,"AirNew>JOBEntregadorDeEtanol>blips<Client",source,true,x,y,z)
		atualrotnumberETANOL[source] = id+1
	end
end

function sair ( quitType )
	if isElement(ppcikETANOL[source]) then
		destroyElement(ppcikETANOL[source])
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )

function SairDaBike ( thePlayer, seat, jacked )
   local rname = getElementData(thePlayer,"rtnameEtanol") or nil
   if rname == nil then return end
   canceljobtimer (thePlayer)
   exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFVocê abandonou o veículo e foi demitido!", "warning")
end
addEventHandler ( "onVehicleExit", getRootElement(), SairDaBike )

function canceljobtimer(source)
	if isElement(ppcikETANOL[source]) then
		destroyElement(ppcikETANOL[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDeEtanol>blips<Client",source,false)	
	atualrotnumberETANOL[source] = 1
	setElementData(source,"rtnameEtanol",nil)	
end