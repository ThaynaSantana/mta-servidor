maxElem = 4
nextElem = 0
elem = 0

State = 'Home'

font = {
    dxCreateFont('files/Light.ttf', 10),
    dxCreateFont('files/Medium.ttf', 10),
    dxCreateFont('files/SemiBold.ttf', 10),
}

--loadSVG()
function painel_corp()
    if State == 'Home' then
        dxDrawRoundedRectangle(735, 405, 450, 270, 20, tocolor(33, 33, 33, 255))
        dxDrawRoundedRectangle(735, 405, 450, 60, 15, tocolor(49, 49, 49, 255))
        dxDrawImage(1162, 412, 15, 15, svg['Icon_Close'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Gerenciador Policial", 735, 405, 450, 60, tocolor(255, 255, 255, 255), 1, font[2], "center", "center", true, true, true)
        
        dxDrawImage(755, 488, 124, 156, svg['background_Card'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawImage(777, 527, 80, 80, svg['Icon_Clothes'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Fardas", 755, 617, 124, 27, tocolor(255, 255, 255, 255), 1, font[1], "center", "center", true, true, true)
        
        dxDrawImage(898, 488, 124, 156, svg['background_Card'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawImage(920, 519, 80, 80, svg['Icon_CarPolice'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Viaturas", 898, 617, 124, 27, tocolor(255, 255, 255, 255), 1, font[1], "center", "center", true, true, true)
        
        dxDrawImage(1041, 488, 124, 156, svg['background_Card'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawImage(1063, 519, 80, 80, svg['Icon_Gun'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Armas", 1041, 617, 124, 27, tocolor(255, 255, 255, 255), 1, font[1], "center", "center", true, true, true)
        
    elseif State == 'Fardas' then
        dxDrawRoundedRectangle(735, 300, 450, 480, 20, tocolor(33, 33, 33, 255))
        dxDrawRoundedRectangle(735, 300, 450, 60, 15, tocolor(49, 49, 49, 255))
        dxDrawImage(1162, 306, 15, 15, svg['Icon_Close'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Gerenciador Policial", 735, 300, 450, 60, tocolor(255, 255, 255, 255), 1, font[2], "center", "center", true, true, true)
        
        elem = 0
        for i,v in ipairs(configPainel.skins) do --
        
            if (i > nextElem and elem < maxElem) then

            elem = elem + 1
            dxDrawRoundedRectangle(760, 379 + ((elem-1)*95), 400, 80, 15, tocolor(69, 69, 69, 255))
            dxDrawImage(1104, 401 + ((elem-1)*95), 35, 35, svg['Icon_Select'], 0, 0, 0, tocolor(255, 255, 255), false)
            dxDrawText(v.nameSkin, 781, 379 + ((elem-1)*95), 379, 80, tocolor(255, 255, 255, 255), 1, font[3], 'left', 'center', true, true)

            end
        end

    elseif State == 'Viaturas' then
        dxDrawRoundedRectangle(735, 300, 450, 480, 20, tocolor(33, 33, 33, 255))
        dxDrawRoundedRectangle(735, 300, 450, 60, 15, tocolor(49, 49, 49, 255))
        dxDrawImage(1162, 306, 15, 15, svg['Icon_Close'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Gerenciador Policial", 735, 300, 450, 60, tocolor(255, 255, 255, 255), 1, font[2], "center", "center", true, true, true)
        
        elem = 0
        for i,v in ipairs(configPainel.Viaturas) do --
        
            if (i > nextElem and elem < maxElem) then

            elem = elem + 1
            dxDrawRoundedRectangle(760, 379 + ((elem-1)*95), 400, 80, 15, tocolor(69, 69, 69, 255))
            dxDrawImage(1104, 401 + ((elem-1)*95), 35, 35, svg['Icon_Select'], 0, 0, 0, tocolor(255, 255, 255), false)
            dxDrawText(v.nameViatura, 781, 379 + ((elem-1)*95), 379, 80, tocolor(255, 255, 255, 255), 1, font[3], 'left', 'center', true, true)

            end
        end

    elseif State == 'Armas' then
        dxDrawRoundedRectangle(735, 300, 450, 480, 20, tocolor(33, 33, 33, 255))
        dxDrawRoundedRectangle(735, 300, 450, 60, 15, tocolor(49, 49, 49, 255))
        dxDrawImage(1162, 306, 15, 15, svg['Icon_Close'], 0, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("Gerenciador Policial", 735, 300, 450, 60, tocolor(255, 255, 255, 255), 1, font[2], "center", "center", true, true, true)
        
        elem = 0
        for i,v in ipairs(configPainel.Armas) do --
        
            if (i > nextElem and elem < maxElem) then

            elem = elem + 1
            dxDrawRoundedRectangle(760, 379 + ((elem-1)*95), 400, 80, 15, tocolor(69, 69, 69, 255))
            dxDrawImage(1104, 401 + ((elem-1)*95), 35, 35, svg['Icon_Select'], 0, 0, 0, tocolor(255, 255, 255), false)
            dxDrawText(v.nameWeapon, 781, 379 + ((elem-1)*95), 379, 80, tocolor(255, 255, 255, 255), 1, font[3], 'left', 'center', true, true)

            end
        end


    end
end

bindKey("backspace", "down", function()
    if isEventHandlerAdded("onClientRender", getRootElement(), painel_corp) then
        removeEventHandler("onClientRender", root, painel_corp)
        removeEventHandler('onClientClick', getRootElement(), clickPainel)
        State = 'Home'
        destroySVG()
        showCursor(false)
    end
end)

addEvent('openPainel', true)
addEventHandler('openPainel', root, function()
    if not isEventHandlerAdded("onClientRender", getRootElement(), painel_corp) then
        addEventHandler("onClientRender", root, painel_corp)
        addEventHandler('onClientClick', getRootElement(), clickPainel)
        loadSVG()
        showCursor(true)
    end
end)

function clickPainel(buttom, state)
    if isEventHandlerAdded("onClientRender", getRootElement(), painel_corp) then
        if buttom == 'left' and state == 'down' then
            if State == 'Home' then
                if isCursorOnElement(755, 488, 124, 156) then
                    State = 'Fardas'
                elseif isCursorOnElement(898, 488, 124, 156) then
                    State = 'Viaturas'
                elseif isCursorOnElement(1041, 488, 124, 156) then
                    State = 'Armas'
                elseif isCursorOnElement(1162, 412, 15, 15) then
                    removeEventHandler("onClientRender", root, painel_corp)
                    removeEventHandler('onClientClick', getRootElement(), clickPainel)
                    State = 'Home'
                    destroySVG()
                    showCursor(false)
                end
            elseif State == 'Fardas' then

                elem = 0
                for i, v in ipairs(configPainel.skins) do
                    if (i > nextElem and elem < maxElem) then
                        elem = elem + 1
                        if isCursorOnElement(1104, 401 + ((elem-1)*95), 35, 35) then
                            triggerServerEvent('onClothes', localPlayer, localPlayer, configPainel.skins[i])

                            removeEventHandler("onClientRender", root, painel_corp)
                            removeEventHandler('onClientClick', getRootElement(), clickPainel)
                            State = 'Home'
                            destroySVG()
                            showCursor(false)
                        end
                    end
                end

                if isCursorOnElement(1162, 306, 15, 15) then
                    State = 'Home'
                    nextElem = 1
                end

            elseif State == 'Viaturas' then

                elem = 0
                for i, v in ipairs(configPainel.Viaturas) do
                    if (i > nextElem and elem < maxElem) then
                        elem = elem + 1
                        if isCursorOnElement(1104, 401 + ((elem-1)*95), 35, 35) then
                            triggerServerEvent('onPoliceCar', localPlayer, localPlayer, configPainel.Viaturas[i])

                            removeEventHandler("onClientRender", root, painel_corp)
                            removeEventHandler('onClientClick', getRootElement(), clickPainel)
                            State = 'Home'
                            destroySVG()
                            showCursor(false)
                        end
                    end
                end

                if isCursorOnElement(1162, 306, 15, 15) then
                    State = 'Home'
                    nextElem = 1
                end

            elseif State == 'Armas' then

                elem = 0
                for i, v in ipairs(configPainel.Armas) do
                    if (i > nextElem and elem < maxElem) then
                        elem = elem + 1
                        if isCursorOnElement(1104, 401 + ((elem-1)*95), 35, 35) then
                            triggerServerEvent('onWeaponArsenal', localPlayer, localPlayer, configPainel.Armas[i])

                            removeEventHandler("onClientRender", root, painel_corp)
                            removeEventHandler('onClientClick', getRootElement(), clickPainel)
                            State = 'Home'
                            destroySVG()
                            showCursor(false)
                        end
                    end
                end

                if isCursorOnElement(1162, 306, 15, 15) then
                    State = 'Home'
                    nextElem = 1
                end

            end
        end
    end
end

-- Navegation
bindKey('mouse_wheel_up', 'down', function()
    if isEventHandlerAdded('onClientRender', root, painel_corp) then 
        if(nextElem > 0) then
            nextElem = nextElem - 1
        end
    end
end)

bindKey('mouse_wheel_down', 'down', function()
    if isEventHandlerAdded('onClientRender', root, painel_corp) then
		if (nextElem < #configPainel.skins - maxElem) then
			nextElem = nextElem + 1
		end
    end
end)

bindKey('mouse_wheel_down', 'down', function()
    if isEventHandlerAdded('onClientRender', root, painel_corp) then
		if (nextElem < #configPainel.Viaturas - maxElem) then
			nextElem = nextElem + 1
		end
    end
end)

bindKey('mouse_wheel_down', 'down', function()
    if isEventHandlerAdded('onClientRender', root, painel_corp) then
		if (nextElem < #configPainel.Armas - maxElem) then
			nextElem = nextElem + 1
		end
    end
end)