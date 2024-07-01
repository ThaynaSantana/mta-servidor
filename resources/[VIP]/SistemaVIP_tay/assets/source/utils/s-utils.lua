

_getPlayerName = getPlayerName;
function getPlayerName(element)
    return _getPlayerName(element):gsub("#%x%x%x%x%x%x", "");
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
    local _str = str
    for key, value in pairs(template) do
        if _str:find(key) then
            _str = _str:gsub(key, value)
        end
    end
    return _str
end

function getPlayerByID(id)
    if (id and type(id) == "number") then
        for k, player in ipairs(getElementsByType("player")) do
            if (others.getPlayerID(player) == id) then
                return player;
            end
        end
    end
    return false;
end

function isElementHasPermission(element, permission)
    if (isElementPlayer(element)) then
        if (permission and type(permission) == "table") then
            for k, v in ipairs(permission) do
                if (isObjectInACLGroup("user."..(getAccountName(getPlayerAccount(element))), aclGetGroup(v))) then
                    return true;
                end
            end
        end
    end
    return false;
end

function createDiscordLogs(title, description, link, image)
    local data = {
        embeds = {
            {
                ["color"] = 16711680,
                ["title"] = title,
                
                ["description"] = description,
                
                ['thumbnail'] = {
                    ['url'] = "https://i.imgur.com/ixS8xZG.png",
                },

                ['image'] = {
                    ['url'] = image
                },

                ["footer"] = {
                    ["text"] = "Roman Store Inc.",
                    ['icon_url'] = "https://i.imgur.com/moOkjDz.png"
                },
            }
        },
    }

    data = toJSON(data);
    data = data:sub(2, -2);
    fetchRemote(link, {["queueName"] = "logs", ["connectionAttempts"] = 5, ["connectTimeout"] = 5000, ["headers"] = {["Content-Type"] = "application/json"}, ['postData'] = data}, function() end);
end