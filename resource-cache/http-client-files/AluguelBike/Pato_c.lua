local marker1 = createMarker(1458.88013, -1739.20337, 12.54688, "cylinder", 1.5, 255, 154, 0, 80)
local painel1 = {}
function aviso()
    function render(hitPlayer, matchingDimension)
        if isElementWithinMarker(localPlayer, marker1 ) then
            local screenW, screenH = guiGetScreenSize()
            painel1.backGround = dxDrawLine((screenW * 0.0000) - 1, (screenH * 0.4264) - 1, (screenW * 0.0000) - 1, screenH * 0.5194, tocolor(0, 0, 0, 255), 1, false)
            dxDrawLine(screenW * 0.3711, (screenH * 0.4264) - 1, (screenW * 0.0000) - 1, (screenH * 0.4264) - 1, tocolor(0, 0, 0, 255), 1, false, painel1.backGround)
            dxDrawLine((screenW * 0.0000) - 1, screenH * 0.5194, screenW * 0.3711, screenH * 0.5194, tocolor(0, 0, 0, 255), 1, false, painel1.backGround)
            dxDrawLine(screenW * 0.3711, screenH * 0.5194, screenW * 0.3711, (screenH * 0.4264) - 1, tocolor(0, 0, 0, 255), 1, false,painel1.backGround)
            dxDrawRectangle(screenW * 0.0000, screenH * 0.4264, screenW * 0.3711, screenH * 0.0931, tocolor(0, 0, 0, 165), false, painel1.backGround)
            dxDrawText("Digite /bike para alugar uma bike", screenW * 0.0352, screenH * 0.4319, screenW * 0.3445, screenH * 0.5194, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "center", false, false, false, false, false)
            dxDrawImage(screenW * 0.0008, screenH * 0.4458, screenW * 0.0344, screenH * 0.0597, ":admin/client/images/warning.png", 0, 0, 0, tocolor(255, 255, 255, 255), false, painel1.backGround)
        else
            cancelEvent()
        end
    end
    addEventHandler("onClientRender", root, render)
end
addEventHandler("onClientMarkerHit", marker, aviso)


local marker2 = createMarker(2004.508, -1415.496, 16.992, "cylinder", 1.5, 255, 154, 0, 80)
local painel2 = {}
function aviso()
    function render(hitPlayer, matchingDimension)
        if isElementWithinMarker(localPlayer, marker2 ) then
            local screenW, screenH = guiGetScreenSize()
            painel2.backGround = dxDrawLine((screenW * 0.0000) - 1, (screenH * 0.4264) - 1, (screenW * 0.0000) - 1, screenH * 0.5194, tocolor(0, 0, 0, 255), 1, false)
            dxDrawLine(screenW * 0.3711, (screenH * 0.4264) - 1, (screenW * 0.0000) - 1, (screenH * 0.4264) - 1, tocolor(0, 0, 0, 255), 1, false, painel2.backGround)
            dxDrawLine((screenW * 0.0000) - 1, screenH * 0.5194, screenW * 0.3711, screenH * 0.5194, tocolor(0, 0, 0, 255), 1, false, painel2.backGround)
            dxDrawLine(screenW * 0.3711, screenH * 0.5194, screenW * 0.3711, (screenH * 0.4264) - 1, tocolor(0, 0, 0, 255), 1, false,painel2.backGround)
            dxDrawRectangle(screenW * 0.0000, screenH * 0.4264, screenW * 0.3711, screenH * 0.0931, tocolor(0, 0, 0, 165), false, painel2.backGround)
            dxDrawText("Digite /bike para alugar uma bike", screenW * 0.0352, screenH * 0.4319, screenW * 0.3445, screenH * 0.5194, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "center", false, false, false, false, false)
            dxDrawImage(screenW * 0.0008, screenH * 0.4458, screenW * 0.0344, screenH * 0.0597, ":admin/client/images/warning.png", 0, 0, 0, tocolor(255, 255, 255, 255), false, painel2.backGround)
        else
            cancelEvent()
        end
    end
    addEventHandler("onClientRender", root, render)
end
addEventHandler("onClientMarkerHit", marker, aviso)