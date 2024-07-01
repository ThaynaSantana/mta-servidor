addEvent("N3xT.onShopAlimentos", true)

local foods = function()
    local eff  = interpolateBetween(150, 0, 0, 255, 0, 0, ((getTickCount() - tc) / 1500), "SineCurve")
    local eff2 = interpolateBetween(0, 0, 0, 200, 0, 0, ((getTickCount() - tc) / 500), "Linear")
    dxDrawRectangle(x*422, y*240, x*469, y*210, tocolor(0, 0, 0, eff2), false)
    dxDrawRectangle(x*891, y*240, x*5, y*210, tocolor(0, 255, 127, eff2), false)
    dxDrawText("Loja de Alimentos", x*615, y*243, x*537, y*440, tocolor(255, 255, 255, 100), x*1.2, "default", "left", "top", false, false, false, false, false)
    dxDrawText("<> Setas para alternar, Enter para comprar, Backspace para fechar.", x*470, y*433, x*537, y*440, tocolor(255, 255, 255, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
    dxDrawImage(x*495, y*286, x*98, y*94, config.itens[foodparte].image, 0, 0, 0, tocolor(255, 255, 255, eff), false)
    dxDrawRectangle(x*662, y*270, x*4, y*159, tocolor(255, 255, 255, 30), false)
    dxDrawText("Nome: #a9a9a9"..config.itens[foodparte].nome, x*719, y*271, x*812, y*286, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Peso: #a9a9a9"..config.itens[foodparte].peso, x*719, y*296, x*812, y*311, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Valor: #006400R$"..config.itens[foodparte].valor..",00", x*719, y*376, x*812, y*391, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Enche: #a9a9a9"..config.itens[foodparte].enche[2].."% da "..config.itens[foodparte].enche[1], x*719, y*321, x*812, y*336, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
end

addEventHandler("N3xT.onShopAlimentos", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, foods) then
            tc        = getTickCount()
            foodparte = 1
            addEventHandler("onClientRender", root, foods)
            showCursor(true)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", true)
        end
    end
)

function foodsKeys(button)
    if isEventHandlerAdded("onClientRender", root, foods) then
        if (button == "backspace") then
            removeEventHandler("onClientRender", root, foods)
            showCursor(false)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", false)
        elseif (button == "arrow_l") then
            if (foodparte > 1) then
                foodparte = foodparte - 1
                playSoundFrontEnd(1)
            end
        elseif (button == "arrow_r") then
            if (foodparte < 13) then
                foodparte = foodparte + 1
                playSoundFrontEnd(1)
            end
        elseif (button == "enter") then
            triggerServerEvent("N3xT.buyItem", localPlayer, foodparte)
        end
    end
end
bindKey("backspace", "down", foodsKeys)
bindKey("arrow_l", "down", foodsKeys)
bindKey("arrow_r", "down", foodsKeys)
bindKey("enter", "down", foodsKeys)