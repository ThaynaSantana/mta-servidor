--[[



 ################################################
 #                                              #
 #              Script Criado Por               #
 #           FACEBOOK.COM/AIRNEWSCR             #
 #                                              #
 #                                              #
 ################################################



--]]

local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

Presos_GUI = guiCreateGridList ( x*467, y*268, x*433, y*254, false )
Presos_Coluna = guiGridListAddColumn ( Presos_GUI, "Jogadores Presos", 0.3 )
Tempo_Coluna = guiGridListAddColumn ( Presos_GUI, "Tempo Preso", 0.3 )
Valor_Coluna = guiGridListAddColumn ( Presos_GUI, "Valor da Fiança", 0.3 )
guiSetVisible ( Presos_GUI, false )

DP_Estado_AirNewSCR = false

function Departamento_de_Policia_Presos ( )
	
    dxDrawLine(x*433 - 1, y*209 - 1, x*433 - 1, y*589, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawLine(x*933, y*209 - 1, x*433 - 1, y*209 - 1, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawLine(x*433 - 1, y*589, x*933, y*589, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawLine(x*933, y*589, x*933, y*209 - 1, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawRectangle(x*433, y*209, x*500, y*380, tocolor(0, 0, 0, 123), false)
   
    dxDrawRectangle(x*433, y*214, x*500, y*22, tocolor(0, 0, 0, 123), false)
    dxDrawLine(x*433, y*236, x*933, y*236, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawText("Departamento de Policia", x*433, y*214, x*933, y*236, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
   
    dxDrawLine(x*467 - 1, y*268 - 1, x*467 - 1, y*522, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawLine(x*900, y*268 - 1, x*467 - 1, y*268 - 1, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawLine(x*467 - 1, y*522, x*900, y*522, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawLine(x*900, y*522, x*900, y*268 - 1, tocolor(0, 0, 0, 255), x*1, false)
    dxDrawRectangle(x*467, y*268, x*433, y*254, tocolor(0, 0, 0, 123), false)
   
    dxDrawRectangle(x*910, y*214, x*23, y*22, tocolor(0, 0, 0, 0), false) -- Fechar
    dxDrawText("X", x*910 - 1, y*214 - 1, x*933 - 1, y*236 - 1, tocolor(0, 0, 0, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("X", x*910 + 1, y*214 - 1, x*933 + 1, y*236 - 1, tocolor(0, 0, 0, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("X", x*910 - 1, y*214 + 1, x*933 - 1, y*236 + 1, tocolor(0, 0, 0, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("X", x*910 + 1, y*214 + 1, x*933 + 1, y*236 + 1, tocolor(0, 0, 0, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("X", x*910, y*214, x*933, y*236, tocolor(255, 0, 0, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
    
	if Posicao_Mouse ( x*496, y*540, x*147, y*39 ) then
        dxDrawRectangle(x*496, y*540, x*147, y*39, tocolor(0, 255, 0, 123), false)
    else
	    dxDrawRectangle(x*496, y*540, x*147, y*39, tocolor(0, 0, 0, 123), false)
	end
	dxDrawText("Pagar Fiança", x*496, y*540, x*643, y*579, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
        
	if Posicao_Mouse ( x*723, y*540, x*147, y*39 ) then
	    dxDrawRectangle(x*723, y*540, x*147, y*39, tocolor(255, 0, 0, 123), false)
    else
	    dxDrawRectangle(x*723, y*540, x*147, y*39, tocolor(0, 0, 0, 123), false)
	end
	dxDrawText("Atualizar Lista", x*723, y*540, x*870, y*579, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)

end

function Jogadores_Presos ( )
	guiGridListClear ( Presos_GUI )
	for index, player in ipairs ( getElementsByType ( "player" ) ) do
	    local Preso = getElementData ( player, "AirNew_Tempo_Prisao" ) or 0
		if tonumber(Preso) > 0 then
			Row_AirNewSCR_Presos = guiGridListAddRow ( Presos_GUI )		    
			guiGridListSetItemText ( Presos_GUI, Row_AirNewSCR_Presos, Presos_Coluna, (string.gsub ( getPlayerName(player), '#%x%x%x%x%x%x', '' ) or getPlayerName(player)), false, false)
		    guiGridListSetItemData ( Presos_GUI, Row_AirNewSCR_Presos, Presos_Coluna, getPlayerName(player) )
			
		    local horas_seg = 3600
		    local hora = math.floor ( Preso / horas_seg )
		    local minuto = math.floor ( ( Preso - ( horas_seg * hora ) ) / 60 )
		    local segundo = math.floor ( ( Preso - ( horas_seg * hora )-( minuto * 60 ) ) )	
			
			guiGridListSetItemText ( Presos_GUI, Row_AirNewSCR_Presos, Tempo_Coluna, string.format ( "%02d:%02d", minuto, segundo ) or 0, false, false)
			guiGridListSetItemData ( Presos_GUI, Row_AirNewSCR_Presos, Tempo_Coluna, string.format ( "%02d:%02d", minuto, segundo ) )
			
			Valor_do_Segundo = tonumber(Preso) * 800
			
			guiGridListSetItemText ( Presos_GUI, Row_AirNewSCR_Presos, Valor_Coluna, "$"..Valor_do_Segundo.."" or 0, false, false)
			guiGridListSetItemData ( Presos_GUI, Row_AirNewSCR_Presos, Valor_Coluna, Valor_do_Segundo )
		end
	end
end
addEventHandler ( "onClientPlayerJoin", getRootElement(), Jogadores_Presos )
addEventHandler ( "onClientPlayerQuit", getRootElement(), Jogadores_Presos )
addEventHandler ( "onClientResourceStart", getRootElement(), Jogadores_Presos )
addEventHandler ( "onClientPlayerChangeNick", getRootElement(), Jogadores_Presos )

function Abrir_DP_AirNewSCR ( )
    if DP_Estado_AirNewSCR == false then
		showCursor ( true )
		addEventHandler ( "onClientRender", getRootElement(), Departamento_de_Policia_Presos )
        guiSetVisible ( Presos_GUI, true )
		playSoundFrontEnd ( 43 )
		DP_Estado_AirNewSCR = true
		Jogadores_Presos ( )
    end
end
addEvent ( "AirNewSCR_AbrirDP", true)
addEventHandler ( "AirNewSCR_AbrirDP", root, Abrir_DP_AirNewSCR )

function Fechar_DP_AirNewSCR ( )
    if DP_Estado_AirNewSCR == true then
		showCursor ( false )
		removeEventHandler ( "onClientRender", getRootElement(), Departamento_de_Policia_Presos )
        guiSetVisible ( Presos_GUI, false )
		playSoundFrontEnd ( 40 )
		DP_Estado_AirNewSCR = false
		Jogadores_Presos ( )
    end
end
addEvent ( "AirNewSCR_FecharDP", true)
addEventHandler ( "AirNewSCR_FecharDP", root, Fechar_DP_AirNewSCR )

function Selecionar_AirNewSCR ( _, state )
    if DP_Estado_AirNewSCR == true then
	    if state == "down" then
		    if Posicao_Mouse ( x*910, y*214, x*23, y*22 ) then -- Fechar
			    Fechar_DP_AirNewSCR ( )
			elseif Posicao_Mouse ( x*496, y*540, x*147, y*39 ) then -- Pagar Fiança Presos_Coluna
			    Jogador_Selecionado = guiGridListGetItemData ( Presos_GUI, guiGridListGetSelectedItem ( Presos_GUI ), 1 ) or nil
				Valor = guiGridListGetItemData ( Presos_GUI, guiGridListGetSelectedItem ( Presos_GUI ), 3 ) or 0
			    if Jogador_Selecionado == nil then
		    	    return outputChatBox ( "Selecione um Jogador antes de Pagar a Fiança!" )
				end
			    triggerServerEvent ( "AirNew_PagarFianca", localPlayer, Jogador_Selecionado, Valor )
				outputChatBox ( ""..Jogador_Selecionado.."/"..Valor.."" )
				Fechar_DP_AirNewSCR ( )
			elseif Posicao_Mouse ( x*723, y*540, x*147, y*39 ) then
			    Jogadores_Presos ( ) -- Atualizar a Lista de Presos
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Selecionar_AirNewSCR )

function Posicao_Mouse ( x, y, Largura, Altura )
	if not isCursorShowing ( ) then
		return false
	end
	local sx, sy = guiGetScreenSize()
	local cx, cy = getCursorPosition()
	local cx, cy = (cx*sx), (cy*sy)
	if (cx >= x and cx <= x + Largura) and (cy >= y and cy <= y + Altura) then
		return true
	else
		return false
	end
end