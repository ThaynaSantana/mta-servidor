colshape = {}
markerStart = {}
laundry = {}
paper = {}
timerPaper = {}
markerPaper = {}
paperEnter = {}
timerCut = {}
paperCutting = {}
colshapeCut = {}
paperCut = {}
machineUp = {}
machineDown = {}

addEventHandler("onResourceStart", resourceRoot,
function()
    if config["Mensagem Start"] then
        outputDebugString("["..getResourceName(getThisResource()).."] Startado com sucesso, qualquer bug contacte zJoaoFtw_#5562!")
    end
    colshapeDoor = createColSphere(-2099.537, 897.995, 76.711, 1.2)
    addEventHandler("onColShapeHit", colshapeDoor,
    function(player, dim)
        if player and isElement(player) and getElementType(player) == "player" and dim then
            if not verifyACL(player) then
                notifyS(player, "Você não pode entrar aqui!", "error")
                setElementPosition(player, -2101.942, 899.448, 76.711)
                setElementRotation(player, 0, 0, 87.944)
            end
        end
    end)
    for i, v in ipairs(config["Get paper"]) do
        colshape[i] = createColSphere(unpack(v))
        addEventHandler("onColShapeHit", colshape[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" and dim and not laundry[player] then
                triggerClientEvent(player, "JOAO.openInfoMoneyLaundry", player, "Aperte X para pegar o papel")
                bindKey(player, "x", "down", getPaper)
            end
        end)
        addEventHandler("onColShapeLeave", colshape[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" and dim then
                triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
                unbindKey(player, "x", "down", getPaper)
            end
        end)
    end
    for i, v in ipairs(config["Machines"]) do
        markerStart[i] = createMarker(v.Marker[1], v.Marker[2], v.Marker[3]-0.9, "cylinder", 1.1, 255, 255, 255, 255)
        --setElementData(markerStart[i], "markerData", {title = "Lavagem de dinheiro", desc = "Inicie aqui o seu processo de lavagem", icon = "gift"})
        addEventHandler("onMarkerHit", markerStart[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" and dim then
                if isElement(paper[player]) and laundry[player] then
                    triggerClientEvent(player, "JOAO.openInfoMoneyLaundry", player, "Aperte X para colocar o papel na máquina")
                    bindKey(player, "x", "down", enterPaperLaundry, i)
                end
            end
        end)
        addEventHandler("onMarkerLeave", markerStart[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" and dim then
                triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
                unbindKey(player, "x", "down", enterPaperLaundry, i)
            end
        end)
    end
    for i, v in ipairs(config["Cut money"]) do
        colshapeCut[i] = createColSphere(unpack(v.Colshape))
        machineUp[i] = createObject(1902, v.MachineUp[1], v.MachineUp[2], v.MachineUp[3], v.MachineUp[4], v.MachineUp[5], v.MachineUp[6])
        machineDown[i] = createObject(1901, v.MachineDown[1], v.MachineDown[2], v.MachineDown[3], v.MachineDown[4], v.MachineDown[5], v.MachineDown[6])
        addEventHandler("onColShapeHit", colshapeCut[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" and dim then
                if laundry[player] then
                    if isElement(paperCut[player]) then
                        triggerClientEvent(player, "JOAO.openInfoMoneyLaundry", player, "Aperte X para coletar o dinheiro da máquina")
                        bindKey(player, "x", "down", collectPaperLaundry)
                        unbindKey(player, "x", "down", cutPaperLaundry, i)
                    else
                        triggerClientEvent(player, "JOAO.openInfoMoneyLaundry", player, "Aperte X para colocar o dinheiro na máquina")
                        bindKey(player, "x", "down", cutPaperLaundry, i)
                    end
                end
            end
        end)
        addEventHandler("onColShapeLeave", colshapeCut[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" and dim then
                if isElement(paperCut[player]) then
                    triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
                    unbindKey(player, "x", "down", collectPaperLaundry)
                    unbindKey(player, "x", "down", cutPaperLaundry, i)
                else
                    triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
                    unbindKey(player, "x", "down", cutPaperLaundry, i)
                end
            end
        end)
    end
end)

function collectPaperLaundry(player)
    if player and isElement(player) then
        triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
        unbindKey(player, "x", "down", collectPaperLaundry)
        if isElement(paperCut[player]) then destroyElement(paperCut[player]) end
        if isElement(paperCutting[player]) then destroyElement(paperCutting[player]) end
        if isElement(paper[player]) then destroyElement(paper[player]) end
        if isTimer(timerPaper[player]) then killTimer(timerPaper[player]) end
        if isTimer(timerCut[player]) then killTimer(timerCut[player]) end
        if isElement(markerPaper[player]) then destroyElement(markerPaper[player]) end
        if isElement(paperEnter[player]) then destroyElement(paperEnter[player]) end
        givePlayerMoney(player, laundry[player])
        notifyS(player, "Você coletou R$ "..formatNumber(laundry[player]).." com sucesso!", "success")
        exports['nasa_logs']:messageDiscord('O jogador(a) '..puxarConta(player)..'('..puxarID(player)..') lavou R$ '..laundry[player]..' de dinheiro sujo ', 'https://discordapp.com/api/webhooks/1143270361136382082/l4XEQjPTC7UbBMjIIXK7cgnae_Ce8j15RF9iS3Kcd3Pkn7Sp0vuCmY38uZqnm--tcjL5')
        laundry[player] = false
        setPedAnimation(player, "CARRY", "putdwn05", -1, false, false, false, false)
        toggleControl(player, "fire", true)
        toggleControl(player, "jump", true)
        toggleControl(player, "enter_passenger", true)
        toggleControl(player, "sprint", true)
    end
end

function cutPaperLaundry(player, _, _, indexCut)
    if player and isElement(player) and indexCut then
        if isElement(paperCutting[player]) then
            triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
            unbindKey(player, "x", "down", cutPaperLaundry, i)
            setPedAnimation(player, "CARRY", "putdwn05", -1, false, false, false, false)
            toggleControl(player, "fire", true)
            toggleControl(player, "jump", true)
            toggleControl(player, "enter_passenger", true)
            toggleControl(player, "sprint", true)
            if isElement(paperCutting[player]) then destroyElement(paperCutting[player]) end
            paperCutting[player] = nil
            paperCutting[player] = createObject(1904, config["Cut money"][indexCut].Money[1], config["Cut money"][indexCut].Money[2], config["Cut money"][indexCut].Money[3])
            moveObject(machineUp[indexCut], 2000, config["Cut money"][indexCut].MachineUp[1], config["Cut money"][indexCut].MachineUp[2], 65.9)
            setTimer(function()
                moveObject(machineUp[indexCut], 2000, config["Cut money"][indexCut].MachineUp[1], config["Cut money"][indexCut].MachineUp[2], config["Cut money"][indexCut].MachineUp[3])
            end, 2000, 1)
            timerCut[player] = setTimer(function()
                if isElement(paperCutting[player]) then destroyElement(paperCutting[player]) end
                paperCutting[player] = nil
                paperCut[player] = createObject(1905, config["Cut money"][indexCut].Money[1], config["Cut money"][indexCut].Money[2], config["Cut money"][indexCut].Money[3])
            end, 3000, 1)
        else
            notifyS(player, "Você precisa do dinheiro em suas mãos!", "error")
        end
    end
end

function enterPaperLaundry(player, _, _, indexMachine)
    if player and indexMachine then
        triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
        unbindKey(player, "x", "down", enterPaperLaundry, indexMachine)
        setPedAnimation(player, "CARRY", "putdwn05", -1, false, false, false, false)
        setTimer(function()
            if isElement(player) then
                if isElement(paper[player]) then destroyElement(paper[player]) end
                paper[player] = nil
                paperEnter[player] = createObject(1903, config["Machines"][indexMachine]["Move"].Start[1], config["Machines"][indexMachine]["Move"].Start[2], config["Machines"][indexMachine]["Move"].Start[3])
                moveObject(paperEnter[player], config["Machines"][indexMachine]["Move"].TimerMeio, config["Machines"][indexMachine]["Move"].EndMeio[1], config["Machines"][indexMachine]["Move"].EndMeio[2], config["Machines"][indexMachine]["Move"].EndMeio[3])
                timerPaper[player] = setTimer(function()
                    if isElement(player) then
                        local pos = {getElementPosition(paperEnter[player])}
                        if isElement(paperEnter[player]) then destroyElement(paperEnter[player]) end
                        paperEnter[player] = createObject(1904, pos[1], pos[2], pos[3])
                        moveObject(paperEnter[player], config["Machines"][indexMachine]["Move"].Timer, config["Machines"][indexMachine]["Move"].End[1], config["Machines"][indexMachine]["Move"].End[2], config["Machines"][indexMachine]["Move"].End[3])
                        if isTimer(timerPaper[player]) then killTimer(timerPaper[player]) end
                        timerPaper[player] = nil
                        timerPaper[player] = setTimer(function()
                            if isElement(player) then
                                markerPaper[player] = createMarker(config["Machines"][indexMachine].Get[1], config["Machines"][indexMachine].Get[2], config["Machines"][indexMachine].Get[3]-0.9, "cylinder", 1.1, 255, 255, 255, 255)
                              --  setElementData( markerPaper[player], "markerData", {title = "Lavagem de dinheiro", desc = "Pegue aqui o seu dinheiro e leve na cortadora de dinheiiro", icon = "gift"})
                                setElementVisibleTo(markerPaper[player], root, false)
                                setElementVisibleTo(markerPaper[player], player, true)
                                addEventHandler("onMarkerHit", markerPaper[player],
                                function(player, dim)
                                    if player and isElement(player) and getElementType(player) == "player" and dim then
                                        if source == markerPaper[player] and isElementVisibleTo(markerPaper[player], player) then
                                            triggerClientEvent(player, "JOAO.openInfoMoneyLaundry", player, "Aperte X para pegar o dinheiro")
                                            bindKey(player, "x", "down", getPaperLaundry)
                                        end
                                    end
                                end)
                                addEventHandler("onMarkerLeave", markerPaper[player],
                                function(player, dim)
                                    if player and isElement(player) and getElementType(player) == "player" and dim then
                                        if source == markerPaper[player] and isElementVisibleTo(markerPaper[player], player) then
                                            triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
                                            unbindKey(player, "x", "down", getPaperLaundry)
                                        end
                                    end
                                end)
                            end
                        end, config["Machines"][indexMachine]["Move"].Timer, 1)
                    end
                end, config["Machines"][indexMachine]["Move"].TimerMeio, 1)
                toggleControl(player, "fire", true)
                toggleControl(player, "jump", true)
                toggleControl(player, "enter_passenger", true)
                toggleControl(player, "sprint", true)
                notifyS(player, "Você entregou os papel na máquina com sucesso!", "success")
            end
        end, 300, 1)
    end
end

function getPaperLaundry(player)
    if isElement(player) then
        if isElement(markerPaper[player]) then destroyElement(markerPaper[player]) end
        if isElement(paperEnter[player]) then destroyElement(paperEnter[player]) end
        paperEnter[player] = nil
        triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
        unbindKey(player, "x", "down", getPaperLaundry)
        setPedAnimation(player, "CARRY", "putdwn05", -1, false, false, false, false)
        setTimer(function()
            if isElement(player) then
                setPedAnimation(player, "CARRY", "crry_prtial", 4.1, true, true, true)
                paperCutting[player] = createObject(1904, 0, 0, 0)
                exports.nasa_pAttach:attach(paperCutting[player], player, 25, 0.02,0.1,-0.17,-3.6,111.6,75.6)
                toggleControl(player, "fire", false)
                toggleControl(player, "jump", false)
                toggleControl(player, "enter_passenger", false)
                toggleControl(player, "sprint", false)
                notifyS(player, "Você pegou o dinheiro com sucesso!", "success")
            end
        end, 300, 1)
    end
end

function getPaper(player)
    triggerClientEvent(player, "JOAO.removeInfoMoneyLaundry", player)
    unbindKey(player, "x", "down", getPaper)
    local quantity = exports["nasa_inventario"]:getItem(player, "moneydirt")
    triggerClientEvent(player, "JOAO.openMoneyLaundry", player, quantity)
end


addEvent("JOAO.getPaperLaundry", true)
addEventHandler("JOAO.getPaperLaundry", root,
function(player, quantity)
    if isElement(paper[player]) then notifyS(player, "Você já está com papel em sua mão!", "error") return end
    if laundry[player] then notifyS(player, "Sua lavagem já tem um processo pendente!", "error") return end
    local itens = exports["nasa_inventario"]:getItem(player, "moneydirt")
    if itens < quantity then
        notifyS(player, "Você não tem dinheiro sujo suficiente!", "error")
        return
    end
    setPedAnimation(player, "CARRY", "putdwn05", -1, false, false, false, false)
    laundry[player] = quantity
    exports["nasa_inventario"]:takeItem(player, "moneydirt", quantity)
    setTimer(function()
        if isElement(player) then
            setPedAnimation(player, "CARRY", "crry_prtial", 4.1, true, true, true)
            paper[player] = createObject(1903, 0, 0, 0)
            exports.nasa_pAttach:attach(paper[player], player, 25, 0.02,0.1,-0.17,-3.6,111.6,75.6)
            toggleControl(player, "fire", false)
            toggleControl(player, "jump", false)
            toggleControl(player, "enter_passenger", false)
            toggleControl(player, "sprint", false)
            notifyS(player, "Você pegou os papel com sucesso!", "success")
        end
    end, 300, 1)
end)

function verifyACL(player)
    for i, v in ipairs(config["ACL's"]) do
        if aclGetGroup(v) and isObjectInACLGroup("user."..puxarConta(player), aclGetGroup(v)) then
            return true
        end
    end
    return false
end