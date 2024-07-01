
local allowed = {{48, 57}, {65, 90}, {97, 122}};

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

_getPlayerName = getPlayerName;
function getPlayerName(element)
    return _getPlayerName(element):gsub("#%x%x%x%x%x%x", "");
end


function generateString(len)
    if (tonumber(len)) then
        math.randomseed(getTickCount());
        
        local str = "";
        for i = 1, len do
            local charlist = allowed[math.random(1, 3)];
            str = str .. string.char(math.random(charlist[1], charlist[2]));
        end
        return str;
    end
    return false;
end

-- Render functions;

local pS = {guiGetScreenSize()};
local x, y = (pS[1]/1360), (pS[2]/768);

local _dxDrawText = dxDrawText;
function dxDrawText(text, pX, pY, w, h, color, size, ...)
    local pX, pY, w, h = pX, pY, (pX + w), (pY + h);
    return _dxDrawText(text, x * pX, y * pY, x * w, y * h, color, x * size, ...);
end

local _dxDrawRectangle = dxDrawRectangle;
function dxDrawRectangle(pX, pY, w, h, ...)
    return _dxDrawRectangle(x * pX, y * pY, x * w, y * h, ...);
end

local _dxDrawImage = dxDrawImage;
function dxDrawImage(pX, pY, w, h, ...)
    return _dxDrawImage(x * pX, y * pY, x * w, y * h, ...);
end

local _guiCreateEdit = guiCreateEdit;
function guiCreateEdit(pX, pY, w, h, ...)
    return _guiCreateEdit(x - pX, y - pY, w, h, ...);
end

function isCursorOnElement(posX, posY, width, height)
    if (isCursorShowing()) then
        local posX, posY, width, height = x * posX, y * posY, x * width, y * height;
        local MouseX, MouseY = getCursorPosition();
        local clientW, clientH = guiGetScreenSize();
        local MouseX, MouseY = MouseX * clientW, MouseY * clientH
        if (MouseX > posX and MouseX < (posX + width) and MouseY > posY and MouseY < (posY + height)) then
            return true;
        end
    end
    return false;
end

-- Others

function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
    if (type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function') then
        local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo);
        if (type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0) then
            for i, v in ipairs(aAttachedFunctions) do
                if (v == func) then
                    return true;
                end
            end
        end
    end
    return false;
end





--[[


    ██████╗  ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗   ██╗
    ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝██║   ██║
    ██████╔╝██║   ██║██╔████╔██║███████║██╔██╗ ██║██║  ██║█████╗  ██║   ██║
    ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║██╔══╝  ╚██╗ ██╔╝
    ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████╗ ╚████╔╝ 
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ╚═══╝  


]]--
