local screen = Vector2(guiGetScreenSize())

local _dText = dxDrawText
function dxDrawText(text, x, y, w, h, ...)
    _dText(text, x, y, (w + x), (h + y), ...)
end

--------------------------------------------------

local panel_state = nil
local panel_tab = nil
local item_hovered = nil
local skin_selected = nil

local chat = nil

local camera = false
local lastCursorPos = false

local ped = nil
local dimension = 0
local interior = 0

yDistance = 0

local fonts = {
    robotoCondensed_light = dxCreateFont('assets/fonts/RobotoCondensed-Light.ttf', 9),
    robotoCondensed_regular = dxCreateFont('assets/fonts/RobotoCondensed-Regular.ttf', 9),
    robotoCondensed_regular2 = dxCreateFont('assets/fonts/RobotoCondensed-Regular.ttf', 8)
}

function render()
    dxDrawImage(25, 25, 430, 90, 'assets/images/banner.png')
    dxDrawRectangle(25, 115, 430, 1, tocolor(196, 57, 54, 255))

    local index = 0
    local values = nil
    if not panel_tab then
        index = (#config.shopTabs > 10 and 10 or #config.shopTabs)
        values = #config.shopTabs
    else
        index = (#config.shopSubTabs[panel_tab] > 10 and 10 or #config.shopSubTabs[panel_tab])
        values = #config.shopSubTabs[panel_tab]
    end

    if values <= 10 then
        dxDrawRectangle(450, 116, 5, (index * 32), tocolor(196, 57, 54, 255))
    else
        dxCreateScrollBar('scroll', 450, 116, 5, (index * 32), ((values - 10) * 32), {using = {196, 57, 54, 255}, scroll = {196, 57, 54, 255}, background = {28, 28, 28, 255}}, (values - 10), false)
    end
    yDistance = 0

    local data = 0

    local scrollData = dxGetPropertiesScrollBar('scroll')
    if scrollData and type (scrollData) == 'table' and next (scrollData) then
        data = scrollData.actual
    else
        data = 1
    end

    item_hovered = nil
    _skin_selected = nil

    for i = 1, 10 do
        local id = ((data - 1) + i)

        if not panel_tab then
            if config.shopTabs[id] then
                yDistance = yDistance + 32

                if isCursorInPosition(25, 116 + ((i - 1) * 32), 425, 32) then
                    item_hovered = config.shopTabs[id]

                    dxDrawRectangle(25, 116 + ((i - 1) * 32), 425, 32, tocolor(196, 57, 54, 255))
                    dxDrawText(config.shopTabs[id], 39, 116 + ((i - 1) * 32), 425, 32, tocolor(28, 29, 31, 255), 1, fonts.robotoCondensed_regular, 'left', 'center')
                else
                    dxDrawRectangle(25, 116 + ((i - 1) * 32), 425, 32, tocolor(28, 28, 28, (255 / 100 * 70)))
                    dxDrawText(config.shopTabs[id], 39, 116 + ((i - 1) * 32), 425, 32, tocolor(255, 255, 255, (255 / 100 * 85)), 1, fonts.robotoCondensed_regular, 'left', 'center')
                end
            end
        else
            if config.shopSubTabs[panel_tab][id] then
                yDistance = yDistance + 32

                if isCursorInPosition(25, 116 + ((i - 1) * 32), 425, 32) then
                    _skin_selected = id

                    dxDrawRectangle(25, 116 + ((i - 1) * 32), 425, 32, tocolor(196, 57, 54, 255))
                    dxDrawText(config.shopSubTabs[panel_tab][id][1], 39, 116 + ((i - 1) * 32), 425, 32, tocolor(28, 29, 31, 255), 1, fonts.robotoCondensed_regular, 'left', 'center')
                    dxDrawText('$ '..formatNumber(config.shopSubTabs[panel_tab][id][3], '.'), 25, 116 + ((i - 1) * 32), 412, 32, tocolor(28, 29, 31, 255), 1, fonts.robotoCondensed_regular2, 'right', 'center')
                elseif skin_selected == id then
                    dxDrawRectangle(25, 116 + ((i - 1) * 32), 425, 32, tocolor(196, 57, 54, 255))
                    dxDrawText(config.shopSubTabs[panel_tab][id][1], 39, 116 + ((i - 1) * 32), 425, 32, tocolor(28, 29, 31, 255), 1, fonts.robotoCondensed_regular, 'left', 'center')
                    dxDrawText('$ '..formatNumber(config.shopSubTabs[panel_tab][id][3], '.'), 25, 116 + ((i - 1) * 32), 412, 32, tocolor(28, 29, 31, 255), 1, fonts.robotoCondensed_regular2, 'right', 'center')
                else
                    dxDrawRectangle(25, 116 + ((i - 1) * 32), 425, 32, tocolor(28, 28, 28, (255 / 100 * 70)))
                    dxDrawText(config.shopSubTabs[panel_tab][id][1], 39, 116 + ((i - 1) * 32), 425, 32, tocolor(255, 255, 255, (255 / 100 * 85)), 1, fonts.robotoCondensed_regular, 'left', 'center')
                    dxDrawText('$ '..formatNumber(config.shopSubTabs[panel_tab][id][3], '.'), 25, 116 + ((i - 1) * 32), 412, 32, tocolor(255, 255, 255, (255 / 100 * 85)), 1, fonts.robotoCondensed_regular2, 'right', 'center')
                end
            end
        end
    end

    if not panel_tab then
        dxDrawImage(25, (116 + yDistance + 13), 430, 34, 'assets/images/bigCancel.png')

        dxDrawText('Cancelar', 25, (116 + yDistance + 13), 430, 34, (isCursorInPosition(25, (116 + yDistance + 13), 430, 34) and colorAnimation('cancel', 1000, 255, 255, 255, 255) or colorAnimation('cancel', 1000, 255, 255, 255, (255 / 100 * 50))), 1, fonts.robotoCondensed_regular, 'center', 'center')
    
        colorAnimation('buy', 1000, 255, 255, 255, (255 / 100 * 50))
    else
        dxDrawImage(25, (116 + yDistance + 13), 253, 34, 'assets/images/buy.png')

        dxDrawText('Comprar', 25, (116 + yDistance + 13), 253, 34, (isCursorInPosition(25, (116 + yDistance + 13), 253, 34) and colorAnimation('buy', 1000, 255, 255, 255, 255) or colorAnimation('buy', 1000, 255, 255, 255, (255 / 100 * 50))), 1, fonts.robotoCondensed_regular, 'center', 'center')

        dxDrawImage(291, (116 + yDistance + 13), 164, 34, 'assets/images/cancel.png')

        dxDrawText('Cancelar', 291, (116 + yDistance + 13), 164, 34, (isCursorInPosition(291, (116 + yDistance + 13), 164, 34) and colorAnimation('cancel', 1000, 255, 255, 255, 255) or colorAnimation('cancel', 1000, 255, 255, 255, (255 / 100 * 50))), 1, fonts.robotoCondensed_regular, 'center', 'center')
    end

    dxDrawImage(25, (screen.y - 64 - 34), 74, 34, 'assets/images/mouse1.png')
    dxDrawText('Para mexer a câmera', 105, (screen.y - 74 - 14), 100, 14, tocolor(255, 255, 255, 255), 1, fonts.robotoCondensed_light)

    dxDrawImage(25, (screen.y - 25 - 34), 69, 34, 'assets/images/scroll.png')
    dxDrawText('Para dar Zoom', 100, (screen.y - 35 - 14), 70, 14, tocolor(255, 255, 255, 255), 1, fonts.robotoCondensed_light)
end

function ocRender(state, identify)
    if state then
        if not panel_state then
            fadeCamera(false, 1)

            if isChatVisible() then
                chat = true
                showChat(false)
            end

            setTimer(function()
                local pos = Vector3(config.shops[identify][8])
                dimension = getElementDimension(localPlayer)
                interior = getElementInterior(localPlayer)
                
                ped = createPed(getElementModel(localPlayer), pos)
                setElementDimension(ped, config.shops[identify][8][4])
                setElementInterior(ped, config.shops[identify][8][5])

                local r = Vector3(getElementRotation(ped))
                
                setElementDimension(localPlayer, config.shops[identify][8][4])
                setElementInterior(localPlayer, config.shops[identify][8][5])
                setElementAlpha(localPlayer, 0)
    
                panel_state = setTimer(render, 0, 0)

                addEventHandler('onClientPreRender', root, onPreRenderHandler)

                toggleAllControls(false)

                camera = {
                    view = 'base',
                    rotation = -r.z,
                    height = -1.5,
                    zoomLevel = 1,
                    zoomInterpolate = false,
                    moveInterpolate = false,
                    startPos = false,
                    stopPos = false,
                    position = {pos.x - 7.5 * math.sin(r.z), pos.y + 7.5 * math.cos(r.z), pos.z + 2.5, pos.x, pos.y, pos.z},
                }

                fadeCamera(true, 1)

                showCursor(true)
            end, 1000, 1)
        end
    else
        if panel_state then
            fadeCamera(false, 1)

            killTimer(panel_state)
            panel_state = nil

            setTimer(function()
                toggleAllControls(true)

                removeEventHandler('onClientPreRender', root, onPreRenderHandler)
                setCameraTarget(localPlayer)

                setElementDimension(localPlayer, dimension)
                setElementInterior(localPlayer, interior)
                setElementAlpha(localPlayer, 255)    

                destroyElement(ped)

                camera = false

                if chat then
                    showChat(true)

                    chat = nil
                end

                fadeCamera(true, 1)
                
                showCursor(false)
            end, 1000, 1)
        end
    end
end
addEvent('moren1n_clothesShop', true)
addEventHandler('moren1n_clothesShop', root, ocRender)

addEventHandler('onClientResourceStop', root, function()
    if panel_state then
        toggleAllControls(true)

        removeEventHandler('onClientPreRender', root, onPreRenderHandler)
        setCameraTarget(localPlayer)

        setElementDimension(localPlayer, dimension)
        setElementInterior(localPlayer, interior)
        setElementAlpha(localPlayer, 255)    

        destroyElement(ped)

        camera = false

        if chat then
            showChat(true)

            chat = nil
        end
        
        showCursor(false)
    end
end)

addEventHandler('onClientClick', root, function(b, s)
    if panel_state then
        if s == 'down' then
            if b == 'left' then
                if not panel_tab then
                    if isCursorInPosition(25, (116 + yDistance + 13), 430, 34) then
                        ocRender(false)
                    elseif item_hovered then
                        panel_tab = item_hovered

                        data = 1
                        dxUpdateScrollBarOffset('scroll', data)

                        changeCamera('front')
                    end
                else
                    if isCursorInPosition(25, (116 + yDistance + 13), 253, 34) then
                        triggerServerEvent('moren1n_clothesShop', localPlayer, localPlayer, 'buy', panel_tab, skin_selected)
                    elseif isCursorInPosition(291, (116 + yDistance + 13), 164, 34) then
                        panel_tab = nil

                        data = 1
                        dxUpdateScrollBarOffset('scroll', data)

                        changeCamera('base')

                        skin_selected = nil

                        setElementModel(ped, getElementModel(localPlayer))
                    elseif _skin_selected then
                        skin_selected = _skin_selected

                        setElementModel(ped, config.shopSubTabs[panel_tab][skin_selected][2])
                    else
                        skin_selected = nil
                    end
                end
            end
        end
    end
end)

addEventHandler('onClientKey', root, function(b, s)
    if panel_state then
        if s then
            if (isCursorShowing() and not isMTAWindowActive()) then
                if (b == 'mouse_wheel_up' or b == 'mouse_wheel_down') then
                    if isCursorInPosition(25, 25, 430, (91 + yDistance)) then
                        if not panel_tab then
                            values = #config.shopTabs
                        else
                            values = #config.shopSubTabs[panel_tab]
                        end

                        values = (values - 10)

                        local scrollData = dxGetPropertiesScrollBar('scroll')
                        if not scrollData then
                            return false
                        end
                        local data = scrollData.actual  
                        
                        if b == 'mouse_wheel_up' then
                            if values > 0 then
                                if data > 1 then
                                    data = data - 1
                                end
                            end
                        else
                            if values > 0 then
                                data = data + 1
                            end
                        end
                        dxUpdateScrollBarOffset('scroll', data)
                    else
                        if (camera and not camera.zoomInterpolate) then
                            local value = 0

                            if (b == 'mouse_wheel_down') then
                                if (camera.zoomLevel > 0.75) then
                                    value = camera.zoomLevel - 0.2 * camera.zoomLevel
                                end
                            elseif (camera.zoomLevel <= 1.75) then
                                value = camera.zoomLevel + 0.2 * camera.zoomLevel
                            end

                            if (value < 0.75) then
                                value = 0.75
                            elseif (value > 1.75) then
                                value = 1.75
                            end

                            camera.zoomInterpolate = {getTickCount(), camera.zoomLevel, value}
                        end
                    end
                end
            end
        end
    end
end)

function onPreRenderHandler(timeSlice)
    if (not isElement(ped) or not camera) then
        return
    end

    if (getKeyState('mouse1') and not isMTAWindowActive() and not camera.moveInterpolate) then
        if isCursorInPosition(25, 25, 430, (91 + yDistance)) then
            return
        end

        local cursorX, cursorY = getCursorPosition()

        if (tonumber(cursorX)) then
            local cursorX = cursorX * screen.x
            local cursorY = cursorY * screen.y

            if (not lastCursorPos) then
                lastCursorPos = {
                    onMoveStartX = cursorX,
                    onMoveStartY = cursorY,
                    yawStart = camera.rotation,
                    pitchStart = camera.height
                }
            end

            camera.rotation = lastCursorPos.yawStart - (cursorX - lastCursorPos.onMoveStartX) / screen.x * 270
            camera.height = lastCursorPos.pitchStart + (cursorY - lastCursorPos.onMoveStartY) / screen.y * 20

            if (camera.rotation > 360) then
                camera.rotation = camera.rotation - 360
            elseif (camera.rotation < 0) then
                camera.rotation = camera.rotation + 360
            end

            local maxZ = math.abs(getElementDistanceFromCentreOfMassToBaseOfModel(ped) - 1)

            if (camera.height > maxZ) then
                camera.height = maxZ
            elseif (camera.height < -2) then
                camera.height = -2
            end
        end
    elseif (lastCursorPos) then
        lastCursorPos = false
    end

    if (camera.zoomInterpolate) then
        local elapsedTime = getTickCount() - camera.zoomInterpolate[1]
        local progress = elapsedTime / 150

        camera.zoomLevel = interpolateBetween(camera.zoomInterpolate[2], 0, 0, camera.zoomInterpolate[3], 0, 0, progress, 'InOutQuad')

        if (progress >= 1) then
            camera.zoomInterpolate = false
        end
    end

    if (camera.moveInterpolate) then
        local elapsedTime = getTickCount() - camera.moveInterpolate
        local progress = elapsedTime / 475

        camera.rotation, camera.height, camera.zoomLevel = interpolateBetween(
            camera.startPos[1], camera.startPos[2], camera.startPos[3],
            camera.stopPos[1] or camera.startPos[1], camera.stopPos[2] or camera.startPos[2], camera.stopPos[3] or camera.startPos[3],
            progress, 'InOutQuad')

        if (progress >= 1) then
            camera.moveInterpolate = false
            camera.zoomInterpolate = false
        end
    end

    local deltaX = camera.position[1] - camera.position[4]
    local deltaY = camera.position[2] - camera.position[5]
    local theta = math.rad(camera.rotation)

    setCameraMatrix(
        camera.position[4] + deltaX * math.cos(theta) - deltaY * math.sin(theta),
        camera.position[5] + deltaX * math.sin(theta) + deltaY * math.cos(theta),
        camera.position[3] + camera.height,
        camera.position[4],
        camera.position[5],
        camera.position[6],
        0, 70 / camera.zoomLevel
    )
end


function changeCamera(view)
    if (not view or camera.view == view) then
        return
    end

    camera.startPos = {camera.rotation, camera.height, camera.zoomLevel}

    if (view == 'base') then
        camera.stopPos = {45, -1.5, 1}
    elseif (view == 'front') then
        camera.stopPos = {0, -1.5, 1}
    elseif (view == 'rear') then
        camera.stopPos = {180, -1.5, 1}
    end

    camera.moveInterpolate = getTickCount()
    camera.view = view
end

color_animation = {}

function colorAnimation(id, duration, r2, g2, b2, alpha)
    if not color_animation[id] then
        color_animation[id] = {id = id, duration = duration, alpha = alpha, r = r2, g = g2, b = b2, lastR = r2, lastG = g2, lastB = b2, lastA = alpha, tick = nil}
    end
    if r2 ~= color_animation[id].lastR or g2 ~= color_animation[id].lastG or b2 ~= color_animation[id].lastB or alpha ~= color_animation[id].lastA then
        color_animation[id].tick = getTickCount()
        color_animation[id].lastR = r2
        color_animation[id].lastG = g2
        color_animation[id].lastB = b2
        color_animation[id].lastA = alpha
    elseif color_animation[id].r == r2 and color_animation[id].g == g2 and color_animation[id].b == b2 and color_animation[id].alpha == alpha then
        color_animation[id].tick = nil
    end
    if color_animation[id].tick then
        local interpolate = {interpolateBetween(color_animation[id].r, color_animation[id].g, color_animation[id].b, r2, g2, b2, (getTickCount() - color_animation[id].tick) / color_animation[id].duration, 'Linear')}
        local interpolateAlpha = interpolateBetween(color_animation[id].alpha, 0, 0, alpha, 0, 0, (getTickCount() - color_animation[id].tick) / color_animation[id].duration, 'Linear')

        color_animation[id].r = interpolate[1]
        color_animation[id].g = interpolate[2]
        color_animation[id].b = interpolate[3]
        color_animation[id].alpha = interpolateAlpha
    end
    return tocolor(color_animation[id].r, color_animation[id].g, color_animation[id].b, color_animation[id].alpha)
end

function formatNumber(number, sep)
	assert(type(tonumber(number))=="number", "Bad argument @'formatNumber' [Expected number at argument 1 got "..type(number).."]")
	assert(not sep or type(sep)=="string", "Bad argument @'formatNumber' [Expected string at argument 2 got "..type(sep).."]")
	local money = number
	for i = 1, tostring(money):len()/3 do
		money = string.gsub(money, "^(-?%d+)(%d%d%d)", "%1"..sep.."%2")
	end
	return money
end

function isCursorInPosition(x, y, width, height)
    if (not isCursorShowing()) then
        return false
    end
    
    local cx, cy = getCursorPosition()
    local cx, cy = (cx * screen.x), (cy * screen.y)
    
    return ((cx >= x and cx <= x + width) and (cy >= y and cy <= y + height))
end