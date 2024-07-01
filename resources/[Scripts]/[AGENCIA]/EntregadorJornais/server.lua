MarkerSafeEntregadorDeJornal = createMarker( 1280.835, -1541.986, 13.522, "cylinder", 35, 0, 255, 0, 0)

EntregadorDeJornalPickup = createPickup ( 1280.835, -1541.986, 13.522, 3, 1210)
MarkerEntregadorDeJornal = createMarker ( 1281.835, -1541.986, 13.522, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerEntregadorDeJornal, EntregadorDeJornalPickup, 0, 0, -1 )

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", EntregadorDeJornalPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "hq"
cmd2 = "profissao"

local HQEntregadorDeJornalBlip = createBlip ( 1280.835, -1541.986, 13.522 )
setElementVisibleTo ( HQEntregadorDeJornalBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQEntregadorDeJornalBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Entregador de Jornal" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "Entregador de Jornal" then
	if isElementVisibleTo ( HQEntregadorDeJornalBlip, source ) then
	setElementVisibleTo ( HQEntregadorDeJornalBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQEntregadorDeJornalBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd1, ComandoHQ )

function AceitarEmprego02 (source)
	exports.Scripts_OnMarkerMsgs_:delete(source)
		unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
		if getElementData ( source, "AirNew>Encaminhamento" ) == "Entregador de Jornal" then
			setElementData ( source, "AirNew>Encaminhamento", false )
			setElementData ( source, "Emprego", "Entregador de Jornal" )
			exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Entregador de Jornais#FFFFFF. Digite: #FFFF00/profissao", "success")
		else
			exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
	end
end

function RecusarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
if isElementVisibleTo ( HQEntregadorDeJornalBlip, source ) then
setElementVisibleTo ( HQEntregadorDeJornalBlip, source, false )
end
removeElementData ( source, "Emprego", "Entregador de Jornal" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "Entregador de Jornal" then
playSoundFrontEnd ( ThePlayer, 43 )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSuba na moto, selecione uma rota, aperte F11 e siga os #FF0000checkpoints", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSe você abandonar a moto, será demitido!", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/rotas #FFFFFF- Abre a lista de rotas disponíveis", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/hq #FFFFFF- Para marcar/desmarcar o seu local de trabalho", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
end
end
addCommandHandler(cmd2, ComandosProf )

function emarker(marker,md) 
	if (md) then
	  if isPedInVehicle ( source ) then return end
		if marker == MarkerEntregadorDeJornal then
		    if getElementData ( source, "Emprego" ) == "Entregador de Jornal" then
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
		if marker == MarkerEntregadorDeJornal then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function CriarVeiculosComData ()
VeiculosComDataEntregadorDeJornal = {
createVehicle(462, 1271.117, -1531.384 -2, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -4, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -6, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -8, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -10, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -12, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -14, 13.564, 0, 0, 270 ),
createVehicle(462, 1271.117, -1531.384 -16, 13.564, 0, 0, 270 ),

}

for i, veh in ipairs(VeiculosComDataEntregadorDeJornal) do
setElementData ( veh, "Emprego", "Entregador de Jornal" )
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
    if Jogador == "Entregador de Jornal" then	
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Entregadores de Jornal#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataEntregadorDeJornal) do
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

atualrotnumberJORNAL = {}
ppcikJORNAL = {}
blips = {}

rotasJORNAL = {
	["Entrega de Jornais Zona Oeste da Cidade - 20 Residências - R$2496"] = {
		{1364.6373291016, -1438.9836425781, 13.467825889587},
		{1022.191, -1388.186, 13.285},
		{908.49755859375, -1445.4783935547, 13.483348846436},
		{877.44775390625, -1567.9298095703, 13.467478752136},
		{798.82409667969, -1579.8061523438, 13.473459243774},
		{648.395, -1514.232, 14.831},
		{665.8, -1420.674, 14.52},
		{886.643, -1334.437, 13.472},
		{1068.741, -1220.861, 16.819},
		{1090.686, -1094.197, 25.366},
		{833.955, -926.173, 55.175},
		{835.247, -891.472, 68.695},
		{831.888, -861.597, 69.866},
		{795.525, -842.034, 60.567},
		{724.829, -995.482, 52.587},
		{619.375, -1101.452, 46.718},
		{543.806, -1202.055, 44.403},
		{295.734, -1335.255, 53.365},
		{193.566, -1310.247, 70.184},
		{304.729, -1746.573, 4.468},
	},
	["Entrega de Jornais Zona Leste da Cidade - 20 Residências - R$2999"] = {
		{1310.7265625, -1369.5993652344, 13.492050170898},
		{1185.507, -1218.482, 18.569},
		{1306.391, -1156.435, 23.755},
		{1631.028, -1170.769, 24.006},
		{1892.087, -1127.514, 24.283},
		{1933.209, -1126.948, 25.317},
		{2081.673, -1087.167, 24.973},
		{2228.783, -1159.202, 25.728},
		{2175.958, -996.962, 62.884},
		{2244.472, -1053.053, 52.732},
		{2432.941, -1017.481, 54.332},
		{2671.953, -1093.562, 69.262},
		{2853.77, -1351.766, 10.991},
		{2867.479, -1464.279, 10.883},
		{2466.751, -1742.046, 13.474},
		{2519.592, -2016.708, 13.453},
		{2464.379, -2000.625, 13.475},
		{2242.854, -1886.43, 13.475},
		{1877.191, -1738.41, 13.307},
		{1783.264, -1864.748, 13.502},
	},
}

pay = {
	["Entrega de Jornais Zona Oeste da Cidade - 20 Residências - R$2496"] = 2496,
	["Entrega de Jornais Zona Leste da Cidade - 20 Residências - R$2999"] = 2999,
}

function ifPlayerEnterOnMarker(markerHit,matchingDimension)
	if isPedInVehicle(source) then
		if markerHit == ppcikJORNAL[source] then
			if (matchingDimension) then
				if isElement(ppcikJORNAL[source]) then
					local rname = getElementData(source,"rtnameJornal") or nil
					if rname == nil then return end
					destroyElement(ppcikJORNAL[source])
					triggerClientEvent(source,"AirNew>JOBEntregadorDeJornal>blips<Client",source,false)
					local vh = getPedOccupiedVehicle(source)
					
					toggleAllControls ( source, false )
					setControlState ( source, "handbrake", true )
					
					if atualrotnumberJORNAL[source] <= #rotasJORNAL[rname] then
					    exports.dxmessages:outputDx(source, "Entregando Jornal... Aguarde!", "info")
						setTimer(gerarrota,2500,1,source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFJornal entregue, siga para o próximo #FF0000checkpoint", "success") end,2500,1,source)
					elseif atualrotnumberJORNAL[source] == #rotasJORNAL[rname]+1 then
						setElementData(source,"rtnameJornal",rname)
						atualrotnumberJORNAL[source] = 1
						local rec = pay[rname]
						givePlayerMoney(source,tonumber(rec))	
						local vh = getPedOccupiedVehicle(source)
						setTimer(function(source) exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê recebeu #FFFF00R$"..rec.." #FFFFFFpor finalizar as entregas!", "success") end,2500,1,source)
						setTimer(function(source) toggleAllControls ( source, true ) end, 2500,1, source )
						setTimer(function(source) setControlState ( source, "handbrake", false ) end, 2500,1, source )
						setElementData(source,"rtnameJornal",nil)	
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
  local rname = getElementData(player,"rtnameJornal") or nil
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
		    if getElementData ( pl, "Emprego" ) == "Entregador de Jornal" then
			   VerificarCairBike(pl)
			end
		end
	end
end,
3000,0)

function pickjobJornal(source)
	if not isElement(source) then return end
	local im = isPedInVehicle(source)
	if im == false then return end	
	local job = getElementData(source,"Emprego") or false
	if job == "Entregador de Jornal" then
	local vh = getPedOccupiedVehicle(source)
	if isElement(vh) then
		local x,y = getElementPosition(vh)
		local x1,y1 = getElementPosition(source)
		local dist = getDistanceBetweenPoints2D(x,y,x1,y1)
		local isMarkerSafe = isElementWithinMarker(vh,MarkerSafeEntregadorDeJornal)
		local id = getElementModel(vh)
		local seat = getPedOccupiedVehicleSeat(source)
		if dist > 0 then return end
		if id == 462 then		
			if seat == 0 then
				if isMarkerSafe == false then return end
				triggerClientEvent(source,"AirNew>JOBEntregadorDeJornal>AbrirPainel<Client",source,rotasJORNAL)
			end
		end
	end
end
end
addCommandHandler("rotas",pickjobJornal)

function receivert(source,rotaname)
	if isElement(ppcikJORNAL[source]) then
		destroyElement(ppcikJORNAL[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDeJornal>blips<Client",source,false)
	setElementData(source,"rtnameJornal",rotaname)
	atualrotnumberJORNAL[source] = 1
	gerarrota(source)
end
addEvent("AirNew>request>Startrota>Server>EntregadorDeJornal", true)
addEventHandler("AirNew>request>Startrota>Server>EntregadorDeJornal",getRootElement(), receivert)

function gerarrota(source)
	local rname = getElementData(source,"rtnameJornal") or nil
	if rname == nil then return end
	if not isElement(ppcikJORNAL[source]) and isPedInVehicle(source) then
		local vh = getPedOccupiedVehicle(source)
		toggleAllControls ( source, true )
		setControlState ( source, "handbrake", false )
		local id = tonumber(atualrotnumberJORNAL[source])
		local x,y,z = rotasJORNAL[rname][id][1],rotasJORNAL[rname][id][2],rotasJORNAL[rname][id][3]
		ppcikJORNAL[source] = createMarker (x, y,z, "checkpoint", 4, 255, 0, 0, 50,source)
		triggerClientEvent(source,"AirNew>JOBEntregadorDeJornal>blips<Client",source,true,x,y,z)
		atualrotnumberJORNAL[source] = id+1
	end
end

function sair ( quitType )
	if isElement(ppcikJORNAL[source]) then
		destroyElement(ppcikJORNAL[source])
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )

function SairDaBike ( thePlayer, seat, jacked )
   local rname = getElementData(thePlayer,"rtnameJornal") or nil
   if rname == nil then return end
   canceljobtimer (thePlayer)
   exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFVocê abandonou o veículo e foi demitido!", "warning")
end
addEventHandler ( "onVehicleExit", getRootElement(), SairDaBike )

function canceljobtimer(source)
	if isElement(ppcikJORNAL[source]) then
		destroyElement(ppcikJORNAL[source])
	end	
	triggerClientEvent(source,"AirNew>JOBEntregadorDeJornal>blips<Client",source,false)	
	atualrotnumberJORNAL[source] = 1
	setElementData(source,"rtnameJornal",nil)	
end