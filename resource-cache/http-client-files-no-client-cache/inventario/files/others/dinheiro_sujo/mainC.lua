addEvent("N3xT.onDinheiroSujo", true)

local dsquantia = guiCreateEdit(x*579, y*466, x*77, y*34, "Quantia", false)    
guiSetVisible(dsquantia, false)

local dinheirosujo = function()
    local ds_data = getElementData(localPlayer, "Dinheiro Sujo") or 0
    dxDrawRectangle(x*492, y*226, x*371, y*346, tocolor(0, 0, 0, 200), false)
    dxDrawRectangle(x*492, y*570, x*371, y*2, tocolor(0, 255, 127, 200), false)
    dxDrawImage(x*618, y*240, x*116, y*108, "files/gfx/others/dinheirosujo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("          Olá Amigo, posso lavar seu #00ff7fDinheiro Sujo#ffffff.\nPorém posso lavar no minímo #00ff00R$10,000 #ffffffe #ff000010% #ffffffé meu.", x*506, y*360, x*622, y*405, tocolor(255, 255, 255, 255), x*1.00, "clear", "left", "top", false, false, false, true, false)
    dxDrawText("Seu Dinheiro Sujo: #00ff00R$ "..ds_data, x*590, y*408, x*692, y*555, tocolor(255, 255, 255, 100), x*1.20, "default", "left", "top", false, false, false, true, false)
    dxDrawText("Dinheiro Sujo", x*640, y*543, x*692, y*555, tocolor(255, 255, 255, 100), x*1.20, "default", "left", "top", false, false, false, false, false)
    dxDrawRectangleBorde(x*698, y*462, x*93, y*42, (isMouseInPosition(x*702, y*462, x*93, y*42) and tocolor(0, 255, 127, 200) or tocolor(0, 255, 127, 150)), false)
    dxDrawRectangle(x*833, y*226, x*30, y*30, (isMouseInPosition(x*833, y*226, x*30, y*30) and tocolor(200, 0, 0, 200) or tocolor(0, 0, 0, 200)), false)
    dxDrawText("X", x*843, y*232, x*855, y*250, tocolor(255, 255, 255, 255), x*1.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawText("Lavar", x*726, y*473, x*757, y*480, tocolor(255, 255, 255, 255), x*1.20, "default-bold", "left", "top", false, false, false, false, false)
end

addEventHandler("N3xT.onDinheiroSujo", root,
    function()
        if not isEventHandlerAdded("onClientRender", root, dinheirosujo) then
            addEventHandler("onClientRender", root, dinheirosujo)
            guiSetVisible(dsquantia, true)
            showCursor(true)
            playSoundFrontEnd(8)
            setElementData(localPlayer, "PainelAberto", true)
        end
    end
)

addEventHandler("onClientGUIClick", root,
    function()
        if (source == dsquantia) then
            local txt = guiGetText(dsquantia)
            if (txt == "Quantia") then
                guiSetText(dsquantia, "")
            end
        end
    end
)

addEventHandler("onClientClick", root,
    function(_, state)
        if isEventHandlerAdded("onClientRender", root, dinheirosujo) then
            if (state == "down") then
                if isMouseInPosition(x*833, y*226, x*30, y*30) then
                    closeDinheiroSujo()

                elseif isMouseInPosition(x*698, y*462, x*93, y*42) then
                    local txt = guiGetText(dsquantia)
                    if tonumber(txt) and (tonumber(txt) >= 10000) then
                        local data = getElementData(localPlayer, "Dinheiro Sujo") or 0
                        if tonumber(data) and (data >= tonumber(txt)) then
                            local soma  = math.floor(tonumber(txt) / 10)
                            local soma2 = (tonumber(txt) - soma)
                            setElementData(localPlayer, "Dinheiro Sujo", data - tonumber(txt))
                            triggerServerEvent("N3xT.giveMoneyDinheiroSujo", localPlayer, soma2)
                            messageC("Você lavou #ff0000R$"..txt.." #00ff7fDinheiro Sujo #ffffffe lucrou #00ff00R$"..soma2.."#ffffff.", "success")
                            closeDinheiroSujo()
                        else
                            messageC("Você não possuí essa quantia!", "error")
                        end
                    else
                        messageC("Coloque uma quantia válida!", "error")
                    end
                end
            end
        end
    end
)

function closeDinheiroSujo()
    removeEventHandler("onClientRender", root, dinheirosujo)
    guiSetVisible(dsquantia, false)
    showCursor(false)
    playSoundFrontEnd(20)
    setElementData(localPlayer, "PainelAberto", false)
end