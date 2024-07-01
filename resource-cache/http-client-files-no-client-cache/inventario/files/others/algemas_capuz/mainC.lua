addEvent("N3xT.onCapuz", true)

local capuz = function()
    dxDrawRectangle(x*0, y*0, screen[1], screen[2], tocolor(0, 0, 0))
    dxDrawText("Você foi encapuzado por alguém.", x*500, y*350, y*0, x*0, tocolor(255, 255, 255, 255), x*2)
end

addEventHandler("N3xT.onCapuz", root,
    function(type)
        if (type == 1) then
            addEventHandler("onClientRender", root, capuz)
        elseif (type == 2) then
            removeEventHandler("onClientRender", root, capuz)
        end
    end
)

addEventHandler("onClientRender", root,
    function()
        for k, v in ipairs(getElementsByType("player")) do
            if getElementData(v, "Algemado") then
                local k, anim = getPedAnimation(v)
                if (anim ~= "gift_give") then
                    setPedAnimation(v, "kissing", "gift_give", 500, true, false, false, true)
                end
                setPedAnimationProgress(v, 'gift_give', 0.10)
            end
        end
    end
)

addEventHandler("onClientKey", root,
    function(button)
        if (button) then
            if (getElementData(localPlayer, "Algemado") == true) or (getElementData(localPlayer, "Encapuzado") == true) then
                cancelEvent()
            end
        end
    end
)