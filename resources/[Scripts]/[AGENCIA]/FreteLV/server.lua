MarkerSafeEntregadorDeMaconha = createMarker( 2195.978, -2247.559, 13.547, "cylinder", 100, 0, 255, 0, 0)

EntregadorDeMaconhaPickup = createPickup ( 2195.978, -2247.559, 13.547, 3, 1210)
MarkerEntregadorDeMaconha = createMarker ( 2195.978, -2247.559, 13.547, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerEntregadorDeMaconha, EntregadorDeMaconhaPickup, 0, 0, -1 )

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", EntregadorDeMaconhaPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "hq"
cmd2 = "profissao"

local HQEntregadorDeMaconhaBlip = createBlip ( 2195.978, -2247.559, 13.547 )
setElementVisibleTo ( HQEntregadorDeMaconhaBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQEntregadorDeMaconhaBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Entregador De Maconha" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "Entregador De Maconha" then
	if isElementVisibleTo ( HQEntregadorDeMaconhaBlip, source ) then
	setElementVisibleTo ( HQEntregadorDeMaconhaBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQEntregadorDeMaconhaBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd1, ComandoHQ )

function AceitarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
if getElementData ( source, "AirNew>Encaminhamento" ) == "Entregador De Maconha" then
setElementData ( source, "AirNew>Encaminhamento", false )
setElementData ( source, "Emprego", "Entregador De Maconha" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Transportador#FFFFFF. Digite: #FFFF00/profissao", "success")
else
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
end
end

function RecusarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
if isElementVisibleTo ( HQEntregadorDeMaconhaBlip, source ) then
setElementVisibleTo ( HQEntregadorDeMaconhaBlip, source, false )
end
removeElementData ( source, "Emprego", "Entregador De Maconha" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "Entregador De Maconha" then
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
		if marker == MarkerEntregadorDeMaconha then
		    if getElementData ( source, "Emprego" ) == "Entregador De Maconha" then
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
		if marker == MarkerEntregadorDeMaconha then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function CriarVeiculosComData ()
VeiculosComDataEntregadorDeMaconha = {
createVehicle(408, 2169.78, -2276.839, 13.426, -0, 0, 226.16430664063 ),
createVehicle(408, 2176.073, -2269.002, 13.413, -0, 0, 222.18603515625 ),
createVehicle(408, 2157.551, -2293.51, 13.444, -0, 0, 225.66812133789 ),
createVehicle(408, 2167.119, -2286.075, 13.482, -0, 0, 225.76136779785 ),

}

for i, veh in ipairs(VeiculosComDataEntregadorDeMaconha) do
setElementData ( veh, "Emprego", "Entregador De Maconha" )
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
    if Jogador == "Entregador De Maconha" then	
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Transportadores#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataEntregadorDeMaconha) do
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

atualrotnumberMaconha = {}
ppcikMaconha = {}
blips = {}

rotasMaconha = {
	["Starfish Casino - R$7250"] = {
		{2630.179, 1861.708, 10.82},
	},
	["Whitewood Estates - R$7499"] = {
		{1076.579, 1918.339, 10.82},
	},
}

pay = {
	["Starfish Casino - R$7250"] = 7250,
	["Whitewood Estates - R$7499"] = 7499,
}

function ifPlayerEnterOnMarker(markerHit,matchingDimension)
	if isPedInVehicle(source) then
		if markerHit == ppcikMaconha[source] then
			if (matchingDimension) then
				if isElement(ppcikMaconha[source]) then
					local rname = getElementData(source,"rtnameMaconha") or nil
					if rname == nil then return end
					destroyElement(ppcikMaconha[source])
					triggerClientEvent(source,"AirNew>JOBEntregadorDeMaconha>blips<Client",source,false)
					local vh = getPedOccupiedVehicle(source)
					
					toggleAllControls ( source, false )
					setControlState ( source, "handbrake", true )
					
					if atualrotnumberMaconha[source] <= #rotasMaconha[rname] then
					    exports.dxmessages:outputDx(source, "Descarregando Frete... Aguarde!", "info")
						setTimer(gerarrota,1000,1,source)
					elseif atualrotnumberMaconha[source] == #rotasMaconha[rname]+1 then
						setElementData(source,"rtnameMaconha",rname)
						atualrotnumberMaconha[source] = 1
						local rec = pay[rname]
						givePlayerMoney(source,tonumber(rec))	
						local vh = getPedOccupiedVehicle(source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFCaminhão descarregador! Você recebeu #FFFF00R$"..rec.." #FFFFFFpor finalizar o transporte!", "success") end,2500,1,source)
						setTimer(function(source) toggleAllControls ( source, true ) end, 2500,1, source )
						setTimer(function(source) setControlState ( source, "handbrake", false ) end, 2500,1, source )
						setElementData(source,"rtnameMaconha",nil)	
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
  local rname = getElementData(player,"rtnameMaconha") or nil
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
		    if getElementData ( pl, "Emprego" ) == "Entregador De Maconha" then
			   VerificarCairBike(pl)
			end
		end
	end
end,
3000,0)

function pickjobMaconha(source)
	if not isElement(source) then return end
	local im = isPedInVehicle(source)
	if im == false then return end	
	local job = getElementData(source,"Emprego") or false
	if job == "Entregador De Maconha" then
	local vh = getPedOccupiedVehicle(source)
	if isElement(vh) then
		local x,y = getElementPosition(vh)
		local x1,y1 = getElementPosition(source)
		local dist = getDistanceBetweenPoints2D(x,y,x1,y1)
		local isMarkerSafe = isElementWithinMarker(vh,MarkerSafeEntregadorDeMaconha)
		local id = getElementModel(vh)
		local seat = getPedOccupiedVehicleSeat(source)
		if dist > 0 then return end
		if id == 408 then		
			if seat == 0 then
				if isMarkerSafe == false then return end
				triggerClientEvent(source,"AirNew>JOBEntregadorDeMaconha>AbrirPainel<Client",source,rotasMaconha)
			end
		end
	end
end
end
addCommandHandler("rotas",pickjobMaconha)

function receivert(source,rotaname)
	if isElement(ppcikMaconha[source]) then
		destroyElement(ppcikMaconha[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDeMaconha>blips<Client",source,false)
	setElementData(source,"rtnameMaconha",rotaname)
	atualrotnumberMaconha[source] = 1
	gerarrota(source)
end
addEvent("AirNew>request>Startrota>Server>EntregadorDeMaconha", true)
addEventHandler("AirNew>request>Startrota>Server>EntregadorDeMaconha",getRootElement(), receivert)

function gerarrota(source)
	local rname = getElementData(source,"rtnameMaconha") or nil
	if rname == nil then return end
	if not isElement(ppcikMaconha[source]) and isPedInVehicle(source) then
		local vh = getPedOccupiedVehicle(source)
		toggleAllControls ( source, true )
		setControlState ( source, "handbrake", false )
		local id = tonumber(atualrotnumberMaconha[source])
		local x,y,z = rotasMaconha[rname][id][1],rotasMaconha[rname][id][2],rotasMaconha[rname][id][3]
		ppcikMaconha[source] = createMarker (x, y,z, "checkpoint", 4, 255, 0, 0, 50,source)
		triggerClientEvent(source,"AirNew>JOBEntregadorDeMaconha>blips<Client",source,true,x,y,z)
		atualrotnumberMaconha[source] = id+1
	end
end

function sair ( quitType )
	if isElement(ppcikMaconha[source]) then
		destroyElement(ppcikMaconha[source])
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )

function SairDaBike ( thePlayer, seat, jacked )
   local rname = getElementData(thePlayer,"rtnameMaconha") or nil
   if rname == nil then return end
   canceljobtimer (thePlayer)
   exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFVocê abandonou o veículo e foi demitido!", "warning")
end
addEventHandler ( "onVehicleExit", getRootElement(), SairDaBike )

function canceljobtimer(source)
	if isElement(ppcikMaconha[source]) then
		destroyElement(ppcikMaconha[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDeMaconha>blips<Client",source,false)	
	atualrotnumberMaconha[source] = 1
	setElementData(source,"rtnameMaconha",nil)	
end