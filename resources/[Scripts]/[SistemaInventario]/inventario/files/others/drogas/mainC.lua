addEvent("N3xT.onPontoDrogas", true)
addEvent("N3xT.EffectDroga", true)

local drogas = function()
    dxDrawRectangle(x*460, y*192, x*425, y*334, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(x*458, y*192, x*7, y*335, tocolor(0, 255, 127, 200), false)
    dxDrawRectangle(x*880, y*192, x*7, y*335, tocolor(0, 255, 127, 200), false)
    dxDrawText("Ponto de Drogas", x*628, y*193, x*700, y*205, tocolor(0, 255, 127, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawImage(x*498, y*242, x*71, y*66, "files/gfx/drugs/fertilizante.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*508, y*349, x*61, y*56, "files/gfx/drugs/smaconha.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*504, y*418, x*60, y*74, "files/gfx/drugs/cocaina.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Fertilizante - R$"..config.itens[39].valor, x*575, y*272, x*660, y*284, tocolor(255, 0, 0, 150), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawText("S. Maconha - R$"..config.itens[40].valor, x*575, y*363, x*661, y*375, tocolor(255, 0, 0, 150), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Cocaína - R$"..config.itens[41].valor, x*575, y*449, x*660, y*461, tocolor(255, 0, 0, 150), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawRectangleBorde(x*723, y*443, x*100, y*36, (isMouseInPosition(x*722, y*443, x*100, y*36) and tocolor(0, 255, 127, 200) or tocolor(0, 0, 0, 150)), false)
    dxDrawRectangleBorde(x*723, y*356, x*100, y*36, (isMouseInPosition(x*723, y*356, x*100, y*36) and tocolor(0, 255, 127, 200) or tocolor(0, 0, 0, 150)), false)
    dxDrawRectangleBorde(x*723, y*263, x*100, y*36, (isMouseInPosition(x*723, y*263, x*100, y*36) and tocolor(0, 255, 127, 200) or tocolor(0, 0, 0, 150)), false)
    dxDrawText("Comprar", x*745, y*363, x*817, y*375, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Comprar", x*745, y*451, x*817, y*463, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Comprar", x*745, y*270, x*816, y*282, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*853, y*192, x*27, y*26, (isMouseInPosition(x*853, y*194, x*27, y*26) and tocolor(200, 0, 0, 200) or tocolor(0, 0, 0, 200)), false)
    dxDrawText("X", x*862, y*196, x*871, y*209, tocolor(255, 255, 255, 255), x*1.00, "sans", "left", "top", false, false, false, false, false)
end

addEventHandler("N3xT.onPontoDrogas", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, drogas) then
            addEventHandler("onClientRender", root, drogas)
            showCursor(true)
            playSoundFrontEnd(8)
            setElementData(localPlayer, "PainelAberto", true)
        end
    end
)

addEventHandler("onClientClick", root,
    function(_, state)
        if isEventHandlerAdded("onClientRender", root, drogas) then
            if (state == "down") then
                if isMouseInPosition(x*853, y*194, x*27, y*26) then
                    removeEventHandler("onClientRender", root, drogas)
                    showCursor(false)
                    playSoundFrontEnd(20)
                    setElementData(localPlayer, "PainelAberto", false)

                elseif isMouseInPosition(x*723, y*263, x*100, y*36) then
                    triggerServerEvent("N3xT.buyItem", localPlayer, 39)
                elseif isMouseInPosition(x*723, y*356, x*100, y*36) then
                    triggerServerEvent("N3xT.buyItem", localPlayer, 40)
                elseif isMouseInPosition(x*723, y*443, x*100, y*36) then
                    triggerServerEvent("N3xT.buyItem", localPlayer, 41)
                end
            end
        end
    end
)

local fm = createMarker(1566.2390136719,23.264503479004,24.1640625 + 0.6, "arrow", 0.7, 0, 255, 127, 30)

local fm_msg = function()
    dxDrawText("Pressione '#ff0000U#ffffff' para começar a fabricar maconha.", screen[1]/2, screen[2]/2, x*817, y*375, tocolor(255, 255, 255, 200), x*1.20, "default", "left", "top", false, false, false, true, false)
end

addEventHandler("onClientMarkerHit", fm,
    function(hitPlayer, dimension)
        if (dimension) and (hitPlayer == localPlayer) then
            if not isPedInVehicle(localPlayer) then
                addEventHandler("onClientRender", root, fm_msg)
            end
        end
    end
)

addEventHandler("onClientMarkerLeave", fm,
    function(hitPlayer, dimension)
        if (dimension) and (hitPlayer == localPlayer) then
            if not isPedInVehicle(localPlayer) then
                removeEventHandler("onClientRender", root, fm_msg)
            end
        end
    end
)

local planta = {
    createObject(677, 1565.6356201172, 29.316785812378, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172, 29.316785812378 + 1.5, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172, 29.316785812378 + 3, 24.1640625 - 1.7),
    
    createObject(677, 1565.6356201172 + 1.5, 29.316785812378, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 1.5, 29.316785812378 + 1.5, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 1.5, 29.316785812378 + 3, 24.1640625 - 1.7),

    createObject(677, 1565.6356201172 + 3, 29.316785812378, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 3, 29.316785812378 + 1.5, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 3, 29.316785812378 + 3, 24.1640625 - 1.7),

    createObject(677, 1565.6356201172 + 4.5, 29.316785812378, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 4.5, 29.316785812378 + 1.5, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 4.5, 29.316785812378 + 3, 24.1640625 - 1.7),

    createObject(677, 1565.6356201172 + 6, 29.316785812378, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 6, 29.316785812378 + 1.5, 24.1640625 - 1.7),
    createObject(677, 1565.6356201172 + 6, 29.316785812378 + 3, 24.1640625 - 1.7),
}

local pmarker = {
    createMarker(1565.6356201172, 29.316785812378, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172, 29.316785812378 + 1.5, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172, 29.316785812378 + 3, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    
    createMarker(1565.6356201172 + 1.5, 29.316785812378, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 1.5, 29.316785812378 + 1.5, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 1.5, 29.316785812378 + 3, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),

    createMarker(1565.6356201172 + 3, 29.316785812378, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 3, 29.316785812378 + 1.5, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 3, 29.316785812378 + 3, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),

    createMarker(1565.6356201172 + 4.5, 29.316785812378, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 4.5, 29.316785812378 + 1.5, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 4.5, 29.316785812378 + 3, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),

    createMarker(1565.6356201172 + 6, 29.316785812378, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 6, 29.316785812378 + 1.5, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
    createMarker(1565.6356201172 + 6, 29.316785812378 + 3, 24.1640625 - 1, "cylinder", 1, 0, 255, 147, 30),
}

bindKey("u", "down",
    function()
        if isElementWithinMarker(localPlayer, fm) then
            if not isPedInVehicle(localPlayer) then
                if not getElementData(localPlayer, "FabricandoMaconha") then
                    setElementData(localPlayer, "FabricandoMaconha", true)
                    messageC("Você já pode começar fabricar #ff0000Maconha #ffffffao lado #00ff7f<#ffffff.", "success")
                    for i = 1, #pmarker do
                        setElementAlpha(pmarker[i], 30)
                    end
                else
                    messageC("Você já está fabricando maconha!", "error")
                end
            end
        end
    end
)

for i = 1, #pmarker do
    setElementAlpha(planta[i], 0)
    setElementAlpha(pmarker[i], 0)
    addEventHandler("onClientMarkerHit", pmarker[i],
        function(hitPlayer, dimension)
            if (dimension) and (hitPlayer == localPlayer) then
                if not isPedInVehicle(localPlayer) then
                    if (getElementAlpha(pmarker[i]) == 30) then
                        local item  = getElementData(localPlayer, "Pá")
                        local item2 = getElementData(localPlayer, "Semente Maconha")
                        local item3 = getElementData(localPlayer, "Fertilizante")
                        if tonumber(item) and (item >= 1) then
                            if tonumber(item2) and (item2 >= 1) then
                                if tonumber(item3) and (item3 >= 1) then
                                    setElementFrozen(localPlayer, true)
                                    setElementAlpha(pmarker[i], 0)
                                    setPedAnimation(localPlayer, "BASEBALL", "Bat_4", 5000, true, false, false, false)

                                    pa = createObject(337, 0, 0, 0)
                                    exports.bone_attach:attachElementToBone(pa, localPlayer, 7, 0, 0.2, 0.6, 180, 90, 70)
                            
                                    setTimer(
                                        function()
                                            local x, y, z = getElementPosition(planta[i])
                                            triggerServerEvent("N3xT.DrogasItem", localPlayer, 1)
                                            setPedAnimation(localPlayer, "BOMBER", "BOM_Plant", 5000, false, false, false, false)
                                            destroyElement(pa)
                                            setElementAlpha(planta[i], 255)
                                            moveObject(planta[i], 5000, x, y, z + 0.7)
                                        end,
                                    5000, 1)

                                    setTimer(
                                        function()
                                            local x, y, z = getElementPosition(planta[i])
                                            triggerServerEvent("N3xT.DrogasItem", localPlayer, 2)
                                            setElementFrozen(localPlayer, false)
                                            setElementAlpha(planta[i], 0)
                                            moveObject(planta[i], 100, x, y, z - 0.7)
                                            if ultimoMarker() then
                                                setElementData(localPlayer, "FabricandoMaconha", nil)
                                            end
                                        end,
                                    10000, 1)
                                else
                                    messageC("Você não possuí 1x #00ff7fFertilizante#ffffff.", "error")
                                end
                            else
                                messageC("Você não possuí 1x #00ff7fSemente Maconha#ffffff.", "error")   
                            end
                        else
                            messageC("Você não possuí uma #00ff7fPá#ffffff.", "error")
                        end
                    end
                end
            end
        end
    )
end

function ultimoMarker()
    local ultimo = 0
    for i = 1, #pmarker do
        if (getElementAlpha(pmarker[i]) == 30) then
            ultimo = ultimo + 1
        end
    end
    if (ultimo == 1) then
        return true
    end
end

local eff_tick = getTickCount()

local eff_maconha = function()
    local eff_b = interpolateBetween(0, 0, 0, 40, 0, 0, ((getTickCount() - eff_tick) / 3000), "SineCurve")
    dxDrawImage(x*0, y*0, screen[1] + x*eff_b, screen[2] + y*eff_b, "files/gfx/others/eff_drogas.png")
end

local eff_cocaina = function()
    local eff_b = interpolateBetween(0, 0, 0, 40, 0, 0, ((getTickCount() - eff_tick) / 3000), "SineCurve")
    dxDrawImage(x*0, y*0, screen[1] + x*eff_b, screen[2] + y*eff_b, "files/gfx/others/eff_drogas2.png")
end

function createMaconhaGifEffect()
    drugtime  = setTimer(setCameraGoggleEffect, 2000, 0, "nightvision")
    drugtime2 = setTimer(setCameraGoggleEffect, 2100, 0, "normal")
end

function stopMaconhaGifEffect()
    if isTimer(drugtime) and isTimer(drugtime2) then
        killTimer(drugtime)
        killTimer(drugtime2)
    end
end

function createCocainaGifEffect()
    drugtime  = setTimer(setCameraGoggleEffect, 2000, 0, "thermalvision")
    drugtime2 = setTimer(setCameraGoggleEffect, 2100, 0, "normal")
end

function stopCocainaGifEffect()
    if isTimer(drugtime) and isTimer(drugtime2) then
        killTimer(drugtime)
        killTimer(drugtime2)
    end
end

addEventHandler("N3xT.EffectDroga", root, 
    function(type)
       -- local eff_sound = playSound("files/sfx/reggae.mp3", true)
        --setSoundEffectEnabled(eff_sound, "reverb", true)
        --setSoundEffectEnabled(eff_sound, "compressor", true)
        --setSoundEffectEnabled(eff_sound, "echo", true)
        setWindVelocity(100, 100, 100)
        if (type == 1) then
            createMaconhaGifEffect()
            addEventHandler("onClientRender", root, eff_maconha)
            setTimer(
                function()
                    removeEventHandler("onClientRender", root, eff_maconha)
                 --   stopSound(eff_sound)
                    setWindVelocity(0.1, 0.1, 0.1)
                    stopMaconhaGifEffect()
                end,
            60000 * config.efeitotime, 1)

        elseif (type == 2) then
            createCocainaGifEffect()
            addEventHandler("onClientRender", root, eff_cocaina)
            setTimer(
                function()
                    removeEventHandler("onClientRender", root, eff_cocaina)
                    stopSound(eff_sound)
                    setWindVelocity(0.1, 0.1, 0.1)
                    stopCocainaGifEffect()
                end,
            60000 * config.efeitotime, 1)   
        end
    end
)