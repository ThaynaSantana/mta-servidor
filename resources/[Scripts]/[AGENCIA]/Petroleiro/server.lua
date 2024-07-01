PetroleiroPickup = createPickup ( 2670.179, -2396.924, 13.633, 3, 1210)
MarkerPetroleiro = createMarker ( 2670.179, -2396.924, 13.633, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerPetroleiro, PetroleiroPickup, 0, 0, -1 )

safe = createMarker ( 2743.707, -2406.665, 13.444, "cylinder", 11, 0, 255, 0, 0)

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", PetroleiroPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "hq"
cmd2 = "profissao"

local HQPetroleiroBlip = createBlip ( 2670.179, -2396.924, 13.633 )
setElementVisibleTo ( HQPetroleiroBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQPetroleiroBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "Petroleiro" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "Petroleiro" then
	if isElementVisibleTo ( HQPetroleiroBlip, source ) then
	setElementVisibleTo ( HQPetroleiroBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQPetroleiroBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd1, ComandoHQ )

function AceitarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
if getElementData ( source, "AirNew>Encaminhamento" ) == "Petroleiro" then
setElementData ( source, "AirNew>Encaminhamento", false )
setElementData ( source, "Emprego", "Petroleiro" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Petroleiro#FFFFFF. Digite: #FFFF00/profissao", "success")
else
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
end
end

function RecusarEmprego02 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
if isElementVisibleTo ( HQPetroleiroBlip, source ) then
setElementVisibleTo ( HQPetroleiroBlip, source, false )
end
removeElementData ( source, "Emprego", "Petroleiro" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "Petroleiro" then
playSoundFrontEnd ( ThePlayer, 43 )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/hq #FFFFFF- Para marcar/desmarcar o seu local de trabalho", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFEntre em um caminhão e dirija até a #00BFFFárea de carregamento", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFApós carregar seu caminhão, aperte F11 e siga até o #FF0000checkpoint", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSe você abandonar o caminhão, será demitido!", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
end
end
addCommandHandler(cmd2, ComandosProf )

function emarker(marker,md) 
	if (md) then
	  if not isPedInVehicle ( source ) then
		if marker == MarkerPetroleiro then
		    if getElementData ( source, "Emprego" ) == "Petroleiro" then
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para se demitir")
			bindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		else
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para aceitar o emprego")
			bindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
		end
		end
		end
		local seat = getPedOccupiedVehicleSeat ( source )
	    if seat == 0 then
		if marker == safe then
			bindKey ( source, LetraParaMarkers, "down", pickjobonbus )
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para carregar seu caminhão")
		end
		if marker == ppcik[source] then
			bindKey ( source, LetraParaMarkers, "down", ifPlayerEnterOnMarker )
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para descarregar seu caminhão")
        end
	  end
  end	
end
addEventHandler("onPlayerMarkerHit",getRootElement(),emarker)

function lmarker(marker,md)
	if (md) then
		if marker == MarkerPetroleiro then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego02 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego02 )
		end
		if marker == safe then
			unbindKey ( source, LetraParaMarkers, "down", pickjobonbus )
			exports.Scripts_OnMarkerMsgs_:delete(source)
		end
		if marker == ppcik[source] then
			unbindKey ( source, LetraParaMarkers, "down", ifPlayerEnterOnMarker )
			exports.Scripts_OnMarkerMsgs_:delete(source)
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

atualrotnumber = {}
ppcik = {}
blips = {}

rotas = {
	["Posto em Idlewood - R$2400"] = {
	    {1925.265, -1791.949, 13.383},
	},
	["Posto em Mulholland - R$2900"] = {
	    {986.605, -921.621, 42.18},
	},
	["Posto em Dillimore - R$3200"] = {
	    {666.603, -546.565, 16.336},
	},
	["Posto em Flint County - R$2600"] = {
	    {-66.923, -1160.396, 1.75},
	},
}

pay={["Posto em Idlewood - R$2400"] = 2400,
	 ["Posto em Mulholland - R$2900"] = 2900,
	 ["Posto em Dillimore - R$3200"] = 3200,
	 ["Posto em Flint County - R$2600"] = 2600,
}

function receivert(source,rotaname)
 if isElement(ppcik[source]) then
  destroyElement(ppcik[source])
 end	
 triggerClientEvent(source,"JOBUS>blips<Client",source,false)
 setElementData(source,"rtname",rotaname)
 atualrotnumber[source] = 1
 gerarrota(source)
end
addEvent("request>Startrota>Server", true)
addEventHandler("request>Startrota>Server",getRootElement(), receivert)

function ifPlayerEnterOnMarker ( source )
if isPedInVehicle(source) then
    if not isElementWithinMarker(source, ppcik[source]) then return end
		if isElement(ppcik[source]) then
		local vh = getPedOccupiedVehicle(source)
		local id = getElementModel(vh)
			if id == 514 then
			    if ( getVehicleTowedByVehicle ( vh ) == CargaPet[source] ) then
			    local rname = getElementData(source,"rtname") or nil
			        if rname == nil then return end
				    destroyElement(ppcik[source])
				    triggerClientEvent(source,"JOBUS>blips<Client",source,false)		
				        if atualrotnumber[source] <= #rotas[rname] then
					    gerarrota(source)
				            elseif atualrotnumber[source] == #rotas[rname]+1 then
					        setElementData(source,"rtname",rname)
					        atualrotnumber[source] = 1
					        local rec = pay[rname]
					        givePlayerMoney(source,tonumber(rec))	
					        local vh = getPedOccupiedVehicle(source)
					        destroyElement ( CargaPet[source] )	
					        setElementData(source,"rtname",nil)
							exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu caminhão foi descarregado, e você recebeu #FFFF00R$"..rec.." #FFFFFFpelo serviço!", "success")
							unbindKey ( source, LetraParaMarkers, "down", ifPlayerEnterOnMarker )
			                exports.Scripts_OnMarkerMsgs_:delete(source)
							
				        end
	            else
				exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê não pode descarregar o caminhão sem sua carga!", "error")
                end
            end
        end
    end
end

function pickjobonbus(source)
	if not isElement(source) then return end
	
	local im = isPedInVehicle(source)
	if im == false then return end	
	
	local job = getElementData(source,"Emprego") or false
	if job == false or job == nil then
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê não é petroleiro, portanto não poderá usar esse comando!", "error") return end
	if job == "Petroleiro" then
	
	local vh = getPedOccupiedVehicle(source)
	if isElement(vh) then
	local x,y = getElementPosition(vh)
	local x1,y1 = getElementPosition(source)
	local dist = getDistanceBetweenPoints2D(x,y,x1,y1)
	local issafe = isElementWithinMarker(vh,safe)
	local id = getElementModel(vh)
	local seat = getPedOccupiedVehicleSeat(source)
		if dist > 0 then return end
		    if id == 514 then		
			    if seat == 0 then
		        local speedX, speedY, speedZ = getElementVelocity ( vh  )
	            local actualSpeed = (speedX^2 + speedY^2 + speedZ^2)^(0.5) 
	            local KMH = math.floor(actualSpeed*180)
			        if KMH >= 1 then
					exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFPare o caminhão para poder carregar", "error") return end
				        if issafe == false then return end
			            
						unbindKey ( source, LetraParaMarkers, "down", pickjobonbus )
			            exports.Scripts_OnMarkerMsgs_:delete(source)
				        
						triggerClientEvent(source,"JOBUS>AbrirPainel<Client",source,rotas)
                end
            end
        end
    end
end

CargaPet = {}

function gerarrota(source)
	
	local rname = getElementData(source,"rtname") or nil
	if rname == nil then return end
	
	if not isElement(ppcik[source]) and isPedInVehicle(source) then
	
	local vh = getPedOccupiedVehicle(source)
	local id = tonumber(atualrotnumber[source])
	local x,y,z = rotas[rname][id][1],rotas[rname][id][2],rotas[rname][id][3]
	
	ppcik[source] = createMarker (x, y,z, "checkpoint", 5, 255, 0, 0, 50,source)
	triggerClientEvent(source,"JOBUS>blips<Client",source,true,x,y,z)
	atualrotnumber[source] = id+1
		
	local vh = getPedOccupiedVehicle(source)
	local xe,ye,ze = getElementPosition ( source )
	
	if CargaPet[source] and isElement( CargaPet[source] ) then
	destroyElement ( CargaPet[source] )
	CargaPet[source] = nil
	end
	
	CargaPet[source] = createVehicle ( 584, xe,ye,ze +15 )
	setTimer ( attachTrailerToVehicle, 50, 1, vh, CargaPet[source] )
	setTimer ( attachTrailerToVehicle, 1000, 1, vh, CargaPet[source] )
	setTimer ( attachTrailerToVehicle, 5000, 1, vh, CargaPet[source] )
	
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu caminhão foi carregado, siga até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", "success")
	
end
end

function sair ( quitType )
 if isElement(ppcik[source]) then
  destroyElement(ppcik[source])
  end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )

function removeHelmetOnExit ( thePlayer, seat, jacked )
	local job = getElementData(thePlayer,"Emprego") or false
	if job ~= "Petroleiro" then return end
	local rname = getElementData(thePlayer,"rtname") or nil
	if rname == nil then return end
    if ( getElementModel ( source ) == 514 ) then 
    canceljobtimer (thePlayer)
    end
end
addEventHandler ( "onVehicleExit", getRootElement(), removeHelmetOnExit )

function SairDoCaminhao ( thePlayer, seat, jacked )
   local rname = getElementData(thePlayer,"rtname") or nil
   if rname == nil then return end
   canceljobtimer (thePlayer)
   exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFVocê abandonou o veículo e foi demitido!", "warning")
end
addEventHandler ( "onVehicleExit", getRootElement(), SairDoCaminhao )

function canceljobtimer(source)
 if isElement(ppcik[source]) then
  destroyElement(ppcik[source])
 end	
 triggerClientEvent(source,"JOBUS>blips<Client",source,false)	
 atualrotnumber[source] = 1
 setElementData(source,"rtname",nil)
 if isElement( CargaPet[source] ) then
  destroyElement ( CargaPet[source] )
 end
end

function CriarVeiculosComData ()
VeiculosComDataPetroleiro = {
createVehicle(514, 2677.948, -2389.787, 13.633, 0, 0, 180 ),
createVehicle(514, 2677.948+5, -2389.787, 13.633, 0, 0, 180 ),
createVehicle(514, 2677.948+10, -2389.787, 13.633, 0, 0, 180 ),
createVehicle(514, 2677.948+15, -2389.787, 13.633, 0, 0, 180 ),
}

for i, veh in ipairs(VeiculosComDataPetroleiro) do
setElementData ( veh, "Emprego", "Petroleiro" )
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
    if Jogador == "Petroleiro" then	
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Petroleiros#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataPetroleiro) do
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