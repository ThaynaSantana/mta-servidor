local AgenciaDeEmpregos = createMarker ( 1567.787, -1893.552, 13.655 -1, "cylinder", 1.1, 101, 219, 82, 90)
setElementInterior ( AgenciaDeEmpregos, 0 )
setElementDimension ( AgenciaDeEmpregos, 0 )

local EntregadorDeJornal = createBlip( 1281.067, -1542.18, 13.522, 0 )
setElementVisibleTo ( EntregadorDeJornal, root, false )
local EntregadorDeJornalMarker = createMarker ( 1281.067, -1542.18, 13.522 -1, "cylinder", 1.2, 20, 70, 230, 0 )

local PizzaBoy = createBlip( 2101.46094, -1801.56970, 13.55469, 0 )
setElementVisibleTo ( PizzaBoy, root, false )
local PizzaBoyMarker = createMarker ( 2101.46094, -1801.56970, 13.55469 -1, "cylinder", 1.2, 20, 70, 230, 0 )

local Petroleiro = createBlip( 2670.179, -2396.924, 13.633, 0 )
setElementVisibleTo ( Petroleiro, root, false )
local PetroleiroMarker = createMarker ( 2670.179, -2396.924, 13.633 -1, "cylinder", 1.2, 20, 70, 230, 0 )

local MotoristaDeOnibus = createBlip( 2372.16, -1818.036, 13.547, 0 )
setElementVisibleTo ( MotoristaDeOnibus, root, false )
local MotoristaDeOnibusMarker = createMarker ( 2372.16, -1818.036, 13.547 -1, "cylinder", 1.2, 20, 70, 230, 0 )

local EntregadorDeMaconha = createBlip( 2195.978, -2247.559, 13.547, 0 )
setElementVisibleTo ( EntregadorDeMaconha, root, false )
local EntregadorDeMaconhaMarker = createMarker ( 2195.978, -2247.559, 13.547 -1, "cylinder", 1.2, 20, 70, 230, 0 )

local EntregadorDeEtanol = createBlip( 864.363, -1235.901, 14.841, 0 )
setElementVisibleTo ( EntregadorDeEtanol, root, false )
local EntregadorDeEtanolMarker = createMarker ( 864.363, -1235.901, 14.841 -1, "cylinder", 1.2, 20, 70, 230, 0 )

local EntregadorDePescador = createBlip( 707.848, -1912.295, 2.221, 0 )
setElementVisibleTo ( EntregadorDePescador, root, false )
local EntregadorDePescadorMarker = createMarker ( 707.848, -1912.295, 2.221 , "cylinder", 1.2, 20, 70, 230, 0 )

local EntregadorDeSedex = createBlip( 1771.337, -1908.439, 13.555, 0 )
setElementVisibleTo ( EntregadorDeSedex, root, false )
local EntregadorDeSedexMarker = createMarker ( 1771.337, -1908.439, 13.555, "cylinder", 1.2, 20, 70, 230, 0 )

function emarker(marker,md)
	if (md) then
		if marker == Entrada then		 
         setTimer ( setElementInterior, 400, 1, source, 3 )
         setTimer ( setElementDimension, 400, 1, source, 0 )
         setTimer ( setElementPosition, 400, 1, source, -2030.2668457031,-117.47930908203,1035.171875 )
         setTimer ( setElementRotation, 900, 1, source, 0, 0, 90 )
         fadeCamera ( source, false, 0.1, 0, 0, 0 )   
         setTimer ( fadeCamera, 900, 1, source , true, 0.5 )
         setTimer ( setCameraTarget, 900, 1, source )
		end
		if marker == Saida then
         setTimer ( setElementInterior, 400, 1, source, 0 )
         setTimer ( setElementDimension, 400, 1, source, 0 )
         setTimer ( setElementPosition, 400, 1, source, 1153.9119873047, -1770.1124267578, 16.59375 )
		 setTimer ( setElementRotation, 900, 1, source, 0, 0, 0 )
         fadeCamera ( source, false, 0.1, 0, 0, 0 )   
         setTimer ( fadeCamera, 900, 1, source , true, 0.5 )
         setTimer ( setCameraTarget, 900, 1, source )
		end
		if marker == AgenciaDeEmpregos then
		 if isPedInVehicle ( source ) then return end
		  triggerClientEvent ( source, "AirNew>AbrirAgencia", root)
		end
		if marker == EntregadorDeJornalMarker or marker == EntregadorDeSedexMarker or marker == PizzaBoyMarker or marker == EntregadorDePescadorMarker or marker == EntregadorDeEtanolMarker or marker == PetroleiroMarker or marker == EntregadorDeMaconhaMarker or marker == MotoristaDeOnibusMarker then
		 TudoInvisivel ()
	    end
    end
end
addEventHandler("onPlayerMarkerHit",getRootElement(),emarker)

function lmarker(marker,md)
	if (md) then
		if marker == AgenciaDeEmpregos then
		 triggerClientEvent ( source, "AirNew>FecharAgencia", root)
		end
    end
end
addEventHandler("onPlayerMarkerLeave",getRootElement(),lmarker)

function TudoInvisivel ()
setElementVisibleTo ( EntregadorDeJornal, source, false )
setElementVisibleTo ( EntregadorDePescador, source, false )
setElementVisibleTo ( EntregadorDeMaconha, source, false )
setElementVisibleTo ( PizzaBoy, source, false )
setElementVisibleTo ( Petroleiro, source, false )
setElementVisibleTo ( MotoristaDeOnibus, source, false )
setElementVisibleTo ( EntregadorDeEtanol, source, false )
setElementVisibleTo ( EntregadorDeSedex, source, false )
end

function EntregadorDeJornalAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( EntregadorDeJornal, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Entregador de Jornal" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Entregador de Jornais#ffffff!", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
end
end
addEvent( "Encaminhar>EntregadorDeJornal", true )
addEventHandler( "Encaminhar>EntregadorDeJornal", getRootElement(), EntregadorDeJornalAirNew )

function PizzaBoyAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( PizzaBoy, source, true )
setElementData ( source, "AirNew>Encaminhamento", "PizzaBoy" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Pizza Boy #FFFFFFem uma #FFFF00Lanchonete", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 5", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>PizzaBoy", true )
addEventHandler( "Encaminhar>PizzaBoy", getRootElement(), PizzaBoyAirNew )

function PetroleiroAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( Petroleiro, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Petroleiro" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Petroleiro#FFFFFF!", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 12", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>Petroleiro", true )
addEventHandler( "Encaminhar>Petroleiro", getRootElement(), PetroleiroAirNew )

function MotoristaDeOnibusAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( MotoristaDeOnibus, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Motorista de Onibus" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Motorista#FFFFFF!", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 17", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>MotoristaDeOnibus", true )
addEventHandler( "Encaminhar>MotoristaDeOnibus", getRootElement(), MotoristaDeOnibusAirNew )

function EntregadorDeMaconhaAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( EntregadorDeMaconha, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Entregador De Maconha" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Transportador#FFFFFF!", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 26", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>EntregadorDeMaconha", true )
addEventHandler( "Encaminhar>EntregadorDeMaconha", getRootElement(), EntregadorDeMaconhaAirNew )

function EntregadorDeEtanolAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( EntregadorDeEtanol, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Entregador De Etanol" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Transportador#FFFFFF!", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 22", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>EntregadorDeEtanol", true )
addEventHandler( "Encaminhar>EntregadorDeEtanol", getRootElement(), EntregadorDeEtanolAirNew )

function EntregadorDeSedexAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( EntregadorDeSedex, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Entregador de Sedex" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê foi aceito como #FFFF00Entregador#ffffff!", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 8", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>EntregadorDeSedex", true )
addEventHandler( "Encaminhar>EntregadorDeSedex", getRootElement(), EntregadorDeSedexAirNew )

function EntregadorDePescadorAirNew ()
local Level = getElementData ( source, "Level" ) or 0
if Level >= 0 then
TudoInvisivel ()
setElementVisibleTo ( EntregadorDePescador, source, true )
setElementData ( source, "AirNew>Encaminhamento", "Entregador de Pescador" )
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê agora é um #FFFF00Pescador", source, 255, 255, 255, true )
outputChatBox ( "Para iniciar o trabalho vá até o #FF0000checkpoint #FFFFFFmarcado em seu mapa (F11)", source, 255, 255, 255, true )
setElementData ( source, "Emprego", false )
else
outputChatBox ( "#00FF00• Emprego: #FFFFFFVocê não possui experiência suficiente para trabalhar com isso, chegue ao #00FF00Level 3", source, 255, 255, 255, true )
end
end
addEvent( "Encaminhar>EntregadorDePescador", true )
addEventHandler( "Encaminhar>EntregadorDePescador", getRootElement(), EntregadorDePescadorAirNew )