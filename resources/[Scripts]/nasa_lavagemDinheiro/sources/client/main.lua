local font = dxCreateFont("files/fonts/semibold.ttf", 8)
local font2 = dxCreateFont("files/fonts/medium.ttf", 8)
local font3 = dxCreateFont("files/fonts/semibold.ttf", 7)
local font4 = dxCreateFont("files/fonts/medium.ttf", 7)

edits = {}

function dx()
    dxDrawImage(527, 299, 312, 170, "files/imgs/base_laundry.png")
    dxDrawText("Lavagem de dinheiro", 558, 319, 248, 15, tocolor(255, 255, 255, 90), 1.00, font, "left", "center", false, false, false, false, false)
    dxDrawText("Dinheiro sujo: R$"..formatNumber(quantity), 542, 336, 268, 15, tocolor(255, 255, 255, 35), 1.00, font2, "left", "center", false, false, false, false, false)
    dxDrawText("Digite a quantidade de dinheiro sujo a lavar abaixo", 547, 375, 275, 13, tocolor(255, 255, 255, 90), 1.00, font3, "left", "center", false, false, false, false, false)
    createEditBox(543, 387, 275, 13, tocolor(255, 255, 255, 35), font4, 1)
    if isMouseInPosition(538, 420, 119, 29) then
        dxDrawImage(538, 420, 119, 29, "files/imgs/button.png", 0, 0, 0, tocolor(173, 146, 255))
        dxDrawImage(569, 432, 6, 6, "files/imgs/close.png", 0, 0, 0, tocolor(29, 20, 54))
        dxDrawText("Fechar painel", 579, 420, 49, 29, tocolor(29, 20, 54), 1.00, font, "left", "center", false, false, false, false, false)
    else
        dxDrawImage(538, 420, 119, 29, "files/imgs/button.png", 0, 0, 0, tocolor(255, 255, 255, 1))
        dxDrawImage(569, 432, 6, 6, "files/imgs/close.png", 0, 0, 0, tocolor(255, 255, 255, 35))
        dxDrawText("Fechar painel", 579, 420, 49, 29, tocolor(255, 255, 255, 35), 1.00, font, "left", "center", false, false, false, false, false)
    end
    if isMouseInPosition(665, 420, 163, 29) then
        dxDrawImage(665, 420, 163, 29, "files/imgs/button_laundry.png", 0, 0, 0, tocolor(173, 146, 255))
        dxDrawImage(704, 431, 9, 7, "files/imgs/check.png", 0, 0, 0, tocolor(29, 20, 54))
        dxDrawText("Confirmar lavagem", 718, 420, 49, 29, tocolor(29, 20, 54), 1.00, font, "left", "center", false, false, false, false, false)
    else
        dxDrawImage(665, 420, 163, 29, "files/imgs/button_laundry.png", 0, 0, 0, tocolor(255, 255, 255, 1))
        dxDrawImage(704, 431, 9, 7, "files/imgs/check.png", 0, 0, 0, tocolor(255, 255, 255, 35))
        dxDrawText("Confirmar lavagem", 718, 420, 49, 29, tocolor(255, 255, 255, 35), 1.00, font, "left", "center", false, false, false, false, false)
    end
end

function dxInfo()
    dxDrawImage(527, 506, 312, 41, "files/imgs/base.png")
    dxDrawText(text, 540, 506, 258, 41, tocolor(255, 255, 255, 60), 1.00, font, "left", "center", false, false, false, false, false)
end

addEvent("JOAO.openInfoMoneyLaundry", true)
addEventHandler("JOAO.openInfoMoneyLaundry", root,
function(text_)
    if not isEventHandlerAdded("onClientRender", root, dxInfo) then
        text = text_
        addEventHandler("onClientRender", root, dxInfo)
    end
end)

addEvent("JOAO.openMoneyLaundry", true)
addEventHandler("JOAO.openMoneyLaundry", root,
function(quantity_)
    if not isEventHandlerAdded("onClientRender", root, dx) then
        quantity = quantity_
        EditBox("add")
        select = false
        addEventHandler("onClientRender", root, dx)
        showCursor(true)
    end
end)

addEventHandler("onClientClick", root,
function(_, state)
    if state == "up" then
        if isEventHandlerAdded("onClientRender", root, dx) then
            select = false
            if guiGetText(edits[1]) == "" then guiSetText(edits[1], "Quantia") end
            if isMouseInPosition(543, 387, 275, 13) then
                select = false
                if guiEditSetCaretIndex(edits[1], string.len(guiGetText(edits[1]))) then
                    select = 1
                    guiBringToFront(edits[1])
                    guiSetInputMode("no_binds_when_editing") 
                    if (guiGetText(edits[1]) == "Quantia") then 
                        guiSetText(edits[1], "")
                    end
                end
            end
            if isMouseInPosition(538, 420, 119, 29) then
                closeMenu()
            end
            if isMouseInPosition(665, 420, 163, 29) then
                if guiGetText(edits[1]) == "" or guiGetText(edits[1]) == "Quantia" then
                    notifyC("Digite a quantia!", "error")
                    return
                end
                local quantity = tonumber(guiGetText(edits[1]))
                if not quantity then
                    notifyC("A quantidade precisa ser em número!", "error")
                    return
                end
                if verifyNumber(quantity) then
                    notifyC("Algo de errado com a quantidade!", "error")
                    return
                end
                triggerServerEvent("JOAO.getPaperLaundry", localPlayer, localPlayer, quantity)
            end
        end
    end
end)

addEvent("JOAO.removeInfoMoneyLaundry", true)
addEventHandler("JOAO.removeInfoMoneyLaundry", root,
function()
    if isEventHandlerAdded("onClientRender", root, dxInfo) then
        removeEventHandler("onClientRender", root, dxInfo)
    end
end)

function closeMenu()
    if isEventHandlerAdded("onClientRender", root, dx) then
        EditBox("destroy")
        removeEventHandler("onClientRender", root, dx)
        showCursor(false)
    end
end

function EditBox(tipo)
    if tipo == 'destroy' then
        for i=1, #edits do
            if isElement(edits[i]) then 
                destroyElement(edits[i])
            end
        end
    elseif tipo == 'add' then
        edits[1] = guiCreateEdit(-1000, -1000, 325, 50, 'Quantia', false)
        guiEditSetMaxLength(edits[1], 1000)
        guiSetProperty(edits[1], 'ValidationString', '[0-9]*')
	end 
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == "string" and isElement( pElementAttachedTo ) and type( func ) == "function" then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == "table" and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end