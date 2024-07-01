
local function getVipIndex(vip)
    if (vip and type(vip) == "string") then
        for k, v in ipairs(system.vips) do
            if (v.name == vip) then
                return k;
            end
        end
    end
    return false;
end

local function getSystemVips()
    local produtos = {};
    local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM manager"), -1);
    if (rows and #rows > 0) then
        for k, v in ipairs(rows) do
            local days = os.date("%dd", (v.later - v.now));
            local remaining = os.date("%d/%m/%Y", v.later);
            table.insert(produtos, {['id'] = v.playerId, ['buyId'] = v.buyId, ['product'] = v.product, ['account'] = v.account, ['finish'] = remaining, ['duration'] = days});
        end
    end
    return produtos;
end

local function getSystemKeys()
    local key = {};
    local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM keys"), -1);
    if (rows and #rows > 0) then
        for k, v in ipairs(rows) do
            local days = os.date("%dd", (v.later - v.now));
            local remaining = os.date("%d/%m/%Y", v.later);
            table.insert(key, {['keyId'] = v.keyId, ['vip'] = v.product, ['key'] = v.key, ['created'] = remaining, ['duration'] = days});
        end
    end
    return key;
end

addEvent("vipSystem >> manager >> add key", true);
addEventHandler("vipSystem >> manager >> add key", root,
    function(player, data)
        local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM keys WHERE key = ?", data.key), -1);
        if (#rows == 0) then
            if (system['webhook']['keys'].use) then 
                local now = getRealTime().timestamp;
                local later = (now + (data.days * 86400));
                local duration = os.date("%dd", (later - now));
                local formatted = os.date("%d/%m/%Y", later);

                createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) criou uma **Key VIP**\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Responsável:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Key:\n └ [🎲] #"..(data.key).."\n\n[🔮] Produto:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expira em:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) has created a **Key VIP**!\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Responsible:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Key:\n └ [🎲] #"..(data.key).."\n\n[🔮] Product:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expires in:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```", system['webhook']['keys'].link); 
            end

            local keyId = getKeyNewID();
            dbExec(getDatabaseConnection(), "INSERT INTO keys (keyId, key, product, now, later, productDays) VALUES (?, ?, ?, ?, ?, ?)", keyId, data.key, data['vip'].name, getRealTime().timestamp, getRealTime().timestamp + (data.days * 86400), data.days);
            outputChatBox("\n\n- YOUR KEY: #FFFF00"..(data.key).." #FFFFFF(#FFFF00"..(data['vip'].name).."#FFFFFF)\n- YOUR KEY: Use #FFFF00CTRL + V #FFFFFFto #FFFF00PASTE #FFFFFFyour key\n\n", player, 255, 255, 255, true);
            addKeyInTable(keyId, data.key, data.vip, getRealTime().timestamp + (data.days * 86400));
            geral.sNotify(player, getSystemLanguage("add key warning added"), "success");
            triggerClientEvent(player, "vipManager >> manager render", player);
        else
            geral.sNotify(player, getSystemLanguage("add key warning key exists"), "warning");
        end
    end
);

addEvent("vipSystem >> manager >> remove key", true);
addEventHandler("vipSystem >> manager >> remove key", root,
    function(player, data)
        if (system['webhook']['keys'].use) then createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) removeu uma **Key VIP**\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Responsável:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Key:\n └ [🎲] #"..(data.key).."\n\n[🔮] Produto:\n └ [🎲] #"..(data.vip).."\n\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) has removed a **Key VIP!**\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Responsible:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Key:\n └ [🎲] #"..(data.key).."\n\n[🔮] Product:\n └ [🎲] #"..(data.vip).."\n\n```", system['webhook']['keys'].link); end
        geral.sNotify(player, getSystemLanguage("remove key warning removed"), "success");
        dbExec(getDatabaseConnection(), "DELETE FROM keys WHERE key = ?", data.key);
        triggerClientEvent(player, "vipManager >> manager render", player);
        removeKeyFromTable(data.keyId);
    end
);

addEvent("vipSystem >> manager >> add vip", true);
addEventHandler("vipSystem >> manager >> add vip", root, 
    function(player, data)
        local playerID = getPlayerByID(data.id);
        if (playerID) then
            if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(playerID))), aclGetGroup(data['vip'].permission))) then
                local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM manager WHERE account = ? AND product = ?", getAccountName(getPlayerAccount(playerID)), data['vip'].name), -1);
                if (rows and #rows > 0) then
                    if (system['webhook']['addVip'].use) then 
                        local now = getRealTime().timestamp;
                        local later = (rows[1].later + (data.days * 86400));
                        local duration = os.date("%dd", (later - now));
                        local formatted = os.date("%d/%m/%Y", later);

                        createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) ativou um **VIP "..(data['vip'].name).."** para o(a) **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Responsável:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Usuário:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Produto:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expira em:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) has activated a **VIP "..(data['vip'].name).."** for **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Responsible:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] User:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Product:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expires in:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```", system['webhook']['addVip'].link); 
                    end

                    dbExec(getDatabaseConnection(), "UPDATE manager SET later = ? WHERE account = ? AND product = ?", rows[1].later + (data.days * 86400), getAccountName(getPlayerAccount(playerID)), data['vip'].name);
                    dbExec(getDatabaseConnection(), "UPDATE salary SET cooldown = ? WHERE account = ? AND product = ?", 0, getAccountName(getPlayerAccount(playerID)), data['vip'].name);
                    addProductInTable(rows[1].buyId, getAccountName(getPlayerAccount(playerID)), data['vip'].name, rows[1].later + (data.days * 86400));
                    triggerClientEvent(player, "vipManager >> manager data", player, {['vip'] = getSystemVips(), ['keys'] = getSystemKeys()});
                    geral.sNotify(player, getSystemLanguage("add vip warning added"), "success");
                    onActiveRenderVIP(playerID, "VIP "..(data['vip'].name));
                    resetSalaryTable(playerID);
                    return;
                else
                    if (system['webhook']['addVip'].use) then 
                        local now = getRealTime().timestamp;
                        local later = (now + (data.days * 86400));
                        local duration = os.date("%dd", (later - now));
                        local formatted = os.date("%d/%m/%Y", later);
                        createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) ativou um **VIP "..(data['vip'].name).."** para o(a) **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Responsável:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Usuário:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Produto:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expira em:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) has activated a **VIP "..(data['vip'].name).."** for **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Responsible:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] User:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Product:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expires in:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```", system['webhook']['addVip'].link); 
                    end
    
                    local buyId = getProductNewID();
                    dbExec(getDatabaseConnection(), "INSERT INTO manager (account, playerId, buyId, product, now, later) VALUES (?, ?, ?, ?, ?, ?)", getAccountName(getPlayerAccount(playerID)), data.id, buyId, data['vip'].name, getRealTime().timestamp, getRealTime().timestamp + (data.days * 86400));
                    dbExec(getDatabaseConnection(), "INSERT INTO salary (account, cooldown, product) VALUES (?, ?, ?)", getAccountName(getPlayerAccount(playerID)), 0, data['vip'].name); 
                    addProductInTable(buyId, getAccountName(getPlayerAccount(playerID)), data['vip'].name, getRealTime().timestamp + (data.days * 86400));
                    triggerClientEvent(player, "vipManager >> manager data", player, {['vip'] = getSystemVips(), ['keys'] = getSystemKeys()});
                    geral.sNotify(player, getSystemLanguage("add vip warning added"), "success");
                    products['addProduct'][data['vip'].name].func(playerID);
                    onActiveRenderVIP(playerID, "VIP "..(data['vip'].name));
                    resetSalaryTable(playerID);
                end
            else
                if (system['webhook']['addVip'].use) then 
                    local now = getRealTime().timestamp;
                    local later = (now + (data.days * 86400));
                    local duration = os.date("%dd", (later - now));
                    local formatted = os.date("%d/%m/%Y", later);
                    createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) ativou um **VIP "..(data['vip'].name).."** para o(a) **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Responsável:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Usuário:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Produto:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expira em:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) has activated a **VIP "..(data['vip'].name).."** for **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Responsible:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] User:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Product:\n └ [🎲] #"..(data['vip'].name).."\n\n[🔮] Expires in:\n └ [🎲] #"..(formatted).." ("..(duration)..")\n\n```", system['webhook']['addVip'].link); 
                end

                local buyId = getProductNewID();
                dbExec(getDatabaseConnection(), "INSERT INTO manager (account, playerId, buyId, product, now, later) VALUES (?, ?, ?, ?, ?, ?)", getAccountName(getPlayerAccount(playerID)), data.id, buyId, data['vip'].name, getRealTime().timestamp, getRealTime().timestamp + (data.days * 86400));
                dbExec(getDatabaseConnection(), "INSERT INTO salary (account, cooldown, product) VALUES (?, ?, ?)", getAccountName(getPlayerAccount(playerID)), 0, data['vip'].name); 
                addProductInTable(buyId, getAccountName(getPlayerAccount(playerID)), data['vip'].name, getRealTime().timestamp + (data.days * 86400));
                triggerClientEvent(player, "vipManager >> manager data", player, {['vip'] = getSystemVips(), ['keys'] = getSystemKeys()});
                geral.sNotify(player, getSystemLanguage("add vip warning added"), "success");
                products['addProduct'][data['vip'].name].func(playerID);
                onActiveRenderVIP(playerID, "VIP "..(data['vip'].name));
                resetSalaryTable(playerID);
                return;
            end
        else
            geral.sNotify(player, getSystemLanguage("add vip warning player offline"), "warning");
        end
    end
);

addEvent("vipSystem >> manager >> remove vip", true);
addEventHandler("vipSystem >> manager >> remove vip", root, 
    function(player, data)
        local playerID = getPlayerByID(data.id);
        if (playerID) then
            if (system['webhook']['remVip'].use) then createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) removeu um **VIP "..(data.product).."** do(a) **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Responsável:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Usuário:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Produto:\n └ [🎲] #"..(data.product).."\n\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) has removed a **VIP "..(data.product).."** from **"..(getPlayerName(playerID)).."** (**"..(data.id).."**)\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Responsible:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] User:\n └ [🎲] #"..(getPlayerName(playerID)).." ("..(data.id)..")\n\n[🔮] Product:\n └ [🎲] #"..(data.product).."\n\n```", system['webhook']['remVip'].link); end
            dbExec(getDatabaseConnection(), "DELETE FROM manager WHERE account = ? AND product = ?", data.account, data.product);
            dbExec(getDatabaseConnection(), "DELETE FROM salary WHERE account = ? AND product = ?", data.account, data.product);
            products['removeProduct'][data.product](getAccountName(getPlayerAccount(playerID)));
            geral.sNotify(player, getSystemLanguage("remove vip warning removed"), "success");
            triggerClientEvent(player, "vipManager >> manager render", player);
            removeProductFromTable(data.buyId);
            resetSalaryTable(playerID);
        else
            geral.sNotify(player, getSystemLanguage("add vip warning player offline"), "warning");
        end
    end
);

addCommandHandler(system['keys-command'], 
    function(player, _, key)
        if (key) then
            local rows = dbPoll(dbQuery(getDatabaseConnection(), "SELECT * FROM keys WHERE key = ?", key), -1);
            if (rows and #rows > 0) then
                if (system['webhook']['keys'].use) then createDiscordLogs("**VIP System**", "> :flag_br: :flag_pt:\n\n> ・ O(A) **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) acabou de utilizar uma **Key VIP**!\n\n> ・ Para mais informações sobre, acompanhe os dados abaixo:\n\n```ini\n[🔮] Key:\n └ [🎲] #"..(key).."\n\n[🔮] Usuário:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Produto:\n └ [🎲] #"..(system['vips'][getVipIndex(rows[1].product)].name).."\n```\n\n> :flag_um: :flag_gb:\n\n> ・ The **"..(getPlayerName(player)).."** (**"..(others.getPlayerID(player)).."**) just used a **VIP Key* *!\n\n> ・ For more information about, follow the data below:\n\n```ini\n[🔮] Key:\n └ [🎲] #"..(key).."\n\n[🔮] User:\n └ [🎲] #"..(getPlayerName(player)).." ("..(others.getPlayerID(player))..")\n\n[🔮] Product:\n └ [🎲] #"..(system['vips'][getVipIndex(rows[1].product)].name).."\n```", system['webhook']['keys'].link); end
                triggerEvent("vipSystem >> manager >> add vip", player, player, {['id'] = others.getPlayerID(player), ['vip'] = system['vips'][getVipIndex(rows[1].product)], ['days'] = rows[1].productDays});
                geral.sNotify(player, getSystemLanguage("use key warning key used"), "success");
                dbExec(getDatabaseConnection(), "DELETE FROM keys WHERE key = ?", key);
                removeKeyFromTable(rows[1].keyId);
            else
                geral.sNotify(player, getSystemLanguage("use key warning not exists"), "warning");
            end
        else
            geral.sNotify(player, getSystemLanguage("use key warning insert"), "warning");
        end
    end
);

addCommandHandler(system['manager'].open, 
    function(player)
        if (isElementHasPermission(player, system['manager'].permissions)) then
            triggerClientEvent(player, "vipManager >> manager render", player);
            triggerClientEvent(player, "vipManager >> manager data", player, {['vip'] = getSystemVips(), ['keys'] = getSystemKeys()});
        end
    end
);




--[[


    ██████╗  ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗   ██╗
    ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝██║   ██║
    ██████╔╝██║   ██║██╔████╔██║███████║██╔██╗ ██║██║  ██║█████╗  ██║   ██║
    ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║██╔══╝  ╚██╗ ██╔╝
    ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████╗ ╚████╔╝ 
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ╚═══╝  


]]--
--[[
███╗   ███╗████████╗ █████╗    ███████╗ █████╗     ███╗   ███╗ ██████╗ ██████╗ ███████╗
████╗ ████║╚══██╔══╝██╔══██╗██╗██╔════╝██╔══██╗    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
██╔████╔██║   ██║   ███████║╚═╝███████╗███████║    ██╔████╔██║██║   ██║██║  ██║███████╗
██║╚██╔╝██║   ██║   ██╔══██║██╗╚════██║██╔══██║    ██║╚██╔╝██║██║   ██║██║  ██║╚════██║
██║ ╚═╝ ██║   ██║   ██║  ██║╚═╝███████║██║  ██║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████║
╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════    
                                                                                                                
   NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!   
                https://discord.gg/KXV2GHtJtg                              


PROCURANDO SCRIPTS, MAPAS, MODELAGENS EXCLUSIVOS?
NOSSA COMUNIDADE ESTÁ SEMPRE ATIVA SOLTANDO VARIOS MODS DE GRAÇA!

MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO
MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO
MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO
MAIS DE 400 MODS GRÁTIS COM DOWNLOAD DIRETO

LINK DE CONVITE PERMANENTE:

https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
https://discord.gg/KXV2GHtJtg   
]]
