PizzaBoyPickup = createPickup ( 2101.46094, -1801.56970, 13.55469, 3, 1210)
MarkerPizzaBoy = createMarker ( 2101.46094, -1801.56970, 13.55469, "cylinder", 1.2, 255, 255, 255, 0 )
attachElements ( MarkerPizzaBoy, PizzaBoyPickup, 0, 0, -1 )

MarkerSafePizzaBoy = createMarker ( 2112.48169, -1784.53406, 13.38725, "cylinder", 20, 255, 255, 255, 0 )

function CancelarSumirPickup ( player )
   cancelEvent()
end
addEventHandler ( "onPickupHit", PizzaBoyPickup, CancelarSumirPickup )

LetraParaMarkers = "z"
cmd1 = "profissao"
cmd2 = "pegarpizzas"
cmd3 = "hq"

local HQPizzaBoyBlip = createBlip ( 2101.46094, -1801.56970, 13.55469 )
setElementVisibleTo ( HQPizzaBoyBlip, root, false )

function VerificarBlipEmprego(player)
  if player then
  acc = getPlayerAccount ( player )
  if isGuestAccount ( acc ) then return end
  setElementVisibleTo ( HQPizzaBoyBlip, player, false )
  end
end

setTimer(
function()
	for i, pl in pairs(getElementsByType("player")) do
		if pl ~= (false or nil) then
		    if getElementData ( pl, "Emprego" ) == "PizzaBoy" then return end
			   VerificarBlipEmprego(pl)
		end
	end
end,
3000,0)

function ComandoHQ ( source )
    if getElementData ( source, "Emprego" ) == "PizzaBoy" then
	if isElementVisibleTo ( HQPizzaBoyBlip, source ) then
	setElementVisibleTo ( HQPizzaBoyBlip, source, false )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00desmarcado #FFFFFFdo mapa!", "info")
	else
	setElementVisibleTo ( HQPizzaBoyBlip, source, true )
	exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFSeu local de trabalho foi #FFFF00marcado #FFFFFFno mapa!", "info")
end
end	
end    
addCommandHandler ( cmd3, ComandoHQ )

function AceitarEmprego03 (source)
	exports.Scripts_OnMarkerMsgs_:delete(source)
	unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego03 )
	if getElementData ( source, "AirNew>Encaminhamento" ) == "PizzaBoy" then
		setElementData ( source, "AirNew>Encaminhamento", false )
		setElementData ( source, "Emprego", "PizzaBoy" )
		exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFAgora você é #FFFF00Pizza Boy#FFFFFF. Digite: #FFFF00/profissao", "success")
	else
		exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê precisa estar encaminhado da Agência para trabalhar neste local!", "error")
	end
end

function RecusarEmprego03 (source)
exports.Scripts_OnMarkerMsgs_:delete(source)
unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego03 )
if isElementVisibleTo ( HQPizzaBoyBlip, source ) then
setElementVisibleTo ( HQPizzaBoyBlip, source, false )
end
removeElementData ( source, "Emprego", "PizzaBoy" )
exports.dxmessages:outputDx(source, "#00FF00• Emprego: #FFFFFFVocê se demitiu do emprego!", "warning")
end

function emarker(marker,md) 
	if (md) then
	  if isPedInVehicle ( source ) then return end
		if marker == MarkerPizzaBoy then
		    if getElementData ( source, "Emprego" ) == "PizzaBoy" then
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para se demitir")
			bindKey ( source, LetraParaMarkers, "down", RecusarEmprego03 )
			else
			exports.Scripts_OnMarkerMsgs_:create(source,"Pressione 'Z' para aceitar o emprego")
			bindKey ( source, LetraParaMarkers, "down", AceitarEmprego03 )
		    end
		end
	end	
end
addEventHandler("onPlayerMarkerHit",getRootElement(),emarker)

function lmarker(marker,md)
	if (md) then
		if marker == MarkerPizzaBoy then
			exports.Scripts_OnMarkerMsgs_:delete(source)			
			unbindKey ( source, LetraParaMarkers, "down", AceitarEmprego03 )
			unbindKey ( source, LetraParaMarkers, "down", RecusarEmprego03 )
		end
	end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function ComandosProf ( ThePlayer )
if getElementData ( ThePlayer, "Emprego" ) == "PizzaBoy" then
playSoundFrontEnd ( ThePlayer, 43 )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSuba na moto, digite #FFFF00/pegarpizzas #FFFFFFe siga até as #00FF00casas #FFFFFFmarcadas em seu mapa (F11)", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFFFFSe você abandonar a moto, será demitido!", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/hq #FFFFFF- Para marcar/desmarcar o seu local de trabalho", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00/pegarpizzas #FFFFFF- Para iniciar as entregas", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#FFFF00Alt #FFFFFF- Solta a pizza no marker de entrega (não sair da moto)", ThePlayer, 255, 255, 255, true )
outputChatBox ( "#F9A631~~~~~~~~~~~~~~~~~~~~~~~~ #00FF00• Emprego #F9A631~~~~~~~~~~~~~~~~~~~~~~~~", ThePlayer, 255, 255, 255, true )
end
end
addCommandHandler(cmd1, ComandosProf )

local moneyPerPizza = 110

local pizzaSkins = {
	[155]=true;
}

local pizzaVehicles = {
	[448]=true;
}

local locations = {
	["Los Santos"] = {
		{ 2071.75, -1702.995, 13.555 -1};
		{ 2072.259, -1654.73, 13.547 -1};
		{ 2072.831, -1628.853, 13.547 -1};
		{ 2241.869, -1887.293, 13.547 -1};
		{ 2296.279, -1887.04, 13.596 -1};
		{ 2310.714, -1724.781, 13.547 -1};
		{ 2238.345, -1645.445, 15.485 -1};
		{ 2281.421, -1651.895, 15.154 -1};
		{ 2232.254, -1475.16, 23.803 -1};
		{ 2264.19, -1474.311, 22.909 -1};
		{ 2378.845, -1327.244, 24 -1};
		{ 2379.274, -1276.639, 24 -1};
		{ 2373.608, -1144.713, 27.625 -1};
		{ 2399.187, -1138.497, 30.087 -1};
		{ 2002.396, -1127.082, 25.442 -1};
		{ 1934.805, -1127.678, 25.353 -1};
		{ 2392.29, -1724.959, 13.493 -1};
		{ 1909.838, -1603.81, 13.547 -1};
		{ 1870.263, -1924.702, 13.547 -1};
		{ 1913.998, -1924.826, 13.547 -1};
		{ 1936.263, -1925.573, 13.547 -1};
		{ 2868.48, -1466.048, 10.922 -1};
		{ 2854.365, -1532.582, 10.922 -1};
		{ 2816.781, -1630.836, 11.018 -1};
		{ 2820.511, -1614.87, 11.088 -1};
		{ 2750.65918, -1468.14697, 30.45313 -1};
		{ 2745.901, -1308.527, 52.456 -1};
		{ 2556.574, -1194.161, 61.388 -1};
		{ 2443.73, -1303.92, 24 -1};
		{ 2443.347, -1321.905, 24 -1};
		{ 2520.20142, -1371.66882, 28.53125 -1};
		{ 2397.40894, -1547.91370, 24.16406 -1};
		{ 2361.072, -1796.024, 13.547 -1};
		{ 2154.436, -1800.302, 13.551 -1};
		{ 1936.167, -1925.175, 13.547 -1};
		{ 1871.192, -1925.3, 13.547 -1};
		{ 1850.325, -1924.146, 13.468 -1};
		{ 1753.95386, -1894.28125, 13.55705 -1};
		{ 1577.022, -1822.371, 13.444 -1};
		{ 1412.41223, -1700.21094, 13.53949 -1};
		{ 1381.03320, -1753.16003, 13.54688 -1};
		{ 1352.302, -1753.763, 13.353 -1};
		{ 1208.46484, -1751.74805, 13.59337 -1};
		{ 1080.588, -1700.868, 13.547 -1};
		{ 942.43042, -1744.14563, 13.54688 -1};
	};
}

local function initializeOnVehicleEnter (p, s)
		if getElementData ( p, "Emprego" ) == "PizzaBoy" then
		if isElementWithinMarker( p, MarkerSafePizzaBoy) then
		local sourcePos = {getElementPosition(p)}
		local playerZone = getZoneName (sourcePos[1], sourcePos[2], sourcePos[3], true)
		if locations[playerZone] then
			triggerClientEvent (p, "requestPizzajobStart", p, locations[playerZone])
			exports.dxmessages:outputDx( p, "#00FF00• Emprego: #FFFFFFVocê pegou as pizzas, siga até a #00FF00casa #FFFFFFmarcada em seu mapa (F11)", "info")
		end
		sourcePos = nil
		playerZone = nil
	end
	end
end
addCommandHandler (cmd2, initializeOnVehicleEnter)

addEvent ("payMeWhatYouOweMe", true)
local function payMeWhatYouOweMe()
	givePlayerMoney (client, moneyPerPizza)
	exports.dxmessages:outputDx(client, "#00FF00• Emprego: #FFFFFFVocê Recebeu #FFFF00R$"..moneyPerPizza.." #FFFFFFpor entregar uma pizza, siga para a próxima entrega!", "success")
	setTimer (function(client)
		if not client then return end
		local sourcePos = {getElementPosition(client)}
		local playerZone = getZoneName (sourcePos[1], sourcePos[2], sourcePos[3], true)
		triggerClientEvent (client, "requestPizzajobStart", client, locations[playerZone])
		sourcePos = nil
		playerZone = nil
	end, 1500, 1, client)
end
addEventHandler ("payMeWhatYouOweMe", root, payMeWhatYouOweMe)

function CriarVeiculosComData ()
VeiculosComDataPizzaBoy = {
createVehicle(448, 2103.46948+4, -1784.28613, 13.38861, 0, 0, 0 ),
createVehicle(448, 2103.46948+6, -1784.28613, 13.38861, 0, 0, 0 ),
createVehicle(448, 2103.46948+8, -1784.28613, 13.38861, 0, 0, 0 ),
createVehicle(448, 2103.46948+10, -1784.28613, 13.38861, 0, 0, 0 ),
createVehicle(448, 2103.46948+12, -1784.28613, 13.38861, 0, 0, 0 ),
createVehicle(448, 2103.46948+14, -1784.28613, 13.38861, 0, 0, 0 ),
}

for i, veh in ipairs(VeiculosComDataPizzaBoy) do
setElementData ( veh, "Emprego", "PizzaBoy" )
setVehicleDamageProof(veh,true)
setVehicleColor( veh, 250, 175, 0 )
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
    if Jogador == "PizzaBoy" then
	else
    cancelEvent()
    exports.dxmessages:outputDx(thePlayer, "#00FF00• Emprego: #FFFFFFEsse veículo é exclusivo para #FFFF00Entregadores#FFFFFF!", "error")
    end
  end
end

local rElement = getRootElement() 
  
function respawnVehicles(player, seconds)
    for i, veh in ipairs(VeiculosComDataPizzaBoy) do
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