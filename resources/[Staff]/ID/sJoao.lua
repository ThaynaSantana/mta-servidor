db = dbConnect( "sqlite", "dados.db")

tablePassports = {}
tablePassportsID = {}

addEventHandler("onResourceStart", resourceRoot,
function()
    dbExec(db, "CREATE TABLE IF NOT EXISTS passaportes(passaporte, conta, serial)")
    if config["Mensagem Start"] then
        outputDebugString("["..getResourceName(getThisResource()).."] Startado com sucesso!")
    end
    dbQuery(saveQuery, db, "SELECT * FROM passaportes")
    setTimer(function()
        for _, player in ipairs(getElementsByType("player")) do 
            local accountPlayer = getAccountName(getPlayerAccount(player))
            if accountPlayer ~= "guest" then 
                if tablePassports[accountPlayer] then
                    setElementData(player, "ID", tonumber(tablePassports[accountPlayer].passaporte))
                    tablePassports[accountPlayer].serial = getPlayerSerial(player)
                    dbExec(db, "UPDATE passaportes SET serial = ? WHERE conta = ?", getPlayerSerial(player), accountPlayer)
                else
                    local idNovo = getAccountID(getPlayerAccount(player))
                    tablePassports[accountPlayer] = {
                        passaporte = tonumber(idNovo),
                        conta = accountPlayer,
                        serial = getPlayerSerial(player),
                    }
                    tablePassportsID[tonumber(idNovo)] = {
                        passaporte = tonumber(idNovo),
                        conta = accountPlayer,
                        serial = getPlayerSerial(player),
                    }
                    dbExec(db, "INSERT INTO passaportes(passaporte, conta, serial) VALUES(?,?,?)", tonumber(idNovo), accountPlayer, getPlayerSerial(player))
                    setElementData(player, "ID", tonumber(idNovo))
                end
            end
        end
    end, 5000, 1)
end)

addEventHandler("onPlayerLogin", root,
function(_, acc)
    if tablePassports[getAccountName(acc)] then 
        local idJogador = tablePassports[getAccountName(acc)].passaporte
        setElementData(source, "ID", tonumber(idJogador))
        tablePassports[getAccountName(acc)].serial = getPlayerSerial(source)
        dbExec(db, "UPDATE passaportes SET serial = ? WHERE conta = ?", getPlayerSerial(source), getAccountName(acc))
    else
        local idNovo = getAccountID(acc)
        tablePassports[getAccountName(acc)] = {
            passaporte = tonumber(idNovo),
            conta = getAccountName(acc),
            serial = getPlayerSerial(source),
        }
        tablePassportsID[tonumber(idNovo)] = {
            passaporte = tonumber(idNovo),
            conta = getAccountName(acc),
            serial = getPlayerSerial(source),
        }
        dbExec(db, "INSERT INTO passaportes(passaporte, conta, serial) VALUES(?,?,?)", tonumber(idNovo), getAccountName(acc), getPlayerSerial(source))
        setElementData(source, "ID", tonumber(idNovo))
    end
end)

function getNameFromID(player, command, id)
    if tonumber(id) then
        local playerTwo = getPlayerID(tonumber(id))
        if (playerTwo) then	
            notifyS(player, "O nome do jogador é "..getPlayerName(playerTwo), "info")
        else
            notifyS(player, "RG não encontrado!", "info")
        end
    end
end
addCommandHandler("id", getNameFromID)

function setID(thePlayer, cmd, oldid, newid)
    if tonumber(oldid) and tonumber(newid) then
        if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
            local player = getPlayerID(tonumber(oldid))
            local playerTwo = getPlayerID(tonumber(newid))
            if isElement(playerTwo) then
                setElementData(playerTwo, "ID", tonumber(oldid))
            end
            if isElement(player) then
                setElementData(player, "ID", tonumber(newid))
            end
            local idVerify = verifyID(tonumber(oldid))
            if idVerify then
                local account_old = idVerify[2].conta
                alterID(tonumber(oldid), tonumber(newid))
                tablePassports[account_old].passaporte = tonumber(newid)
                dbExec(db, "UPDATE passaportes SET passaporte = ? WHERE passaporte = ?", tonumber(oldid), tonumber(newid))
                dbExec(db, "UPDATE passaportes SET passaporte = ? WHERE conta = ?", tonumber(newid), account_old)
            end
            notifyS(player, "O staff "..removeHex(getPlayerName(thePlayer)).." trocou seu id para "..tonumber(newid).."!", "info")
            notifyS(thePlayer, "Você alterou o ID "..tonumber(oldid).." para o ID "..tonumber(newid).."!", "info")
        end
    end
end
addCommandHandler("setid", setID)

function alterID(oldId, newId)
    savedPassaport = false 
    for i, v in pairs(tablePassports) do
        if v.passaporte == newId then
            savedPassaport = v.passaporte
            tablePassports[i].passaporte = oldId
            break 
        end
    end
    for i, v in pairs(tablePassports) do
        if v.passaporte == oldId then
            if not savedPassaport or savedPassaport ~= v.passaporte then 
                tablePassports[i].passaporte = newId
                break 
            end 
        end
    end
end

function verifyID(idNumber)
    for i, v in pairs(tablePassports) do
        if v.passaporte == idNumber then
            return {i, v}
        end
    end
    return false
end

function getSerialByID(rg)
    for i, v in pairs(tablePassports) do
        if v.passaporte == rg then
            return v.serial, v.conta
        end
    end
    return false, false
end

function getIdByConta(conta)
    if tablePassports[conta] then
        return tablePassports[conta].passaporte, tablePassports[conta].serial
    else
        if conta then
            if getAccount(conta) then
                if getAccountID(getAccount(conta))  then
                    local contaFora = (getAccountID(getAccount(conta)) and getAccountID(getAccount(conta)) or 0)
                    return contaFora, "N/A"
                else
                    return 0, "N/A"
                end
            else
                return 0, "N/A"
            end
        end
    end
end

function getPlayerID(id)
	v = false
	for i, player in ipairs (getElementsByType("player")) do
		if getElementData(player, "ID") == id then
			v = player
			break
		end
	end
	return v
end

function removeHex (s)
    return s:gsub ("#%x%x%x%x%x%x", "") or false
end

oldNickname = {}

addEvent("JOAO.alternateNickPRO", true)
addEventHandler("JOAO.alternateNickPRO", root,
function(player, tipo)
    if player and tipo then
        if not isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Console")) then
            if tipo == "tirar" then
                if not oldNickname[player] then
                    oldNickname[player] = 'Nada'
                end
                setPlayerName(player, oldNickname[player])
                oldNickname[player] = nil
            elseif tipo == "colocar" then
                oldNickname[player] = getPlayerName(player)
                setPlayerName(player, "STAFF+"..getPlayerName(player))
            end
        end
    end
end)

function saveQuery(queryTable)
    local result = dbPoll(queryTable, 0)
    for i=1, #result do
        local row = result[i]
        tablePassports[row.conta] = row
        tablePassportsID[tonumber(row.passaporte)] = row
    end
end