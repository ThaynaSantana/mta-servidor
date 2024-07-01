screenW, screenH = guiGetScreenSize()
scale = math.min (math.max (0.8, (screenH / 768)), 2)

parentW, parentH = 348 * scale, 528 * scale
parentX, parentY = (screenW - parentW) / 2, (screenH - parentH) / 2

instance = {
    isEvent = false;
    hasLogged = false;
    cooldown = 0;
    serverSlots = 0;
}

services = {
    mechanic = 0;
    police = 0;
    ambulance = 0;
}

elements = {
    myTable = { };
    animation = {
        start = 0;
        finish = 0;
        duration = 0;
        current = 0;
        tick = 0;
    };
}

-- function's resource's
local tableTextures = {
    imgElements = { };
    fontsElements = { };
}

_dxDrawText = dxDrawText
function dxDrawText (displayText, x, y, w, h, ...)
    return _dxDrawText (displayText, x, y, x + w, y + h, ...)
end

_dxDrawImage = dxDrawImage
function dxDrawImage (x, y, w, h, path, ...)
    if (type (path) ~= 'string') then
        return _dxDrawImage (x, y, w, h, path, ...)
    end
    if (not tableTextures.imgElements[path]) then
        tableTextures.imgElements[path] = dxCreateTexture (path, 'argb', true, 'clamp')
    end
    if (tableTextures.imgElements[path] and isElement (tableTextures.imgElements[path])) then
        return _dxDrawImage (x, y, w, h, tableTextures.imgElements[path], ...)
    else
        return print ('['..getResourceName (getThisResource ( ))..'] - Erro ao carregar a textura: ' .. path)
    end
end

_dxCreateFont = dxCreateFont
function dxCreateFont (path, size, ...)
    if (not tableTextures.fontsElements[path]) then
        tableTextures.fontsElements[path] = { }
    end
    if (not tableTextures.fontsElements[path][size]) then
        tableTextures.fontsElements[path][size] = _dxCreateFont ('assets/fonts/'..path, size * (scale / 1.1), ...)
    end
    return tableTextures.fontsElements[path][size]
end

function isCursorOnElement (x, y, w, h)
    if (not isCursorShowing ( )) then
        return false
    end
    local cursorX, cursorY = getCursorPosition ( )
    if (cursorX and cursorY) then
        cursorX, cursorY = cursorX * screenW, cursorY * screenH
        return (cursorX >= x and cursorX <= x + w and cursorY >= y and cursorY <= y + h)
    end
    return false
end

_getPlayerName = getPlayerName
function getPlayerName (player)
    if (not isElement (player)) then
        return false
    end
    return string.gsub (_getPlayerName (player), '#%x%x%x%x%x%x', '');
end

function formatNumber (number)
    local formatted = number
    while true do  
        formatted, k = string.gsub (formatted, '^(-?%d+)(%d%d%d)', '%1.%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end


-- [LIB]: Scrollbar | CopyRight (C) ThigasDevelopment | https://github.com/ThigasDevelopment/scrollbar

-- script's main
local scrollbar = {
    actual = false;
    events = false;
    elements = { };
}

-- script's util
function isCursorOnElement (x, y, width, height)
    if not isCursorShowing () then
        return false
    end
    local cursor = {(Vector2 (getCursorPosition ()).x * Vector2 (guiGetScreenSize ()).x), (Vector2 (getCursorPosition ()).y * Vector2 (guiGetScreenSize ()).y)}
    return (cursor[1] > x and cursor[1] < x + width and cursor[2] > y and cursor[2] < y + height)
end

-- script's function
function dxCreateScrollBar (identify, x, y, width, height, size, colors, values, postGUI)
    postGUI = (postGUI or false)
    if not scrollbar.elements[identify] then
        scrollbar.elements[identify] = {
            positions = {
                offset = y;
                size = size;
                default = {x, y, width, height};
            };
            actual = 1;
            using = false;
            values = values;
        }
        if not scrollbar.events then
            addEventHandler ("onClientClick", getRootElement (), dxClickScroll)
            scrollbar.events = true
        end
    else
        local v = scrollbar.elements[identify]
        local x, y, w, h = unpack (v.positions.default)
        if v.using then
            local cursor = (Vector2 (getCursorPosition ()).y * Vector2 (guiGetScreenSize ()).y)

            cursor = cursor - (v.positions.size / 2)

            local actualValue = math.ceil ((scrollbar.elements[scrollbar.actual].positions.offset - y) / (((y + h - v.positions.size) - y) / scrollbar.elements[scrollbar.actual].values))

            scrollbar.elements[scrollbar.actual].positions.offset = (cursor <= y and y or cursor >= (y + h - v.positions.size) and (y + h - v.positions.size) or cursor)
            scrollbar.elements[scrollbar.actual].actual = (actualValue <= 1 and 1 or actualValue >= scrollbar.elements[scrollbar.actual].values and scrollbar.elements[scrollbar.actual].values or actualValue)
        end
        dxDrawRectangle (x, y, w, h, tocolor (unpack (colors.background)), postGUI)
        dxDrawRectangle (x, v.positions.offset, w, v.positions.size, (v.using and tocolor (unpack (colors.using)) or tocolor (unpack (colors.scroll))), postGUI)
    end
end

function dxDestroyScrollBar (identify)
    if not scrollbar.elements[identify] then
        return false
    end
    if scrollbar.actual ~= false and scrollbar.actual == identify then
        scrollbar.actual = false
    end
    scrollbar.elements[identify] = nil
    if not next (scrollbar.elements) and scrollbar.events then
        removeEventHandler ("onClientClick", getRootElement (), dxClickScroll)
        scrollbar.events = false
    end
    return true
end

function dxGetPropertiesScrollBar (identify)
    if not scrollbar.elements[identify] then
        return false
    end
    return scrollbar.elements[identify]
end

function dxUpdateScrollBarOffset (identify, value)
    if not scrollbar.elements[identify] then
        return false
    end
    local v = scrollbar.elements[identify]
    local x, y, w, h = unpack (v.positions.default)

    scrollbar.elements[identify].actual = (value <= 1 and 1 or value >= v.values and v.values or value)

    local newValues = {
        lastIndex = (y + (((y + h - v.positions.size) - y) / scrollbar.elements[identify].values) * (v.values - 1));
        newPosition = (y + (((y + h - v.positions.size) - y) / scrollbar.elements[identify].values) * (v.actual - 1));
    }

    scrollbar.elements[identify].positions.offset = (newValues.newPosition >= newValues.lastIndex and (y + h - v.positions.size) or newValues.newPosition)
    return true
end

-- script's click
function dxClickScroll (button, state)
    if button == "left" and state == "down" then
        for i in pairs (scrollbar.elements) do
            if isCursorOnElement (scrollbar.elements[i].positions.default[1], scrollbar.elements[i].positions.offset, scrollbar.elements[i].positions.default[3], scrollbar.elements[i].positions.size) or isCursorOnElement (unpack (scrollbar.elements[i].positions.default)) then
                scrollbar.elements[i].using = true
                scrollbar.actual = i
                break
            end
        end
    elseif button == "left" and state == "up" then
        if not scrollbar.actual then
            return false
        end
        scrollbar.elements[scrollbar.actual].using = false
        scrollbar.actual = false
    end
end