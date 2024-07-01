local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,720
local x, y = (screenW/resW), (screenH/resH)

AgenciaEmpregosAirNew = false

function PainelAgenciaEmpregosNew ()		
	dxDrawRectangle(x*344, y*10, x*592, y*353, tocolor(2, 20, 1, 255), false)
	mR, mG, mB, mA = 147, 147, 147, 200

		if not cursorPosition( x*344, y*51, x*592, y*29 ) then
		dxDrawRectangle(x*344, y*51, x*592, y*29, tocolor(0, 150, 0, 210), false)
		else
		dxDrawRectangle(x*344, y*51, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end	

		if not cursorPosition( x*344, y*90, x*592, y*29 ) then
        dxDrawRectangle(x*344, y*90, x*592, y*29, tocolor(0, 150, 0, 210), false)
		else
		dxDrawRectangle(x*344, y*90, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end
		
		if not cursorPosition( x*344, y*129, x*592, y*29 ) then
        dxDrawRectangle(x*344, y*129, x*592, y*29, tocolor(0, 150, 0, 210), false)
        else
		dxDrawRectangle(x*344, y*129, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end
		
		if not cursorPosition( x*344, y*168, x*592, y*29 ) then
		dxDrawRectangle(x*344, y*168, x*592, y*29, tocolor(0, 150, 0, 210), false)
        else
		dxDrawRectangle(x*344, y*168, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end
		
		if not cursorPosition( x*344, y*207, x*592, y*29 ) then
		dxDrawRectangle(x*344, y*207, x*592, y*29, tocolor(0, 150, 0, 210), false)
        else
		dxDrawRectangle(x*344, y*207, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end
		
		if not cursorPosition( x*344, y*285, x*592, y*29 ) then
		dxDrawRectangle(x*344, y*285, x*592, y*29, tocolor(0, 150, 0, 210), false)
        else
		dxDrawRectangle(x*344, y*285, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end
		
		if not cursorPosition( x*344, y*324, x*592, y*29 ) then
		dxDrawRectangle(x*344, y*324, x*592, y*29, tocolor(0, 150, 0, 210), false)
        else
		dxDrawRectangle(x*344, y*324, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end
		
		if not cursorPosition( x*344, y*246, x*592, y*29 ) then
		dxDrawRectangle(x*344, y*246, x*592, y*29, tocolor(0, 150, 0, 210), false)
		else
		dxDrawRectangle(x*344, y*246, x*592, y*29, tocolor(mR, mG, mB, mA), false)
		end		
		
	dxDrawRectangle(x*344, y*10, x*592, y*25, tocolor(0, 127, 0, 255), false)
	dxDrawText("Agência de Empregos", x*343, y*10, x*936, y*35, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawRectangle(x*908, y*11, x*28, y*24, tocolor(0, 127, 0, 255), false)
	dxDrawText("X", x*907, y*10, x*936, y*35, tocolor(255, 0, 0, 255), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawText("Entregador de Jornal", x*343, y*51, x*641, y*80, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Pescador", x*343, y*90, x*641, y*119, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Pizza Boy", x*343, y*129, x*641, y*158, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Entregador de Encomendas", x*343, y*168, x*641, y*197, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Petroleiro", x*343, y*207, x*641, y*236, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Motorista de Ônibus", x*343, y*246, x*641, y*275, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Transportador - SF", x*343, y*285, x*641, y*314, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Transportador - LV", x*343, y*324, x*641, y*353, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 0", x*641, y*51, x*936, y*80, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 3", x*641, y*90, x*936, y*119, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 5", x*641, y*129, x*936, y*158, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 8", x*641, y*168, x*936, y*197, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 12", x*641, y*207, x*936, y*236, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 17", x*641, y*246, x*936, y*275, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 22", x*641, y*285, x*936, y*314, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Level: 26", x*641, y*324, x*936, y*353, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
end

addCommandHandler('ap',
function () 
	AbrirAgenciaEmpregos ()
end
)

function AbrirAgenciaEmpregos ()
if AgenciaEmpregosAirNew == false then
addEventHandler ( "onClientRender", root, PainelAgenciaEmpregosNew )
showCursor ( true )
AgenciaEmpregosAirNew = true
end
end
addEvent ( "AirNew>AbrirAgencia", true)
addEventHandler ( "AirNew>AbrirAgencia", root, AbrirAgenciaEmpregos )

function FecharAgenciaEmpregos ()
if AgenciaEmpregosAirNew == true then
removeEventHandler ( "onClientRender", root, PainelAgenciaEmpregosNew )
showCursor ( false )
AgenciaEmpregosAirNew = false
playSoundFrontEnd ( 40 )
end
end
addEvent ( "AirNew>FecharAgencia", true)
addEventHandler ( "AirNew>FecharAgencia", root, FecharAgenciaEmpregos )

function ObjetosDaLoja (_,state)

if AgenciaEmpregosAirNew == true then
if state == "down" then

if isCursorOnElement ( x*908, y*11, x*28, y*24 ) then
removeEventHandler ( "onClientRender", root, PainelAgenciaEmpregosNew )
showCursor ( false )
AgenciaEmpregosAirNew = false

elseif isCursorOnElement ( x*344, y*51, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>EntregadorDeJornal", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement ( x*344, y*285, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>EntregadorDeEtanol", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement ( x*344, y*324, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>EntregadorDeMaconha", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement ( x*344, y*129, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>PizzaBoy", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement ( x*344, y*90, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>EntregadorDePescador", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement ( x*344, y*207, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>Petroleiro", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement (x*344, y*246, x*592, y*29) then
triggerServerEvent ( "Encaminhar>MotoristaDeOnibus", localPlayer )
FecharAgenciaEmpregos ()

elseif isCursorOnElement ( x*344, y*168, x*592, y*29 ) then
triggerServerEvent ( "Encaminhar>EntregadorDeSedex", localPlayer )
FecharAgenciaEmpregos ()

end

end
end

end
addEventHandler ( "onClientClick", root, ObjetosDaLoja )

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

function isCursorOnElement( x,y,w,h )
local mx,my = getCursorPosition ()
local fullx,fully = guiGetScreenSize()
cursorx,cursory = mx*fullx,my*fully
if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
return true
else
return false
end
end