local screenW, screenH = guiGetScreenSize ()
local resW, resH = 1920,1080
local x, y = (screenW/resW), (screenH/resH)

local dxfont0_MontserratBoldItalic = dxCreateFont("assets/font/MontserratBoldItalic.ttf", y*24)
local dxfont1_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*13)
local dxfont2_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*10)
local dxfont3_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*15)
local dxfont4_MontserratSemiBold = dxCreateFont("assets/font/MontserratSemiBold.ttf", y*11)


Scroll1 = dxCreateTexture("assets/img/Scroll1.png", "argb")
Scroll2 = dxCreateTexture("assets/img/Scroll2.png", "argb")

PosSlots = {}

for i = 1,4 do
    for i2 = 1,5 do
        local Index = (i * 5) - (5 - i2)
        PosSlots[Index] = {-98 + (i2 * 144), 124 + (i * 158)}
    end
end

PosSlots2 = {}

for i = 1,4 do
    for i2 = 1,5 do
        local Index = (i * 5) - (5 - i2)
        PosSlots2[Index] = {995 + (i2 * 144), 124 + (i * 158)}
    end
end

Chest = false

addEvent("MST.OpenChest",true)
addEventHandler("MST.OpenChest",root,function(id,itensm,itensb, peso, perm)
    if Chest then
        removeEventHandler("onClientRender",root,dxChest)
        Chest = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
    else
        addEventHandler("onClientRender",root,dxChest)
        Chest = true
        PosScrollbar = 1
        PosScrollbar2 = 1
        showCursor(true)
        ItensMeu = itensm
        ItensBau = itensb
        IDBau = id
        InfosInv = {}
        for i = 1,20 do
            InfosInv[i] = i
        end
        InfosBau = {}
        for i = 1,20 do
            InfosBau[i] = i
        end
        SelectItem = 0
        SelectBau = 0
        EditBox.Create("Quantidade", x*848, y*476, x*223, y*74, false, 8, tocolor(0,0,0,0), dxfont3_MontserratSemiBold, "QUANTIDADE")
        EditBox.SetVisible("Quantidade",true)
        PesoConsumidoInv = getConsumed(ItensMeu, "inv")
        PesoConsumidoBau = getConsumed(ItensBau, "bau")
        PesoBau = peso
        PermMover = perm
    end
end)


addEvent("MST.AttInv",true)
addEventHandler("MST.AttInv",root,function()
    if Chest then
        triggerServerEvent("Kings.UpdateID",localPlayer,localPlayer,IDBau)
    end
end)

addEvent("MST.AttChest",true)
addEventHandler("MST.AttChest",root,function(itensm, itensb)
    if Chest then
        ItensMeu = itensm
        ItensBau = itensb
        PesoConsumidoInv = getConsumed(ItensMeu, "inv")
        PesoConsumidoBau = getConsumed(ItensBau, "bau")
    end
end)

bindKey("backspace","down",function()
    if Chest then
        removeEventHandler("onClientRender",root,dxChest)
        Chest = false
        showCursor(false)
        EditBox.DestroyEdit("Quantidade")
    end
end)

function getConsumed(table,type)
    PesoTotal = 0
    for i,v in ipairs(table) do
        if type == "inv" then
            local Quantidade = v[2]
            local Peso = v[4]
            PesoTotal = PesoTotal + (Peso * Quantidade)
        elseif type == "bau" then
            local Quantidade = v.Quantidade
            local Peso = v.Peso
            PesoTotal = PesoTotal + (Peso * Quantidade)
        end
    end
    return PesoTotal
end

function getWeigthBag()
    if getElementData(localPlayer, "VIP") or getElementData(localPlayer, "Staff") then
        return 50
    end
    return 30
end

function dxChest()
    dxDrawRectangle(0, 0, screenW, screenH, tocolor(0,0,0,75), false)
    for i = 1,#PosSlots do
        dxDrawImage(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152, "assets/img/slot.png", 0, 0, 0, (isCursorOnElement(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152) and tocolor(255,255,255,255) or tocolor(255,255,255,200)),false)
        dxDrawImage(x*PosSlots[i][1], y*(PosSlots[i][2] + 122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), false)
    end
    for i = 1,#InfosInv do
        local Index = InfosInv[i]
        if #ItensMeu >= Index then
            local Item = ItensMeu[Index][1]
            local Quantidade = ItensMeu[Index][2]
            local Nome = ItensMeu[Index][3]
            local Peso = ItensMeu[Index][4] * Quantidade
            local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
            local PosX = (PosSlots[i][1] + (138/2)) - (Width/2)
            local PosY = (PosSlots[i][2] + (152/2)) - (Height/2)
            dxDrawImage(x*PosX, y*PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), false)

            local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
            local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
            local PosX = (x*(PosSlots[i][1]) + (x*(138)/2)) - (Width/2)
            local PosY = (y*(PosSlots[i][2] + 122) + (y*(30)/2)) - (Height/2)
            dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,false,false)


            local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 4) or ""..Peso..".00")
            local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
            dxDrawText(""..Quantidade.."x ("..PesoFormat..")", x*(PosSlots[i][1] + 130) - Width, y*(PosSlots[i][2] + 10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,false,false)
        end
    end
    for i = 1,#PosSlots2 do
        dxDrawImage(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152, "assets/img/slot.png", 0, 0, 0, (isCursorOnElement(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152) and tocolor(255,255,255,255) or tocolor(255,255,255,200)),false)
        dxDrawImage(x*PosSlots2[i][1], y*(PosSlots2[i][2] + 122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), false)
    end
    for i = 1,#InfosBau do
        local Index = InfosBau[i]
        if #ItensBau >= Index then
            local Item = ItensBau[Index].Item
            local Quantidade = ItensBau[Index].Quantidade
            local Nome = ItensBau[Index].Nome
            local Peso = ItensBau[Index].Peso * Quantidade
            local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
            local PosX = ((PosSlots2[i][1]) + ((138)/2)) - ((Width)/2)
            local PosY = (PosSlots2[i][2] + (152/2)) - (Height/2)
            dxDrawImage(x*PosX, y*PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), false)

            local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
            local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
            local PosX = (x*(PosSlots2[i][1]) + (x*(138)/2)) - (Width/2)
            local PosY = (y*(PosSlots2[i][2] + 122) + (y*(30)/2)) - (Height/2)
            dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,false,false)


            local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 4) or ""..Peso..".00")
            local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
            dxDrawText(""..Quantidade.."x ("..PesoFormat..")", x*(PosSlots2[i][1] + 130) - Width, y*(PosSlots2[i][2] + 10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,false,false)
        end
    end
    local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	local cursorx, cursory = mx*fullx - x*(30), my*fully - y*(30)
    if SelectItem ~= 0 then
        local Item = ItensMeu[SelectItem][1]
        local Quantidade = ItensMeu[SelectItem][2]
        local Nome = ItensMeu[SelectItem][3]
        local Peso = ItensMeu[SelectItem][4] * Quantidade
        local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
        dxDrawImage(cursorx, cursory, x*138, y*152, "assets/img/slot.png", 0, 0, 0, tocolor(255,255,255,255),true)
        dxDrawImage(cursorx,  cursory + y*(122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), true)
        local PosX = (cursorx + (x*(138)/2)) - (x*(Width)/2)
        local PosY = (cursory + (y*(152)/2)) - (y*(Height)/2)
        dxDrawImage(PosX, PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), true)

        local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
        local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
        local PosX = (cursorx + (x*(138)/2)) - (Width/2)
        local PosY = ((cursory + y*(122)) + (y*(30)/2)) - (Height/2)
        dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,true,false)

        local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 3) or ""..Peso..".00")
        local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
        dxDrawText(""..Quantidade.."x ("..PesoFormat..")", cursorx + x*(130) - Width, cursory + y*(10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,true,false)
    elseif SelectBau ~= 0 then
        local Item = ItensBau[SelectBau].Item
        local Quantidade = ItensBau[SelectBau].Quantidade
        local Nome = ItensBau[SelectBau].Nome
        local Peso = ItensBau[SelectBau].Peso * Quantidade
        local Width, Height = (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][1] or 64), (Config.AjustandoImagens[Item] and Config.AjustandoImagens[Item][2] or 64)
        dxDrawImage(cursorx, cursory, x*138, y*152, "assets/img/slot.png", 0, 0, 0, tocolor(255,255,255,255),true)
        dxDrawImage(cursorx,  cursory + y*(122), x*138, y*30, "assets/img/barra.png", 0, 0, 0, tocolor(255,255,255,255), true)
        local PosX = (cursorx + (x*(138)/2)) - (x*(Width)/2)
        local PosY = (cursory + (y*(152)/2)) - (y*(Height)/2)
        dxDrawImage(PosX, PosY, x*Width, y*Height, ":MODInventario/gfx/itens/"..Item..".png", 0, 0, 0, tocolor(255,255,255,255), true)

        local Width = dxGetTextWidth(Nome, 1, dxfont4_MontserratSemiBold)
        local Height = dxGetFontHeight(1, dxfont4_MontserratSemiBold)
        local PosX = (cursorx + (x*(138)/2)) - (Width/2)
        local PosY = ((cursory + y*(122)) + (y*(30)/2)) - (Height/2)
        dxDrawText(string.upper(Nome), PosX, PosY, Width, Height, tocolor(255,255,255,255), 1 ,dxfont4_MontserratSemiBold, "left", "top", false,false,true,false)

        local PesoFormat = (verifyFloor(Peso) and string.sub(""..Peso.."", 1, 3) or ""..Peso..".00")
        local Width = dxGetTextWidth(""..Quantidade.."x ("..PesoFormat..")", 1, dxfont2_MontserratSemiBold)
        dxDrawText(""..Quantidade.."x ("..PesoFormat..")", cursorx + x*(130) - Width, cursory + y*(10), x*0, y*0, tocolor(255,255,255,255), 1 ,dxfont2_MontserratSemiBold, "left", "top", false,false,true,false)
    end
    --Peso Inv
    
    local Peso = getWeigthBag()
    dxDrawRoundedRectangle(x*80, y*251, x*635, y*20, tocolor(70,47,82,255), 5) 
    dxDrawRoundedRectangle(x*80, y*251, x*635/Peso*PesoConsumidoInv, y*20, tocolor(52, 31, 62,255), 5)
    dxDrawImage(x*54, y*250, x*18, y*19, "assets/img/shop.png", 0, 0, 0, tocolor(255,255,255,255), false)
    dxDrawText(""..(verifyFloor(PesoConsumidoInv) and string.sub(""..PesoConsumidoInv.."", 1, 4) or ""..PesoConsumidoInv..".00").."Kg", x*79, y*251, x*714, y*271, tocolor(255, 255, 255, 255), 1.00, dxfont2_MontserratSemiBold, "center", "center", false, false, false, false, false)
    dxDrawText(""..Peso.."Kg", x*722, y*251, x*784, y*271, tocolor(255, 255, 255, 255), 1.00, dxfont2_MontserratSemiBold, "left", "center", false, false, false, false, false)
    -- Peso Inv

    --Peso Bau
    dxDrawRoundedRectangle(x*1173, y*251, x*635, y*20, tocolor(70,47,82,255), 5) 
    dxDrawRoundedRectangle(x*1173, y*251, x*635/PesoBau*PesoConsumidoBau, y*20, tocolor(52, 31, 62,255), 5)
    dxDrawImage(x*1147, y*250, x*18, y*19, "assets/img/shop.png", 0, 0, 0, tocolor(255,255,255,255), false)
    dxDrawText(""..(verifyFloor(PesoConsumidoBau) and string.sub(""..PesoConsumidoBau.."", 1, 4) or ""..PesoConsumidoBau..".00").."Kg", x*1172, y*251, x*1807, y*271, tocolor(255, 255, 255, 255), 1.00, dxfont2_MontserratSemiBold, "center", "center", false, false, false, false, false)
    dxDrawText(""..PesoBau.."Kg", x*1815, y*251, x*1852, y*271, tocolor(255, 255, 255, 255), 1.00, dxfont2_MontserratSemiBold, "left", "center", false, false, false, false, false)
    -- Peso Inv

    --ScrollBar Inv

    dxDrawImage(x*770, y*280, x*11, y*630, Scroll2, 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*770, y*(154 + (126 * PosScrollbar)), x*11, y*126, Scroll1, 0, 0, 0, tocolor(255, 255, 255, 255), false)

    --ScrollBar Bau

    dxDrawImage(x*1863, y*280, x*11, y*630, Scroll2, 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*1863, y*(154 + (126 * PosScrollbar2)), x*11, y*126, Scroll1, 0, 0, 0, tocolor(255, 255, 255, 255), false)



    dxDrawRoundedRectangle(x*825, y*459, x*269, y*222, tocolor(52,31,62,255), 7)
    dxDrawRoundedRectangle(x*848, y*476, x*223, y*74, tocolor(70, 47, 82,255), 7)  
    dxDrawRoundedRectangle(x*848, y*586, x*223, y*74, tocolor(70, 47, 82,255), 7)  
    dxDrawText("ENVIAR", x*848, y*586, x*1071, y*660, tocolor(255, 255, 255, 255), 1.00, dxfont3_MontserratSemiBold, "center", "center", false, false, false, false, false)

    
    dxDrawText(""..getPlayerName(localPlayer).." #"..(getElementData(localPlayer, "ID") or "N/A").."", x*52, y*164, x*370, y*207, tocolor(241, 241, 241, 255), 1.00, dxfont0_MontserratBoldItalic, "left", "top", false, false, false, false, false)
    dxDrawText("#462f52N: #ffffff555-333   #462f52RG: #ffffff3335-2374   #462f52BANCO: #ffffff$333.220   #462f52CARTEIRA: #ffffff$25.353", x*52, y*213, x*467, y*242, tocolor(255, 255, 255, 255), 1.00, dxfont1_MontserratSemiBold, "left", "top", false, false, false, true, false)
end

addEventHandler("onClientClick",root,function(b,s)
    if Chest then
        if b == "left" then
            if s == "down" then
                for i = 1,#InfosInv do
                    if isCursorOnElement(x*PosSlots[i][1], y*PosSlots[i][2], x*138, y*152) then
                        local Index = InfosInv[i]
                        if #ItensMeu >= Index then
                            SelectItem = Index
                        end
                    end
                end
                if PermMover then
                    for i = 1,#InfosInv do
                        if isCursorOnElement(x*PosSlots2[i][1], y*PosSlots2[i][2], x*138, y*152) then
                            local Index = InfosBau[i]
                            if #ItensBau >= Index then
                                SelectBau = Index
                            end
                        end
                    end
                end
            elseif s == "up" then
                local Quantidade = (EditBox.GetText("Quantidade") ~= "" and tonumber(EditBox.GetText("Quantidade")) or 1)
                if isCursorOnElement(x*848, y*586, x*223, y*74) then
                    if SelectItem ~= 0 then
                        local Item = ItensMeu[SelectItem][1]
                        local QuantidadeT = ItensMeu[SelectItem][2]
                        if QuantidadeT >= Quantidade then
                            local PesoAdd = ItensMeu[SelectItem][4] * Quantidade
                            local PesoLivre = PesoBau - PesoConsumidoBau
                            if PesoLivre >= PesoAdd then
                                triggerServerEvent("Kings.AddBau",localPlayer,IDBau,Item,Quantidade)
                            end
                        end
                    elseif SelectBau ~= 0 then
                        local Item = ItensBau[SelectBau].Item
                        local QuantidadeT = ItensBau[SelectBau].Quantidade
                        if QuantidadeT >= Quantidade then
                            triggerServerEvent("Kings.RemoveBau",localPlayer,IDBau,Item,Quantidade)
                        end
                    end
                elseif isCursorOnElement(x*1140, y*281, x*711, y*623) then
                    if SelectItem ~= 0 then
                        local Item = ItensMeu[SelectItem][1]
                        local QuantidadeT = ItensMeu[SelectItem][2]
                        if QuantidadeT >= Quantidade then
                            local PesoAdd = ItensMeu[SelectItem][4] * Quantidade
                            local PesoLivre = PesoBau - PesoConsumidoBau
                            if PesoLivre >= PesoAdd then
                                triggerServerEvent("Kings.AddBau",localPlayer,IDBau,Item,Quantidade)
                            end
                        end
                    end
                elseif isCursorOnElement(x*48, y*281, x*711, y*623) then
                    if SelectBau ~= 0 then
                        local Item = ItensBau[SelectBau].Item
                        local QuantidadeT = ItensBau[SelectBau].Quantidade
                        if QuantidadeT >= Quantidade then
                            triggerServerEvent("Kings.RemoveBau",localPlayer,IDBau,Item,Quantidade)
                        end
                    end
                end
                SelectItem = 0
                SelectBau = 0
            end
        end
    end
end)

function ScrollBar(b)
    if Chest then
        if isCursorOnElement(x*41, y*281, x*721, y*627) then
            if b == "mouse_wheel_up" then
                if PosScrollbar ~= 1 then
                    for i = 1, #InfosInv do
                        InfosInv[i] = InfosInv[i] - 5
                    end
                    PosScrollbar = PosScrollbar -1
                end
            elseif b == "mouse_wheel_down" then
                if PosScrollbar ~= 5 then
                    for i = 1, #InfosInv do
                        InfosInv[i] = InfosInv[i] +5
                    end
                    PosScrollbar = PosScrollbar +1
                end
            end
        elseif isCursorOnElement(x*1140, y*281, x*721, y*627) then 
            if b == "mouse_wheel_up" then
                if PosScrollbar2 ~= 1 then
                    for i = 1, #InfosBau do
                        InfosBau[i] = InfosBau[i] - 5
                    end
                    PosScrollbar2 = PosScrollbar2 -1
                end
            elseif b == "mouse_wheel_down" then
                if PosScrollbar2 ~= 5 then
                    for i = 1, #InfosBau do
                        InfosBau[i] = InfosBau[i] +5
                    end
                    PosScrollbar2 = PosScrollbar2 +1
                end
            end
        end
    end
end
bindKey("mouse_wheel_up", "down", ScrollBar)
bindKey("mouse_wheel_down", "down", ScrollBar)

function verifyFloor(number)
    return not ((number - math.floor(number)) == 0)
end

function isCursorOnElement(x, y, w, h)
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


function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius
    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color)
        dxDrawRectangle(x, y - radius, rx, radius, color)
        dxDrawRectangle(x, y + ry, rx, radius, color)
        dxDrawRectangle(x - radius, y, radius, ry, color)
        dxDrawRectangle(x + rx, y, radius, ry, color)
        dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
    end
end