local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)

local dxfont0_fontNick = dxCreateFont("font/fontNick.ttf", 14)
local dxfont1_fontNick = dxCreateFont("font/fontNick.ttf", 12)
painel = false


--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><          Painel Inicial            ><
         ><><><><><><><><><><><><><><><><><><><><
--]]

function painelsamu ()
        exports["[FM]Blur"]:dxDrawBluredRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(255, 255, 255, 230))	
         dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Como funciona o porte de armas :", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("● #ffffffVocê não pode estar procurado", screenW * 0.3814, screenH * 0.2891, screenW * 0.5835, screenH * 0.3216, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffO porte custa #00ff00$#ffffff2000 reais", screenW * 0.3814, screenH * 0.3216, screenW * 0.5835, screenH * 0.3542, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffVocê vai ter que responder um questionario", screenW * 0.3814, screenH * 0.3542, screenW * 0.5835, screenH * 0.3867, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffSe responder menos que 60% é reprovado", screenW * 0.3814, screenH * 0.3867, screenW * 0.5835, screenH * 0.4193, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffCaso reprove não recebera reembolso", screenW * 0.3814, screenH * 0.4193, screenW * 0.5835, screenH * 0.4518, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffCom o porte você não pode ser criminoso", screenW * 0.3814, screenH * 0.4518, screenW * 0.5835, screenH * 0.4844, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffPara iniciar o teste clique no botão ' Adquirir '", screenW * 0.3814, screenH * 0.4844, screenW * 0.5835, screenH * 0.5169, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("● #ffffffCaso queira desistir clique no botão ' Fechar '", screenW * 0.3814, screenH * 0.5169, screenW * 0.5835, screenH * 0.5495, tocolor(0, 21, 231, 254), 1.00, dxfont1_fontNick, "left", "top", false, false, false, true, false)
        dxDrawImage(screenW * 0.4297, screenH * 0.5781, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(0, 21, 231, 148), false)
        dxDrawImage(screenW * 0.4297, screenH * 0.6719, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(231, 0, 0, 148), false)
        dxDrawText("Adquirir", screenW * 0.4685, screenH * 0.5885, screenW * 0.5183, screenH * 0.6198, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Fechar", screenW * 0.4685, screenH * 0.6797, screenW * 0.5183, screenH * 0.7109, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)


end


--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><      Configurações N Altere        ><
         ><><><><><><><><><><><><><><><><><><><><
--]]

function convertTime(ms) 
    local min = math.floor ( ms/60000 ) 
    local sec = math.floor( (ms/1000)%60 ) 
    return min, sec 
end

function FecharAbrirPainel ()
if painel == false then
  addEventHandler ( "onClientRender", root, painelsamu )
  painel = true
  showCursor ( true )
  playSoundFrontEnd ( 43 )
else
  removeEventHandler ( "onClientRender", root, painelsamu )
  removeEventHandler ( "onClientRender", root, InformacoesM4 )
  playSoundFrontEnd ( 43 )
  painel = false
  showCursor ( false )
end
end
addEvent ( "AbrirPorte", true ) 
addEventHandler ( "AbrirPorte", root, FecharAbrirPainel )

function ComprarPorte (_,state)
local Permitido = getElementData ( localPlayer, "TS:Permitido") or nil
 if painel == true then
  if state == "down" then
   if isCursorOnElement ( screenW * 0.4297, screenH * 0.5781, screenW * 0.1281, screenH * 0.0573 ) then 	
   triggerServerEvent ("Porte", getLocalPlayer(), jogador)
   if Permitido == "Permitido" then
   comprarporte2 ()
  end
  end
  end
  end
  end
addEventHandler ("onClientClick", root, ComprarPorte )

function comprarporte2 ()
	addEventHandler ( "onClientRender", root, InformacoesM4 )
	removeEventHandler ( "onClientRender", root, painelsamu )
	setElementData(localPlayer, "TS:Questoes", "Questao1")
	setElementData(localPlayer, "TS:Respostas", false)
	setElementData(localPlayer, "TS:Pontos", "0")
    showCursor (true)
    playSoundFrontEnd ( 43 )
    painel = false
	questoes = true
	final = false
	setElementData (localPlayer, "TS:Permitido", false)
  end

function FecharPainel2 (_,state)
 if painel == true or final == true then
  if state == "down" then
   if isCursorOnElement ( screenW * 0.4297, screenH * 0.6719, screenW * 0.1281, screenH * 0.0573 ) then
    removeEventHandler("onClientRender", root, painelsamu )
	removeEventHandler ( "onClientRender", root, InformacoesM4 )
	setElementData(localPlayer, "TS:Respostas", false)
	setElementData(localPlayer, "TS:Questoes", false)
    showCursor (false)
    playSoundFrontEnd ( 43 )
    painel = false
	questoes = false
	final = false
  end
  end
  end
 end
addEventHandler ("onClientClick", root, FecharPainel2 )

--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><           Perguntas                ><
         ><><><><><><><><><><><><><><><><><><><><
--]]

function InformacoesM4 ()

local QualQuestao = getElementData ( localPlayer, "TS:Questoes" ) or nil
local QualResposta = getElementData ( localPlayer, "TS:Respostas" ) or nil
local Pontos = tonumber(getElementData ( localPlayer, "TS:Pontos" )) or 0
local PontosErros = tonumber( 5 - Pontos) or 0

        if QualQuestao == "Questao1" then
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
		dxDrawImage(screenW * 0.4253, screenH * 0.6198, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(0, 21, 231, 148), false)
        dxDrawText("Responder", screenW * 0.4583, screenH * 0.6276, screenW * 0.5212, screenH * 0.6576, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("( Questão 1 ) Em qual momento posso \nefetuar um disparo ?", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        if QualResposta == "A" then
		dxDrawText("A ) #ffffffEm momento de raiva ( X )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("A ) #ffffffEm momento de raiva (  )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		if QualResposta == "B" then
        dxDrawText("B ) #ffffffQuando estivar dando fuga ( X )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        else
		dxDrawText("B ) #ffffffQuando estivar dando fuga (  )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "C" then
		dxDrawText("C ) #ffffffEm brigas ( X )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("C ) #ffffffEm brigas (  )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "D" then
		dxDrawText("D ) #ffffffPara me proteger ( X )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("D ) #ffffffPara me proteger (  )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end 
		
		elseif QualQuestao == "Questao2" then
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
		dxDrawImage(screenW * 0.4253, screenH * 0.6198, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(0, 21, 231, 148), false)
        dxDrawText("Responder", screenW * 0.4583, screenH * 0.6276, screenW * 0.5212, screenH * 0.6576, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("( Questão 2 ) Para que serve o porte? ", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        if QualResposta == "A" then
		dxDrawText("A ) #ffffffNada ( X )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("A ) #ffffffNada (  )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		if QualResposta == "B" then
        dxDrawText("B ) #ffffffPara efetuar assaltos ( X )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        else
		dxDrawText("B ) #ffffffPara efetuar assaltos (  )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "C" then
		dxDrawText("C ) #ffffffPara atirar na policia ( X )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("C ) #ffffffPara atirar na policia (  )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "D" then
		dxDrawText("D ) #ffffffPara me proteger ( X )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("D ) #ffffffPara me proteger (  )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		
		elseif QualQuestao == "Questao3" then
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
		dxDrawImage(screenW * 0.4253, screenH * 0.6198, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(0, 21, 231, 148), false)
        dxDrawText("Responder", screenW * 0.4583, screenH * 0.6276, screenW * 0.5212, screenH * 0.6576, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("( Questão 3 ) Se você ver alguem armado \noque você faz? ", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        if QualResposta == "A" then
		dxDrawText("A ) #ffffffNada ( X )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("A ) #ffffffNada (  )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		if QualResposta == "B" then
        dxDrawText("B ) #ffffffLigo para policia ( X )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        else
		dxDrawText("B ) #ffffffLigo para policia (  )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "C" then
		dxDrawText("C ) #ffffffTento tomar a arma ( X )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("C ) #ffffffTento tomar a arma (  )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "D" then
		dxDrawText("D ) #ffffffAtiro contra ele ( X )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("D ) #ffffffAtiro contra ele (  )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		
		elseif QualQuestao == "Questao4" then
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
		dxDrawImage(screenW * 0.4253, screenH * 0.6198, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(0, 21, 231, 148), false)
        dxDrawText("Responder", screenW * 0.4583, screenH * 0.6276, screenW * 0.5212, screenH * 0.6576, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("( Questão 4 ) Caso um policial te aborde \nqual seria sua reação? ", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        if QualResposta == "A" then
		dxDrawText("A ) #ffffffFicar calado ( X )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("A ) #ffffffFicar calado (  )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		if QualResposta == "B" then
        dxDrawText("B ) #ffffffLigo para meu advogado ( X )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        else
		dxDrawText("B ) #ffffffLigo para meu advogado (  )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "C" then
		dxDrawText("C ) #ffffffMostro meu porte ( X )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("C ) #ffffffMostro meu porte (  )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "D" then
		dxDrawText("D ) #ffffffAtiro contra ele ( X )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("D ) #ffffffAtiro contra ele (  )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		
		elseif QualQuestao == "Questao5" then
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
		dxDrawImage(screenW * 0.4253, screenH * 0.6198, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(0, 21, 231, 148), false)
        dxDrawText("Responder", screenW * 0.4583, screenH * 0.6276, screenW * 0.5212, screenH * 0.6576, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("( Questão 5 ) Caso você veja um assalto \noque você faria? ", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        if QualResposta == "A" then
		dxDrawText("A ) #ffffffNada ( X )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("A ) #ffffffNada (  )", screenW * 0.3843, screenH * 0.3346, screenW * 0.5864, screenH * 0.3672, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		if QualResposta == "B" then
        dxDrawText("B ) #ffffffLigo para a policia ( X )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        else
		dxDrawText("B ) #ffffffLigo para a policia (  )", screenW * 0.3843, screenH * 0.3802, screenW * 0.5864, screenH * 0.4128, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "C" then
		dxDrawText("C ) #ffffffMostro meu porte ( X )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("C ) #ffffffMostro meu porte (  )", screenW * 0.3843, screenH * 0.4258, screenW * 0.5864, screenH * 0.4583, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        end
		if QualResposta == "D" then
		dxDrawText("D ) #ffffffAtiro contra o assaltante ( X )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		else
		dxDrawText("D ) #ffffffAtiro contra o assaltante (  )", screenW * 0.3843, screenH * 0.4714, screenW * 0.5864, screenH * 0.5039, tocolor(0, 21, 231, 254), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		
		
		elseif QualQuestao == "Questao6" then
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.5885, tocolor(0, 0, 0, 218), false)
        dxDrawRectangle(screenW * 0.3770, screenH * 0.1745, screenW * 0.2489, screenH * 0.0560, tocolor(0, 0, 0, 143), false)
        dxDrawLine(screenW * 0.3770, screenH * 0.2305, screenW * 0.6252, screenH * 0.2305, tocolor(0, 21, 231, 254), 3, false)
        dxDrawText("Porte De Armas", screenW * 0.4553, screenH * 0.1823, screenW * 0.5476, screenH * 0.2201, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Parabens você finallizou o teste !", screenW * 0.3814, screenH * 0.2435, screenW * 0.5835, screenH * 0.2760, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        dxDrawText("Numero de Acertos : #00ff00 "..Pontos, screenW * 0.3814, screenH * 0.3099, screenW * 0.5835, screenH * 0.3424, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
       
        dxDrawText("Numero de Erros : #ff0000 "..PontosErros, screenW * 0.3814, screenH * 0.3555, screenW * 0.5835, screenH * 0.3880, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
        dxDrawText("Seu porte foi :", screenW * 0.4553, screenH * 0.4219, screenW * 0.5373, screenH * 0.4648, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
        if Pontos >= 3 then
		dxDrawText("#00ff00ACEITO", screenW * 0.4663, screenH * 0.4714, screenW * 0.5161, screenH * 0.5104, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		setElementData(localPlayer, "TS:PorteDeArmas", "Sim")
		else
		setElementData(localPlayer, "TS:PorteDeArmas", "Não")
		dxDrawText("#ff0000RECUSADO", screenW * 0.4663, screenH * 0.4714, screenW * 0.5161, screenH * 0.5104, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, true, false)
		end
		dxDrawImage(screenW * 0.4297, screenH * 0.6719, screenW * 0.1281, screenH * 0.0573, "0.png", 0, 0, 0, tocolor(231, 0, 0, 148), false)
       
        dxDrawText("Fechar", screenW * 0.4685, screenH * 0.6797, screenW * 0.5183, screenH * 0.7109, tocolor(255, 255, 255, 255), 1.00, dxfont0_fontNick, "left", "top", false, false, false, false, false)
	end
end




function AbrirM4 (_,state)
local QualResposta = getElementData ( localPlayer, "TS:Respostas" ) or nil
local Pontos = tonumber(getElementData ( localPlayer, "TS:Pontos" )) or 0
 if questoes == true then
 local QualQuestao = getElementData ( localPlayer, "TS:Questoes" ) or nil
  if state == "down" then
  if isCursorOnElement ( screenW * 0.4253, screenH * 0.6198, screenW * 0.1281, screenH * 0.0573 ) then
  if QualQuestao == "Questao1" then
	setElementData(localPlayer, "TS:Questoes", "Questao2")
	if QualResposta == "D" then
	setElementData(localPlayer, "TS:Pontos", Pontos + 1)
	end
	setElementData(localPlayer, "TS:Respostas", false)
    playSoundFrontEnd ( 43 )
	elseif QualQuestao == "Questao2" then
	setElementData(localPlayer, "TS:Respostas", false)
	if QualResposta == "D" then
	setElementData(localPlayer, "TS:Pontos", Pontos + 1)
	end
	setElementData(localPlayer, "TS:Questoes", "Questao3")
    playSoundFrontEnd ( 43 )
	elseif QualQuestao == "Questao3" then
	setElementData(localPlayer, "TS:Respostas", false)
	if QualResposta == "A" then
	setElementData(localPlayer, "TS:Pontos", Pontos + 1)
	end
	setElementData(localPlayer, "TS:Questoes", "Questao4")
    playSoundFrontEnd ( 43 )
	elseif QualQuestao == "Questao4" then
	setElementData(localPlayer, "TS:Respostas", false)
	if QualResposta == "C" then
	setElementData(localPlayer, "TS:Pontos", Pontos + 1)
	end
	setElementData(localPlayer, "TS:Questoes", "Questao5")
    playSoundFrontEnd ( 43 )
	elseif QualQuestao == "Questao5" then
	setElementData(localPlayer, "TS:Respostas", false)
	if QualResposta == "B" then
	setElementData(localPlayer, "TS:Pontos", Pontos + 1)
	end
	setElementData(localPlayer, "TS:Questoes", "Questao6")
	final = true
    playSoundFrontEnd ( 43 )
	elseif QualQuestao == "Questao6" then
	setElementData(localPlayer, "TS:Respostas", false)
	setElementData(localPlayer, "TS:Questoes", false)
    playSoundFrontEnd ( 43 )
  end
  end
  end
 end
 end

addEventHandler ("onClientClick", root, AbrirM4 )

function EscolhiA (_,state)
local Pontos = tonumber(getElementData ( localPlayer, "TS:Pontos" )) or 0
 local QualQuestao = getElementData ( localPlayer, "TS:Questoes" ) or nil
 if questoes == true then
  if state == "down" then
  if isCursorOnElement ( screenW * 0.3799, screenH * 0.3307, screenW * 0.1706, screenH * 0.0365 ) then

	setElementData(localPlayer, "TS:Respostas", "A")
	triggerEvent( "addNotification", root, "#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê marcou a letra 'A'")
    playSoundFrontEnd ( 43 )

  end
  end
  end
 end
 

addEventHandler ("onClientClick", root, EscolhiA )

function EscolhiB (_,state)
local Pontos = tonumber(getElementData ( localPlayer, "TS:Pontos" )) or 0
 local QualQuestao = getElementData ( localPlayer, "TS:Questoes" ) or nil
 if questoes == true then
  if state == "down" then
  if isCursorOnElement ( screenW * 0.3807, screenH * 0.3763, screenW * 0.2057, screenH * 0.0365 ) then
	setElementData(localPlayer, "TS:Respostas", "B")
	triggerEvent( "addNotification", root, "#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê marcou a letra 'B'")
    playSoundFrontEnd ( 43 )
  end
  end
  end
 end
 

addEventHandler ("onClientClick", root, EscolhiB )

function EscolhiC (_,state)
local Pontos = tonumber(getElementData ( localPlayer, "TS:Pontos" )) or 0
 local QualQuestao = getElementData ( localPlayer, "TS:Questoes" ) or nil
 if questoes == true then
  if state == "down" then
  if isCursorOnElement ( screenW * 0.3807, screenH * 0.4219, screenW * 0.2057, screenH * 0.0365 ) then

	setElementData(localPlayer, "TS:Respostas", "C")
	triggerEvent( "addNotification", root, "#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê marcou a letra 'C'")
    playSoundFrontEnd ( 43 )

  end
  end
  end
  end
 

addEventHandler ("onClientClick", root, EscolhiC )

function EscolhiD (_,state)
local Pontos = tonumber(getElementData ( localPlayer, "TS:Pontos" )) or 0
 local QualQuestao = getElementData ( localPlayer, "TS:Questoes" ) or nil
 if questoes == true then
  if state == "down" then
  if isCursorOnElement ( screenW * 0.3807, screenH * 0.4674, screenW * 0.2057, screenH * 0.0365 ) then

	setElementData(localPlayer, "TS:Respostas", "D")
	triggerEvent( "addNotification", root, "#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê marcou a letra 'D'")
    playSoundFrontEnd ( 43 )

  end
  end
  end
  end
 

addEventHandler ("onClientClick", root, EscolhiD )



function ComecouM4 ()
tick = getTickCount()
addEventHandler("onClientRender", root, FabricandoM4)
end
addEvent("FazendoArma", true)
addEventHandler("FazendoArma", getRootElement(), ComecouM4)
 
function AcabouDeFabricarM4 ()
tick = getTickCount()
removeEventHandler("onClientRender", root, FabricandoM4)
end
addEvent("TerminandoArma", true)
addEventHandler("TerminandoArma", getRootElement(), AcabouDeFabricarM4)

--[[
         ><><><><><><><><><><><><><><><><><><><><
         ><         Munições                   ><
         ><><><><><><><><><><><><><><><><><><><><
--]]


function InformacoesPISTOLA ()

        
end



function AbrirPistola (_,state)
 if painel == true then
  if state == "down" then
  if isCursorOnElement ( screenW * 0.5234, screenH * 0.2956, screenW * 0.1362, screenH * 0.0417	 ) then
  setElementData(localPlayer, "DNL:Item_Selecionado", "DNL:Aba_Munições")
  triggerServerEvent ("AbrirPistola", getLocalPlayer(), jogador)
    addEventHandler ( "onClientRender", root, InformacoesPISTOLA )
	removeEventHandler ( "onClientRender", root, InformacoesM4 )
	removeEventHandler ( "onClientRender", root, InformacoesAK )
	removeEventHandler ( "onClientRender", root, InformacoesSNIPER )
    playSoundFrontEnd ( 43 )
  end
  end
  end
 end

addEventHandler ("onClientClick", root, AbrirPistola )

function ComecouPistola ()
tick = getTickCount()
addEventHandler("onClientRender", root, FabricandoPISTOLA)
end
addEvent("FazendoPistola", true)
addEventHandler("FazendoPistola", getRootElement(), ComecouPistola)
 
function AcabouDeFabricarPistola ()
tick = getTickCount()
removeEventHandler("onClientRender", root, FabricandoPISTOLA)
end
addEvent("TerminandoPistola", true)
addEventHandler("TerminandoPistola", getRootElement(), AcabouDeFabricarPistola)

function isCursorOnElement ( x, y, w, h )
local mx, my = getCursorPosition ()
 local fullx, fully = guiGetScreenSize ()
  cursorx, cursory = mx*fullx, my*fully
   if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
    return true
   else
  return false
 end
end
