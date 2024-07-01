
function onActiveRenderVIP(element, product)
    if (system['active']['chat'].use) then outputChatBox("\n\n"..(formatString(system['active']['chat'].message, {['${product}'] = product, ['${user}'] = getPlayerName(element), ['${id}'] = others.getPlayerID(element)})).."\n\n", root, 255, 255, 255, true); end
    if (system['active']['screen'].use) then triggerClientEvent(root, "vipSystem >> active >> start render", root, element, product, math.random(#system.musics)); end
    triggerClientEvent(element, "vipSystem >> active >> player >> start render", element, element, product);
    return;
end

function addPlayerVIP(id, product)
    if (system['site-automatic'].use) then
        local buyId = getProductNewID();
        local player = getPlayerByID(id);
        if (player) then
            if (products['addProduct'][product.name]) then
                if (products['addProduct'][product.name].type == "vip") then
                    local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM manager WHERE account = ? AND product = ?", getAccountName(getPlayerAccount(player)), product.name), -1);
                    if (#rows == 0) then
                        addProductInTable(buyId, getAccountName(getPlayerAccount(player)), products['addProduct'][product.name].name, getRealTime().timestamp + (products['addProduct'][product.name].days * 86400));
                        dbExec(getDatabaseConnection(), "INSERT INTO manager (account, playerId, buyId, product, now, later) VALUES (?, ?, ?, ?, ?, ?)", getAccountName(getPlayerAccount(player)), id, buyId, product.name, getRealTime().timestamp, getRealTime().timestamp + (products['addProduct'][product.name].days * 86400));
                        dbExec(getDatabaseConnection(), "INSERT INTO salary (account, cooldown, product) VALUES (?, ?, ?)", getAccountName(getPlayerAccount(player)), 0, product.name); 
                        resetSalaryTable(player);
                    else
                        addProductInTable(buyId, getAccountName(getPlayerAccount(player)), products['addProduct'][product.name].name, getRealTime().timestamp + (products['addProduct'][product.name].days * 86400));
                        dbExec(getDatabaseConnection(), "UPDATE manager SET later = ? WHERE account = ? AND product = ?", rows[1].later + (products['addProduct'][product.name].days * 86400), getAccountName(getPlayerAccount(player)), product.name);
                        dbExec(getDatabaseConnection(), "UPDATE salary SET cooldown = ? WHERE account = ? AND product = ?", 0, getAccountName(getPlayerAccount(player)), product.name);
                        resetSalaryTable(player);
                    end
                end
                
                if (system['webhook']['activate'].use) then createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ Uma nova **compra** foi recebida, e a compra recebida foi **ativada** em nosso **servidor**.\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] ID do usuário:\n └ [🎲] #"..(id).."\n\n[🔮] Produto:\n └ [🎲] #"..(products['addProduct'][product.name].name).."\n\n[🔮] Duração:\n └ [🎲] #"..(products['addProduct'][product.name].days or "0").."d\n\n[🔮] Tipo do Produto:\n └ [🎲] #"..(products['addProduct'][product.name].type).."\n```\n\n> :flag_um: :flag_gb:\n\n> ・ A new **purchase** has been received and the received purchase has been **activated** on our **server**.\n\n> ・ For more information about , follow the data below:\n\n```ini\n[🔮] User ID:\n └ [🎲] #"..(id).."\n\n[🔮] Product:\n └ [🎲] #"..(products['addProduct'][product.name].name).."\n\n[🔮] Duration:\n └ [🎲] #"..(products['addProduct'][product.name].days or "0").."d\n\n[🔮] Product type:\n └ [🎲] #"..(products['addProduct'][product.name].type).."\n```", system['webhook']['activate'].link); end
                onActiveRenderVIP(player, products['addProduct'][product.name].name);
                products['addProduct'][product.name].func(player); 
            else
                outputDebugString("[VIP System] EN: Some product does not exist in our script! ("..(product.name)..")", 0, 255, 0, 0);
                outputDebugString("[VIP System] PT: Algum produto não existe em nosso resource! ("..(product.name)..")", 0, 255, 0, 0);
            end
        else
            if (system['webhook']['activate'].use) then createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ Uma nova **compra** foi recebida, porém o(a) jogador(a) não estava **online dentro do servidor**, e a compra foi **armazenada** em nossos **bancos de dados**.\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] ID do usuário:\n └ [🎲] #"..(id).."\n\n[🔮] Produto:\n └ [🎲] #"..(product.name).."\n```\n\n> :flag_um: :flag_gb:\n\n> ・ A new **purchase** was received, however the player was not **online within the server**, and the purchase was **stored** in our **databases**.\n\n> ・ For more information on, follow the data below:\n\n```ini\n[🔮] User id:\n └ [🎲] #"..(id).."\n\n[🔮] Product:\n └ [🎲] #"..(product.name).."\n```", system['webhook']['activate'].link); end
            dbExec(getDatabaseConnection(), "INSERT INTO active (id, product) VALUES (?, ?)", id, toJSON(product));
        end
    end
    return false;
end
