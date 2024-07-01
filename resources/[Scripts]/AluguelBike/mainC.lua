local screen = {guiGetScreenSize()} local x, y = (screen[1]/1920) , (screen[2]/1080) local tick = {}

function dxDrawBike()
    local alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick[1]) / 800), 'Linear')
    dxDrawImage(x * 406, y * 263, x * 1124, y * 594, 'me/Base.png', 0, 0, 0, tocolor(255, 255, 255, alpha))
    if isMouseInPosition(x * 477, y * 681, x * 221, y * 54) then 
        if isCursorShowing() then
            local cx, cy = getCursorPosition()
            local mx, my = cx * screen[1], cy * screen[2]
            dxDrawText('R$'..config.Preco, mx - x*-30, my + y*-40, x*240, y*40, tocolor(255, 255, 255, 255), 1.30, 'clear', 'left', 'top', false, false, false, true, false)
        end 
    else
    end
end

addEventHandler('onClientClick', root, 
    function(b, s)
        if (b == 'left') and (s == 'down') then 
            if isEventHandlerAdded('onClientRender', root, dxDrawBike) then  
                if isMouseInPosition(x * 477, y * 681, x * 221, y * 54) then 
                    triggerServerEvent('Pedro.alugarBike', localPlayer, localPlayer, config.Preco)
                end
            end
        end
    end
)

addEvent('Pedro.printAluguel', true)
addEventHandler('Pedro.printAluguel', root, 
    function()
        if not isEventHandlerAdded('onClientRender', root, dxDrawBike) then 
            tick[1] = getTickCount()
            addEventHandler('onClientRender', root, dxDrawBike) 
            showCursor(true)
        else
            showCursor(false)
            removeEventHandler('onClientRender', root, dxDrawBike)
        end
    end
)

bindKey('backspace', 'down', 
    function()
        if isEventHandlerAdded('onClientRender', root, dxDrawBike) then  
            triggerEvent('Pedro.printAluguel', localPlayer)
        end
    end
)

setTimer(function()
    addEventHandler('onClientKey', root, 
        function(key)
            if isPedInVehicle(localPlayer) and (getElementModel(getPedOccupiedVehicle(localPlayer)) == config.IDbike) then 
                if key ~= 'arrow_u' and key ~= 'arrow_l' and key ~= 'arrow_r' and key ~= 'arrow_d' and key ~= 'w' and key ~= 'a' and key ~= 's' and key ~= 'd' and key ~= 'f' and key ~= 'f11' then 
                    cancelEvent()
                end
            end
        end
    )
end, 500, 1)

--------------------------------------------------------------------------------------------------------------
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

function isMouseInPosition(x,y,w,h)
	if isCursorShowing() then
		local sx,sy = guiGetScreenSize()
		local cx,cy = getCursorPosition()
		local cx,cy = (cx*sx),(cy*sy)
		if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
			return true
		end
	end
end
--------------------------------------------------------------------------------------------------------------