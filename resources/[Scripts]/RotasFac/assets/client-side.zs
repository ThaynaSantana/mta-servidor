local screen = {guiGetScreenSize()}

local render = dxCreateRenderTarget(557, 350, true)
local scroll_position_y = 0
local columns = 1
local rows = 0
local scroll_focus = false
local scroll_click_1 = 0
local scroll_click_2 = 0

local open = false
local open_save = false
local animate = {
    atual = 0,
    next = 0
}

local in_route = false

function renderRoute()
    if open or animate.tick then
        cx, cy = 0, 0
        if isCursorShowing () then
            cx, cy = getCursorPosition ()
            cx, cy = cx * screen[1], cy * screen[2]
        end
        animate.atual = interpolateBetween(animate.atual, 0, 0, animate.next, 0, 0, (getTickCount() - (animate.tick or 0)) / 500, "Linear")
        dxDrawRectangle(111, (screen[2] - 470) / 2, 600, 60, tocolor(51, 51, 51, animate.atual))
        dxDrawRectangle(111, (screen[2] - 470) / 2 + 60 + 10, 600, 400, tocolor(51, 51, 51, animate.atual))
        dxDrawText("ROTAS", 111 + 21, (screen[2] - 470) / 2 - 19, 600, 60, tocolor(255, 255, 255, animate.atual), 1, createFont("Poppins-Bold", 54), "left", "center")
        dxDrawText("X", 111 + 562, (screen[2] - 470) / 2 + 22, 16, 16, tocolor(128, 128, 128, animate.atual), 1, createFont("Poppins-Medium", 20), "center", "center")
        dxDrawText("Opções disponíveis", 111 + 12, (screen[2] - 470) / 2 + 60 + 10 + 12, 139, 21, tocolor(5, 236, 0, animate.atual), 1, createFont("Roboto-Regular", 12), "left", "center")
        if scroll_focus then
            scroll_click_1 = cy - scroll_click_2
            scroll_position_y = math.min(math.max(scroll_click_1 * (((rows * (100 + 10)) - 350 - 10) / (350 - (350 / (rows / 3)))), 0), ((rows * (100 + 10)) - 350 - 10))
        end
        if rows > 3 then
            dxDrawRectangle(111 + 600, (screen[2] - 470) / 2 + 60 + 10 + 40 + (scroll_position_y / ((rows * (100 + 10)) - 350 - 10) * (350 - (350 / (rows / 3)))), 2, 350 / (rows / 3), tocolor(5, 236, 0, animate.atual), false)
        end
        dxDrawImage(111 + 21, (screen[2] - 470) / 2 + 60 + 10 + 38, 557, 350, render, 0, 0, 0, tocolor(255, 255, 255, animate.atual))
        local c = 0
        local r = 0
        local _cursor_play = false
        for i = 1, (columns * rows) do
            if isCursorOnPosition(111 + 21 + 459 + (c * (100 + 10)), (screen[2] - 470) / 2 + 60 + 10 + 38 + 23 + (r * (100 + 10)) - scroll_position_y, 67, 54) and isCursorOnPosition(111 + 21, (screen[2] - 470) / 2 + 60 + 10 + 38, 557, 350) then
                _cursor_play = i
            end
            c = c + 1
            if c == columns then
                c = 0
                r = r + 1
            end
        end
        if cursor_play ~= _cursor_play then
            setRender(_cursor_play)
        end
        cursor_play = _cursor_play
        if math.floor(animate.atual) == math.floor(animate.next) then
            animate.tick = nil
            if not open then
                open_save = false
                showCursor(false)
                showChat(true)
            end
        end
    end
end
setTimer(renderRoute, 0, 0)

function clickScroll(button, state)
    if open then
        if button == "left" then
            if state == "down" then
                if isCursorOnPosition(111 + 600, (screen[2] - 470) / 2 + 60 + 10 + 40 + (scroll_position_y / ((rows * (100 + 10)) - 350 - 10) * (350 - (350 / (rows / 3)))), 2, 350 / (rows / 3)) and not scroll_focus and rows > 3 then
                    scroll_click_2 = cy - (scroll_position_y / ((rows * (100 + 10)) - 350 - 10) * (350 - (350 / (rows / 3))));
                    scroll_focus = true
                end
                if isCursorOnPosition(111 + 562, (screen[2] - 470) / 2 + 22, 16, 16) then
                    openCloseRoute()
                end
                if cursor_play then
                    in_route = {route_open = open, route = cursor_play, atual = 1}
                    local route_items = settings["Routes Items"][in_route.route_open][in_route.route]
                    local route = settings["Routes"][route_items.route][in_route.atual]
                    in_route.marker = createMarker(route.position[1], route.position[2], route.position[3], "cylinder", settings["Main"]["Routes Marker"].size, unpack(settings["Main"]["Routes Marker"].color))
                    openCloseRoute()
                end
            elseif state == "up" then
                if scroll_focus and rows > 3 then
                    scroll_focus = false
                end
            end
        end
    end
end
addEventHandler("onClientClick", root, clickScroll)

addEventHandler("onClientMarkerHit", root, function(player)
    if player == localPlayer and not isPedInVehicle(localPlayer) then
        if in_route and source == in_route.marker then
            local route_items = settings["Routes Items"][in_route.route_open][in_route.route]
            local route = settings["Routes"][route_items.route]
            if in_route.atual >= #route then
                addInfoboxC("Você terminou suas rotas!", "info")
                in_route = false
                destroyElement(source)
                return
            end
            in_route.atual = in_route.atual + 1
            local route_items = settings["Routes Items"][in_route.route_open][in_route.route]
            local route = settings["Routes"][route_items.route][in_route.atual]
            destroyElement(source)
            in_route.marker = createMarker(route.position[1], route.position[2], route.position[3], "cylinder", settings["Main"]["Routes Marker"].size, unpack(settings["Main"]["Routes Marker"].color))
            triggerServerEvent(getResourceName(getThisResource())..":setAnimation", localPlayer, "bomber", "bom_plant", 0, true, true, false)
            setElementFrozen(localPlayer, true)
            setTimer(function()
                triggerServerEvent(getResourceName(getThisResource())..":setAnimation", localPlayer, "ped", "facanger", 0, false, false, false)
                triggerServerEvent(getResourceName(getThisResource())..":giveItem", localPlayer, "dinheirosujo", math.random(unpack(settings["Main"]["Dirty Money Value"])))
                triggerServerEvent(getResourceName(getThisResource())..":giveItem", localPlayer, route_items.item, math.random(unpack(route_items.give_amount)))
                setElementFrozen(localPlayer, false)
            end, 1000, 1)
        end
    end
end)

function keyScroll(button, state)
    if open then
        if isCursorOnPosition(111 + 21, (screen[2] - 470) / 2 + 60 + 10 + 38, 557, 350) then
            if button == "mouse_wheel_up" and state then
                if rows > 3 then
                    scroll_position_y = math.max(scroll_position_y - 50, 0)
                    setRender()
                end
            elseif button == "mouse_wheel_down" and state then
                if rows > 3 then
                    scroll_position_y = math.min(scroll_position_y + 50, (rows * (100 + 10)) - 350 - 10)
                    setRender()
                end
            end
        end
    end
end
addEventHandler("onClientKey", root, keyScroll)

function openCloseRoute(route)
    local route = tonumber(route)
    if route then
        if not in_route then
            open = route
            open_save = route
            animate.tick = getTickCount()
            animate.next = 255
            rows = #settings["Routes Items"][open]
            setTimer(function()
                setRender()
            end, 10, 1)
            showCursor(true)
            showChat(false)
        else
            addInfoboxC("Você já está em uma rota!", "info")
        end
    else
        open = false
        animate.tick = getTickCount()
        animate.next = 0
    end
end
createEventHandler(getResourceName(getThisResource())..":openCloseRoute", openCloseRoute)

addCommandHandler("cancelarrota", function()
    if in_route then
        destroyElement(in_route.marker)
        in_route = false
        addInfoboxC("A rota foi cancelada!", "success")
    else
        addInfoboxC("Você não está em uma rota!", "error")
    end
end)

local fonts = {
    ["Roboto-Medium"] = "assets/fonts/Roboto-Medium.ttf",
    ["Roboto-Regular"] = "assets/fonts/Roboto-Regular.ttf",
    ["Poppins-Bold"] = "assets/fonts/Poppins-Bold.ttf",
    ["Poppins-Medium"] = "assets/fonts/Poppins-Medium.ttf"
}
local fonts_created = {}

function createFont(font, size)
    local font_loader = "default"
    if fonts[font] then
        if not fonts_created[font] then
            fonts_created[font] = {}
        end
        if not fonts_created[font][size] then
            font_loader = dxCreateFont(fonts[font], size, false)
            fonts_created[font][size] = font_loader
        else
            font_loader = fonts_created[font][size]
        end
    end
    return font_loader
end

function isCursorOnPosition(x, y, w, h)
    if cx and cy then
        if cx >= x and cx <= (x + w) and cy >= y and cy <=(y + h) then
            return true
        end
    end
    return false
end

local _dxDrawText = dxDrawText

function dxDrawText(text, x, y, w, h, ...)
    _dxDrawText(text, x, y, x + w, y + h, ...)
end

local SvgsRectangle = {}

function dxDrawBordRectangle(x, y, w, h, radius, color, post)
    if not SvgsRectangle[radius + w + h] then
        local Path = string.format([[
            <svg width="%s" height="%s" viewBox="0 0 %s %s" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect opacity="1" width="%s" height="%s" rx="%s" fill="#FFFFFF"/>
            </svg>
        ]], w, h, w, h, w, h, radius)
        SvgsRectangle[radius + w + h] = svgCreate(w, h, Path)
    end
    if SvgsRectangle[radius + w + h] then
        dxDrawImage(x, y, w, h, SvgsRectangle[radius + w + h], 0, 0, 0, color, post)
    end
end

function setRender(is_cursor1)
    if open or open_save then
        dxSetRenderTarget(render, true)
        local c = 0
        local r = 0
        for i, v in ipairs(settings["Routes Items"][open or open_save]) do
            dxDrawImage(0 + (c * (100 + 10)), 0 + (r * (100 + 10)) - scroll_position_y, 557, 100, "assets/images/background.png", 0, 0, 0, tocolor(255, 255, 255, 255))
            if is_cursor1 == i then
                dxDrawBordRectangle(459 + (c * (100 + 10)), 23 + (r * (100 + 10)) - scroll_position_y, 67, 54, 6, tocolor(5, 236, 0, 255), false)
            else
                dxDrawBordRectangle(459 + (c * (100 + 10)), 23 + (r * (100 + 10)) - scroll_position_y, 67, 54, 6, tocolor(6, 6, 6, 255), false)
            end
            dxDrawImage(459 + (c * (100 + 10)) + 25, 23 + (r * (100 + 10)) - scroll_position_y + 14, 18, 18, "assets/images/play.png", 0, 0, 0, tocolor(255, 255, 255, 255))
            dxDrawText("INICIAR", 459 + (c * (100 + 10)) + 15, 23 + (r * (100 + 10)) - scroll_position_y + 34, 38, 15, tocolor(255, 255, 255, 255), 1, createFont("Poppins-Bold", 10), "center", "center")
            dxDrawText("ITEM", 0 + (c * (100 + 10)) + 5, 0 + (r * (100 + 10)) - scroll_position_y + 5, 33, 16, tocolor(177, 173, 192, 255), 1, createFont("Roboto-Medium", 10), "left", "center")
            dxDrawText(v.name, 0 + (c * (100 + 10)) + 5, 0 + (r * (100 + 10)) - scroll_position_y + 21, 33, 16, tocolor(255, 255, 255, 255), 1, createFont("Roboto-Medium", 14), "left", "center")
            dxDrawImage(0 + (c * (100 + 10)) + 47, 0 + (r * (100 + 10)) - scroll_position_y + 42, 58, 54, "assets/images/items/"..v.item..".png", 0, 0, 0, tocolor(255, 255, 255, 255))
            c = c + 1
            if c == columns then
                c = 0
                r = r + 1
            end
        end
    end
    dxSetRenderTarget()
end

setTimer(function()
    if scroll_focus then
        setRender()
    end
end, 20, 0)