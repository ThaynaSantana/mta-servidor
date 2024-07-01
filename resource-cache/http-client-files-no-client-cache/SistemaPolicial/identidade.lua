 --[[


 ################################################
 #                                              #                                                  
 #             SCRIPT DESENVOLVIDO POR:         #
 #             Facebook.com/FENIXMTA/           #
 #             Youtube.com/FENIXMTA             #
 #             Não retire os créditos !         #
 #                                              #
 ################################################




 --]]
 
setElementData(localPlayer,"cliente:policial",nil)  
 
local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

local dxfont0_fonte = dxCreateFont("Files/fonte.ttf", 10)
local dxfont1_fonte = dxCreateFont("Files/fonte.ttf", 11)

function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end


function dxIdentidade ()

        local nome = getElementData ( localPlayer, "PM_FeniX_RG_Nome" ) or "Erro N/A"
		local data = getElementData ( localPlayer, "PM_FeniX_RG_DataNascimento" ) or "Erro N/A"
		local sexo = getElementData ( localPlayer, "PM_FeniX_RG_Sexo" ) or "Erro N/A"
		local localOrigem = getElementData ( localPlayer, "PM_FeniX_RG_LocalOrigem" ) or "Erro N/A"
		local dinheiro = convertNumber(getElementData ( localPlayer, "PM_FeniX_RG_Money" )) or "Erro N/A"

        dxDrawRectangle(screenW * 0.3704, screenH * 0.2396, screenW * 0.2357, screenH * 0.4570, tocolor(0, 0, 0, 160), false)
        dxDrawRectangle(screenW * 0.3704, screenH * 0.2396, screenW * 0.2357, screenH * 0.0339, tocolor(0, 0, 0, 160), false)
        dxDrawText("Dados Jogador", screenW * 0.3712, screenH * 0.2383, screenW * 0.6061, screenH * 0.2734, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.3704, screenH * 0.2734, screenW * 0.2357, screenH * 0.0039, tocolor(255, 0, 0, 200), false)
        dxDrawText("Nome : "..nome.."", screenW * 0.3814, screenH * 0.3047, screenW * 0.5988, screenH * 0.3268, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, false, false)
        dxDrawText("Data de Nascimento : "..data.."", screenW * 0.3814, screenH * 0.3529, screenW * 0.5988, screenH * 0.3750, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, false, false)
        dxDrawText("Sexo : "..sexo.."", screenW * 0.3814, screenH * 0.4023, screenW * 0.5988, screenH * 0.4245, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, false, false)
        dxDrawText("Local de Origem : "..localOrigem.."", screenW * 0.3814, screenH * 0.4518, screenW * 0.5988, screenH * 0.4740, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, false, false)
        if getElementData ( localPlayer, "PM_FeniX_RG_Porte" ) == "Sim" then
	    dxDrawText("Porte de Armas : ( #00FF00✔ #FFFFFF)", screenW * 0.3814, screenH * 0.5013, screenW * 0.5988, screenH * 0.5234, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, true, false)
        else
		dxDrawText("Porte de Armas : ( #FF0000x #FFFFFF)", screenW * 0.3814, screenH * 0.5013, screenW * 0.5988, screenH * 0.5234, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, true, false)
        end
		dxDrawText("Dinheiro : "..dinheiro.."", screenW * 0.3814, screenH * 0.5508, screenW * 0.5988, screenH * 0.5729, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "left", "top", false, false, false, false, false)
        dxDrawImage(screenW * 0.4165, screenH * 0.6068, screenW * 0.1435, screenH * 0.0612, "Files/button.png", 0, 0, 0, tocolor(255, 0, 0, 200), false)
        dxDrawText("Finalizar Abordagem", screenW * 0.4165, screenH * 0.6042, screenW * 0.5600, screenH * 0.6680, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)

end


function abrirIdentidade()
  if not isEventHandlerAdded("onClientRender", getRootElement(), dxIdentidade) then
     addEventHandler ("onClientRender", root, dxIdentidade)
     showCursor(true)
     else
	 removeEventHandler ("onClientRender" , root, dxIdentidade)
     showCursor(false)
	 end
end

function receberSolicitacao ()
	if getElementData ( localPlayer, "FeniX_SolicitarFicha" ) == "Sim" then
		setElementData ( localPlayer, "FeniX_SolicitarFicha", "Não" )
		abrirIdentidade ()
	end
end
setTimer ( receberSolicitacao, 50, 0 )


function close (_,state)
	if isEventHandlerAdded("onClientRender", root, dxIdentidade) then  
		if state == "down" then
			if cursorPosition (screenW * 0.4165, screenH * 0.6068, screenW * 0.1435, screenH * 0.0612) then
				abrirIdentidade ()
			end
		end
	end
end
addEventHandler ( "onClientClick", root, close )

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

function cursorPosition(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end		