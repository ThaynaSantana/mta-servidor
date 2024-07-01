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

local dxfont0_fonte = dxCreateFont("Files/fonte.ttf", 12)
local dxfont1_fonte = dxCreateFont("Files/fonte.ttf", 11)
local dxfont2_fonte = dxCreateFont("Files/fonte.ttf", 10)

txdAlgema = engineLoadTXD("Arquivos/cuff.txd")
dffAlgema = engineLoadDFF("Arquivos/cuff.dff")
engineImportTXD(txdAlgema, 331)
engineReplaceModel(dffAlgema, 331)

local _ParadiseAlgemado = {}
_ParadiseAlgemado.algema = {}

--[[                               
                                   ################################################
                                   #                      Bloquear                #                                                                
                                   ################################################
--]]  

addEventHandler("onClientKey", root, 
    function (button, press)
        if getElementData(getLocalPlayer(),"FeniX_Preso") then
            if button == "F1" or button == "F2" or button == "F3" or button == "F4" or button == "F5" or button == "F6" or button == "F7" then
                cancelEvent()
            end
        end
    end
)

--[[                               
                                   ################################################
                                   #                      Mouse                   #                                                                
                                   ################################################
--]]  

button = "q" -- Botão para ter acesso ao Mouse e fechar o Dx !
Cmd = "fecharpainel" -- Comando para fechar o Dx !

function fecharDx_1 ()
  if isEventHandlerAdded("onClientRender", getRootElement(), dxPainel) then
  removeEventHandler ("onClientRender" , root, dxPainel)
  end
end
bindKey(button , "down" , fecharDx_1)  

function fecharDx_2 ()
  if isEventHandlerAdded("onClientRender", getRootElement(), dxPainel) then
  removeEventHandler ("onClientRender" , root, dxPainel)
  end
end
addCommandHandler(Cmd , fecharDx_2) 


function dxPainel ()

        dxDrawRectangle(screenW * 0.6515, screenH * 0.4323, screenW * 0.1640, screenH * 0.3984, tocolor(0, 0, 0, 160), false)
        dxDrawRectangle(screenW * 0.6515, screenH * 0.4323, screenW * 0.1640, screenH * 0.0404, tocolor(0, 0, 0, 160), false)
        dxDrawText("Sistema Policial", screenW * 0.6515, screenH * 0.4323, screenW * 0.8155, screenH * 0.4727, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.6515, screenH * 0.4727, screenW * 0.1640, screenH * 0.0039, tocolor(255, 0, 0, 255), false)
        
		dxDrawRectangle(screenW * 0.6515, screenH * 0.4948, screenW * 0.1640, screenH * 0.0378, corBotaoIdentidade, false)
		corBotaoIdentidade = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.4948, screenW * 0.1640, screenH * 0.0378) then
        corBotaoIdentidade = tocolor(255, 0, 0, 255)
end
        dxDrawText("Ver Identidade", screenW * 0.6515, screenH * 0.4948, screenW * 0.8155, screenH * 0.5326, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        
		dxDrawRectangle(screenW * 0.6515, screenH * 0.5378, screenW * 0.1640, screenH * 0.0378, corBotaoRevistar, false)
		corBotaoRevistar = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.5378, screenW * 0.1640, screenH * 0.0378) then
        corBotaoRevistar = tocolor(255, 0, 0, 255)
end
        dxDrawText("Revistar", screenW * 0.6515, screenH * 0.5378, screenW * 0.8155, screenH * 0.5755, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        
		dxDrawRectangle(screenW * 0.6515, screenH * 0.5807, screenW * 0.1640, screenH * 0.0378, corBotaoAlgemar, false)
		corBotaoAlgemar = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.5807, screenW * 0.1640, screenH * 0.0378) then
        corBotaoAlgemar = tocolor(255, 0, 0, 255)
end
        if getElementData( localPlayer , "Algemar_Desalgemar", true) then
        dxDrawText("Desalgemar", screenW * 0.6515, screenH * 0.5807, screenW * 0.8155, screenH * 0.6185, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        else
		dxDrawText("Algemar", screenW * 0.6515, screenH * 0.5807, screenW * 0.8155, screenH * 0.6185, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
end
		dxDrawRectangle(screenW * 0.6515, screenH * 0.6237, screenW * 0.1640, screenH * 0.0378, corBotaoApreender, false)
		corBotaoApreender = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.6237, screenW * 0.1640, screenH * 0.037) then
        corBotaoApreender = tocolor(255, 0, 0, 255)
end
        dxDrawText("Apreender Armas", screenW * 0.6515, screenH * 0.6237, screenW * 0.8155, screenH * 0.6615, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        
		dxDrawRectangle(screenW * 0.6515, screenH * 0.6667, screenW * 0.1640, screenH * 0.0378, corBotaoCNH, false)
		corBotaoCNH = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.6667, screenW * 0.1640, screenH * 0.0378) then
        corBotaoCNH = tocolor(255, 0, 0, 255)
end
        dxDrawText("Checar CNH", screenW * 0.6515, screenH * 0.6667, screenW * 0.8155, screenH * 0.7044, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        
		dxDrawText("Jogador ID : "..ID.." ", screenW * 0.6515, screenH * 0.7982, screenW * 0.8155, screenH * 0.8255, tocolor(255, 255, 255, 255), 1.00, dxfont2_fonte, "center", "center", false, false, false, false, false)
        dxDrawImage(screenW * 0.7914, screenH * 0.3984, screenW * 0.0242, screenH * 0.0651, "Files/icone.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        
		dxDrawRectangle(screenW * 0.6515, screenH * 0.7096, screenW * 0.1640, screenH * 0.0378, corBotaoMultar, false)
		corBotaoMultar = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.7096, screenW * 0.1640, screenH * 0.0378) then
        corBotaoMultar = tocolor(255, 0, 0, 255)
end
        dxDrawText("Multar", screenW * 0.6515, screenH * 0.7096, screenW * 0.8155, screenH * 0.7474, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.6515, screenH * 0.7526, screenW * 0.1640, screenH * 0.0378, corBotaoPrender , false)
		corBotaoPrender = tocolor(0, 0, 0, 160)   
        if cursorPosition(screenW * 0.6515, screenH * 0.7526, screenW * 0.1640, screenH * 0.0378) then
        corBotaoPrender = tocolor(255, 0, 0, 255)
end
        dxDrawText("Prender", screenW * 0.6515, screenH * 0.7526, screenW * 0.8155, screenH * 0.7904, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        ---dxDrawText("X", screenW * 0.6559, screenH * 0.4349, screenW * 0.6662, screenH * 0.4727, tocolor(255, 255, 255, 255), 1.00, dxfont2_fonte, "center", "center", false, false, false, false, false)
        --dxDrawRectangle(screenW * 0.6567, screenH * 0.4336, screenW * 0.0095, screenH * 0.0391, tocolor(255, 255, 255, 0), false)
end


local valor = createElement("dxEditBox6") 
local motivo = createElement("dxEditBox6")


function dxMulta ()

        dxDrawRectangle(screenW * 0.3214, screenH * 0.3086, screenW * 0.3265, screenH * 0.2526, tocolor(0, 0, 0, 160), false)
        dxDrawRectangle(screenW * 0.3214, screenH * 0.3086, screenW * 0.3265, screenH * 0.0365, tocolor(0, 0, 0, 160), false)
        dxDrawText("Multa - Detran", screenW * 0.3221, screenH * 0.3073, screenW * 0.6479, screenH * 0.3451, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.3214, screenH * 0.3451, screenW * 0.3265, screenH * 0.0039, tocolor(255, 0, 0, 255), false)
		dxDrawEditBox("Valor da Multa", screenW * 0.3734, screenH * 0.3776, screenW * 0.2225, screenH * 0.0469, false, 20, valor)
		dxDrawEditBox("Motivo da Multa", screenW * 0.3734, screenH * 0.4297, screenW * 0.2225, screenH * 0.0469, false, 200, motivo)
        dxDrawImage(screenW * 0.4107, screenH * 0.4961, screenW * 0.1479, screenH * 0.0521, "Files/button.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
        dxDrawText("Aplicar Multa", screenW * 0.4107, screenH * 0.4961, screenW * 0.5586, screenH * 0.5482, tocolor(255, 255, 255, 255), 1.00, dxfont1_fonte, "center", "center", false, false, false, false, false)
	    dxDrawRectangle(screenW * 0.6310, screenH * 0.3073, screenW * 0.0168, screenH * 0.0378, tocolor(255, 0, 0, 0), false)
        dxDrawText("X", screenW * 0.6318, screenH * 0.3086, screenW * 0.6479, screenH * 0.3451, tocolor(255, 255, 255, 255), 1.00, dxfont0_fonte, "center", "center", false, false, false, false, false)
end


function abrirDx ()
  if not isEventHandlerAdded("onClientRender", getRootElement(), dxPainel) then
     addEventHandler("onClientRender" , root , dxPainel)
	 else
	 removeEventHandler ("onClientRender" , root, dxPainel)
    end
end
addEvent ("FeniX_AbrirDX", true)
addEventHandler ("FeniX_AbrirDX", getRootElement(), abrirDx)

function abrirDx_2 ()
  if not isEventHandlerAdded("onClientRender", getRootElement(), dxMulta) then
     addEventHandler("onClientRender" , root , dxMulta)
	 else
	 removeEventHandler ("onClientRender" , root, dxMulta)
    end
end
addEvent ("FeniX_AbrirMulta", true)
addEventHandler ("FeniX_AbrirMulta", getRootElement(), abrirDx_2)

 --[[


function close (_,state)
    if isEventHandlerAdded("onClientRender", root, dxPainel) then  
        if state == "down" then
            if cursorPosition(screenW * 0.6567, screenH * 0.4336, screenW * 0.0095, screenH * 0.0391) then 
                removeEventHandler("onClientRender", root , dxPainel)
				playSound("Files/hit.mp3", false)
             end
        end
    end
end
addEventHandler("onClientClick", root, close)

 --]]
 
function close (_,state)
    if isEventHandlerAdded("onClientRender", root, dxMulta) then  
        if state == "down" then
            if cursorPosition(screenW * 0.6310, screenH * 0.3073, screenW * 0.0168, screenH * 0.0378) then 
				abrirDx_2 ()
				playSound("Files/hit.mp3", false)
             end
        end
    end
end
addEventHandler("onClientClick", root, close)
 
--[[                               
                                   ################################################
                                   #                   Função Buttons             #                                                                
                                   ################################################
--]]  

function buttons(_,state)
    if isEventHandlerAdded("onClientRender", root, dxPainel) then  
        if state == "down" then
            if cursorPosition(screenW * 0.6515, screenH * 0.6667, screenW * 0.1640, screenH * 0.0378) then 
                triggerServerEvent("FeniX_CNH", localPlayer)
                playSound("Files/hit.mp3", false) 
				elseif cursorPosition(screenW * 0.6515, screenH * 0.4948, screenW * 0.1640, screenH * 0.0378) then
				triggerServerEvent("FeniX_Identidade", localPlayer)
                playSound("Files/hit.mp3", false) 
				elseif cursorPosition(screenW * 0.6515, screenH * 0.5378, screenW * 0.1640, screenH * 0.0378) then
				triggerServerEvent("FeniX_Revistar", localPlayer)
                playSound("Files/hit.mp3", false) 
				elseif cursorPosition(screenW * 0.6515, screenH * 0.5807, screenW * 0.1640, screenH * 0.0378) then
				triggerServerEvent("FeniX_AlgemarDesalgemar", localPlayer)
                playSound("Files/hit.mp3", false) 
				elseif cursorPosition(screenW * 0.6515, screenH * 0.6237, screenW * 0.1640, screenH * 0.0378) then
				triggerServerEvent("FeniX_ApreenderArmas", localPlayer)
                playSound("Files/hit.mp3", false) 
				elseif cursorPosition(screenW * 0.6515, screenH * 0.7096, screenW * 0.1640, screenH * 0.0378) then
				abrirDx_2 ()
                playSound("Files/hit.mp3", false) 
				elseif cursorPosition(screenW * 0.6515, screenH * 0.7526, screenW * 0.1640, screenH * 0.0378) then
				triggerServerEvent("FeniX_Prender", localPlayer)
                playSound("Files/hit.mp3", false) 
            end
        end
    end
end
addEventHandler("onClientClick", root, buttons)

--[[                               
                                   ################################################
                                   #                   Função Click               #                                                                
                                   ################################################
--]] 

function clickPlayer ( _, state, _, _, _, _, _, ClickJogdor )
  if state == "down" then
	if ( ClickJogdor ) then
	  if ( getElementType ( ClickJogdor ) == "player" ) then
	        ID = getElementData(ClickJogdor , "ID") or "N/A"
		 	triggerServerEvent ( "FeniX_ClickJogdor", localPlayer, ClickJogdor )
	  end
	end
  end
end
addEventHandler ( "onClientClick", root, clickPlayer) 

--[[                               
                                   ################################################
                                   #                   Setar Multa                #                                                                
                                   ################################################
--]] 

function setarMulta (_,state)
 if isEventHandlerAdded("onClientRender", root, dxMulta) then  
  if state == "down" then
  if cursorPosition (screenW * 0.4107, screenH * 0.4961, screenW * 0.1479, screenH * 0.0521) then 
  local valor_1 = tonumber(getElementData(valor, "text6"))
  local motivo_1 = getElementData(motivo, "text6")
  local Valor_Multa =  tonumber ( valor_1 ) or nil
  local Motivo_Multa = motivo_1 or nil
  if Valor_Multa == tonumber("0") or Valor_Multa == nil then
  return triggerServerEvent ("FeniX_Aviso_2", localPlayer)
  end
  if Motivo_Multa == "" or Motivo_Multa == nil then
  return triggerServerEvent ("FeniX_Aviso_1", localPlayer)
  end
  abrirDx_2 ()
  triggerServerEvent ( "FeniX_SetarMulta", getLocalPlayer(), Valor_Multa , Motivo_Multa )
	   end
    end
  end
end
addEventHandler ( "onClientClick", root, setarMulta )

--[[                               
                                   ################################################
                                   #                   Função Algema               #                                                                
                                   ################################################
--]] 

function addAlgema(player)
	if (player) then
	removeAlgema(player)
	_ParadiseAlgemado.algema[player] = createObject(331, 0, 0, 0)
	exports.bone_attach:attachElementToBone(_ParadiseAlgemado.algema[player], player, 12, 0, 0, 0, 0, -90 , 0)
	end
end

function removeAlgema(player)
	if (player) then
	if (_ParadiseAlgemado.algema[player]) and (isElement(_ParadiseAlgemado.algema[player])) then
	if (exports.bone_attach:isElementAttachedToBone(_ParadiseAlgemado.algema[player])) then
	exports.bone_attach:detachElementFromBone(_ParadiseAlgemado.algema[player])
	if isElement(_ParadiseAlgemado.algema[player]) then destroyElement(_ParadiseAlgemado.algema[player]) end
	_ParadiseAlgemado.algema[player] = nil
	end
	end
	end
end

addEvent("algemaRemove", true)
addEventHandler("algemaRemove", root,
function()
	removeAlgema(source)
end)

addEvent("algemaAdd", true)
addEventHandler("algemaAdd", root,
function()
    if (exports.bone_attach:isElementAttachedToBone(_ParadiseAlgemado.algema[player])) then return removeAlgema(source) end
	addAlgema(source)
end)

function renderAnimation()
	for k, v in ipairs(getElementsByType("player")) do
    if getElementData(v, "algemado") then
	local block, animation = getPedAnimation(v)
	if animation ~= "gift_give" then
	setPedAnimation(v, "kissing", "gift_give", -1, true, false, true ) 
	end
	setPedAnimationProgress(v, 'gift_give', 0.15)
	end
	end
end
addEventHandler("onClientRender", root, renderAnimation)

addEventHandler("onClientPlayerDamage", localPlayer,
function()
	if getElementData(localPlayer, "algemado") then
	cancelEvent()
	end
end)

addEventHandler("onClientPlayerStealthKill", localPlayer,
function(targetPlayer)
	if getElementData(targetPlayer, "algemado") then
	cancelEvent()
	end
end)
	
function keyBlock(key)
	if getElementData(localPlayer,"algemado") and (key:upper() == "B") then
	cancelEvent()
	end
end
addEventHandler("onClientKey", root, keyBlock)


--[[                               
                                   ################################################
                                   #                    Mouse e Dx                #                                                                
                                   ################################################
--]]

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