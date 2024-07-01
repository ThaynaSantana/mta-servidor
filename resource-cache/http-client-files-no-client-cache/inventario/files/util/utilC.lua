screen = {guiGetScreenSize()} x, y = (screen[1]/1366), (screen[2]/768)

font = {
	[1] = dxCreateFont("files/font/font1.ttf", 11),
	[2] = dxCreateFont("files/font/font2.ttf", 9),
}

function messageC(message, type)
    triggerEvent("N3xT.dxNotification", root, message, type)
end

function math.round(number, decimals, method)
    decimals = decimals or 1
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function dxDrawRectangleBorde(x, y, w, h, borderColor, bgColor, postGUI)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200)
        end

        if (not bgColor) then
            bgColor = borderColor
        end

        dxDrawRectangle(x, y, w, h, bgColor, postGUI)

        dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
        dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
        dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
        dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
    end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end