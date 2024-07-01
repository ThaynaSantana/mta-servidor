

local db = {};

local vehs = {}; local salary = {};
local colorVeh = {}; local colorFarol = {};

function getDatabaseConnection()
    return db;
end

function resetSalaryTable(element)
    salary[element] = {};
    local rows = dbPoll(dbQuery(db, "SELECT * FROM salary WHERE account = ?", getAccountName(getPlayerAccount(element))), -1);
    if (rows and #rows > 0) then
        for i = 1, #rows do
            table.insert(salary[element], {rows[i].product, rows[i].cooldown});
        end
    end
end

local function getSalaryProduct(element, product)
    for k, v in ipairs(salary[element]) do
        if (v[1] == product) then
            return v[2];
        end
    end
    return false;
end

addEvent("vipSystem >> get other", true);
addEventHandler("vipSystem >> get other", root,
    function(player, data)
        if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(player))), aclGetGroup(data['vip'].permission))) then

            if (system['vips'][data.index]['items']['others'][data['item'].columnIndex].func and type(system['vips'][data.index]['items']['others'][data['item'].columnIndex].func) == "function") then
                system['vips'][data.index]['items']['others'][data['item'].columnIndex].func(player);
                geral.sNotify(player, getSystemLanguage("get others"):gsub("${item}", data['item'].name), "success");

            elseif (system['vips'][data.index]['items']['others'][data['item'].columnIndex].func and type(system['vips'][data.index]['items']['others'][data['item'].columnIndex].func) == "string") then
                if (isPedInVehicle(player)) then
                    local colorType = system['vips'][data.index]['items']['others'][data['item'].columnIndex].func;
                    if (colorType == "rgb headlight") then
                        if (not colorFarol[player]) then
                            triggerClientEvent(player, "vipSystem >> start headlight", player);
                            colorFarol[player] = true;
                        else
                            triggerClientEvent(player, "vipSystem >> stop headlight", player);
                            colorFarol[player] = true;
                        end

                    elseif (colorType == "rgb vehicle") then
                        if (not colorVeh[player]) then
                            triggerClientEvent(player, "vipSystem >> start color", player);
                            colorVeh[player] = true;
                        else
                            triggerClientEvent(player, "vipSystem >> stop color", player);
                            colorVeh[player] = true;
                        end
                    end
                    geral.sNotify(player, getSystemLanguage("get others"):gsub("${item}", data['item'].name), "success");
                end
            end
        end
    end
);

addEvent("vipSystem >> get salary", true);
addEventHandler("vipSystem >> get salary", root,
    function(player, data)
        if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(player))), aclGetGroup(data['vip'].permission))) then
            local playerSalary = getSalaryProduct(player, data['vip'].name);
            local nowTimestamp = getRealTime().timestamp;
            if (playerSalary) then
                if ((nowTimestamp - playerSalary) >= 86400) then
                    if (system['salary'].use) then outputChatBox(system['salary'].message:gsub("${user}", getPlayerName(player).." ("..(others.getPlayerID(player))..")"), root, 255, 255, 255, true); end
                    dbExec(db, "UPDATE salary SET cooldown = ? WHERE account = ? AND product = ?", nowTimestamp, getAccountName(getPlayerAccount(player)), data['vip'].name);
                    geral.sNotify(player, getSystemLanguage("get salary"), "success");
                    others.giveMoney(player, data['vip'].salary);
                    resetSalaryTable(player);

                elseif (playerSalary == 0) then
                    if (system['salary'].use) then outputChatBox(system['salary'].message:gsub("${user}", getPlayerName(player).." ("..(others.getPlayerID(player))..")"), root, 255, 255, 255, true); end
                    dbExec(db, "UPDATE salary SET cooldown = ? WHERE account = ? AND product = ?", nowTimestamp, getAccountName(getPlayerAccount(player)), data['vip'].name);
                    geral.sNotify(player, getSystemLanguage("get salary"), "success");
                    others.giveMoney(player, data['vip'].salary);
                    resetSalaryTable(player);
                else
                    local secs = ((playerSalary + 86400) - nowTimestamp);
                    local remaining = string.format("%.1dh %.1dm and %.1ds", secs / (60 * 60), secs / 60 % 60, secs % 60);
                    geral.sNotify(player, getSystemLanguage("warning cooldown salary"):gsub("${cooldown}", remaining), "warning");
                end
            end
        end
    end
);

addEvent("vipSystem >> get vehicle", true);
addEventHandler("vipSystem >> get vehicle", root,
    function(player, data)
        if (not isPedInVehicle(player)) then
            if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(player))), aclGetGroup(data['vip'].permission))) then
                if (vehs[player] and isElement(vehs[player])) then
                    destroyElement(vehs[player]);
                    vehs[player] = nil;
                end

                local pX, pY, pZ = getElementPosition(player);
                local rX, rY, rZ = getElementRotation(player);
                geral.sNotify(player, getSystemLanguage("get vehicle"):gsub("${item}", data['item'].name), "success");
                vehs[player] = createVehicle(data['item'].id, pX + 1.2, pY + 1.2, pZ, rX, rY, rZ, "ROMAN");
                warpPedIntoVehicle(player, vehs[player]);
            end
        end
    end
);

addEvent("vipSystem >> get person", true);
addEventHandler("vipSystem >> get person", root,
    function(player, data)
        if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(player))), aclGetGroup(data['vip'].permission))) then
            geral.sNotify(player, getSystemLanguage("get person"):gsub("${item}", data['item'].name), "success");
            setElementModel(player, data['item'].id);
        end
    end
);

addEvent("vipSystem >> get weapon", true);
addEventHandler("vipSystem >> get weapon", root,
    function(player, data)
        if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(player))), aclGetGroup(data['vip'].permission))) then
            geral.sNotify(player, getSystemLanguage("get weapon"):gsub("${item}", data['item'].name), "success");
            giveWeapon(player, data['item'].id, 999);
        end
    end
);

local function onManagerPanelVIP(player)
    triggerClientEvent(player, "vipSystem >> manager render", player);
end

addEventHandler("onPlayerQuit", root,
    function()
        if (vehs[source] and isElement(vehs[source]) and getElementType(vehs[source]) == "vehicle") then
            destroyElement(vehs[source]);
        end
    end
);

addEventHandler("onPlayerLogin", root,
    function()
        bindKey(source, system.bind, "down", onManagerPanelVIP);
        
        salary[source] = {};
        local rows = dbPoll(dbQuery(db, "SELECT * FROM salary WHERE account = ?", getAccountName(getPlayerAccount(source))), -1);
        if (rows and #rows > 0) then
            setElementData(source, "VIP", true);
            
            for i = 1, #rows do
                table.insert(salary[source], {rows[i].product, rows[i].cooldown});
            end
        end

        if (system['site-automatic'].use) then
            local active = dbPoll(dbQuery(db, "SELECT * FROM active WHERE id = ?", others.getPlayerID(source)), -1);
            if (active and #active > 0) then
                if (others.getPlayerID(source) == active[1].id) then
                    addPlayerVIP(active[1].id, fromJSON(active[1].product));
                    dbExec(db, "DELETE FROM active WHERE id = ?", active[1].id);
                end
            end
        end
    end
);

addEventHandler("onResourceStart", resourceRoot, 
    function()
        if (system['database'].type == "sqlite") then db = dbConnect("sqlite", "assets/archives/core/system.db");
        elseif (system['database'].type == "mysql") then db = dbConnect("mysql", "dbname="..(system['database']['infos'].dbname)..";host="..(system['database']['infos'].host)..";charset=utf8", system['database']['infos'].username, system['database']['infos'].password, system['database']['infos'].options); end
        dbExec(db, "CREATE TABLE IF NOT EXISTS manager (account TEXT, playerId INTEGER, buyId INTEGER, product TEXT, now BIGINT, later BIGING)");
        dbExec(db, "CREATE TABLE IF NOT EXISTS keys (keyId INTEGER, key TEXT, product TEXT, now BIGINT, later BIGING, productDays INTEGER)");
        dbExec(db, "CREATE TABLE IF NOT EXISTS salary (account TEXT, cooldown BIGING, product TEXT)");
        dbExec(db, "CREATE TABLE IF NOT EXISTS active (id INTEGER, product JSON)");
        setTimer(onControllerPlayerVIP, 3 * 60 * 1000, 0);
    
        local rows = dbPoll(dbQuery(db, "SELECT * FROM manager"), -1);
        if (#rows > 0) then
            for k, v in ipairs(rows) do
                addProductInTable(v.buyId, v.account, v.product, v.later);
            end
        end
    
        _call(
            function()
                for k, player in ipairs(getElementsByType("player")) do
                    if (player and isElement(player) and getElementType(player) == "player") then
                        if (getPlayerAccount(player) and not isGuestAccount(getPlayerAccount(player))) then
                            bindKey(player, system.bind, "down", onManagerPanelVIP);
                            
                            salary[player] = {};
                            local rows = dbPoll(dbQuery(db, "SELECT * FROM salary WHERE account = ?", getAccountName(getPlayerAccount(player))), -1);
                            if (rows and #rows > 0) then
                                setElementData(player, "VIP", true);
                                
                                for i = 1, #rows do
                                    table.insert(salary[player], {rows[i].product, rows[i].cooldown});
                                end
                            end
    
                            if (system['site-automatic'].use) then
                                local active = dbPoll(dbQuery(db, "SELECT * FROM active WHERE id = ?", others.getPlayerID(player)), -1);
                                if (active and #active > 0) then
                                    if (others.getPlayerID(player) == active[1].id) then
                                        dbExec(db, "DELETE FROM active WHERE id = ?", active[1].id);
                                        addPlayerVIP(active[1].id, fromJSON(active[1].product));
                                    end
                                end
                            end
                        end
                    end
                    sleep(2);
                end
            end
        );
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
