--[[



 ################################################
 #                                              #
 #              Script Criado Por               #
 #           FACEBOOK.COM/AIRNEWSCR             #
 #                                              #
 #                                              #
 ################################################



--]]

InteriorDP = 6
DimensaoDP = 0

local Departamento_Marker = createMarker ( 249.61310, 67.90508, 1003.64063 -1, "cylinder", 1.2, 20, 70, 230, 95 )
setElementInterior ( Departamento_Marker, InteriorDP )
setElementDimension ( Departamento_Marker, DimensaoDP )

local Entrada_LS = createMarker ( 1554.81995, -1675.62549, 16.19531 -1, "cylinder", 1.2, 20, 70, 230, 95 )
local Entrada_LS_Blip = createBlipAttachedTo ( Entrada_LS, 30 )
setBlipVisibleDistance ( Entrada_LS_Blip, 150 )

local Entrada_LV = createMarker ( 2287.06201, 2431.86523, 10.82031 -1, "cylinder", 1.2, 20, 70, 230, 95 )
local Entrada_LV_Blip = createBlipAttachedTo ( Entrada_LV, 30 )
setBlipVisibleDistance ( Entrada_LV_Blip, 150 )

local Entrada_SF = createMarker ( -1605.54163, 710.71606, 13.86719 -1, "cylinder", 1.2, 20, 70, 230, 95 )
local Entrada_SF_Blip = createBlipAttachedTo ( Entrada_SF, 30 )
setBlipVisibleDistance ( Entrada_SF_Blip, 150 )

local Saida = createMarker ( 246.76097, 63.05082, 1003.64063 -1, "cylinder", 1.2, 20, 70, 230, 95 )
setElementInterior ( Saida, InteriorDP )
setElementDimension ( Saida, DimensaoDP )

local Gate_DP_01 = createObject ( 985, 247, 72.599998474121, 1004.299987793, 0, 0, 180 )
setElementInterior ( Gate_DP_01, InteriorDP )
setElementDimension ( Gate_DP_01, DimensaoDP )

local Abrir_Gate_DP_01 = createMarker ( 246.40462, 72.35159, 1003.64063, "cylinder", 2, 255, 255, 255, 0 )
setElementInterior ( Abrir_Gate_DP_01, InteriorDP )
setElementDimension ( Abrir_Gate_DP_01, DimensaoDP )

local Gate_DP_02 = createObject ( 5422, 250.7001953125, 62.2001953125, 1004.5999755859, 0, 0, 0 )
setElementInterior ( Gate_DP_02, InteriorDP )
setElementDimension ( Gate_DP_02, DimensaoDP )

local Abrir_Gate_DP_02 = createMarker ( 250.52910, 63.29612, 1003.64063, "cylinder", 2, 255, 255, 255, 0 )
setElementInterior ( Abrir_Gate_DP_02, InteriorDP )
setElementDimension ( Abrir_Gate_DP_02, DimensaoDP )

function Entrar_Marker_AirNewSCR ( marker, md )
	if md then
	    if marker == Entrada_LS or marker == Entrada_LV or marker == Entrada_SF then
		    if not isPedInVehicle ( source ) then
                setTimer ( setElementInterior, 400, 1, source, InteriorDP )
                setTimer ( setElementDimension, 400, 1, source, DimensaoDP )
                setTimer ( setElementPosition, 400, 1, source, 246.76097, 63.05082 + 1, 1003.64063 )
                setTimer ( setElementRotation, 900, 1, source, 0, 0, 0 )
				if marker == Entrada_LS then
				    setElementData ( source, "Entrada_DP", "Entrada_LS" )
				elseif marker == Entrada_LV then
				    setElementData ( source, "Entrada_DP", "Entrada_LV" )
				elseif marker == Entrada_SF then
				    setElementData ( source, "Entrada_DP", "Entrada_SF" )
				end
                fadeCamera ( source, false, 0.1, 0, 0, 0 )   
                setTimer ( fadeCamera, 900, 1, source , true, 0.5 )
                setTimer ( setCameraTarget, 900, 1, source )
		    end			
		elseif marker == Saida then
		    if not isPedInVehicle ( source ) then
                setTimer ( setElementInterior, 400, 1, source, 0 )
                setTimer ( setElementDimension, 400, 1, source, 0 )
				if getElementData ( source, "Entrada_DP" ) == "Entrada_LS" then
                    setTimer ( setElementPosition, 400, 1, source, 1554.81995 - 1, -1675.62549, 16.19531 )
					setTimer ( setElementRotation, 900, 1, source, 0, 0, 90 )
				elseif getElementData ( source, "Entrada_DP" ) == "Entrada_LV" then
				    setTimer ( setElementPosition, 400, 1, source, 2287.06201, 2431.86523 - 1, 10.82031 )
					setTimer ( setElementRotation, 900, 1, source, 0, 0, 180 )
				elseif getElementData ( source, "Entrada_DP" ) == "Entrada_SF" then
				    setTimer ( setElementPosition, 400, 1, source, -1605.54163, 710.71606 + 1, 13.86719 )
					setTimer ( setElementRotation, 900, 1, source, 0, 0, 0 )
				end
                fadeCamera ( source, false, 0.1, 0, 0, 0 )   
                setTimer ( fadeCamera, 900, 1, source , true, 0.5 )
                setTimer ( setCameraTarget, 900, 1, source )
			end
		elseif marker == Abrir_Gate_DP_01 then
		    if getElementData ( source, "AirNewSCR_Entrada_PortaoDP" ) == "Sim" then
                moveObject ( Gate_DP_01, 700, 247, 72.599998474121, 1006.700012207 )
			else
			    setElementPosition ( source, 246.49457, 69.95558, 1003.64063 )
		    end
		elseif marker == Abrir_Gate_DP_02 then
		    if getElementData ( source, "AirNewSCR_Entrada_PortaoDP" ) == "Sim" then
                moveObject ( Gate_DP_02, 700, 250.7001953125, 62.2001953125, 1006.700012207 )
		    else
			    setElementPosition ( source, 248.43903, 63.55590, 1003.64063 )
		    end
		elseif marker == Departamento_Marker then
		    triggerClientEvent ( source, "AirNewSCR_AbrirDP", root )
		end
    end
end
addEventHandler ( "onPlayerMarkerHit", getRootElement(), Entrar_Marker_AirNewSCR )
 
function Sair_Marker_AirNewSCR ( marker, md )
	if md then
	    if marker == Abrir_Gate_DP_01 then
		    if getElementData ( source, "AirNewSCR_Entrada_PortaoDP" ) == "Sim" then
                moveObject ( Gate_DP_01, 700, 247, 72.599998474121, 1004.299987793 )
            end
		elseif marker == Abrir_Gate_DP_02 then
		    if getElementData ( source, "AirNewSCR_Entrada_PortaoDP" ) == "Sim" then
                moveObject ( Gate_DP_02, 700, 250.7001953125, 62.2001953125, 1004.5999755859 )
		    end
		elseif marker == Departamento_Marker then
		    triggerClientEvent ( source, "AirNewSCR_FecharDP", root )
		end
    end
end
addEventHandler ( "onPlayerMarkerLeave", getRootElement(), Sair_Marker_AirNewSCR )

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Carregar_AirNewSCR, 50, 1, acc )
  end
)

function Carregar_AirNewSCR ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			local Entrada_DP = getAccountData ( conta, "Entrada_DP" ) or 0
			setElementData ( source, "Entrada_DP", Entrada_DP )
		end
	end	
end

function Iniciar_Resource ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Carregar_AirNewSCR ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), Iniciar_Resource )

function Salvar_AirNewSCR ( conta )
	if conta then
		local source = getAccountPlayer ( conta )
		local Entrada_DP = getElementData ( source, "Entrada_DP" ) or 0
		setAccountData ( conta, "Entrada_DP", Entrada_DP )
	end
end

function Desligar_AirNewSCR ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Salvar_AirNewSCR ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), Desligar_AirNewSCR )

function Sair_AirNewSCR_Servidor ( quitType )
	local acc = getPlayerAccount(source)
	if not isGuestAccount ( acc ) then
		if acc then
			Salvar_AirNewSCR ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), Sair_AirNewSCR_Servidor )

function Pagar_Fianca ( Jogador_Selecionado, Valor )
    Jogador_Destinatario = getPlayerFromName ( Jogador_Selecionado )
	Dinheiro_Pagador = getPlayerMoney ( source )
	if Dinheiro_Pagador >= tonumber(Valor) then
	    if not isGuestAccount ( getPlayerAccount(Jogador_Destinatario)) then
	        local Controlador = getPlayerName ( source )
	        exports.Scripts_Dxmessages:outputDx ( source, "Sucesso: Você tirou o Jogador "..Jogador_Selecionado.." #ffffffda Prisão por $"..Valor.."!", "success")
	    	exports.Scripts_Dxmessages:outputDx ( Jogador_Destinatario, "Aviso: O Jogador "..Controlador.." #ffffffPagou $"..Valor.." Para te Soltarem da Prisão!", "warning")
			removeElementData(Jogador_Destinatario, "FeniX_Preso")
	        takePlayerMoney ( source, Valor )
			setElementData ( Jogador_Destinatario, "AirNew_PagouFianca", "Sim" )
			setElementData ( Jogador_Destinatario, "AirNew_Tempo_Prisao", tonumber(0) )
			setElementData ( Jogador_Destinatario, "AirNew_Preso", "Não" )
		else
	        exports.Scripts_Dxmessages:outputDx ( source, "Erro: O Jogador "..Jogador_Selecionado.." #ffffffNão está Logado!", "error")
        end
	else
        exports.Scripts_Dxmessages:outputDx ( source, "Erro: Você não Possui Dinheiro Suficiente!", "error")
	end
end
addEvent( "AirNew_PagarFianca", true )
addEventHandler( "AirNew_PagarFianca", getRootElement(), Pagar_Fianca )