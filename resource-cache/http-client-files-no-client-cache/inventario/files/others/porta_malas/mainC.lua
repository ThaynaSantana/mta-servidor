addEvent("N3xT.onPortaMalas", true)
addEvent("N3xT.onPortaMalasSound", true)
addEvent("N3xT.onRefreshGridPortaMalas", true)

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

local portamalas = function()
    local peso    = getElementData(localPlayer, "Peso") or 0
    local mochila = getElementData(localPlayer, "Mochila") or 4
    dxDrawRectangle(x*375, y*211, x*592, y*336, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(x*374, y*544, x*593, y*3, tocolor(0, 255, 127, 255), false)
    dxDrawRectangle(x*374, y*211, x*593, y*3, tocolor(0, 255, 127, 255), false)
    dxDrawRectangle(x*966, y*211, x*28, y*25, (isMouseInPosition(x*966, y*211, x*28, y*25) and tocolor(200, 0, 0, 200) or tocolor(0, 0, 0, 200)), false)
    dxDrawText("X", x*975, y*214, x*1003, y*240, tocolor(255, 255, 255, 255), x*1.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawImage(x*643, y*290, x*50, y*43, "files/gfx/others/seta.png", 0, 0, 0, (isMouseInPosition(x*643, y*290, x*50, y*43) and tocolor(0, 255, 127, 150) or tocolor(200, 200, 200, 150)), false)
    dxDrawImage(x*648, y*350, x*50, y*43, "files/gfx/others/seta.png", 180, 0, 0, (isMouseInPosition(x*648, y*350, x*50, y*43) and tocolor(0, 255, 127, 150) or tocolor(200, 200, 200, 150)), false)
    dxDrawText("Seus itens - Peso "..math.round(peso, 3).." / "..mochila.." KG", x*435, y*517, x*544, y*526, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
    if (vehportamalas) then
        local peso2 = getElementData(vehportamalas, "Peso") or 0
        dxDrawText("Itens no veículo - Peso "..math.round(peso2, 3).." / 30 KG", x*740, y*518, x*860, y*527, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "top", false, false, false, false, false)
    end
end

addEventHandler("N3xT.onPortaMalasSound", root,
    function(x, y, z)
        playSound3D("files/sfx/door.mp3", x, y, z)
    end
)

addEventHandler("N3xT.onRefreshGridPortaMalas", root,
    function(veh)
        if (vehportamalas) then
            if (vehportamalas == veh) then
                updateItensPortaMalas()
            end
        end
    end
)

bindKey(config.portamalasbind, "down",
    function()
	    if not isEventHandlerAdded("onClientRender", root, portamalas) and not (getElementData(localPlayer, "PainelAberto") == true) then
            if not isPedInVehicle(localPlayer) then
                for _, veh in ipairs(getElementsByType("vehicle")) do
					local x, y, z    = getElementPosition(localPlayer)
                    local cx, cy, cz = getVehicleComponentPosition(veh, "boot_dummy", "world")
                    if (cx) and (cy) and (cz) then
                        if (getDistanceBetweenPoints3D(x, y, z, cx, cy, cz) <= 2) then
						    if not isVehicleLocked(veh) then
                                triggerServerEvent("N3xT.onStartPortaMalas", localPlayer, veh, x, y, z)
                                break
                            else
                                messageC("O veículo está trancado!", "error")
                            end
                        end
					end
				end
			end
		end
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
        if isEventHandlerAdded("onClientRender", root, portamalas) then
            if (state == "down") then
                if isMouseInPosition(x*966, y*211, x*28, y*25) then
                    closePortaMalas()

                elseif isMouseInPosition(x*643, y*290, x*50, y*43) then
                    if (vehportamalas) then
                        local txt = guiGetText(editquantia)
                        if tonumber(txt) and (tonumber(txt) >= 1) then
                            if (gridsource:GetSelectedItem() ~= -1) then
                                local item = gridsource:GetItemDetails(1, gridsource:GetSelectedItem())
                                triggerServerEvent("N3xT.onMovePortaMalas", localPlayer, vehportamalas, item, tonumber(txt), "player")
                            else
                                messageC("Selecione um item!", "error")
                            end
                        else
                            messageC("Preencha a quantia!", "error")
                        end
                    else
                        messageC("Ocorreu um erro ao fazer a ação no porta malas!", "error")
                    end

                elseif isMouseInPosition(x*648, y*350, x*50, y*43) then
                    if (vehportamalas) then
                        local txt = guiGetText(editquantia)
                        if tonumber(txt) and (tonumber(txt) >= 1) then
                            if (guiGridListGetSelectedItem(gridveh) ~= -1) then
                                local item = guiGridListGetItemText(gridveh, guiGridListGetSelectedItem(gridveh), 1)
                                triggerServerEvent("N3xT.onMovePortaMalas", localPlayer, vehportamalas, item, tonumber(txt), "vehicle")
                            else
                                messageC("Selecione um item!", "error")
                            end
                        else
                            messageC("Preencha a quantia!", "error")
                        end
                    else
                        messageC("Ocorreu um erro ao fazer a ação no porta malas!", "error")
                    end
                end
            end
        end
    end
)

addEventHandler("N3xT.onPortaMalas", root,
    function(veh)
        addEventHandler("onClientRender", root, portamalas)
        showCursor(true)
        guiSetVisible(gridveh, true)
        guiSetVisible(editquantia, true)
        gridsource:SetVisible(true)
        vehportamalas = veh
        updateItensPortaMalas()
        setElementData(localPlayer, "PainelAberto", true)
	end
)

function closePortaMalas()
    removeEventHandler("onClientRender", root, portamalas)
    showCursor(false)
    playSoundFrontEnd(20)
    guiSetVisible(gridveh, false)
    guiSetVisible(editquantia, false)
    gridsource:SetVisible(false)
    vehportamalas = nil
    setElementData(localPlayer, "PainelAberto", false)
end

function updateItensPortaMalas()
    gridsource:Clear()
    guiGridListClear(gridveh)
    for _, v in ipairs(config.itens) do
        local data = getElementData(localPlayer, v.nome)
        if tonumber(data) and (data >= 1) then
            gridsource:AddItem(1, v.nome)
            gridsource:AddItem(2, tostring(data))
            gridsource:AddItem(3, tostring(v.peso))
        end
        if (vehportamalas) then
            local data2 = getElementData(vehportamalas, v.nome)
            if tonumber(data2) and (data2 >= 1) then
                guiGridListAddRow(gridveh, v.nome, tostring(data2), tostring(v.peso))
            end
        end
    end
end

addEventHandler("onClientRender", root,
    function()
        if (vehportamalas) then
            local x, y, z    = getElementPosition(localPlayer)
            local cx, cy, cz = getVehicleComponentPosition(vehportamalas, "boot_dummy", "world")
            if (cx) and (cy) and (cz) then
                if (getDistanceBetweenPoints3D(x, y, z, cx, cy, cz) > 2) then
                    closePortaMalas()
                end
            end
        end

        if isEventHandlerAdded("onClientRender", root, portamalas) then
            if (getElementData(localPlayer, "PainelAberto1") == true) then
                removeEventHandler("onClientRender", root, portamalas)
                showCursor(false)
                guiSetVisible(gridveh, false)
                guiSetVisible(editquantia, false)
                gridsource:SetVisible(false)
                vehportamalas = nil
            end
        end
    end
)