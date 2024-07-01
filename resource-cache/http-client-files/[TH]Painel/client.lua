local largura, altura = guiGetScreenSize()
local escala = math.min(
	math.max(altura / 1080, 0.65),
	2
)


local parent_w = 
local parent_h = 
local parent_x = largura / 2 - parent_w * escala / 2
local parent_y = altura / 2 - parent_h * escala / 2

addEventHandler("onClientRender", root, function()
	dxDrawRectangle(
		parent_x,
		parent_y,
		parent_w * escala,
		parent_h * escala,
		tocolor(23, 23, 25)
		)

	dxDrawCircle(
		parent_x + (50 + 40) * escala,
		parent_y + (50 + 40) * escala,
		50 * escala, -- RAIO
		0, 360,
		tocolor(36, 36, 36)
		)

	dxDrawRectangle(
		parent_x + (40 + 100 + 40) * escala,
		parent_y + (40 + 15) * escala,
		(parent_w - 40 - 100 - 40 - 40) * escala,
		20 * escala,
		tocolor(36,36,36)
		)

	dxDrawRectangle(
		parent_x + (40 + 100 + 40) * escala,
		parent_y + (40 + 15 + 20 + 30) * escala,
		(parent_w - 40 - 100 -40 - 40) * escala,
		20 * escala,
		tocolor(36,36,36)
		)
	
	dxDrawRectangle(
		parent_x + 40 * escala,
		parent_y + (40 + 100 + 30) * escala,
		(parent_w - 40 - 40) * escala,
		20 * escala,
		tocolor(36,36,36)
		)

end)