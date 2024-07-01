
local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)

local dxfont0_font = dxCreateFont("gfx/font.ttf", 12)
local dxfont1_font = dxCreateFont("gfx/font.ttf", 13)

alpha = 0
ficha = false
function crime ()
        dxDrawRectangle(x*531, y*276, x*308, y*293, tocolor(0, 0, 0, 80), false)
        dxDrawText("Limpar Ficha", x*622, y*286, x*708, y*319, tocolor(255, 255, 255, 255), x*1.00, dxfont0_font, "left", "top", false, false, false, false, false)
        dxDrawRectangle(x*622, y*502,x* 113, y*39, tocolor(0, 0, 0, 200), false)
        dxDrawText("Limpar", x*651, y*513, x*750, y*541, tocolor(255, 255, 255, 255), x*1.00, dxfont0_font, "left", "top", false, false, true, false, false)
        dxDrawRectangle(x*795, y*276, x*44, y*31, tocolor(0, 0, 0, 200), false)
        dxDrawText("X", x*811, y*281, x*867, y*324, tocolor(255, 255, 255, 255), x*1.00, dxfont1_font, "left", "top", false, false, true, false, false)
        dxDrawImage(x*622, y*340, x*113, y*109, "gfx/black.png", 0, 0, 0, tocolor(255, 255, 255,255), false)
    --------------------------------<efeito>------------------    
        color = tocolor(0, 0, 0, 177)  
        color2 = tocolor(0, 0, 0, 177)      
        if ismouseinposition (x*622, y*502, x*113, y*39) then color = tocolor(30, 144, 255, 255) end
        if ismouseinposition (x*795, y*276, x*44, y*311) then color2 = tocolor(30, 144, 255, 255) end
        dxDrawRectangle(x*622, y*502, x*113, y*39,color, false)
        dxDrawRectangle(x*795, y*276, x*44, y*31,color2, false)
    end

function criminal(_,state)
if ficha == true then
if state == "down" then
if isCursorOnElement(x*622, y*502, x*113, y*39) then
triggerServerEvent ("criminal", getLocalPlayer())
end
end
end
end
addEventHandler("onClientClick", root, criminal)

function Fechar(_,state)
if ficha == true then
if state == "down" then
if isCursorOnElement (x*795, y*276, x*44, y*31) then
removeEventHandler ("onClientRender", root,crime)
showCursor (false)
ficha = false
end
end
end
end
addEventHandler ("onClientClick", root, Fechar)

function ficha2(_,state)
if ficha == false then
showCursor (true)
addEventHandler ("onClientRender", root,crime)
ficha = true
end
end
addEvent ("ficha2",true)
addEventHandler ("ficha2", root, ficha2)


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

function ismouseinposition ( x, y, width, height )
    if ( not isCursorShowing ( ) ) then
        return false
    end
 
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
    end
    
local alphaState = true

function alphaFunction()
    if alphaState == true then
        alpha = alpha + 5
    if alpha >= 110 then
        alphaState = false
    end
    end
    if alphaState == false then
        alpha = alpha - 5
    if alpha <= 0 then
        alphaState = true
        end
    end
end
addEventHandler("onClientRender", getRootElement(), alphaFunction)

function dxDrawBorder(posX, posY,posW,posH,color,scale)
    dxDrawLine(posX, posY, posX+posW, posY, color, scale,true)
    dxDrawLine(posX, posY, posX, posY+posH, color, scale,true)
    dxDrawLine(posX, posY+posH, posX+posW, posY+posH, color, scale,true)
    dxDrawLine(posX+posW, posY, posX+posW, posY+posH, color, scale,true)
end