local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

local corArmasUm = tocolor(32,32,32)
local corArmasDois = tocolor(32,32,32)
local corArmasTres = tocolor(32,32,32)
local corArmasQuatro = tocolor(32,32,32)
local exibir = false
function Gerenciador_Corp()
    dxDrawRoundedRectangle(x*510, y*218, x*290, y*316, tocolor(24, 24, 24, 255), false)
    dxDrawText("Armamento CV", x*411, y*238, x*901, y*273, tocolor(255, 255, 255, 255), 1.60, "default", "center", "center", false, false, false, false, false)
    dxDrawRoundedRectangle(x*569, y*293, x*175, y*30, corArmasUm, false)
    dxDrawRoundedRectangle(x*569, y*333, x*175, y*30, corArmasDois, false)
	dxDrawRoundedRectangle(x*569, y*373, x*175, y*30, corArmasTres, false)
	dxDrawRoundedRectangle(x*569, y*413, x*175, y*30, corArmasQuatro, false)
    dxDrawText("Faca", x*569, y*293, x*744, y*323, tocolor(255, 255, 255, 255), 1.40, "default", "center", "center", false, false, false, false, false)
    dxDrawText("Pistola", x*569, y*333, x*744, y*363, tocolor(255, 255, 255, 255), 1.40, "default", "center", "center", false, false, false, false, false)
	dxDrawText("AK-47", x*569, y*373, x*744, y*403, tocolor(255, 255, 255, 255), 1.40, "default", "center", "center", false, false, false, false, false)
	dxDrawText("Colete", x*569, y*413, x*744, y*443, tocolor(255, 255, 255, 255), 1.40, "default", "center", "center", false, false, false, false, false)
    dxDrawText("'Backspace' para fechar", x*452, y*614, x*861, y*398, tocolor(255, 255, 255, 255), 1.60, "default", "center", "center", false, false, false, false, false)
end

-- Givar armas 01
addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button=="left" and state=="down" then
        if exibir == true then
            if isMouseInPosition(x*569, y*293, x*175, y*30) then
                triggerServerEvent("CV:GiveWeapons01", localPlayer)
            end
        end
    end
end)

-- Givar armas 02
addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button=="left" and state=="down" then
        if exibir == true then
            if isMouseInPosition(x*569, y*333, x*175, y*30) then
                triggerServerEvent("CV:GiveWeapons02", localPlayer)
            end
        end
    end
end)
--


-- Givar armas 03
addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button=="left" and state=="down" then
        if exibir == true then
            if isMouseInPosition(x*569, y*373, x*175, y*30) then
                triggerServerEvent("CV:GiveWeapons03", localPlayer)
            end
        end
    end
end)

-- Cor Armas 01
addEventHandler("onClientRender", getRootElement(), function()
    if exibir == true then
        if isMouseInPosition(x*569, y*293, x*175, y*30) then
            corArmasUm = tocolor(75,80,150)
        else
            corArmasUm = tocolor(32,32,32)
        end
    end
end)
--

-- Cor armas 02
addEventHandler("onClientRender", getRootElement(), function()
    if exibir == true then
        if isMouseInPosition(x*569, y*333, x*175, y*30) then
            corArmasDois = tocolor(75,80,150)
        else
            corArmasDois = tocolor(32,32,32)
        end
    end
end)
--

-- Cor armas 03
addEventHandler("onClientRender", getRootElement(), function()
    if exibir == true then
        if isMouseInPosition(x*569, y*373, x*175, y*30) then
            corArmasTres = tocolor(75,80,150)
        else
            corArmasTres = tocolor(32,32,32)
        end
    end
end)
--

-- Givar colete
addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button=="left" and state=="down" then
        if exibir == true then
            if isMouseInPosition(x*569, y*413, x*175, y*30) then
                triggerServerEvent("coleteCV", localPlayer)
            end
        end
    end
end)

-- Cor colete
addEventHandler("onClientRender", getRootElement(), function()
    if exibir == true then
        if isMouseInPosition(x*569, y*413, x*175, y*30) then
            corArmasQuatro = tocolor(75,80,150)
        else
            corArmasQuatro = tocolor(32,32,32)
        end
    end
end)
--


-- Abrir Painel
addEvent("CV:AbrirMarkerPOL", true)
addEventHandler("CV:AbrirMarkerPOL", getRootElement(), function()
    if exibir == false then
        addEventHandler("onClientRender", getRootElement(), Gerenciador_Corp)
        exibir = true
        showCursor(true)
    else
        removeEventHandler("onClientRender", getRootElement(), Gerenciador_Corp)
        exibir = false
        showCursor(false)
    end
end)
--

-- Fechar Painel
bindKey("backspace", "down", function()
    if exibir == true then
        removeEventHandler("onClientRender", getRootElement(), Gerenciador_Corp)
        showCursor(false)
        exibir = false
    end
end)
--

-- Arredondar retângulo
function dxDrawRoundedRectangle(x, y, w, h, borderColor, bgColor, postGUI)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200)
        end
        if (not bgColor) then
            bgColor = borderColor
        end
        dxDrawRectangle(x, y, w, h, bgColor, postGUI);
        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI)
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI)
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI)
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI)
    end
end
--

-- Funções cursor
function isMouseInPosition ( x, y, width, height )
    if ( not isCursorShowing( ) ) then
        return false
    end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    
    return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end

function isCursorOverText(posX, posY, sizeX, sizeY)
    if ( not isCursorShowing( ) ) then
        return false
    end
    local cX, cY = getCursorPosition()
    local screenWidth, screenHeight = guiGetScreenSize()
    local cX, cY = (cX*screenWidth), (cY*screenHeight)

    return ( (cX >= posX and cX <= posX+(sizeX - posX)) and (cY >= posY and cY <= posY+(sizeY - posY)) )
end
--