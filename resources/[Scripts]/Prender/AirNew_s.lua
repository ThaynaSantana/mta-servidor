InteriorDP = 6
DimensaoDP = 0

Grupo = { "Policial" } -- Grupos do Painel P, que terá acesso ao DX !

function isPlayerOnGroup2 ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( Grupo ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) ) then
            inGroup = true
            break
        end
    end
    return inGroup
end

Distancia_Comandos = 7

Deixar_Preso = createMarker ( 1535.73486, -1672.03137, 13.38281 -1, "cylinder", 10, 255, 255, 255, 0 )

Local_Preso = createMarker ( 264.08435, 77.60955, 1001.03906 -1, "cylinder", 2.5, 255, 255, 255, 0 )
setElementInterior ( Local_Preso, InteriorDP )
setElementDimension ( Local_Preso, DimensaoDP )

function emarker ( marker, md )
	if md then
	    if marker == Deixar_Preso then
		    if getElementData ( source, "ocupacao" ) == "Policial" then
		        setElementData ( source, "AirNewSCR_PrisaoArea", "Sim" )
				exports.Scripts_OnMarkerMsgs_:create ( source, "Aviso: Aperte F9 para Abrir / Fechar o Painel de Prender do DP" )
			end
		end
    end
end
addEventHandler ( "onPlayerMarkerHit", getRootElement ( ), emarker )

function lmarker ( marker, md )
	if md then
	    if marker == Deixar_Preso then
		    setElementData ( source, "AirNewSCR_PrisaoArea", "Não" )
			exports.Scripts_OnMarkerMsgs_:delete(source)
		end
    end
end
addEventHandler ( "onPlayerMarkerLeave", getRootElement ( ), lmarker )

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	


function voltarCmd ()
removeElementData(source, "FeniX_Preso")
end
addEvent("voltarCmd", true)
addEventHandler("voltarCmd", getRootElement ( ), voltarCmd )


function Verificar_Emprego_Atual ( )
	for i, player in ipairs(getElementsByType("player")) do
		local acc = getPlayerAccount(player)
		if acc and not isGuestAccount(acc) then
			local job = getElementData(player,'ocupacao')
			local accName = getAccountName (acc)
			 if isPlayerOnGroup2 ( player ) then
			    setElementData ( player, "ocupacao", "Policial" )
			    setElementData ( player, "AirNewSCR_Entrada_PortaoDP", "Sim" )
				setElementData ( player, "AirNew_Perm_Prender", "Sim" )
			else
			    setElementData ( player, "ocupacao", "Criminoso" )
			    setElementData ( player, "AirNewSCR_Entrada_PortaoDP", "Não" )
				setElementData ( player, "AirNew_Perm_Prender", "Não" )
			end
		end
	end
end
setTimer ( Verificar_Emprego_Atual, 1500, 0 )

local Prisao_Blip = createBlip ( 1535.89856, -1672.66479, 13.38281 )
setElementVisibleTo ( Prisao_Blip, root, false )

function Nivel_de_Procurado ( source, int )
	if int == 0 then
		setPlayerWantedLevel ( source, int )
	else
		local wl = getPlayerWantedLevel ( source )
		if wl + int <= 6 then
			setPlayerWantedLevel ( source, wl+int )
		else
			setPlayerWantedLevel ( source, 6 )
		end
	end
end
addEvent("AirNewSCR_Nivel_de_Procurado", true)
addEventHandler("AirNewSCR_Nivel_de_Procurado", getRootElement ( ), Nivel_de_Procurado )

function Mensagens_Exports ( source, msg )
	exports.Scripts_Textos:createNewDxMessage ( msg, source, 255, 255, 255 )
end
addEvent ( "AirNewSCR_Mensagens_Exports", true)
addEventHandler ( "AirNewSCR_Mensagens_Exports", getRootElement ( ), Mensagens_Exports )

function Enviar_Prisao_Servidor ( Jogador, Numero, Formato, Motivo )
    outputChatBox ( "#58ACFAPolicia: O Policial #ffffff"..getPlayerName(source).." #58ACFAPrendeu o Jogador #ffffff"..Jogador.."!", root, 255, 255, 255, true )
    outputChatBox ( "#58ACFAPolicia: Pelo tempo de "..Numero.." "..Formato..", Motivo: "..Motivo.."!", root, 255, 255, 255, true )
    Jogador_Func = getPlayerFromName ( Jogador )
    Estrelas_Preso = getPlayerWantedLevel ( Jogador_Func )
    givePlayerMoney ( source, Estrelas_Preso*1000 )
    if Formato == "Segundo(s)" then
        Multiplicador = 1
    elseif Formato == "Minuto(s)" then
        Multiplicador = 60
    elseif Formato == "Hora(s)" then
        Multiplicador = 3600
    elseif Formato == "Dia(s)" then
        Multiplicador = 86400
    end
    TempoPrisao = Numero*Multiplicador
    setElementData ( Jogador_Func, "AirNew_Tempo_Prisao", TempoPrisao )
    setElementData ( Jogador_Func, "AirNew_Preso", "Sim" )
	setPlayerWantedLevel ( Jogador_Func, 0 )
	takeAllWeapons ( Jogador_Func )
	setElementData ( Jogador_Func, "FeniXMTA_Preso", false )
	detachElements (Jogador_Func, getElementAttachedTo(Jogador_Func) )
	lx, ly, lz = getElementPosition (Jogador_Func)
	setElementPosition (Jogador_Func, lx+2 , ly+2 , lz)	
	setPedAnimation (Jogador_Func)
	
	setElementData ( Jogador_Func, "Policia:Captura", false )
	setElementData ( Jogador_Func, "Player:Msg", "" )
	showCursor ( Jogador_Func, false)
	setControlState ( Jogador_Func, "sprint", false)
	setControlState ( Jogador_Func, "walk", false)
	setControlState ( Jogador_Func, "forwards", false)
	toggleAllControls ( Jogador_Func, true )
	
	triggerClientEvent ( source, "CancelTimeParaPrender:Time", source )
	
	if getElementData ( Jogador_Func, "algemado" ) == true then
		setElementData ( Jogador_Func, "algemado", false )
		setPedAnimation ( Jogador_Func )
		setElementFrozen ( Jogador_Func, false )
		toggleControl ( Jogador_Func, "fire", true )
	end
end
addEvent( "AirNew_Enviar_Prisao", true )
addEventHandler( "AirNew_Enviar_Prisao", getRootElement(), Enviar_Prisao_Servidor )

function Capturar_Jogador ( source, wantedlevel, vitima )
	local x, y, z = getElementPosition ( vitima )
	if x < -518 and y < 0 then -- SF
		time = 4
	end
	if x >= -518 and y < 510 then -- LS
		time = 2
	end
	if x >= -518 and y >= 510 then -- LV
		time = 4
	end	
	setElementData ( source, "PoliceToPrision:Time", tonumber(time*60) )	
	setTimer ( triggerClientEvent, 10000, 1, source, "ShowTimeParaPrender:Time", source )
	
	exports.Scripts_Textos:createNewDxMessage ( "Você foi Capturado pelo Policial "..getPlayerName(source), vitima, 255, 255, 255 )
	exports.Scripts_Textos:createNewDxMessage ( "Você tem "..time.." Minutos para Levar o Jogador para a Prisão!", source, 255, 255, 255 )
	
	toggleAllControls ( vitima, false )
	setElementVisibleTo ( Prisao_Blip, source, true )
end
addEvent("AirNewSCR_Capturar_Jogador", true)
addEventHandler("AirNewSCR_Capturar_Jogador", getRootElement(), Capturar_Jogador )

function Teleportar_Capturado_Veiculo ( state, player , vehicle , seat )
	if state == true then
		if seat and isElement ( vehicle ) then
		    warpPedIntoVehicle ( player, vehicle, seat )
		end
	else 
		removePedFromVehicle ( player )
	end
end
addEvent ( "AirNewSCR_TeleportarVeiculo", true )
addEventHandler ( "AirNewSCR_TeleportarVeiculo", getRootElement ( ), Teleportar_Capturado_Veiculo )

function Remover_Jogador_Veiculo ( player )
    removePedFromVehicle ( player )
end
addEvent ( "AirNewSCR_Remover_Jogador_Veiculo", true )
addEventHandler ( "AirNewSCR_Remover_Jogador_Veiculo", getRootElement ( ), Remover_Jogador_Veiculo )

function Teleportar_Capturado_Player ( source, type, value, x, y ,z)
	local Policial = getElementData ( source, "Policia:Captura" )
	if isElement ( Policial ) and not isPedInVehicle ( source ) then
		if type == "INT" then
			setElementInterior ( source, value )
		elseif type == "DIM" then
			setElementDimension ( source, value )
		end
		setElementPosition ( source, x, y ,z )
	end
end
addEvent ( "AirNewSCR_TeleportarPlayer", true )
addEventHandler ( "AirNewSCR_TeleportarPlayer", getRootElement ( ), Teleportar_Capturado_Player )

function Liberar_Capturado ( source )	
	for p, player in ipairs ( getElementsByType ( "player" ) ) do	
		job = getElementData ( player,"ocupacao" ) or "Nenhum"
		capturado = getElementData ( player, "Policia:Captura" )
		if job == "Criminoso" and isElement ( capturado ) then
			if capturado == source then
				Soltar_Fail_Captura ( source, player )
				setElementData ( player, "FeniXMTA_Preso", false )
        removeElementData(player, "FeniX_Preso")
			end
		end
	end
end
addEvent ( "AirNewSCR_FalharCapturaLiberar", true )
addEventHandler ( "AirNewSCR_FalharCapturaLiberar", getRootElement ( ), Liberar_Capturado )

function Soltar_Fail_Captura ( policial, vitima )
	exports.Scripts_Textos:createNewDxMessage ( "O policial falhou e voce está solto novamnte, fuja",vitima, 255, 255, 255 )
	exports.Scripts_Textos:createNewDxMessage ( "Voce falhou e o criminoso está solto novamente",policial, 255, 255, 255 )
	setElementVisibleTo ( Prisao_Blip, policial, false )
	setElementData ( vitima, "Policia:Captura", false )
	setElementData ( vitima, "Player:Msg", "" )
	showCursor ( vitima, false )
	setControlState ( vitima, "sprint", false )
	setControlState ( vitima, "walk", false )
	setControlState ( vitima, "forwards", false )
	toggleAllControls ( vitima, true )
end

--- // Salvamento - Carregamento // ---

addEventHandler("onPlayerLogin", root,
function( _, acc )
 CarregarLoginPlay ( acc )
 end
)

function CarregarLoginPlay ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			local AirNew_Tempo_Prisao = getAccountData ( conta, "AirNew_Tempo_Prisao" ) or 0
			setElementData ( source, "AirNew_Tempo_Prisao", AirNew_Tempo_Prisao )
			local AirNew_Preso = getAccountData ( conta, "AirNew_Preso" ) or "Não"
			setElementData ( source, "AirNew_Preso", AirNew_Preso )
		end
	end	
end

function ReiniciarScript ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs ( getElementsByType ( "player" ) ) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				CarregarLoginPlay ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), ReiniciarScript )

--

function SalvarLoginPlay ( conta )
	if conta then
		local source = getAccountPlayer ( conta )
		local AirNew_Tempo_Prisao = getElementData ( source, "AirNew_Tempo_Prisao" ) or 0
		setAccountData ( conta, "AirNew_Tempo_Prisao", AirNew_Tempo_Prisao )
		local AirNew_Preso = getElementData ( source, "AirNew_Preso" ) or "Não"
		setAccountData ( conta, "AirNew_Preso", AirNew_Preso )
	end	
end

function DesligarScript ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs ( getElementsByType ( "player" ) ) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				SalvarLoginPlay ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement ( ), DesligarScript )

function JogadorQuit ( quitType )
	local acc = getPlayerAccount ( source )
	if not isGuestAccount ( acc ) then
		if acc then
			SalvarLoginPlay ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement ( ), JogadorQuit )