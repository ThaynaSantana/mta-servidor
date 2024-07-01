addEvent("N3xT.onRefreshGridBau", true)
addEvent("N3xT.onACLBau", true)

local gridsource = dxGridW:Create(384, 228, 249, 284)
gridsource:AddColumn("Item", 90)
gridsource:AddColumn("Quantidade", 80)
gridsource:AddColumn("Peso", 75)
gridsource:SetVisible(false)

local gridveh = guiCreateGridList(x*708, y*228, x*249, y*285, false)
guiGridListAddColumn(gridveh, "Item", 0.4)
guiGridListAddColumn(gridveh, "Quantidade", 0.3)
guiGridListAddColumn(gridveh, "Peso", 0.2)
guiSetAlpha(gridveh, 0.7)
guiSetVisible(gridveh, false)

local editquantia = guiCreateEdit(x*637, y*418, x*66, y*32, "Quantia", false)
guiSetAlpha(editquantia, 0.5)
guiSetVisible(editquantia, false)

local bau = function()
    dxDrawRectangle(x*375, y*211, x*592, y*336, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(x*374, y*544, x*593, y*3, tocolor(0, 255, 127, 255), false)
    dxDrawRectangle(x*374, y*211, x*593, y*3, tocolor(0, 255, 127, 255), false)
    dxDrawRectangle(x*966, y*211, x*28, y*25, (isMouseInPosition(x*966, y*211, x*28, y*25) and tocolor(200, 0, 0, 200) or tocolor(0, 0, 0, 200)), false)
    dxDrawText("X", x*975, y*214, x*1003, y*240, tocolor(255, 255, 255, 255), x*1.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawImage(x*643, y*290, x*50, y*43, "files/gfx/others/seta.png", 0, 0, 0, (isMouseInPosition(x*643, y*290, x*50, y*43) and tocolor(0, 255, 127, 150) or tocolor(200, 200, 200, 150)), false)
    dxDrawImage(x*648, y*350, x*50, y*43, "files/gfx/others/seta.png", 180, 0, 0, (isMouseInPosition(x*648, y*350, x*50, y*43) and tocolor(0, 255, 127, 150) or tocolor(200, 200, 200, 150)), false)
end

addEventHandler("N3xT.onRefreshGridBau", root,
    function(baud)
        local bau_data = getElementData(localPlayer, "NextComedorDePerereca")
        if (bau_data) and (bau_data == baud) then
            updateBau()
        end
    end
)

bindKey(config.baubind, "down",
    function()
	    if not isEventHandlerAdded("onClientRender", root, bau) then
            if not isPedInVehicle(localPlayer) then
                for _, v in ipairs(getElementsByType("object")) do
                    if isElement(v) and (getElementModel(v) == 964) and getElementData(v, "NextGostosaum") then
					    local x, y, z    = getElementPosition(localPlayer)
                        local ox, oy, oz = getElementPosition(v)
                        if (getDistanceBetweenPoints3D(x, y, z, ox, oy, oz) <= 2) then
                            triggerServerEvent("N3xT.onACLBau", localPlayer, v)
                            break
                        end
                    end
				end
			end
		end
	end
)

addEventHandler("N3xT.onACLBau", root,
    function(v_bau)
        addEventHandler("onClientRender", root, bau)
        showCursor(true)
        setElementData(localPlayer, "PainelAberto", true)
        setElementData(localPlayer, "PainelAberto1", true)
        setElementData(localPlayer, "NextComedorDePerereca", v_bau)
        guiSetVisible(editquantia, true)
        guiSetVisible(gridveh, true)
        playSoundFrontEnd(8)
        gridsource:SetVisible(true)
        updateBau()
    end
)

addEventHandler("onClientGUIClick", root,
    function()
        if (source == editquantia) then
            local txt = guiGetText(editquantia)
            if (txt == "Quantia") then
                guiSetText(editquantia, "")
            end
        end
    end
)

addEventHandler("onClientClick", root,  
    function(_, state)
        if isEventHandlerAdded("onClientRender", root, bau) then
            if (state == "down") then
                if isMouseInPosition(x*966, y*211, x*28, y*25) then
                    closeBau()

                elseif isMouseInPosition(x*643, y*290, x*50, y*43) then
                    local txt = guiGetText(editquantia)
                    if tonumber(txt) and (tonumber(txt) >= 1) then
                        if (gridsource:GetSelectedItem() ~= -1) then
                            local item = gridsource:GetItemDetails(1, gridsource:GetSelectedItem())
                            triggerServerEvent("N3xT.onMoveBau", localPlayer, item, tonumber(txt), "player")
                        else
                            messageC("Selecione um item!", "error")
                        end
                    else
                        messageC("Preencha a quantia!", "error")
                    end

                elseif isMouseInPosition(x*648, y*350, x*50, y*43) then
                    local txt = guiGetText(editquantia)
                    if tonumber(txt) and (tonumber(txt) >= 1) then
                        if (guiGridListGetSelectedItem(gridveh) ~= -1) then
                            local item = guiGridListGetItemText(gridveh, guiGridListGetSelectedItem(gridveh), 1)
                            triggerServerEvent("N3xT.onMoveBau", localPlayer, item, tonumber(txt), "bau")
                        else
                            messageC("Selecione um item!", "error")
                        end
                    else
                        messageC("Preencha a quantia!", "error")
                    end
                end
            end
        end
    end
)

function closeBau()
    removeEventHandler("onClientRender", root, bau)
    showCursor(false)
    playSoundFrontEnd(20)
    guiSetVisible(gridveh, false)
    guiSetVisible(editquantia, false)
    gridsource:SetVisible(false)
    setElementData(localPlayer, "PainelAberto", false)
    setElementData(localPlayer, "PainelAberto1", false)
    setElementData(localPlayer, "NextComedorDePerereca", nil)
end

function updateBau()
    local bau_data = getElementData(localPlayer, "NextComedorDePerereca")
    gridsource:Clear()
    guiGridListClear(gridveh)
    for _, v in ipairs(config.itens) do
        local data = getElementData(localPlayer, v.nome)
        if tonumber(data) and (data >= 1) then
            gridsource:AddItem(1, v.nome)
            gridsource:AddItem(2, tostring(data))
            gridsource:AddItem(3, tostring(v.peso))
        end
        if (bau_data) then
            local data2 = getElementData(bau_data, v.nome)
            if tonumber(data2) and (data2 >= 1) then
                guiGridListAddRow(gridveh, v.nome, tostring(data2), tostring(v.peso))
            end
        end
    end
end