MarkerSafe = createMarker( 2372.16, -1818.036, 13.547, "cylinder", 100, 0, 255, 0, 0)

MotoristaDeOnibusPickup = createPickup ( 2372.16, -1818.036, 13.547, 3, 1210)
MarkerMotoristaDeOnibus = createMarker ( 2372.16, -1818.036, 13.547, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerMotoristaDeOnibus, MotoristaDeOnibusPickup, 0, 0, -1 )

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", MotoristaDeOnibusPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "hq"
cmd2 = "profissao"

local HQMotoristaDeOnibusBlip = createBlip ( 2372.16, -1818.036, 13.547 )
setElementVisibleTo ( HQMotoristaDeOnibusBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQMotoristaDeOnibusBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Motorista de Onibus" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "Motorista de Onibus" then
	if isElementVisibleTo ( HQMotoristaDeOnibusBlip, source ) then
	setElementVisibleTo ( HQMotoristaDeOnibusBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQMotoristaDeOnibusBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd1, ComandoHQ )

function AceitarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
if getElementData ( source, "AirNew>Encaminhamento" ) == "Motorista de Onibus" then
setElementData ( source, "AirNew>Encaminhamento", false )
setElementData ( source, "Emprego", "Motorista de Onibus" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Motorista de Ônibus#FFFFFF. Digite: #FFFF00/profissao", "success")
else
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
end
end

function RecusarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
if isElementVisibleTo ( HQMotoristaDeOnibusBlip, source ) then
setElementVisibleTo ( HQMotoristaDeOnibusBlip, source, false )
end
removeElementData ( source, "Emprego", "Motorista de Onibus" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "Motorista de Onibus" then
playSoundFrontEnd ( ThePlayer, 43 )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/hq #FFFFFF- Para marcar/desmarcar o seu local de trabalho", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/rotas #FFFFFF- Abre a lista de rotas disponíveis", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFEntre em um ônibus, selecione uma rota, aperte F11 e siga os #FF0000checkpoints", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSe você abandonar o ônibus, será demitido!", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
end
end
addCommandHandler(cmd2, ComandosProf )

function emarker(marker,md) 
	if (md) then
	  if isPedInVehicle ( source ) then return end
		if marker == MarkerMotoristaDeOnibus then
		    if getElementData ( source, "Emprego" ) == "Motorista de Onibus" then
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
		if marker == MarkerMotoristaDeOnibus then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function CriarVeiculosComData ()
VeiculosComDataMotoristaDeOnibus = {
createVehicle(437, 2396.979, -1764.481, 13.547, 0, 0, 90 ),
createVehicle(437, 2396.979, -1779.093, 13.581, 0, 0, 90 ),
createVehicle(437, 2396.979, -1786.401, 13.581, 0, 0, 90 ),
createVehicle(437, 2396.979, -1772.307, 13.581, 0, 0, 90 ),
}

for i, veh in ipairs(VeiculosComDataMotoristaDeOnibus) do
setElementData ( veh, "Emprego", "Motorista de Onibus" )
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
    if Jogador == "Motorista de Onibus" then	
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Motorista de Ônibus#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataMotoristaDeOnibus) do
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

atualrotnumberBUS = {}
ppcikBUS = {}
blips = {}

rotasBUS = {
	["Leste da Cidade - R$4500"] = {
		{2400.539, -1749.975, 13.818},
		{2743.37, -1659.772, 13.505},
		{2902.358, -1143.802, 11.619},
		{2223.648, -1169.361, 26.162},
		{1333.832, -923.253, 36.586},
		{1323.716, -1489.482, 13.825},
		{2028.748, -2181.849, 13.989},
	},
	["Oeste da Cidade - R$4700"] = {
	    {1920.124, -1792.434, 13.909},
		{1894.732, -1929.783, 13.913},
		{1730.818, -1853.203, 13.942},
		{1444.119, -1729.505, 13.908},
		{1080.438, -1708.018, 13.906},
		{383.134, -2038.237, 8.363},
		{370.329, -1432.401, 34.744},
		{593.639, -1241.267, 18.511},
	},
}

pay = {
	["Leste da Cidade - R$4500"] = 4500,
	["Oeste da Cidade - R$4700"] = 4700,
}

function ifPlayerEnterOnMarker(markerHit,matchingDimension)
	if isPedInVehicle(source) then
		if markerHit == ppcikBUS[source] then
			if (matchingDimension) then
				if isElement(ppcikBUS[source]) then
					local rname = getElementData(source,"rtnameBUS") or nil
					if rname == nil then return end
					destroyElement(ppcikBUS[source])
					triggerClientEvent(source,"AirNew>JOBUS>blips<Client",source,false)
					local vh = getPedOccupiedVehicle(source)
					
					toggleAllControls ( source, false )
					setControlState ( source, "handbrake", true )
					
					if atualrotnumberBUS[source] <= #rotasBUS[rname] then
					    exports.dxmessages:outputDx(source, "Passageiros desembarcando... Aguarde", "info")
						setTimer(gerarrota,5000,1,source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFOs passageiros desembarcaram. Siga para o próximo #FF0000checkpoint", "success") end,5000,1,source)
					elseif atualrotnumberBUS[source] == #rotasBUS[rname]+1 then
						setElementData(source,"rtnameBUS",rname)
						atualrotnumberBUS[source] = 1
						local rec = pay[rname]
						givePlayerMoney(source,tonumber(rec))	
						local vh = getPedOccupiedVehicle(source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê recebeu #FFFF00R$"..rec.." #FFFFFFpor finalizar a rota!", "success") end,5000,1,source)
						setTimer(function(source) toggleAllControls ( source, true ) end, 5000,1, source )
						setTimer(function(source) setControlState ( source, "handbrake", false ) end, 5000,1, source )
						setElementData(source,"rtnameBUS",nil)	
					end

					
				end

			end	
		end
	end
end
addEventHandler("onPlayerMarkerHit",getRootElement(),ifPlayerEnterOnMarker)

function pickjobonbusBUS(source)
	if not isElement(source) then return end
	local im = isPedInVehicle(source)
	if im == false then return end	
	local job = getElementData(source,"Emprego") or false
	if job == "Motorista de Onibus" then
	local vh = getPedOccupiedVehicle(source)
	if isElement(vh) then
		local x,y = getElementPosition(vh)
		local x1,y1 = getElementPosition(source)
		local dist = getDistanceBetweenPoints2D(x,y,x1,y1)
		local isMarkerSafe = isElementWithinMarker(vh,MarkerSafe)
		local id = getElementModel(vh)
		local seat = getPedOccupiedVehicleSeat(source)
		if dist > 0 then return end
		if id == 437 then		
			if seat == 0 then
				if isMarkerSafe == false then return end
				triggerClientEvent(source,"AirNew>JOBUS>AbrirPainel<Client",source,rotasBUS)
			end
		end
	end
end
end
addCommandHandler("rotas",pickjobonbusBUS)

function receivert(source,rotaname)
	if isElement(ppcikBUS[source]) then
		destroyElement(ppcikBUS[source])
	end	
	triggerClientEvent(source,"AirNew>JOBUS>blips<Client",source,false)
	setElementData(source,"rtnameBUS",rotaname)
	atualrotnumberBUS[source] = 1
	gerarrota(source)
end
addEvent("AirNew>request>Startrota>Server>MotoristaDeOnibus", true)
addEventHandler("AirNew>request>Startrota>Server>MotoristaDeOnibus",getRootElement(), receivert)

function gerarrota(source)
	local rname = getElementData(source,"rtnameBUS") or nil
	if rname == nil then return end
	if not isElement(ppcikBUS[source]) and isPedInVehicle(source) then
		local vh = getPedOccupiedVehicle(source)
		toggleAllControls ( source, true )
		setControlState ( source, "handbrake", false )
		local id = tonumber(atualrotnumberBUS[source])
		local x,y,z = rotasBUS[rname][id][1],rotasBUS[rname][id][2],rotasBUS[rname][id][3]
		ppcikBUS[source] = createMarker (x, y,z, "checkpoint", 4, 255, 0, 0, 50,source)
		triggerClientEvent(source,"AirNew>JOBUS>blips<Client",source,true,x,y,z)
		atualrotnumberBUS[source] = id+1
	end
end

function sair ( quitType )
	if isElement(ppcikBUS[source]) then
		destroyElement(ppcikBUS[source])
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )

function SairDoOnibus ( thePlayer, seat, jacked )
   local rname = getElementData(thePlayer,"rtnameBUS") or nil
   if rname == nil then return end
   canceljobtimer (thePlayer)
   exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFVocê abandonou o veículo e foi demitido!", "warning")
end
addEventHandler ( "onVehicleExit", getRootElement(), SairDoOnibus )

function canceljobtimer(source)
	if isElement(ppcikBUS[source]) then
		destroyElement(ppcikBUS[source])
	end	
	triggerClientEvent(source,"AirNew>JOBUS>blips<Client",source,false)	
	atualrotnumberBUS[source] = 1
	setElementData(source,"rtnameBUS",nil)	
end