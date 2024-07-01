local timeDesc = 
{
    ["M"] = 60, 
    ["H"] = 3600, 
    ["D"] = 86400,
    ["P"] = 'PERMANENTE',
}

function resourceStart()
    db = dbConnect("sqlite", "assets/database/database.sqlite")
    dbExec(db, "CREATE TABLE IF NOT EXISTS PlayerPunishs (account TEXT, punishs INTEGER)")
    dbExec(db, "CREATE TABLE IF NOT EXISTS Punishs (id, account TEXT, author TEXT, reason TEXT, total_time INTEGER, time_left INTEGER, type_ban TEXT, timestamp INTEGER)")
    
    if db then 
        outputDebugString("SQUADY [Sistema de Punição] Banco de dados conectado com sucesso.", 4, 14, 158, 247)
    else
        outputDebugString("SQUADY [Sistema de Punição] Houve um erro ao conectar o banco de dados.", 4, 255, 0, 0)
    end
    
    for _, player in ipairs(getElementsByType('player')) do
        if (not isGuestAccount(getPlayerAccount(player))) then
            local rows = dbPoll(dbQuery(db, "SELECT * FROM Punishs WHERE account = ?", getAccountName(getPlayerAccount(player))), -1)
            if (rows and #rows > 0) then
                setTimer(function(element)
                    setPlayerInPrison(element, rows[1].reason, rows[1].author, rows[1].total_time, rows[1].time_left)
                end, 1000, 1, player)
                setTimer(function()
                    if player and isElement(player) then
                        timePunish(getAccountName(getPlayerAccount(player)))
                    end
                end, 5000, 0)
            end
        end
    end
end
addEventHandler("onResourceStart", resourceRoot, resourceStart)

function setPlayerInPrison(player, reason, author, totalTime, timeLeft)
    if isPedInVehicle(player) then 
        removePedFromVehicle(player)
    end

    setElementFrozen(player, true)
    setElementPosition(player, config["positions"]["prison"][1], config["positions"]["prison"][2], config["positions"]["prison"][3])
    setElementDimension(player, config["positions"]["prison"][4])
    setElementInterior(player, config["positions"]["prison"][5])
    setElementData(player, "admin.prison", true)
    toggleAllControls(player, false)

    setTimer(function()
        if player and isElement(player) then
            timePunish(getAccountName(getPlayerAccount(player)))
        end
    end, 5000, 0)


    local prisonData = {
        timeLeft = timeLeft,
        totalTime = totalTime,
        reason = reason,
        author = author
    }

    triggerClientEvent(player, "squady.prisonRender", player, true)
    triggerClientEvent(player, "squady.prisonData", player, prisonData)
end

function removePlayerFromPrison(player)
    if player and isElement(player) then
        setElementFrozen(player, false)
        setElementPosition(player, config["positions"]["prison-exit"][1], config["positions"]["prison-exit"][2], config["positions"]["prison-exit"][3])
        dbExec(db, "DELETE FROM `punishs` WHERE `account` = ?", getAccountName(getPlayerAccount(player)))
        setElementDimension(player, config["positions"]["prison-exit"][4])
        setElementInterior(player, config["positions"]["prison-exit"][5])

        if isElement(player) and getElementType(player) == "player" then
            local account = getPlayerAccount(player)
            if isElement(account) then
                dbExec(db, "DELETE FROM `punishs` WHERE `account` = ?", getAccountName(account))
            end
            sendMessage("server", player, "Você foi solto da prisão staff.", "success")
            removeElementData(player, "admin.prison")
            removeElementData(player, "admin.prison:Time")
            toggleAllControls(player, true)
        end
    end
end

addEvent("squady.search-player", true)
addEventHandler("squady.search-player", getRootElement(), function(key, id)
    local serial, accountID = exports["[arena]ID"]:getSerialByID(tonumber(id))
    if (not accountID) then 
        sendMessage("server", source, "Conta não encontrada", "error")
    else
        triggerClientEvent(source, "squady.admin-manager-data", source, getAccountInformations(tonumber(id), accountID, serial))
    end
end)

addEvent("squady.apply-player-punish", true)
addEventHandler("squady.apply-player-punish", getRootElement(), function(targetPlayerID, reason, time, timeType, typePunish)
    if targetPlayerID and reason and time and timeType and typePunish then
        local adminID = getElementData(source, "ID")
        local adminName = getAccountName(getPlayerAccount(source))
        local serial, accountName = exports["[arena]ID"]:getSerialByID(targetPlayerID.id)
        local stateBan = getStatePunish(accountName)

        local receiver = getPlayerByID(tonumber(targetPlayerID.id))

        if stateBan == 'Banido' then
            return exports['FR_DxMessages']:addBox(source, 'Este jogador já está banido.', 'error')
        end

        if timeDesc[timeType] == 'PERMANENTE' then
            dbExec(db, "INSERT INTO Punishs (id, account, author, reason, total_time, time_left, type_ban, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", targetPlayerID.id, accountName, adminName, reason, seconds, seconds, timeDesc[timeType], getRealTime().timestamp)
            outputChatBox('#49a6fc[INFO] #FFFFFFO Moderador(a) #49a6fc'..getPlayerName(source)..' #'..(getElementData(source, 'ID') or 0)..' #FFFFFFpuniu o jogador(a) #49a6fc'..accountName..' #'..targetPlayerID.id..' #FFFFFFpor #49a6fc'..timeDesc[timeType]..' #FFFFFFcom o seguinte motivo: #49a6fc'..reason, root, 255, 255, 255, true)
            messageDiscord("O(A) " .. getPlayerName(source) .. " (" .. getElementData(source, "ID" or 0) .. ") baniu o jogador " .. accountName .. " (" .. targetPlayerID.id .. ") PERMANENTEMENTE com o seguinte motivo "..reason.."", config["logs"]["web-hook"])
            if receiver and isElement(receiver) then 
                banPlayer(receiver, true, true, true, adminName, reason)
            end
        else
            local seconds = tonumber(time) * timeDesc[timeType]
            
            if typePunish == "Dentro" then
                if receiver and isElement(receiver) then 
                    setPlayerInPrison(receiver, reason, adminName, seconds, seconds)
                end
            elseif typePunish == "Fora" then
                addBan(nil, nil, serial, getRootElement(), reason, seconds, adminName)
            end
    
            dbExec(db, "INSERT INTO Punishs (id, account, author, reason, total_time, time_left, type_ban, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", targetPlayerID.id, accountName, adminName, reason, seconds, seconds, timeDesc[timeType], getRealTime().timestamp)

            if isElement(receiver) then
                outputChatBox('#49a6fc[INFO] #FFFFFFO Moderador(a) #49a6fc'..getPlayerName(source)..' #'..(getElementData(source, 'ID') or 0)..' #FFFFFFpuniu o jogador(a) #49a6fc'..getPlayerName(receiver)..' #'..(getElementData(receiver, 'ID') or 0)..' #FFFFFFpor #49a6fc'..seconds..' segundos #FFFFFFcom o seguinte motivo: #49a6fc'..reason, root, 255, 255, 255, true)
                messageDiscord("O(A) " .. getPlayerName(source) .. " (" .. getElementData(source, "ID" or 0) .. ") baniu o jogador " .. getPlayerName(receiver) .. " (" .. (getElementData(receiver, "ID") or 0) .. ") por "..seconds.." segundos com o seguinte motivo "..reason.."", config["logs"]["web-hook"])
            else
                outputChatBox('#49a6fc[INFO] #FFFFFFO Moderador(a) #49a6fc'..getPlayerName(source)..' #'..(getElementData(source, 'ID') or 0)..' #FFFFFFpuniu o jogador(a) #49a6fc'..accountName..' #'..targetPlayerID.id..' #FFFFFFpor #49a6fc'..seconds..' segundos #FFFFFFcom o seguinte motivo: #49a6fc'..reason, root, 255, 255, 255, true)
                messageDiscord("O(A) " .. getPlayerName(source) .. " (" .. getElementData(source, "ID" or 0) .. ") baniu o jogador " .. accountName .. " (" .. targetPlayerID.id .. ") por "..seconds.." segundos com o seguinte motivo "..reason.."", config["logs"]["web-hook"])
            end
        end
        local result = dbPoll(dbQuery(db, "SELECT * FROM PlayerPunishs WHERE account = ?", accountName), -1)
        if result and #result > 0 then
            local currentPunishs = tonumber(result[1]["punishs"])
            dbExec(db, "UPDATE PlayerPunishs SET punishs = ? WHERE account = ?", currentPunishs + 1, accountName)
        else
            dbExec(db, "INSERT INTO PlayerPunishs (account, punishs) VALUES (?, ?)", accountName, 1)
        end
    end
end)

addCommandHandler(config["open"]["command"], function(player)
    if isPlayerHavePermission(player, config["open"]["permissions"]) then 
        triggerClientEvent(player, "squady.openAdminPanel", player)
    end
end)

addCommandHandler("despunir", function(player, cmd, target)
    if not isPlayerHavePermission(player, config["open"]["permissions"]) then
        sendMessage("server", player, "Você não tem permissão para usar este comando.", "error")
    else
        local playerID = getElementData(player, "ID")

        if not playerID then
            return
        end

        local serial, accountName = exports["[arena]ID"]:getSerialByID(tonumber(target))
        local stateBan = getStatePunish(accountName)

        if stateBan == 'Desbanido' then
            return exports['FR_DxMessages']:addBox(player, 'Este jogador não está banido.', 'error')
        end    

        if target then

            local receiver = getPlayerByID(tonumber(target))

            if receiver and getElementData(receiver, "admin.prison") then
                removePlayerFromPrison(receiver)
                triggerClientEvent(receiver, "squady.prisonRender-remove", receiver)
            else
                for _, ban in ipairs(getBans()) do
                    if getBanSerial(ban) == serial then
                        removeBan(ban)
                    end
                end
            end

            local result = dbPoll(dbQuery(db, "SELECT * FROM PlayerPunishs WHERE account = ?", accountName), -1)
            if result and #result > 0 then
                local currentPunishs = tonumber(result[1]["punishs"])
                dbExec(db, "UPDATE PlayerPunishs SET punishs = ? WHERE account = ?", currentPunishs - 1, accountName)
            else
                dbExec(db, "INSERT INTO PlayerPunishs (account, punishs) VALUES (?, ?)", accountName, 1)
            end

            dbExec(db, "DELETE FROM Punishs WHERE account = ?", accountName)
            sendMessage("server", player, "Você despuniu o jogador " .. accountName .. " (" .. target .. ")", "success")
            messageDiscord("O(A) " .. getPlayerName(player) .. " (" .. getElementData(player, "ID" or 0) .. ") despuniu o jogador " .. accountName .. " (" .. target .. ")", config["logs"]["web-hook"])
        end
    end
end)

addEvent("squady.prisonFinish", true)
addEventHandler("squady.prisonFinish", getRootElement(), function()
    removePlayerFromPrison(source)
end)

addEventHandler("onPlayerLogin", getRootElement(), function()
    local rows = dbPoll(dbQuery(db, "SELECT * FROM punishs WHERE account = ?", getAccountName(getPlayerAccount(source))), -1);

    if (#rows ~= 0) then
        local latestPunishment = rows[1]

        if latestPunishment.type_ban == 'PERMANENTE' then
            banPlayer(source, true, true, true, latestPunishment.author, latestPunishment.reason)
        else
            if latestPunishment.time_left and latestPunishment.time_left > 0 then
                setTimer(function(player)
                    if player and isElement(player) then
                        timePunish(getAccountName(getPlayerAccount(player)))
                    end
                end, 5000, 0, source)
                setTimer(
                    function(element)
                        setPlayerInPrison(element, latestPunishment.reason, latestPunishment.author, latestPunishment.total_time, latestPunishment.time_left);
                    end
                , 1000, 1, source)
            end
        end
    end
end)

addEventHandler("onPlayerWasted", getRootElement(), function()
    if (getElementData(source, "admin.prison")) then 
        triggerClientEvent(source, "squady.prisonRender", source, false)
        
        local rows = dbPoll(dbQuery(db, "SELECT * FROM `Punishs` WHERE `account` = ?", getAccountName(getPlayerAccount(source))), -1);
        if (rows and #rows > 0) then
            setTimer(
                function(element)
                    setPlayerInPrison(element, rows[1].reason, rows[1].author, rows[1].total_time, rows[1].time_left);
                end
            , 10 * 1000, 1, source);
        end
    end
end)

-- // Useful functions 

function getPlayerFromData(accountData)
    if not accountData or not accountData.acc then
        return nil
    end

    for _, player in ipairs(getElementsByType("player")) do
        local playerName = getPlayerName(player)
        if playerName == accountData.acc then
            return player
        end
    end

    return nil
end

function convertTimeToSeconds(time, timeType)
    local actualTime = timeDesc[timeType]
    local numericTime = tonumber(time)
    if numericTime then
        return numericTime * actualTime
    else
        return 0 
    end
end

function timePunish(account)
    if account then
        local rowsPunishs = dbPoll(dbQuery(db, "SELECT * FROM Punishs WHERE account = ?", account), -1)
        if (rowsPunishs and #rowsPunishs ~= 0) then 
            if (rowsPunishs[1].time_left-5) <= 0 then
                removePlayerFromPrison(getPlayerFromAccountName(account))
            end
            dbExec(db, 'UPDATE Punishs SET time_left = ? WHERE account = ?', tonumber(rowsPunishs[1].time_left - 5), account)
        end
    end
end

function getPunishs(account)
    local rowsPlayerPunishs = dbPoll(dbQuery(db, "SELECT * FROM `PlayerPunishs` WHERE `account` = ?", account), -1)
    if (rowsPlayerPunishs and #rowsPlayerPunishs > 0) then
        local playerPunishment = rowsPlayerPunishs[1]
        return playerPunishment.punishs
    else
        return 0
    end
end

function removeBans(accountName)
    if accountName then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Punishs WHERE account = ?", accountName), -1)
        local receiver = getPlayerFromAccountName(accountName)
        if receiver and isElement(receiver) then
            removePlayerFromPrison(receiver)
        end
        if (result[1].type_ban and result[1].type_ban == 'PERMANENTE') then
            local idPunido = exports['[arena]ID']:getIdByConta(accountName)
            local serial = exports["[arena]ID"]:getSerialByID(idPunido)
            for _, ban in ipairs(getBans()) do
                if getBanSerial(ban) == serial then
                    removeBan(ban)
                end
            end
        end
        dbExec(db, 'DELETE FROM Punishs WHERE account = ?', accountName)
        return true
    end
    return false
end

function getStatePunish(account)
    local rowsPunishs = dbPoll(dbQuery(db, "SELECT * FROM Punishs WHERE account = ?", account), -1)
    if (rowsPunishs and #rowsPunishs > 0) then
        return "Banido"
    else
        return "Desbanido"
    end
end

function getAllBans()
    tableBansList = {}
    local punishments = dbPoll(dbQuery(db, "SELECT * FROM Punishs"), -1)
    for i, v in ipairs(punishments) do
        if v.account then
            local idAuthor = exports['[arena]ID']:getIdByConta(v.author)
            local idPunishment = exports['[arena]ID']:getIdByConta(v.account)
            local serial, accountName = exports["[arena]ID"]:getSerialByID(idPunishment)

            if serial then
                table.insert(tableBansList, {
                    applicator = v.author,
                    applicatorId = idAuthor,
                    reason = v.reason,
                    applied_date = v.timestamp,
                    temp = v.time_left,
                    typePunish = 'Banido',
                    typeTime = v.total_time,
                    serialAccount = serial,
                    account = v.account,
                    passport = idPunishment,
                    quantityPunishments = getPunishs(v.account)
                })
            end
        end
    end
    return tableBansList
end

function getAccountInformations(account_id, account, serial)
    if account_id and account and serial then
        local data = {}

        --local infoPersonage = exports['[MOD]Prefeitura']:getInfoPersonage(account)
        local receiver = getPlayerFromAccountName(account)

        if not infoPersonage then
            avatar = 0
        else
            avatar = infoPersonage.avatar
        end
        
        data = {
            id = account_id,
            acc = account,
            serial = serial,
            status = (receiver and "Online" or "Offline"),
            statusB = "Desbanido",
            avatar = avatar and avatar or 0,
            punishs = 0
        }

        local rowsPunishs = dbPoll(dbQuery(db, "SELECT * FROM `Punishs` WHERE `account` = ?", account), -1)
        if (rowsPunishs and #rowsPunishs > 0) then
            local latestPunishment = rowsPunishs[1]
            data.statusB = "Banido"
        end

        local rowsPlayerPunishs = dbPoll(dbQuery(db, "SELECT * FROM `PlayerPunishs` WHERE `account` = ?", account), -1)
        if (rowsPlayerPunishs and #rowsPlayerPunishs > 0) then
            local playerPunishment = rowsPlayerPunishs[1]
            data.punishs = playerPunishment.punishs
        end

        return data
    end
end

function messageDiscord(message, link)
	sendOptions = {
	    queueName = "dcq",
	    connectionAttempts = 3,
	    connectTimeout = 5000,
	    formFields = {
	        content="```\n"..message.."```"
	    },
	}
	fetchRemote(link, sendOptions, function () return end)
end

function getPlayerByID(playerID)
    for _, player in ipairs(getElementsByType("player")) do
        if getElementData(player, "ID") == playerID then
            return player
        end
    end
    return nil
end

function getPlayerFromAccountName(name) 
    local acc = getAccount(name)
    if not acc or isGuestAccount(acc) then
        return false
    end
    return getAccountPlayer(acc)
end