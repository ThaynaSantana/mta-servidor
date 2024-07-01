local srcX, srcY = guiGetScreenSize()

local side = 200
local x = srcX / 2 - side / 2
local y = srcY / 2 - side / 2

local holding = false

local function is_cursor_on_element(mouse_x, mouse_y, element_x, element_y, width, height)
	return mouse_x - element_x > 0 and
	 		mouse_x - element_x <= width and
	 		mouse_y - element_y > 0 and
	 		mouse_y - element_y <= height
end

local function render_square()
	dxDrawRectangle(
		x, y,
		side, side,
		tocolor(220, 20, 20)
	)
end

local function on_cursor_move(relative_x, relative_y, absolute_x, absolute_y)
	if holding then
		x = absolute_x - off_x
		y = absolute_y - off_y
	end
end

local function on_click(button, state, absolute_x, absolute_y)
	if button ~= "left" then
		return
	end

	if state = "down" and is_cursor_on_element(absolute_x, absolute_y, x, y, side, side) then
		holding = true

		off_x = absolute_x - x
		off_y = absolute_y - y
	else
		holding = false
	end
end

addEventHandler("onClientRender", root, render_square)
addEventHandler("onClientCursorMove", root, on_cursor_move)
addEventHandler("onClientClick", root, on_click)

showCursor(true)