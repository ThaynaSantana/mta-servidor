local screenW,screenH = guiGetScreenSize()
local resW, resH = 1365,767
local x, y =  (screenW/resW), (screenH/resH)


painel = false
function painelSPEED ()
	
        dxDrawRectangle(572, 288, 208, 406, tocolor(0, 0, 0, 184), false)
        dxDrawRectangle(590, 308, 172, 28, tocolor(105, 105, 105, 227), false)
        dxDrawText("SPEED", 590, 308, 762, 336, tocolor(0, 0, 255, 255), 1.20, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawRectangle(590, 335, 172, 332, tocolor(105, 105, 105, 87), false)
        dxDrawRectangle(589, 370, 0, 0, tocolor(255, 255, 255, 255), false)

      
        dxDrawText("Skin 1", 590, 400, 762, 428, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Skin Fem 2", 590, 437, 762, 465, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Skin 3", 590, 474, 762, 502, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("VTR", 590, 511, 762, 539, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Destruir veículo", 590, 548, 762, 576, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        
        dxDrawText("Fechar", 718, 678, 780, 694, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
	
	if isCursorOnElement ( 590, 401, 172, 27 ) then 
      dxDrawRectangle(590, 401, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Skin 1", 590, 400, 762, 428, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	
	
	if isCursorOnElement ( 590, 438, 172, 27 ) then 
      dxDrawRectangle(590, 438, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Skin Fem 2", 590, 437, 762, 465, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end

	if isCursorOnElement ( 590, 475, 172, 27 ) then 
      dxDrawRectangle(590, 475, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Skin 3", 590, 474, 762, 502, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end

	if isCursorOnElement ( 590, 512, 172, 27 ) then 
      dxDrawRectangle(590, 512, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("VTR", 590, 511, 762, 539, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end

    if isCursorOnElement ( 590, 548, 172, 27 ) then 
      dxDrawRectangle(590, 548, 172, 27, tocolor(105, 105, 105, 152), false)
	  dxDrawText("Destruir veículo", 590, 548, 762, 576, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
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
addEventHandler ("onClientRender", root, painelSPEED)
showCursor (true)
painel = true
  end
end
addEvent("openPainelSPEED", true)
addEventHandler("openPainelSPEED", getRootElement(), guiackapaTG)

function fecharpainel (_,state)
if painel == true then
if state == "down" then
if isCursorOnElement ( 718, 678, 62, 16) then
removeEventHandler ("onClientRender", root, painelSPEED)
showCursor (false)
painel = false
end
end
end
end
addEventHandler ("onClientClick", root, fecharpainel)



------------ Fardas ------------------------------

function SPEEDskin01 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(590, 401, 172, 27) then
triggerServerEvent ("SPEEDsetskin01", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, SPEEDskin01)

function SPEEDskin02 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(590, 438, 172, 27) then
triggerServerEvent ("SPEEDsetskin02", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, SPEEDskin02)

function SPEEDskin03 (_,state)
	if painel == true then
		if  state == "down"  then
			if  isCursorOnElement(590, 475, 172, 27) then
				triggerServerEvent ("SPEEDsetskin03", localPlayer)
			end
		end
	end
end
addEventHandler ("onClientClick", root, SPEEDskin03)

function SPEEDcar (_,state)
	if painel == true then
		if  state == "down"  then
			if  isCursorOnElement(590, 511, 172, 27) then
				triggerServerEvent ("SPEEDcarspawn", localPlayer)
			end
		end
	end
end
addEventHandler ("onClientClick", root, SPEEDcar)

function cardespawnSPEED (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(590, 548, 172, 27) then
triggerServerEvent ("destroycarSPEED", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, cardespawnSPEED)

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