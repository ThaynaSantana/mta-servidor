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
 
local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH) 

local dxfont0_Fonte = dxCreateFont("Files/fonte.ttf", 10)
local dxfont1_Fonte = dxCreateFont("Files/fonte.ttf", 12)

local nome = createElement("dxEditBox3") 
local dataNascimento = createElement("dxEditBox3") 
local sexo = createElement("dxEditBox3") 
local localOrigem = createElement("dxEditBox3") 

function dxRG ()

    exports["[FM]Blur"]:dxDrawBluredRectangle(screenW * 0.3843, screenH * 0.2344, screenW * 0.2277, screenH * 0.5534, tocolor(255, 255, 255, 255))
    dxDrawRectangle(screenW * 0.3843, screenH * 0.2344, screenW * 0.2277, screenH * 0.5534, tocolor(0, 0, 0, 160), false)
    dxDrawEditBox("Nome", screenW * 0.4165, screenH * 0.3633, screenW * 0.1633, screenH * 0.0313, false, 25, nome) 
    dxDrawEditBox("Data de Nascimento", screenW * 0.4173, screenH * 0.4349, screenW * 0.1633, screenH * 0.0313, false, 10, dataNascimento) 
    dxDrawEditBox("Sexo", screenW * 0.4165, screenH * 0.5065, screenW * 0.1633, screenH * 0.0313, false, 9, sexo) 
    dxDrawEditBox("Local de Origem", screenW * 0.4165, screenH * 0.5781, screenW * 0.1633, screenH * 0.0313, false, 20, localOrigem) 
    dxDrawImage(screenW * 0.4400, screenH * 0.6510, screenW * 0.1157, screenH * 0.0521, "Files/button.png", 0, 0, 0, corBotaoDefinir, false)
    corBotaoDefinir = tocolor(255, 0, 0, 160)   
    if cursorPosition(screenW * 0.4400, screenH * 0.6510, screenW * 0.1157, screenH * 0.0521) then
    corBotaoDefinir = tocolor(255, 0, 0, 200)
end
	dxDrawText("Definir", screenW * 0.4407, screenH * 0.6484, screenW * 0.5556, screenH * 0.7031, tocolor(255, 255, 255, 255), 1.00, dxfont1_Fonte, "center", "center", false, false, false, false, false)
    dxDrawText("Atenciosamente Equipe @AC", screenW * 0.3843, screenH * 0.7487, screenW * 0.6120, screenH * 0.7786, tocolor(255, 255, 255, 255), 1.00, dxfont0_Fonte, "center", "center", false, false, false, false, false)
    dxDrawRectangle(525, 601, 311, 4, tocolor(255, 0, 0, 160), false)
    dxDrawText("Notamos que é sua primeira vez na cidade", screenW * 0.3953, screenH * 0.2708, screenW * 0.5996, screenH * 0.2956, tocolor(255, 255, 255, 255), 1.00, dxfont0_Fonte, "left", "top", false, false, false, false, false)
    dxDrawText("Por Favor preenche os dados abaixo.", screenW * 0.3953, screenH * 0.2950, screenW * 0.5732, screenH * 0.3268, tocolor(255, 255, 255, 255), 1.00, dxfont0_Fonte, "left", "top", false, false, false, false, false)
    dxDrawText("BR/PT Arena MTA", screenW * 0.3953, screenH * 0.2422, screenW * 0.4788, screenH * 0.2669, tocolor(255, 0, 0, 255), 1.00, dxfont0_Fonte, "left", "top", false, false, false, false, false)
	if getElementData(localPlayer, "FeniX:MsgErro") then
	exports["[FM]Blur"]:dxDrawBluredRectangle(screenW * 0.0073, screenH * 0.3008, screenW * 0.1816, screenH * 0.0404, tocolor(255, 255, 255, 255))
	dxDrawRectangle(screenW * 0.0073, screenH * 0.3008, screenW * 0.1816, screenH * 0.0404, tocolor(0, 0, 0, 160), false)
    dxDrawRectangle(screenW * 0.0073, screenH * 0.3372, screenW * 0.1816, screenH * 0.0039, tocolor(255, 0, 0, 160), false)
    dxDrawText(""..getElementData(localPlayer, "FeniX:MsgErro"), screenW * 0.0146, screenH * 0.3008, screenW * 0.1640, screenH * 0.3372, tocolor(255, 255, 255, 255), 1.00, dxfont0_Fonte, "left", "center", false, false, false, false, false)
	end
end

function dxMsg ()

	if getElementData(localPlayer, "FeniX:Msg") then
    exports["[FM]Blur"]:dxDrawBluredRectangle(screenW * 0.0073, screenH * 0.3008, screenW * 0.2006, screenH * 0.0404, tocolor(255, 255, 255, 255))
    dxDrawRectangle(screenW * 0.0073, screenH * 0.3008, screenW * 0.2006, screenH * 0.0404, tocolor(0, 0, 0, 160), false)
    dxDrawRectangle(screenW * 0.0073, screenH * 0.3372, screenW * 0.2006, screenH * 0.0039, tocolor(255, 0, 0, 160), false)
    dxDrawText(""..getElementData(localPlayer, "FeniX:Msg"), screenW * 0.0146, screenH * 0.3008, screenW * 0.2042, screenH * 0.3372, tocolor(255, 255, 255, 255), 1.00, dxfont0_Fonte, "left", "center", false, false, false, false, false)
	end

end

camera = {
	[1] = {1785.5252685547,-1670.3322753906,197.42810058594,1824.4713134766,-1419.6008300781,206.25146484375,298.618, -1781.733, 46.114}, 
	[2] = {341.279, -2012.911, 28.072,2424.805, -1727.568, 44.648,-1579.8115234375,606.18676757813,61.850708007813}, 
	[3] = {657.015, -1202.206, 58.425,1472.077, -1413.87, 84.744,2210.75, -1038.502, 88.452}, 
	[4] = {1281.0335693359,-884.94543457031,86.771049499512,1415.4288330078,-907.2900390625,85.035575866699,1415.4951171875,-808.62286376953,87.2880859375}
}

local i = 1
local dx = 0.0
function cameramov ()
    if dx < 1 then
        dx = dx+0.001
		    local _x, _y, _z = interpolateBetween ( camera[i][1], camera[i][2], camera[i][3], camera[i][4], camera[i][5], camera[i][6], dx, "SineCurve")
		    setCameraMatrix ( _x, _y, _z, camera[i][7], camera[i][8], camera[i][9])
	elseif dx > 0 then
        _x, _y, _z = nil, nil, nil
	    dx = 0.0
		i = i + 1
		if ( i >= 7) then
		    i = 1
			dx = 0.0
		end	
	end
end

function abrirDx()
  if not isEventHandlerAdded("onClientRender", getRootElement(), dxRG) then
     showChat(false)
     addEventHandler ( "onClientRender",root,renderBlur)
     musica = playSound( "Files/sound.mp3", true )
     addEventHandler("onClientRender",root,cameramov)
     addEventHandler ("onClientRender", root, dxRG)
	 addEventHandler ("onClientRender", root, dxMsg)
     showCursor(true)
	 else
	 removeEventHandler ("onClientRender" , root, dxRG)
	 showCursor(false)
	 setTimer(function()
	 removeEventHandler ("onClientRender" , root, dxMsg)
	 end, 2500, 1)
    end
end
addEvent("FeniX:abrirDx",true)
addEventHandler( "FeniX:abrirDx", getRootElement( ), abrirDx)


function ConfigurarBrancos ()
	if isEventHandlerAdded("onClientRender", getRootElement(), dxRG) then
	    local nome1 = getElementData(nome, "text2")
        local dataNascimento1 = getElementData(dataNascimento, "text2")
        local sexo1 = getElementData(sexo, "text2") 
        local localOrigem1 = getElementData(localOrigem, "text2")
		FeniXMTA_01 = nome1
		FeniXMTA_02 = dataNascimento1
		FeniXMTA_03 = sexo1
		FeniXMTA_04 = localOrigem1
	end
end
setTimer ( ConfigurarBrancos, 50, 0 )

FeniXMTA_01 = 0
FeniXMTA_02 = 0
FeniXMTA_03 = 0
FeniXMTA_04 = 0
FeniXMTA_05 = 0

function definirRG (_,state)
 if isEventHandlerAdded("onClientRender", root, dxRG) then  
  if state == "down" then
  if cursorPosition (screenW * 0.4400, screenH * 0.6510, screenW * 0.1157, screenH * 0.0521) then 
  local nome1 = getElementData(nome, "text2")
  local dataNascimento1 = getElementData(dataNascimento, "text2")
  local sexo1 = getElementData(sexo, "text2") 
  local localOrigem1 = getElementData(localOrigem, "text2")
  if nome1 == "" or dataNascimento1 == "" or sexo1 == "" or localOrigem1 == "" then
  setElementData(localPlayer, "FeniX:MsgErro", "Preenche os dados Primeiro!")
  setTimer(function()
  setElementData(localPlayer, "FeniX:MsgErro", false)
  end, 2500, 1)
  return
  end
  removeEventHandler ( "onClientRender",root, renderBlur)
  removeEventHandler("onClientRender",root,cameramov)
  setCameraTarget(getLocalPlayer())
  abrirDx()
  showChat(true)
  stopSound( musica )
  setElementData(localPlayer, "FeniX:Msg", "Registro feito com Sucesso , Parabéns!")
  setTimer(function()
  setElementData(localPlayer, "FeniX:Msg", false)
  setElementData ( localPlayer, "FeniX_RG_Nome", ""..FeniXMTA_01.."" )
  setElementData ( localPlayer, "FeniX_RG_DataNascimento", ""..FeniXMTA_02.."" )
  setElementData ( localPlayer, "FeniX_RG_Sexo", ""..FeniXMTA_03.."" )
  setElementData ( localPlayer, "FeniX_RG_LocalOrigem", ""..FeniXMTA_04.."" )
  end, 2500, 1)
	  end
    end
  end
end
addEventHandler ( "onClientClick", root, definirRG )

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

local screenWidth, screenHeight = guiGetScreenSize()
local blurStrength = 1
local ScreenSource = dxCreateScreenSource(screenWidth, screenHeight)
local blurShader = dxCreateShader("Files/blur.fx")

function renderBlur()
    if (blurShader) then
        dxUpdateScreenSource(ScreenSource)
        dxSetShaderValue(blurShader, "ScreenSource", ScreenSource);
        dxSetShaderValue(blurShader, "BlurStrength", blurStrength);
        dxSetShaderValue(blurShader, "UVSize", screenWidth, screenHeight);
        dxDrawImage(0, 0, screenWidth, screenHeight, blurShader)
    end
end	
