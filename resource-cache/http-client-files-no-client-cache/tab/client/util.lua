local screenW, screenH = guiGetScreenSize()
local xG, yG = (screenW/1366), (screenH/768)


standartR, standartG, standartB, standartH = 191, 32, 32, 150

local tab_f = dxCreateFont("tab_t.ttf", 13)
local tab_f1 = dxCreateFont("tab_t.ttf", 12)

function dxDrawWindow(x, y, w, h, text)
	local mx, my = getMousePos()
	local tcolor = tocolor(255, 255, 255, 255)
	dxDrawImage(x, y, w, h, "assets/main_tab.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
	dxDrawText(text, x + 4, y + 5, w + x, 30 + y, tcolor, 1,1, "default-bold", "center", "center", true, false, false, true)

	dxDrawText("Ping", xG*897, yG*280, xG*949, yG*297, tocolor(255, 255, 255, 255), xG*1.10, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Tempo Jogado", xG*715, yG*280, xG*814, yG*297, tocolor(255, 255, 255, 255), xG*1.10, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Nick", xG*494, yG*280, xG*593, yG*297, tocolor(255, 255, 255, 255), xG*1.10, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("Brasilia Roleplay - discord.gg/BRsilia", xG*385, yG*236, xG*980, yG*253, tocolor(255, 255, 255, 255), xG*1.10, "default-bold", "center", "center", false, false, false, false, false)
end

function dxDrawLogo(x, y, w, h, text)
	local mx, my = getMousePos()
	dxDrawImage(x, y, w, h, "assets/main_logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
end

function dxDrawUser(x, y, w, h, text)
	local mx, my = getMousePos()
	dxDrawImage(x, y, w, h, "assets/main_user.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
end

function dxDrawMain(x, y, w, h, text)
    if isCursorShowing(x, y, w, h) then 
        dxDrawImage(x, y, w, h, "assets/main_tab.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
        dxDrawText(text, x, y + 5, w + x, 30 + y, tocolor(255,255,255,255), 1,1, "default-bold", "center", "center", false, false, false, false) 
    end
end

function dxDrawButton(x, y, w, h, text)
	local mx, my = getMousePos()
	local CR = getElementData(localPlayer, "ColorR") or standartR
	local CG = getElementData(localPlayer, "ColorG") or standartG
	local CB = getElementData(localPlayer, "ColorB") or standartB
	local CH = getElementData(localPlayer, "ColorH") or standartH
	local bgcolor = tocolor(CR,CG,CB,255)
	if isPointInRect(mx, my, x, y, w, h) then
		bgcolor = tocolor(CR,CG,CB,CH)
	else
		bgcolor = tocolor(CR,CG,CB, 255)
	end
	dxDrawRectangle(x, y, w, h, bgcolor, false)
	dxDrawText(text, x, y, w + x, h + y, tocolor(255, 255, 255, 255), 1,1, "default-bold", "center", "center", true, false, false, true)
end

function dxDrawButtonText(x, y, w, h, text, Font_1, Font_2)
	local mx, my = getMousePos()
	local tcolor = tocolor(128, 128, 128, 255)
	dxDrawText(text, x, y, w + x, h + y, tcolor, Font_1, Font_2, tab_f, "center", "center", true, false, false, true)
end

function dxDrawButtonTextR(x, y, w, h, text, Font_1, Font_2)
	local mx, my = getMousePos()
	local tcolor = tocolor(128, 128, 128, 255)
	dxDrawText(text, x, y, w + x, h + y, tcolor, Font_1, Font_2, tab_f1, "center", "center", true, false, false, true)
end

function dxDrawProgress(x, y, w, h, size, text)
	local CR = getElementData(localPlayer, "ColorR") or standartR
	local CG = getElementData(localPlayer, "ColorG") or standartG
	local CB = getElementData(localPlayer, "ColorB") or standartB
	dxDrawRectangle(x, y, w, h, tocolor(255,255,255,255))
	dxDrawRectangle(x + 1 , y + 1, w - 2, h - 2, tocolor(100,100,100,255))
	if size == 0 then
		dxDrawRectangle(x + 1 , y + 1, size, h - 2, tocolor(CR, CG, CB, 255))
	else
		if size < w then
			dxDrawRectangle(x + 1 , y + 1, size - 2, h - 2, tocolor(CR, CG, CB, 255))
		else
			dxDrawRectangle(x + 1 , y + 1, w - 2, h - 2, tocolor(CR, CG, CB, 255))
		end
	end
	dxDrawText(text, x, y, w + x, h + y, tocolor(255,255,255,255), 1,1, "default-bold", "center", "center", true, false, false, true)
end

function dxDrawScrollBar(x, y, w, h, sc, text, Proc, fil)
local veh = getPedOccupiedVehicle(localPlayer)
	local mx, my = getMousePos()
	local CR = getElementData(localPlayer, "ColorR") or standartR
	local CG = getElementData(localPlayer, "ColorG") or standartG
	local CB = getElementData(localPlayer, "ColorB") or standartB
	local bgcolor = tocolor(CR, CG, CB, 200)
	local tcolor = tocolor(255, 255, 255, 255)
	local tcolorr = tocolor(255, 255, 255, 255)
	dxDrawRectangle(x, y, w, h, bgcolor, false)
	dxDrawText(text, x, y, w + x, h + y, tcolorr, 1,1, "default-bold", "center", "center", true, false, false, true)
	if sc >= x and sc <= (x+w)-5 then
		dxDrawRectangle(sc, y-5, 5, h+10, tcolor, false)
		scrollProcent = ((sc-x)/w)*(80 - fil)
		visualPocent_fuel = scrollProcent  
		mnohitel = 0 + math.floor(scrollProcent)*Proc
	else
		if sc <= x then
			dxDrawRectangle(x, y-5, 5, h+10, tcolor, false)
			scrollProcent = 0
			mnohitel = 0 + math.floor(scrollProcent)*Proc
			visualPocent_fuel = scrollProcent
		else
			dxDrawRectangle((x+w)-5, y-5, 5, h+10, tcolor, false)
			scrollProcent = 80 - fil
			mnohitel = 0 + math.floor(scrollProcent)*Proc
			visualPocent_fuel = scrollProcent 
		end
	end
end


function dxDrawCreateText(x, y, w, h, text)
	dxDrawText(text, x, y, w + x, h + y, tcolor, 1.1, "default-bold", "center", "center", true, false, false, true)
end

function isPointInRect(x, y, rx, ry, rw, rh)
	if x >= rx and y >= ry and x <= rx + rw and y <= ry + rh then
		return true
	else
		return false
	end
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
function getMousePos()
	local xsc, ysc = guiGetScreenSize()
	local mx, my = getCursorPosition()
	if not mx or not my then
		mx, my = 0, 0
	end
	return mx * xsc, my * ysc
end

function isMouseClick()
	return wasMousePressedInCurrentFrame
end



   --NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!   
  --              https://discord.gg/KXV2GHtJtg                              


--PROCURANDO SCRIPTS, MAPAS, MODELAGENS EXCLUSIVOS?
--NOSSA COMUNIDADE ESTÁ SEMPRE A ATIVA SOLTANDO VARIOS MODS DE GRAÇA!

--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO
--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO
--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO
--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO

--LINK DE CONVITE PERMANENTE:

--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
