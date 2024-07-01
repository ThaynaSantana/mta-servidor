local pS = {guiGetScreenSize()};
local x, y = (pS[1]/1366), (pS[2]/768);

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

local _dxDrawImageSection = dxDrawImageSection;
function dxDrawImageSection(pX, pY, w, h, ...)
    return _dxDrawImageSection(x * pX, y * pY, x * w, y * h, ...);
end

local _dxGetTextSize = dxGetTextSize;
function dxGetTextSize(text, width, scale, ...)
    return _dxGetTextSize(text, x * width, x * scale, ...);
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

local RawData = {}

function dxDrawSVG (x, y, w, h, raw, ...)
    if not RawData[raw] then
        RawData[raw] = svgCreate (w, h, raw)
    end

    dxSetBlendMode ('add')
    dxDrawImage (x, y, w, h, RawData[raw], ...)
    dxSetBlendMode ('blend')
end

--

function getPlayerFromID(id)
    if tonumber(id) then
        for _, player in ipairs(getElementsByType('player')) do
            if getElementData(player, 'ID') and (getElementData(player, 'ID') == tonumber(id)) then
                return player
            end
        end
    end
    return false
end

function pullName(player)
    return removeHex(getPlayerName(player))
end

function pullID(player)
    return (getElementData(player, "ID") or 0)
end

function removeHex(message)
	if (type(message) == "string") then
		while (message ~= message:gsub("#%x%x%x%x%x%x", "")) do
			message = message:gsub("#%x%x%x%x%x%x", "")
		end
	end
	return message or false
end

function secondsToTimeDesc(seconds)
    if seconds and type(seconds) == "number" then
        local sec = math.floor(seconds % 60)
        local min = math.floor((seconds % 3600) / 60)
        local hou = math.floor((seconds % 86400) / 3600)
        local day = math.floor(seconds / 86400)
        return day, hou, min, sec
    end
    return 0, 0, 0, 0
end