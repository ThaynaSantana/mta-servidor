
local keysActives = {};
local productsActives = {};

-- Product manager

function getProductNewID()
    local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM manager"), -1)
    if (rows and #rows > 0) then
        return (rows[#rows].buyId + 1);
    end
    return 1;
end

function addProductInTable(buyId, account, product, duration)
    productsActives[buyId] = {['account'] = account, ['product'] = product, ['duration'] = duration};
    return true;
end

function removeProductFromTable(buyId)
    if (productsActives[buyId]) then
        table.remove(productsActives, buyId);
        return true;
    end
    return false;
end

-- Key manager

function getKeyNewID()
    local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM keys"), -1)
    if (rows and #rows > 0) then
        return (rows[#rows].keyId + 1);
    end
    return 1;
end

function addKeyInTable(keyId, key, product, duration)
    keysActives[keyId] = {['key'] = key, ['product'] = product, ['duration'] = duration};
    return true;
end

function removeKeyFromTable(keyId)
    if (keysActives[keyId]) then
        table.remove(keysActives, keyId);
        return true;
    end
    return false;
end

-- setTimer manager

function onControllerPlayerVIP()
    for k, v in pairs(productsActives) do
        if (productsActives[k] and productsActives[k] ~= nil) then
            if (getRealTime().timestamp >= productsActives[k].duration) then
                if (productsActives[k].account and getAccount(productsActives[k].account)) then
                    local player = getAccountPlayer(getAccount(productsActives[k].account)) or "Offline";
                    if (player and isElement(player) and getElementType(player) == "player") then
                        outputChatBox("\n"..(getSystemLanguage("product expired"):gsub("${product}", products['addProduct'][productsActives[k].product].name)).."\n", player, 255, 255, 255, true);
                        resetSalaryTable(player);
                    end

                    if (system['webhook']['expired'].use) then createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O **benefício** de um(a) jogador(a) **acabou** de se **expirar**!\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Conta do usuário:\n └ [🎲] #"..(productsActives[k].account).."\n\n[🔮] Produto:\n └ [🎲] #"..(products['addProduct'][productsActives[k].product].name).."\n```\n\n> :flag_um: :flag_gb:\n\n> ・ A player's **benefit** has **just** expired**!\n\n> ・ For more information on, follow the data below:\n\n```ini\n[🔮] User account:\n └ [🎲] #"..(productsActives[k].account).."\n\n[🔮] Product:\n └ [🎲] #"..(products['addProduct'][productsActives[k].product].name).."\n```", system['webhook']['expired'].link); end
                    dbExec(getDatabaseConnection(), "DELETE FROM manager WHERE account = ? AND product = ?", productsActives[k].account, productsActives[k].product);
                    dbExec(getDatabaseConnection(), "DELETE FROM salary WHERE account = ? AND product = ?", productsActives[k].account, productsActives[k].product);
                    products['removeProduct'][productsActives[k].product](productsActives[k].account);
                    removeProductFromTable(k);
                end
            end
        end
    end
end