local screenW,screenH = guiGetScreenSize()
local resW, resH = 1365,767
local x, y =  (screenW/resW), (screenH/resH)

painel=false
function painelMissao()
	dxDrawnRectangule(379, 145, 608, 393, tocolor(27, 27, 27, 80), false)
end