function interfaceUI ( )
    elements.animation.current = interpolateBetween (elements.animation.start, 0, 0, elements.animation.finish, 0, 0, (getTickCount ( ) - elements.animation.tick) / elements.animation.duration, 'Linear')

    local myAvatar = getElementData (localPlayer, config.elementAvatar) or 0;
    local myID = getElementData (localPlayer, config.elementId) or 'N/A';
    local myLevel = getElementData (localPlayer, config.elementLevel) or 0;

    dxDrawImage (parentX, parentY, parentW, parentH, 'assets/images/background.png', 0, 0, 0, tocolor (255, 255, 255, elements.animation.current))
    dxDrawImage (parentX + (13 * scale), parentY + (55 * scale), 51 * scale, 51 * scale, 'assets/images/avatar/'..myAvatar..'.png', 0, 0, 0, tocolor (255, 255, 255, elements.animation.current))
    
    dxDrawRectangle (parentX + (249 * scale), parentY + (9 * scale), 85 * scale, 25 * scale, tocolor (34, 34, 34, elements.animation.current))
    dxDrawRectangle (parentX + (249 * scale), parentY + (9 * scale), (85 * scale) * instance.serverSlots / 100, 25 * scale, tocolor (config.colorServer[1], config.colorServer[2], config.colorServer[3], elements.animation.current))

    dxDrawText ('Lista de Jogadores', parentX + (10 * scale), parentY, 142 * scale, 44 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 9), 'left', 'center')
    dxDrawText (getPlayerName (getLocalPlayer ( ))..' #'..myID, parentX + (74 * scale), parentY + (66 * scale), 274 * scale, 16 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 10), 'left', 'top')
    dxDrawText ('Level: '..formatNumber (myLevel), parentX + (74 * scale), parentY + (82 * scale), 274 * scale, 16 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 10), 'left', 'top')
    dxDrawText ((#getElementsByType ('player'))..'/'..instance.serverSlots, parentX + (249 * scale), parentY + (9 * scale), (85 * scale), 25 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 10), 'center', 'center')
    dxDrawText (services.mechanic, parentX + (239 * scale), parentY + (92 * scale), (19 * scale), 20 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 11), 'center', 'center')
    dxDrawText (services.police, parentX + (280 * scale), parentY + (92 * scale), (19 * scale), 20 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 11), 'center', 'center')
    dxDrawText (services.ambulance, parentX + (320 * scale), parentY + (92 * scale), (19 * scale), 20 * scale, tocolor (255, 255, 255, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 11), 'center', 'center')

    if (#elements.myTable > 9) then
        dxCreateScrollBar ('scroll-players', parentX + (328 * scale), parentY + (126 * scale), 6 * scale, 383 * scale, (344 / 4) * scale, {using = {config.colorServer[1], config.colorServer[2], config.colorServer[3], elements.animation.current}, scroll = {config.colorServer[1], config.colorServer[2], config.colorServer[3], elements.animation.current / 1.2}, background = {31, 31, 31, elements.animation.current }}, (#elements.myTable - 9) + 1, false)
    end
    local actualOffset = (dxGetPropertiesScrollBar ('scroll-players') and dxGetPropertiesScrollBar ('scroll-players').actual or 1);
    
    for i = 0, 9 - 1 do
        local actualElement = elements.myTable[i + actualOffset]
        local y = (parentY + (126 * scale)) + (i * (43 * scale))

        if (actualElement) then
            local actualAvatar = getElementData (actualElement, config.elementAvatar) or 0;
            local actualID = getElementData (actualElement, config.elementId) or 'N/A';
            local actualName = getPlayerName (actualElement);
            local actualMs = getPlayerPing (actualElement);

            dxDrawRectangle (parentX + (13 * scale), y, (#elements.myTable > 9 and 313 or 321) * scale, 39 * scale, tocolor (31, 31, 31, elements.animation.current))
            dxDrawImage (parentX + (18 * scale), y + (4 * scale), 30 * scale, 30 * scale, 'assets/images/avatar/'..actualAvatar..'.png', 0, 0, 0, tocolor (255, 255, 255, elements.animation.current))
            dxDrawText (actualName..' #'..actualID, parentX + (58 * scale), y, 274 * scale, 39 * scale, tocolor (224, 224, 224, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 9), 'left', 'center')
            dxDrawText (actualMs..'ms', parentX + (58 * scale), y, (#elements.myTable > 9 and 258 or 266) * scale, 39 * scale, tocolor (224, 224, 224, elements.animation.current), 1.00 * scale, dxCreateFont ('RobotoCondensed-Regular.ttf', 9), 'right', 'center')
        end
    end
end

function scoreboardManager (actionName, ...)
    local event = {...}
    if (not actionName) then
        return false
    end
    if (actionName == 'open') then
        if (not instance.isEvent) then
            instance.isEvent = true
            elements.animation = {
                start = elements.animation.current;
                finish = 255;
                duration = 600;
                current = 0;
                tick = getTickCount ( );
            }
            services = {
                police = getCountFromServices ('police');
                mechanic = getCountFromServices ('mechanic');
                ambulance = getCountFromServices ('ambulance');
            }
            showCursor (true)
            bindKey ('mouse_wheel_up', 'down', scrollBinds)
            bindKey ('mouse_wheel_down', 'down', scrollBinds)
            triggerServerEvent ('Scoreboard-Request', localPlayer, 'get-all-players')
            addEventHandler('onClientRender', root, interfaceUI)
            return true
        end
    elseif (actionName == 'close') then
        if (instance.isEvent) then
            instance.isEvent = false
            elements.animation = {
                start = elements.animation.current;
                finish = 0;
                duration = 600;
                current = 0;
                tick = getTickCount ( );
            }
            showCursor (false)
            instance.cooldown = getRealTime ( ).timestamp + config.cooldown;
            unbindKey ('mouse_wheel_up', 'down', scrollBinds)
            unbindKey ('mouse_wheel_down', 'down', scrollBinds)
            setTimer (function ( )
                dxDestroyScrollBar ('scroll-players')
                removeEventHandler('onClientRender', root, interfaceUI)
            end, 700, 1)
            return true
        end
    elseif (actionName == 'change-logged-state') then
        local loggedState = event[1];
        instance.hasLogged = loggedState;
        return true
    elseif (actionName == 'update-players') then
        elements.myTable = { }
        instance.serverSlots = event[2];
        if (event[1] and type (event[1]) == 'table' and #event[1] > 0 and next (event[1])) then
            elements.myTable = event[1];
            return true
        end
    end
    return false
end
createEventHandler ('Scoreboard-Manager', root, scoreboardManager)

bindKey (config.toggleKey, 'down', function ( )
    if (not instance.hasLogged) then
        return
    end
    if (not instance.isEvent) then
        if (instance.cooldown > getRealTime ( ).timestamp) then
            return sendMessage ('client', 'Você deve esperar '..(instance.cooldown - getRealTime ( ).timestamp)..' segundos para abrir a scoreboard novamente.', 'error')
        end
    end
    scoreboardManager (not instance.isEvent and 'open' or 'close');
    return
end)

addEventHandler ('onClientPlayerQuit', getRootElement ( ), function ( )
    for i, v in ipairs (elements.myTable) do
        if (v == source) then
            table.remove (elements.myTable, i)
        end
    end
end)

function scrollBinds (key)
    if (not instance.isEvent or not isCursorOnElement (parentX, parentY, parentW, parentH)) then
        return
    end
    local data = dxGetPropertiesScrollBar ('scroll-players')
    if (not data) then
        return
    end
    local actualOffset = data.actual;
    if (key == 'mouse_wheel_up') then
        if (actualOffset > 0) then
            actualOffset = actualOffset - 1;
        end
    elseif (key == 'mouse_wheel_down') then
        if (actualOffset + 1) < #elements.myTable then
            actualOffset = actualOffset + 1;
        end
    end
    dxUpdateScrollBarOffset ('scroll-players', actualOffset)
    return
end