
local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768) local font = dxCreateFont('files/font.ttf', x * 10, false) local cores = {24, 21, 24, 21, 24, 21, 24, 21, 24, 21, 24, 21, 24} local select = 'Estilo de andar'
proxPag = 0

positionss = {
	{441, 249, 151.1, 38.19},
	{441, 287.19, 151.1, 38.19},
	{441, 325.38, 151.1, 38.19},
	{441, 363.57, 151.1, 38.19},
	{441, 401.77, 151.1, 38.19},
	{441, 439.96, 151.1, 38.19},
}

positions = {
	{600.41, 249, 317.15, 24.91, 			599, 249, 898, 273},
	{600.41, 273.91, 317.15, 24.91, 		599, 274, 898, 298},
	{600.41, 300.48, 317.15, 24.91, 		599, 300, 898, 324},
	{600.41, 325.38, 317.15, 24.91, 		599, 324, 898, 348},
	{600.41, 350.29, 317.15, 24.91, 		599, 350, 898, 374},
	{600.41, 376.86, 317.15, 24.91, 		599, 378, 898, 402},
	{600.41, 401.77, 317.15, 24.91, 		599, 402, 898, 426},
	{600.41, 426.67, 317.15, 24.91, 		599, 427, 898, 451},
	{600.41, 453.24, 317.15, 24.91, 		599, 453, 898, 477},
}

function painel ()
	dxDrawImage(x * 433, y * 215, x * 495, y * 299, 'files/painel.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
	dxDrawRectangle(x * 588, y * 249, x * 14, y * 228, tocolor(91, 91, 91, alpha), true)
	for i, v in ipairs(ANIMATIONS) do
		dxDrawRectangle(x * positionss[i][1], y * positionss[i][2], x * positionss[i][3], y * positionss[i][4], (isMouseInPosition(x * positionss[i][1], y * positionss[i][2], x * positionss[i][3], y * positionss[i][4]) and tocolor(30, 30, 30, alpha) or tocolor(cores[i], cores[i], cores[i], alpha)), false)
		dxDrawImage(x * positionss[i][1] + (x * 11.62), y * positionss[i][2] + (y * 6.64), x * 26.57, y * 26.57, 'files/'..v.Icon..'.png', 0, 0, 0, (select == v.Name and tocolor(255, 0, 0, alpha) or tocolor(255, 255, 255, alpha)), false)
		dxDrawText(v.Name, x * positionss[i][1] + (x * 42), y * positionss[i][2] + (y * 13), 0, 0, (select == v.Name and tocolor(255, 0, 0, alpha) or tocolor(255, 255, 255, alpha)), 1, font)
		if select == v.Name then
			if v.WalkStyles then
				linha = 0
				for k, anin in ipairs(v.WalkStyles) do
					if (k > proxPag and linha < #positions) then
						linha = linha + 1
						dxDrawRectangle(x * positions[linha][1], y * positions[linha][2], x * positions[linha][3], y * positions[linha][4], (isMouseInPosition(x * positions[linha][1], y * positions[linha][2], x * positions[linha][3], y * positions[linha][4]) and tocolor(30, 30, 30, alpha) or tocolor(cores[linha], cores[linha], cores[linha], alpha)), false)
						dxDrawText(anin.Name, x * positions[linha][1] + (x * 16.59), y * positions[linha][2] + (y * 5.5), 0, 0, tocolor(255, 255, 255, alpha), 1, font)
						dxDrawText('/'..anin.Command, x * positions[linha][5], y * positions[linha][6], x * positions[linha][7], y * positions[linha][8], tocolor(255, 255, 255, alpha), 1, font, 'right', 'center')
					end
				end
			else
				linha = 0
				for k, anin in ipairs(v.Animations) do
					if (k > proxPag and linha < #positions) then
						linha = linha + 1
						dxDrawRectangle(x * positions[linha][1], y * positions[linha][2], x * positions[linha][3], y * positions[linha][4], (isMouseInPosition(x * positions[linha][1], y * positions[linha][2], x * positions[linha][3], y * positions[linha][4]) and tocolor(30, 30, 30, alpha) or tocolor(cores[linha], cores[linha], cores[linha], alpha)), false)
						dxDrawText(anin.Name, x * positions[linha][1] + (x * 16.59), y * positions[linha][2] + (y * 5.5), 0, 0, tocolor(255, 255, 255, alpha), 1, font)
						dxDrawText('/'..anin.Command, x * positions[linha][5], y * positions[linha][6], x * positions[linha][7], y * positions[linha][8], tocolor(255, 255, 255, alpha), 1, font, 'right', 'center')
					end
				end
			end		
		end
	end

end

function getTable ()
	tabless = false
	for i, v in ipairs(ANIMATIONS) do
		if (select == v.Name) then
			if v.WalkStyles then
				tabless = v.WalkStyles
			else
				tabless = v.Animations
			end
		end
	end
	return tabless
end

addEventHandler('onClientClick', root, function (button, state)
	if isEventHandlerAdded('onClientRender', root, painel) and button ==  'left' and state == 'down' then
		linha = 0
		for i, v in ipairs(ANIMATIONS) do
			linha = linha + 1
			if isMouseInPosition(x * positionss[linha][1], y * positionss[linha][2], x * positionss[linha][3], y * positionss[linha][4]) then
				select = v.Name
				proxPag = 0
				return
			end
		end

		linha2 = 0
		for i, v in ipairs(getTable()) do
			if (i > proxPag and linha2 < #positions) then
				linha2 = linha2 + 1
				if isMouseInPosition(x * positions[linha2][1], y * positions[linha2][2], x * positions[linha2][3], y * positions[linha2][4]) then
					triggerServerEvent('Caio.onExecuteCommand', localPlayer, v.Command)
					return
				end
			end
		end
	end
end)

addEventHandler('onClientKey', root, function (button, press)
	if isEventHandlerAdded('onClientRender', root, painel) then
		if button == 'backspace' and press then
			removeEventHandler('onClientRender', root, painel)
			showCursor(false)
			proxPag = 0
		elseif button == 'space' and press then
			triggerServerEvent('Caio.onPararAnimation', localPlayer)
		elseif button == 'mouse_wheel_up' and press then
            if (proxPag > 0) then
                proxPag = proxPag - 1
            end
		elseif button == 'mouse_wheel_down' and press then
			local tabless = getTable()
            proxPag = proxPag + 1
            if (proxPag > #tabless - #positions) then
                proxPag = #tabless - #positions
            end
		end
	end
end)

bindKey('f2', 'down', function ()
	if not isEventHandlerAdded('onClientRender', root, painel) then
		addEventHandler('onClientRender', root, painel)
		showCursor(true)
	else
		removeEventHandler('onClientRender', root, painel)
		showCursor(false)
	end
end)


ossos = {}

addEvent('Caio.onPararAnimationsClient', true)
addEventHandler('Caio.onPararAnimationsClient', root, function(player)
	if ossos then
		for i, v in pairs(ossos) do 
			if isElement(v[5]) then
				if v[5] == player then
					table.remove(ossos, i)
					updateElementRpHAnim(player)
				end
			else
				table.remove(ossos, i)
			end
		end
	end
end)

addEventHandler('onClientPedsProcessed', root, function()
	if ossos then
		for i, v in pairs(ossos) do 
			if isElement(v[5]) then
				setElementBoneRotation(v[5], v[1], v[2], v[3], v[4])		
				updateElementRpHAnim(v[5])
			else
				table.remove(ossos, i)
			end 
		end
	end
end)

addEvent('Caio.onSetBonePosition', true)
addEventHandler('Caio.onSetBonePosition', root, function (player, position)
	for i, v in pairs(position) do
		setElementBoneRotation(player, i, v[1], v[2], v[3])
		table.insert(ossos, {i, v[1], v[2], v[3], player})
	end
end)

ifp = {}

setTimer(function()
	for i, v in ipairs(IFPS) do
		ifp[i] = engineLoadIFP('ifp/'..v..'.ifp', v)
	end
end, 1000, 1)

addEvent('Caio.onSetAnimation', true)
addEventHandler('Caio.onSetAnimation', root, function (player, animation)
	setPedAnimation(player, unpack(animation))
end)

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