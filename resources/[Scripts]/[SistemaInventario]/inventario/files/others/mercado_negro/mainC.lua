addEvent("N3xT.onShopNegro", true)

local negro = function()
    local eff  = interpolateBetween(150, 0, 0, 255, 0, 0, ((getTickCount() - tc) / 1500), "SineCurve")
    local eff2 = interpolateBetween(0, 0, 0, 200, 0, 0, ((getTickCount() - tc) / 500), "Linear")
    dxDrawRectangle(x*422, y*240, x*469, y*210, tocolor(0, 0, 0, eff2), false)
    dxDrawRectangle(x*891, y*240, x*5, y*210, tocolor(0, 255, 127, eff2), false)
    dxDrawText("Mercado Negro", x*615, y*243, x*537, y*440, tocolor(255, 255, 255, 100), x*1.2, "default", "left", "top", false, false, false, false, false)
    dxDrawText("<> Setas para alternar, Enter para comprar, Backspace para fechar.", x*470, y*433, x*537, y*440, tocolor(255, 255, 255, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*662, y*270, x*4, y*159, tocolor(255, 255, 255, 30), false)
    dxDrawImage(x*495, y*286, x*90, y*95, config.itens[negroparte].image, 0, 0, 0, tocolor(255, 255, 255, eff), false)
    dxDrawText("Nome: #a9a9a9"..config.itens[negroparte].nome, x*700, y*271, x*812, y*286, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Peso: #a9a9a9"..config.itens[negroparte].peso, x*700, y*296, x*812, y*311, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Valor: #006400R$"..config.itens[negroparte].valor..",00", x*700, y*376, x*812, y*391, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Descrição:\n#a9a9a9"..config.itens[negroparte].desc, x*700, y*321, x*812, y*336, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
end

addEventHandler("N3xT.onShopNegro", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, negro) then
            tc         = getTickCount()
            negroparte = 34
            addEventHandler("onClientRender", root, negro)
            showCursor(true)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", true)
        end
    end
)

function negroKeys(button)
    if isEventHandlerAdded("onClientRender", root, negro) then
        if (button == "backspace") then
            removeEventHandler("onClientRender", root, negro)
            showCursor(false)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", false)
        elseif (button == "arrow_l") then
            if (negroparte > 34) then
                negroparte = negroparte - 1
                playSoundFrontEnd(1)
            end
        elseif (button == "arrow_r") then
            if (negroparte < 38) then
                negroparte = negroparte + 1
                playSoundFrontEnd(1)
            end
        elseif (button == "enter") then
            triggerServerEvent("N3xT.buyItem", localPlayer, negroparte)
        end
    end
end
bindKey("backspace", "down", negroKeys)
bindKey("arrow_l", "down", negroKeys)
bindKey("arrow_r", "down", negroKeys)
bindKey("enter", "down", negroKeys)