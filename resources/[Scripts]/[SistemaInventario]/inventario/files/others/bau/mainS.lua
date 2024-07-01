addEvent("N3xT.onMoveBau", true)
addEvent("N3xT.onACLBau", true)

local db_inv = dbConnect("sqlite", "files/inventario.db")
dbExec(db_inv, "CREATE TABLE IF NOT EXISTS bau (id INT, nome TEXT, quantia INT)")

for i = 1, #config.bau do
    local obj = createObject(964, config.bau[i][1], config.bau[i][2], config.bau[i][3] - 1)
    setElementData(obj, "BauID", i)
    setElementData(obj, "NextGostosaum", true)
end

addEventHandler("N3xT.onMoveBau", root,
    function(item, quantia, lado)
        local bau_data = getElementData(source, "NextComedorDePerereca")
        if (bau_data) then
            if (lado == "player") then
                sourceGiveBau(source, bau_data, item, quantia)
            elseif (lado == "bau") then
                bauGiveBau(bau_data, source, item, quantia)
            end
        end
    end
)

function sourceGiveBau(source, bau, item, quantia)
    local data = getElementData(source, item)
    if tonumber(data) and (data >= quantia) then
        local data2 = getElementData(bau, item) or 0
        takeItem(source, item, quantia)
        messageS(source, "Foi retirado de você "..quantia.."x #00ff7f"..item.."#ffffff.", "info")
        setElementData(bau, item, data2 + quantia)
        triggerClientEvent(source, "N3xT.onRefreshGridBau", source, bau)
    else
        messageS(source, "Você não possuí essa quantidade!", "error")
    end
end

function bauGiveBau(bau, source, item, quantia)
    local data = getElementData(bau, item)
    if tonumber(data) and (data >= quantia) then
        if (getSpaceMochila(source, item, quantia) == true) then
            if not isItemEquipped(source, item) then
                giveItem(source, item, quantia)
                setElementData(bau, item, data - quantia)
                triggerClientEvent(source, "N3xT.onRefreshGridBau", source, bau)
            else
                messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
            end
        end
    else
        messageS(source, "O porta malas não possuí essa quantidade!", "error")
    end
end

addEventHandler("onResourceStart", resourceRoot,
    function()
        for i = 1, #config.bau do
            local result = dbPoll(dbQuery(db_inv, "SELECT * FROM bau WHERE id=?", i), -1)
            if (#result > 0) then
                for _, v in ipairs(config.itens) do
                    for _, search in ipairs(result) do
                        if (v.nome == search["nome"]) then
                            for _, bau in ipairs(getElementsByType("object")) do
                                if isElement(bau) and (getElementModel(bau) == 964) and getElementData(bau, "NextGostosaum") then
                                    if (getElementData(bau, "BauID") == i) then
                                        setElementData(bau, search["nome"], search["quantia"])
                                        dbExec(db_inv, "DELETE FROM bau WHERE id=? AND nome=?", i, search["nome"])
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)

addEventHandler("onResourceStop", resourceRoot,
    function()
        for _, v in ipairs(getElementsByType("object")) do
            if isElement(v) and (getElementModel(v) == 964) and getElementData(v, "NextGostosaum") then
                local id = getElementData(v, "BauID")
                for _, item in ipairs(config.itens) do
                    local data = getElementData(v, item.nome)
                    if (data) and (data >= 1) then
                        dbExec(db_inv, "INSERT INTO bau (id, nome, quantia) VALUES (?, ?, ?)", id, item.nome, data)
                    end
                end
            end
        end
    end
)

addEventHandler("N3xT.onACLBau", root,
    function(v_bau)
        local id = getElementData(v_bau, "BauID")
        if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(config.bau[id][4])) then
            triggerClientEvent(source, "N3xT.onACLBau", resourceRoot, v_bau)
        end
    end
)