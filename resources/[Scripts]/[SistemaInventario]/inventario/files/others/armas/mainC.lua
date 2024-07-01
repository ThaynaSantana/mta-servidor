addEvent("N3xT.onShopArmas", true)

local weapon = function()
    local eff  = interpolateBetween(150, 0, 0, 255, 0, 0, ((getTickCount() - tc) / 1500), "SineCurve")
    local eff2 = interpolateBetween(0, 0, 0, 200, 0, 0, ((getTickCount() - tc) / 500), "Linear")
    dxDrawRectangle(x*422, y*240, x*469, y*210, tocolor(0, 0, 0, eff2), false)
    dxDrawRectangle(x*891, y*240, x*5, y*210, tocolor(0, 255, 127, eff2), false)
    dxDrawText("Loja de Armas", x*615, y*243, x*537, y*440, tocolor(255, 255, 255, 100), x*1.2, "default", "left", "top", false, false, false, false, false)
    dxDrawText("<> Setas para alternar, Enter para comprar, Backspace para fechar.", x*470, y*433, x*537, y*440, tocolor(255, 255, 255, 100), x*1.00, "default", "left", "top", false, false, false, false, false)
    dxDrawImage(x*495, y*286, x*90, y*95, config.itens[weaponparte].image, 0, 0, 0, tocolor(255, 255, 255, eff), false)
    dxDrawRectangle(x*662, y*270, x*4, y*159, tocolor(255, 255, 255, 30), false)
    dxDrawText("Nome: #a9a9a9"..config.itens[weaponparte].nome, x*700, y*271, x*812, y*286, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Peso: #a9a9a9"..config.itens[weaponparte].peso, x*700, y*296, x*812, y*311, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Valor: #006400R$"..config.itens[weaponparte].valor..",00", x*700, y*376, x*812, y*391, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
    dxDrawText("Descrição:\n#a9a9a9"..config.itens[weaponparte].desc, x*700, y*321, x*812, y*336, tocolor(255, 255, 255, 255), x*0.9, font[1], "left", "top", false, false, false, true, false)
end

addEventHandler("N3xT.onShopArmas", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, weapon) then
            tc          = getTickCount()
            weaponparte = 43
            addEventHandler("onClientRender", root, weapon)
            showCursor(true)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", true)
        end
    end
)

function weaponKeys(button)
    if isEventHandlerAdded("onClientRender", root, weapon) then
        if (button == "backspace") then
            removeEventHandler("onClientRender", root, weapon)
            showCursor(false)
            playSoundFrontEnd(15)
            setElementData(localPlayer, "PainelAberto", false)
        elseif (button == "arrow_l") then
            if (weaponparte > 43) then
                weaponparte = weaponparte - 1
                playSoundFrontEnd(1)
            end
        elseif (button == "arrow_r") then
            if (weaponparte < 54) then
                weaponparte = weaponparte + 1
                playSoundFrontEnd(1)
            end
        elseif (button == "enter") then
            if not (getElementData(localPlayer, "ArmaMao") == config.itens[weaponparte].nome) then
                triggerServerEvent("N3xT.buyItem", localPlayer, weaponparte)
            else
                messageC("Você já possuí essa arma!", "error")
            end
        end
    end
end
bindKey("backspace", "down", weaponKeys)
bindKey("arrow_l", "down", weaponKeys)
bindKey("arrow_r", "down", weaponKeys)
bindKey("enter", "down", weaponKeys)

local WeaponID = {
    [22] = true,
    [23] = true,
    [24] = true,
    [25] = true,
    [29] = true,
    [30] = true,
    [31] = true,
    [34] = true,
}

addEventHandler("onClientRender", root,
    function()
        local wep = getPedWeapon(localPlayer)
        if (WeaponID[wep]) then
            if (getPedTotalAmmo(localPlayer) == 1) then
                toggleControl("fire", false)
                toggleControl("action", false)
                setPlayerHudComponentVisible("crosshair", false)
                
                if isPedInVehicle(localPlayer) then
                    setPedWeaponSlot(localPlayer, 0)
                end
            else
                toggleControl("fire", true)
                toggleControl("action", true)
                setPlayerHudComponentVisible("crosshair", true)
            end
        else
            if (wep ~= 28) then
                toggleControl("fire", true)
                toggleControl("action", true)
                setPlayerHudComponentVisible("crosshair", true)
            end
        end
    end
)