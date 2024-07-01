local screenW, screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

	setElementData (localPlayer, "Level",0)
	setElementData (localPlayer, "LSys:EXP",0)
	setElementData (localPlayer, "LSys:Online",0)
	setElementData (localPlayer, "LSys:Mins",0)

open = false

function convertS(s)
	if type(tonumber(s)) == "number" then
		milisegundo = s
		local horas_seg=3600
		local hora = math.floor(milisegundo/horas_seg)
		local minuto = math.floor((milisegundo-(horas_seg*hora))/60)
		local segundo = math.floor((milisegundo-(horas_seg*hora)-(minuto*60)))	
		local tudo = string.format("%02d:%02d:%02d",hora,minuto,segundo)	
		local dia = math.floor(s/86400)

		return hora,minuto,segundo,tudo,dia
	else
		return 0,0,0,0,0		
	end
end

function openClose(state)
	if open == false and state == true then
		open = true
		addEventHandler("onClientRender", root,Window)
		showCursor(true)
		playSoundFrontEnd(10)
	else
		playSoundFrontEnd(10)
		open = false
		showCursor(false)
		removeEventHandler("onClientRender", root,Window)
	end
end
addEvent( "SHOW.WINDOW.LEVELSYS", true )
addEventHandler( "SHOW.WINDOW.LEVELSYS", getLocalPlayer(), openClose )

function isCursorOnElement(x,y,w,h)
	local cursor = isCursorShowing ()
	if cursor then
		local mx,my = getCursorPosition ()
		local fullx,fully = guiGetScreenSize()
		cursorx,cursory = mx*fullx,my*fully
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		else
			return false
		end
	end
end

function btsplayer(_,state)
		if state == "down"then
			if (open == true) then
				if isCursorOnElement (x*827, y*297, x*25, y*23) then
					openClose(false)
				end	
			end		
		end
end
addEventHandler("onClientClick",root,btsplayer)

function cursorPosition(x, y, width, height)
	if (not isCursorShowing()) then
		return false
	end
	local sx, sy = guiGetScreenSize()
	local cx, cy = getCursorPosition()
	local cx, cy = (cx*sx), (cy*sy)
	if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
		return true
	else
		return false
	end
end