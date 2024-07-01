local screenW,screenH = guiGetScreenSize()
local resW, resH = 1365,767
local x, y =  (screenW/resW), (screenH/resH)


painel = false
function painelCV ()
	
        dxDrawRectangle(572, 288, 208, 406, tocolor(0, 0, 0, 184), false)
        dxDrawRectangle(590, 308, 172, 28, tocolor(105, 105, 105, 227), false)
        dxDrawText("CV", 590, 308, 762, 336, tocolor(255, 255, 255, 255), 1.20, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawRectangle(590, 335, 172, 332, tocolor(105, 105, 105, 87), false)
        dxDrawRectangle(589, 370, 0, 0, tocolor(255, 255, 255, 255), false)

      
        dxDrawText("Skin 1", 590, 400, 762, 428, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Skin 2", 590, 437, 762, 465, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Veículo", 590, 474, 762, 502, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Destruir veículo", 590, 512, 762, 540, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        
        dxDrawText("Fechar", 718, 678, 780, 694, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
	
	if isCursorOnElement ( 590, 401, 172, 27 ) then ---- Farda 02
      dxDrawRectangle(590, 401, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Skin 1", 590, 400, 762, 428, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	
	
	if isCursorOnElement ( 590, 438, 172, 27 ) then ---- Farda 03
      dxDrawRectangle(590, 438, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Skin 2", 590, 437, 762, 465, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
	
	if isCursorOnElement ( 590, 475, 172, 27 ) then ---- Farda 04
      dxDrawRectangle(590, 475, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Veículo", 590, 474, 762, 502, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end

    if isCursorOnElement ( 590, 512, 172, 27 ) then ---- Farda 05
      dxDrawRectangle(590, 512, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Destruir veículo", 590, 512, 762, 540, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
		
    if isCursorOnElement ( 718, 678, 62, 16 ) then ---- Fechar 
    dxDrawRectangle(718, 678, 62, 16, tocolor(255, 0, 0, 100), false)
	dxDrawText("Fechar", 718, 678, 780, 694, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
	else
	dxDrawRectangle(718, 678, 62, 16, tocolor(0, 0, 0, 100), false)
	end
	
    end

------------ [ ABRIR E FECHAR ]---------------------

function guiackapaTG()
  if painel == false then
addEventHandler ("onClientRender", root, painelCV)
showCursor (true)
painel = true
  end
end
addEvent("openPainelCV", true)
addEventHandler("openPainelCV", getRootElement(), guiackapaTG)

function fecharpainel (_,state)
if painel == true then
if state == "down" then
if isCursorOnElement ( 718, 678, 62, 16) then
removeEventHandler ("onClientRender", root, painelCV)
showCursor (false)
painel = false
end
end
end
end
addEventHandler ("onClientClick", root, fecharpainel)



------------ Fardas ------------------------------

function CVskin01 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(590, 401, 172, 27 ) then
triggerServerEvent ("CVsetskin01", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, CVskin01)

function CVskin02 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(590, 438, 172, 27 ) then
triggerServerEvent ("CVsetskin02", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, CVskin02)

function CVcar (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(590, 475, 172, 27 ) then
triggerServerEvent ("CVcarspawn", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, CVcar)

function cardespawnCV (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( 590, 512, 172, 27 ) then
triggerServerEvent ("destroycarCV", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, cardespawnCV)

------------------------------------------------------------

--- Ignora


local x,y = guiGetScreenSize()

function isCursorOnElement(x,y,w,h)
 local mx,my = getCursorPosition ()
 local fullx,fully = guiGetScreenSize()
 cursorx,cursory = mx*fullx,my*fully
 if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
  return true
 else
  return false
 end
end