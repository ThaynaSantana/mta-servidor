addEvent("N3xT.onShopUtilitarios", true)

local utilities = function()
    local eff  = interpolateBetween(150, 0, 0, 255, 0, 0, ((getTickCount() - tc) / 1500), "SineCurve")
    local eff2 = interpolateBetween(0, 0, 0, 200, 0, 0, ((getTickCount() - tc) / 500), "Linear")
    dxDrawRectangle(x*422, y*240, x*469, y*210, tocolor(0, 0, 0, eff2), false)
    dxDrawRectangle(x*891, y*240, x*5, y*210, tocolor(0, 255, 127, eff2), false)
    dxDrawText("Loja de Utilitários", x*615, y*243, x*537, y*440, tocolor(255, 255, 255, 100), x*1.2, "default", "left", "top", false, false, false, false, false)
    dxDrawText("<> Setas para alternar, Enter para comprar, Backspace para fechar.", x*470, y*433, x*537, y*440, tocolor(255, 255, 255, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*662, y*270, x*4, y*159, tocolor(255, 255, 255, 30), false)

    if (utilparte == 13) then
        dxDrawImage(x*495, y*286, x*90, y*95, config.mochila.image, 0, 0, 0, tocolor(255, 255, 255, eff), false)
        dxDrawText("Nome: #a9a9a9"..config.mochila.nome, x*700, y*271, x*812, y*286, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
        dxDrawText("Peso: #a9a9a9"..config.mochila.peso, x*700, y*296, x*812, y*311, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
        dxDrawText("Valor: #006400R$"..config.mochila.valor..",00", x*700, y*376, x*812, y*391, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
        dxDrawText("Descrição:\n#a9a9a9"..config.mochila.desc, x*700, y*321, x*812, y*336, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    else
        dxDrawImage(x*495, y*286, x*90, y*95, config.itens[utilparte].image, 0, 0, 0, tocolor(255, 255, 255, eff), false)
        dxDrawText("Nome: #a9a9a9"..config.itens[utilparte].nome, x*700, y*271, x*812, y*286, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
        dxDrawText("Peso: #a9a9a9"..config.itens[utilparte].peso, x*700, y*296, x*812, y*311, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
        dxDrawText("Valor: #006400R$"..config.itens[utilparte].valor..",00", x*700, y*376, x*812, y*391, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
        dxDrawText("Descrição:\n#a9a9a9"..config.itens[utilparte].desc, x*700, y*321, x*812, y*336, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    end
end

addEventHandler("N3xT.onShopUtilitarios", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, utilities) then
            tc        = getTickCount()
            utilparte = 13
            addEventHandler("onClientRender", root, utilities)
            showCursor(true)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", true)
        end
    end
)

function utilKeys(button)
    if isEventHandlerAdded("onClientRender", root, utilities) then
        if (button == "backspace") then
            removeEventHandler("onClientRender", root, utilities)
            showCursor(false)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", false)
        elseif (button == "arrow_l") then
            if (utilparte > 13) then
                utilparte = utilparte - 1
                playSoundFrontEnd(1)
            end
        elseif (button == "arrow_r") then
            if (utilparte < 24) then
                utilparte = utilparte + 1
                playSoundFrontEnd(1)
            end
        elseif (button == "enter") then
            if (utilparte == 13) then
                triggerServerEvent("N3xT.buyItem", localPlayer, utilparte, _, "mochila")
            else
                triggerServerEvent("N3xT.buyItem", localPlayer, utilparte)
            end
        end
    end
end
bindKey("backspace", "down", utilKeys)
bindKey("arrow_l", "down", utilKeys)
bindKey("arrow_r", "down", utilKeys)
bindKey("enter", "down", utilKeys)