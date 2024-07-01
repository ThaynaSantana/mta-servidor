addEvent("N3xT.onOpenInventory", true)
addEvent("N3xT.onUseMira", true)
addEvent("N3xT.onRevistarInv", true)

local slot = {
    [1] = {x=420, y=200, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [2] = {x=525, y=200, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [3] = {x=630, y=200, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [4] = {x=735, y=200, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [5] = {x=840, y=200, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},

    [6] = {x=420, y=325, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [7] = {x=525, y=325, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [8] = {x=630, y=325, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [9] = {x=735, y=325, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [10] = {x=840, y=325, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},

    [11] = {x=420, y=450, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [12] = {x=525, y=450, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [13] = {x=630, y=450, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [14] = {x=735, y=450, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
    [15] = {x=840, y=450, w=100, h=120, cor=tocolor(0, 0, 0, 35), status="vazio"},
}

local inventory = function()
    local peso    = getElementData(localPlayer, "Peso") or 0
    local mochila = getElementData(localPlayer, "Mochila") or 4

   -- exports["Blur"]:dxDrawBluredRectangle(x*0, y*0, screen[1], screen[2], tocolor(255, 255, 255, 255))
    dxDrawText("Inventario - Peso "..math.round(peso).." / "..mochila.." KG", x*600, y*175, x*0, y*0, tocolor(255, 255, 255, 255), x*1, font[1])
    
    for _, item in ipairs(slot) do
        dxDrawRectangleBorde(x*item.x, y*item.y, x*item.w, y*item.h, item.cor)

        for _, data in ipairs(config.itens) do
            local dated = getElementData(localPlayer, data.nome) or 0
            if tonumber(dated) and (dated >= 1) then
                local free = getFreeSlot(data.nome)
                if free then
                    item.status = data.nome
                    item.cor    = tocolor(0, 0, 0, 100)
                end
            end

            if (item.status == data.nome) then
                if tonumber(dated) and (dated < 1) or (dated == nil) then
                    if (item.status == data.nome) then
                        if (select == item.status) then
                            select = false
                        end
                        item.cor    = tocolor(0, 0, 0, 30)
                        item.status = "vazio"
                    end
                end

                dxDrawImage(x*item.x + x*item.w/3.5, y*item.y + y*item.h/3, x*45, y*45, data.image)
                dxDrawText(dated, x*item.x + x*10, y*item.y + y*5, x*0, y*0, tocolor(200, 200, 200, 200), x*1, font[2])
                dxDrawText(data.peso.." KG", x*item.x + x*62, y*item.y + y*5, x*0, y*0, tocolor(200, 200, 200, 200), x*1, font[2])
                dxDrawText(data.nome, x*item.x + x*5, y*item.y + y*100, x*0, y*0, tocolor(200, 200, 200, 200), x*1, font[2])
            end

            if (item.cor == tocolor(0, 0, 0, 150)) then
                if (select ~= item.status) then
                    item.cor = tocolor(0, 0, 0, 100)
                end
            end
        end
    end

    if (select ~= false) then
        local bgeffect    = interpolateBetween(0, 0, 0, 100, 0, 0, ((getTickCount() - tick) / 500), "Linear")
        local texteffect  = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick) / 500), "Linear")
        local editeffect  = interpolateBetween(100, 0, 0, 200, 0, 0, ((getTickCount() - tick) / 1000), "SineCurve")

        dxDrawImage(x*953, y*234, x*136, y*34, "files/gfx/others/buttonbg.png", 0, 0 ,0, (isMouseInPosition(x*953, y*234, x*136, y*34) and tocolor(0, 0, 0, 150) or tocolor(0, 0, 0, bgeffect)))
        dxDrawImage(x*953, y*278, x*136, y*34, "files/gfx/others/buttonbg.png", 0, 0 ,0, (isMouseInPosition(x*953, y*278, x*136, y*34) and tocolor(0, 0, 0, 150) or tocolor(0, 0, 0, bgeffect)))
        dxDrawImage(x*953, y*322, x*136, y*34, "files/gfx/others/buttonbg.png", 0, 0, 0, (isMouseInPosition(x*953, y*322, x*136, y*34) and tocolor(0, 0, 0, 150) or tocolor(0, 0, 0, bgeffect)))
        dxDrawImage(x*953, y*366, x*136, y*34, "files/gfx/others/buttonbg.png", 0, 0, 0, (isMouseInPosition(x*953, y*366, x*136, y*34) and tocolor(0, 0, 0, 150) or tocolor(0, 0, 0, bgeffect)))
        dxDrawText(edit, x*985, y*242, x*0, y*0, tocolor(200, 200, 200, texteffect), x*0.9, font[1])
        dxDrawText("Usar", x*1007, y*286, x*0, y*0, tocolor(200, 200, 200, texteffect), x*0.9, font[1])
        dxDrawText("Enviar", x*1003, y*330, x*0, y*0, tocolor(200, 200, 200, texteffect), x*0.9, font[1])
        dxDrawText("Dropar", x*1000, y*373, x*0, y*0, tocolor(200, 200, 200, texteffect), x*0.9, font[1])

        if (editselect == true) then
            dxDrawRectangle(x*970, y*239, x*2, y*23, tocolor(150, 150, 150, editeffect))
        end
    end
end

addEventHandler("N3xT.onOpenInventory", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, inventory) then
            if not (getElementData(localPlayer, "PainelAberto") == true) then
                addEventHandler("onClientRender", root, inventory)
                showCursor(true)
                showChat(false)
                --playSound("files/sfx/openInv.wav")
                select = false
            end
        else
            removeEventHandler("onClientRender", root, inventory)
            showCursor(false)
            showChat(true)
            --playSound("files/sfx/closeInv.wav")
        end
    end
)

addEventHandler("onClientRender", root,
    function()
        if isEventHandlerAdded("onClientRender", root, inventory) then
            if (getElementData(localPlayer, "PainelAberto") == true) then
                removeEventHandler("onClientRender", root, inventory)
                showChat(true)
                --playSound("files/sfx/closeInv.wav")
            end
        end
    end
)

addEventHandler("onClientClick", root,
    function(button, state)
        if isEventHandlerAdded("onClientRender", root, inventory) then
            if (button == "left" and state == "down") then
                if (select ~= false) then
                    if isMouseInPosition(x*953, y*278, x*136, y*34) then -- Usar
                        triggerServerEvent("N3xT.useItem", localPlayer, select, edit)
                    elseif isMouseInPosition(x*953, y*322, x*136, y*34) then -- Enviar
                        triggerServerEvent("N3xT.submitItem", localPlayer, select, edit)
                    elseif isMouseInPosition(x*953, y*366, x*136, y*34) then -- Dropar
                        triggerServerEvent("N3xT.dropItem", localPlayer, select, edit)
                    end
                    if isMouseInPosition(x*953, y*234, x*136, y*34) then -- Quantidade
                        editselect = true
                        if (edit == "Quantidade") then
                            edit = ""
                        end
                    else
                        editselect = false
                    end
                end
            end
        end
    end
)

addEventHandler("onClientClick", root,
    function(button, state)
        if isEventHandlerAdded("onClientRender", root, inventory) then
            if (button == "left" and state == "down") then
                for _, item in ipairs(slot) do
                    if isMouseInPosition(x*item.x, y*item.y, x*item.w, y*item.h) then
                        if (item.status ~= "vazio") then
                            item.cor   = tocolor(0, 0, 0, 150)
                            select     = item.status
                            tick       = getTickCount()
                            edit       = "Quantidade"
                            editselect = false
                            playSoundFrontEnd(33)
                            break
                        end
                    else
                        if not isMouseInPosition(x*953, y*234, x*136, y*34) and not isMouseInPosition(x*953, y*278, x*136, y*34) and not isMouseInPosition(x*953, y*322, x*136, y*34) and not isMouseInPosition(x*953, y*366, x*136, y*34) then
                            select = false
                        end
                    end
                end
            end
        end
    end
)

function useMira()
    if (getElementData(localPlayer, "UsandoMira") == true) then
        local Crosshair = dxCreateShader("files/fx/texreplace.fx")
        engineApplyShaderToWorldTexture(Crosshair, "siteM16")
        dxSetShaderValue(Crosshair, "gTexture", dxCreateTexture("files/gfx/utilities/mira.png"))
    end
end
addEventHandler("N3xT.onUseMira", root, useMira)
addEventHandler("onClientResourceStart", resourceRoot, useMira)

local gridrevistar = dxGridW:Create(550, 228, 249, 284)
gridrevistar:AddColumn("Item", 90)
gridrevistar:AddColumn("Quantidade", 80)
gridrevistar:AddColumn("Peso", 75)
gridrevistar:SetVisible(false)

local dxrevistar = function()
    dxDrawText("Pressione backspace para fechar", x*589, y*515, x*675, y*524, tocolor(255, 255, 255, 255), x*1.00, "default", "left", "top", false, false, false, false, false)
end

addEventHandler("N3xT.onRevistarInv", root,
    function(nome, quantia, peso)
        if not gridrevistar:IsVisible() then
            gridrevistar:Clear()
            gridrevistar:SetVisible(true)
            addEventHandler("onClientRender", root, dxrevistar)
            showCursor(true)
            playSoundFrontEnd(8)
        end
        gridrevistar:AddItem(1, nome)
        gridrevistar:AddItem(2, tostring(quantia))
        gridrevistar:AddItem(3, tostring(peso))
    end
)

addEventHandler("onClientKey", root,
    function(button)
        if isEventHandlerAdded("onClientRender", root, dxrevistar) then
            if (button == "backspace") then
                removeEventHandler("onClientRender", root, dxrevistar)
                showCursor(false)
                gridrevistar:SetVisible(false)
                playSoundFrontEnd(20)
            end
        end
    end
)

function keyEditBox(key)
    if isEventHandlerAdded("onClientRender", root, inventory) then
        if (editselect == true) then
            if tonumber(key) then
                if (utf8.len(edit) < 5) then
                    edit = edit .. key
                end
		    end
        end
    end
end
addEventHandler('onClientCharacter', getRootElement(), keyEditBox)

function keyEditBox2(button, press)
    if isEventHandlerAdded("onClientRender", root, inventory) then
        if (editselect == true) then
	        if (button == 'backspace' and press) then
			    edit = utf8.sub(edit, 1, utf8.len(edit) -1)
            else
                cancelEvent()
            end
        end
    end
end
addEventHandler('onClientKey', getRootElement(), keyEditBox2)

function getFreeSlot(date)
    value = false
    for i, v in ipairs(slot) do
        local free = verifySlot(date)
        if free then
            if (v.status == "vazio") then
                value = i
                break
            end
        end
    end
    return value
end

function verifySlot(date)
    for i = 1, #slot do
        if (slot[i].status == date) then
            return false
        else
            if (i == #slot) then
                return true
            end
        end
    end
end