_getPlayerName = getPlayerName;

function getPlayerName(element)
    if element then
        return _getPlayerName(element):gsub("#%x%x%x%x%x%x", "") or _getPlayerName(element);
    end
end

function isElementPlayer(element)
    if (element and isElement(element) and getElementType(element) == "player") then
        return true;
    end
    return false;
end

function formatNumber(number) 
    while true do      
        number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1.%2');
        if (k == 0) then      
            break;
        end  
    end  
    return number;
end

function formatString(str, template)
    local _str = str;
    for key, value in pairs(template) do
        if (_str:find(key)) then
            _str = _str:gsub(key, value);
        end
    end
    return _str;
end

others = {  
    ['getPlayerID'] = function(element)
        return getElementData(element, "ID") or "N/A";
    end,
};

function getPlayerByID(id)
    local searchedPlayer;
    if (id and type(id) == "number") then
        Async:forEach(getElementsByType("player"),
            function(player)
                if (others.getPlayerID(player) == id) then
                    searchedPlayer = player;
                end
            end
        );
    end
    return searchedPlayer;
end

function isPlayerHavePermission(element, permissions)
    if (isElementPlayer(element)) then
        if (permissions and type(permissions) == "table") then
            for k, v in ipairs(permissions) do
                if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(element))), aclGetGroup(v))) then
                    return true;
                end
            end
        elseif (permissions and type(permissions) == "string") then
            if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(element))), aclGetGroup(permissions))) then
                return true;
            end
        end
    end
    return false;
end

function createDiscordLogs(title, description, fields, link, image)
    local data = {
        embeds = {
            {
                ['color'] = 2929290,
                ['title'] = title,
                
                ['description'] = "> "..(description),
                ['fields'] = fields,
                
                ['image'] = {
                    ['url'] = image
                },

                ["footer"] = {
                    ["text"] = "Brasil Zenith Roleplay",
                    ['icon_url'] = ""
                },
            }
        },
    }

    data = toJSON(data);
    data = data:sub(2, -2);
    fetchRemote(link, {["queueName"] = "logs", ["connectionAttempts"] = 5, ["connectTimeout"] = 5000, ["headers"] = {["Content-Type"] = "application/json"}, ['postData'] = data}, function() end);
end