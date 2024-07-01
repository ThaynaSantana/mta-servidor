local srcX, srcY = guiGetScreenSize()

local x, y = srcX / 2 - 200 / 2, srcY / 2 - 200 / 2
local w, h = 200, 200
local color = tocolor(255, 0, 0)


local function get_relative_cursor_position(mouse_x, mouse_y, elm_x, elm_y)
	local relative_x = mouse_x - elm_x
	local relative_y = mouse_y - elm_y

	return relative_x, relative_y
end

addEventHandler("onClientRender", root, function()
	dxDrawRectangle(
		x, y
		w, h,
		color
	)
end)

addEventHandler("onClientClick", root, function(button, state, mouse_x ,mouse_y)
	local rel_x, rel_y = get_relative_cursor_position(mouse_x, mouse_y, x, y)

	if (rel_x > 0 and rel_x < w and rel_y > 0 and rel_y < h) then
		outputDebugScript("Clicou dentro da forma")
		color = tocolor(0, 255, 0) -- muda a cor do retangulo para azul
	end

end)