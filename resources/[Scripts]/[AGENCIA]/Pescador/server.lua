MarkerSafeEntregadorDePescador = createMarker( 707.83, -1912.334, 2.214, "cylinder", 100, 0, 255, 0, 0)

EntregadorDePescadorPickup = createPickup ( 707.83, -1912.334, 2.214, 3, 1210)
MarkerEntregadorDePescador = createMarker ( 707.83, -1912.334, 2.214, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerEntregadorDePescador, EntregadorDePescadorPickup, 0, 0, -1 )

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", EntregadorDePescadorPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "hq"
cmd2 = "profissao"

local HQEntregadorDePescadorBlip = createBlip ( 707.83, -1912.334, 2.214 )
setElementVisibleTo ( HQEntregadorDePescadorBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQEntregadorDePescadorBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Entregador de Pescador" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "Entregador de Pescador" then
	if isElementVisibleTo ( HQEntregadorDePescadorBlip, source ) then
	setElementVisibleTo ( HQEntregadorDePescadorBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQEntregadorDePescadorBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd1, ComandoHQ )

function AceitarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
if getElementData ( source, "AirNew>Encaminhamento" ) == "Entregador de Pescador" then
setElementData ( source, "AirNew>Encaminhamento", false )
setElementData ( source, "Emprego", "Entregador de Pescador" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Pescador#FFFFFF. Digite: #FFFF00/profissao", "success")
else
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
end
end

function RecusarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
if isElementVisibleTo ( HQEntregadorDePescadorBlip, source ) then
setElementVisibleTo ( HQEntregadorDePescadorBlip, source, false )
end
removeElementData ( source, "Emprego", "Entregador de Pescador" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "Entregador de Pescador" then
playSoundFrontEnd ( ThePlayer, 43 )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFEntre no barco, selecione uma rota, aperte F11 e siga os #FF0000checkpoints", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSe você abandonar o barco, será demitido", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/rotas #FFFFFF- Abre a lista de rotas disponíveis para pesca", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/hq #FFFFFF- Para marcar/desmarcar o seu local de trabalho", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
end
end
addCommandHandler(cmd2, ComandosProf )

function emarker(marker,md) 
	if (md) then
	  if isPedInVehicle ( source ) then return end
		if marker == MarkerEntregadorDePescador then
		    if getElementData ( source, "Emprego" ) == "Entregador de Pescador" then
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
		if marker == MarkerEntregadorDePescador then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function CriarVeiculosComData ()
VeiculosComDataEntregadorDePescador = {
createVehicle(595, 677.748, -1934.437, 0.8, 0, 0, 180 ),
createVehicle(595, 680.748, -1934.437, 0.8, 0, 0, 180 ),
createVehicle(595, 683.748, -1934.437, 0.8, 0, 0, 180 ),
createVehicle(595, 686.748, -1934.437, 0.8, 0, 0, 180 ),
createVehicle(595, 689.748, -1934.437, 0.8, 0, 0, 180 ),
createVehicle(595, 692.748, -1934.437, 0.8, 0, 0, 180 ),
createVehicle(595, 695.748, -1934.437, 0.8, 0, 0, 180 ),

}

for i, veh in ipairs(VeiculosComDataEntregadorDePescador) do
setElementData ( veh, "Emprego", "Entregador de Pescador" )
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
    if Jogador == "Entregador de Pescador" then	
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Pescadores#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataEntregadorDePescador) do
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

atualrotnumberPESCADOR = {}
ppcikPESCADOR = {}
blips = {}

rotasPESCADOR = {
	["Pescas - Leste de Los Santos - R$3899"] = {
		{3015.739, -2156.578, 0.835},
		{3081.582, -861.795, 0.835},
		{4226.075, -1153.867, 0.835},
		{2751.104, -3485.455, 0.835},
		{287.381, -2588.084, 0.835},
        },
	["Pescas - Sul de Los Santos - R$4600"] = {
		{182.002, -4390.128, 0.835},
		{-1710.255, -4770.055, 0.835},
		{-2622.669, -3130.05, 0.835},
		{-3812.71, -3107.97, 0.835},
		{741.293, -2539.186, 0.835},
	},
}

pay = {
	["Pescas - Leste de Los Santos - R$3899"] = 3899,
	["Pescas - Sul de Los Santos - R$4600"] = 4600,
}

function ifPlayerEnterOnMarker(markerHit,matchingDimension)
	if isPedInVehicle(source) then
		if markerHit == ppcikPESCADOR[source] then
			if (matchingDimension) then
				if isElement(ppcikPESCADOR[source]) then
					local rname = getElementData(source,"rtnamePescador") or nil
					if rname == nil then return end
					destroyElement(ppcikPESCADOR[source])
					triggerClientEvent(source,"AirNew>JOBEntregadorDePescador>blips<Client",source,false)
					local vh = getPedOccupiedVehicle(source)
					
					toggleAllControls ( source, false )
					setControlState ( source, "handbrake", true )
					
					if atualrotnumberPESCADOR[source] <= #rotasPESCADOR[rname] then
					    exports.dxmessages:outputDx(source, "Pescando... Aguarde!", "info")
						setTimer(gerarrota,2500,1,source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFPeixes pegos, siga para o próximo #FF0000checkpoint", "success") end,12500,1,source)
					elseif atualrotnumberPESCADOR[source] == #rotasPESCADOR[rname]+1 then
						setElementData(source,"rtnamePescador",rname)
						atualrotnumberPESCADOR[source] = 1
						local rec = pay[rname]
						givePlayerMoney(source,tonumber(rec))	
						local vh = getPedOccupiedVehicle(source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê recebeu #FFFF00R$"..rec.." #FFFFFFpor finalizar as pescas!", "success") end,12500,1,source)
						setTimer(function(source) toggleAllControls ( source, true ) end, 12500,1, source )
						setTimer(function(source) setControlState ( source, "handbrake", false ) end, 12500,1, source )
						setElementData(source,"rtnamePescador",nil)	
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
  local rname = getElementData(player,"rtnamePescador") or nil
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
		    if getElementData ( pl, "Emprego" ) == "Entregador de Pescador" then
			   VerificarCairBike(pl)
			end
		end
	end
end,
3000,0)

function pickjobPescador(source)
	if not isElement(source) then return end
	local im = isPedInVehicle(source)
	if im == false then return end	
	local job = getElementData(source,"Emprego") or false
	if job == "Entregador de Pescador" then
	local vh = getPedOccupiedVehicle(source)
	if isElement(vh) then
		local x,y = getElementPosition(vh)
		local x1,y1 = getElementPosition(source)
		local dist = getDistanceBetweenPoints2D(x,y,x1,y1)
		local isMarkerSafe = isElementWithinMarker(vh,MarkerSafeEntregadorDePescador)
		local id = getElementModel(vh)
		local seat = getPedOccupiedVehicleSeat(source)
		if dist > 0 then return end
		if id == 595 then		
			if seat == 0 then
				if isMarkerSafe == false then return end
				triggerClientEvent(source,"AirNew>JOBEntregadorDePescador>AbrirPainel<Client",source,rotasPESCADOR)
			end
		end
	end
end
end
addCommandHandler("rotas",pickjobPescador)

function receivert(source,rotaname)
	if isElement(ppcikPESCADOR[source]) then
		destroyElement(ppcikPESCADOR[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDePescador>blips<Client",source,false)
	setElementData(source,"rtnamePescador",rotaname)
	atualrotnumberPESCADOR[source] = 1
	gerarrota(source)
end
addEvent("AirNew>request>Startrota>Server>EntregadorDePescador", true)
addEventHandler("AirNew>request>Startrota>Server>EntregadorDePescador",getRootElement(), receivert)

function gerarrota(source)
	local rname = getElementData(source,"rtnamePescador") or nil
	if rname == nil then return end
	if not isElement(ppcikPESCADOR[source]) and isPedInVehicle(source) then
		local vh = getPedOccupiedVehicle(source)
		toggleAllControls ( source, true )
		setControlState ( source, "handbrake", false )
		local id = tonumber(atualrotnumberPESCADOR[source])
		local x,y,z = rotasPESCADOR[rname][id][1],rotasPESCADOR[rname][id][2],rotasPESCADOR[rname][id][3]
		ppcikPESCADOR[source] = createMarker (x, y,z, "checkpoint", 4, 255, 0, 0, 50,source)
		triggerClientEvent(source,"AirNew>JOBEntregadorDePescador>blips<Client",source,true,x,y,z)
		atualrotnumberPESCADOR[source] = id+1
	end
end

function sair ( quitType )
	if isElement(ppcikPESCADOR[source]) then
		destroyElement(ppcikPESCADOR[source])
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )

function SairDaBike ( thePlayer, seat, jacked )
   local rname = getElementData(thePlayer,"rtnamePescador") or nil
   if rname == nil then return end
   canceljobtimer (thePlayer)
   exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFVocê abandonou o veículo e foi demitido!", "warning")
end
addEventHandler ( "onVehicleExit", getRootElement(), SairDaBike )

function canceljobtimer(source)
	if isElement(ppcikPESCADOR[source]) then
		destroyElement(ppcikPESCADOR[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDePescador>blips<Client",source,false)	
	atualrotnumberPESCADOR[source] = 1
	setElementData(source,"rtnamePescador",nil)	
end

function canceljobdeath()
	local job = getElementData(source,"Emprego") or false
	if job ~= "Entregador de Pescador" then return end
	local rname = getElementData(source,"rtnamePescador") or nil
	if rname == nil then return end
	canceljobtimer(source)
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê morreu, emprego cancelado!", "warning")
end	
addEventHandler( "onPlayerWasted", getRootElement( ),canceljobdeath)