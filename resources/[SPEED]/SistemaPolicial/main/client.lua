storage = {}

storage.screen = {guiGetScreenSize()}

storage.font = 'default-bold'



storage.rectangle = {}
storage.effect = {}

storage.effect.temp = 1000
storage.effect.type = 'Linear'
storage.effect.maxAlpha = 255


storage.rectangle.background = {}
storage.rectangle.background.img = 'assets/background.png'
storage.rectangle.background.color = {30,30,30}
storage.rectangle.background.size = {400,300}
storage.rectangle.background.pos = {(storage.screen[1] - storage.rectangle.background.size[1] )/2, (storage.screen[2] - storage.rectangle.background.size[2] )/2}

storage.rectangle.baseIcons = {}
storage.rectangle.baseIcons.img = 'assets/baseIcons.png'
storage.rectangle.baseIcons.size = {60,300}
storage.rectangle.baseIcons.pos = {storage.rectangle.background.pos[1] - storage.rectangle.baseIcons.size[1] - 5, storage.rectangle.background.pos[2]}

storage.rectangle.baseButtons = {}
storage.rectangle.baseButtons.img = '/assets/baseButtons.png'
storage.rectangle.baseButtons.color = {40,40,40}
storage.rectangle.baseButtons.size = {352,226}
storage.rectangle.baseButtons.pos = {storage.rectangle.background.pos[1] + (storage.rectangle.background.size[1] - storage.rectangle.baseButtons.size[1])/2,
storage.rectangle.background.pos[2] + (storage.rectangle.background.size[2] - storage.rectangle.baseButtons.size[2])/2}

storage.rectangle.icons = {}
storage.rectangle.icons.size = {35,35}
storage.rectangle.icons.pos = {storage.rectangle.baseIcons.pos[1] + (storage.rectangle.baseIcons.size[1] - storage.rectangle.icons.size[1] )/2 ,
storage.rectangle.baseIcons.pos[2] + 10}
storage.rectangle.icons.offset = storage.rectangle.icons.size[2] + 15

storage.rectangle.buttons = {}
storage.rectangle.buttons.img = '/assets/buttons.png'
storage.rectangle.buttons.size = {321,40}
storage.rectangle.buttons.pos = {storage.rectangle.baseButtons.pos[1] + (storage.rectangle.baseButtons.size[1] - storage.rectangle.buttons.size[1])/2,
storage.rectangle.baseButtons.pos[2] + 10}
storage.rectangle.buttons.offset = storage.rectangle.buttons.size[2] + 5

storage.rectangle.collect = {}
storage.rectangle.collect.img = '/assets/collect.png'
storage.rectangle.collect.size = {35,35}
storage.rectangle.collect.pos = {storage.rectangle.baseIcons.pos[1] + (storage.rectangle.baseIcons.size[1] - storage.rectangle.collect.size[1])/2,
storage.rectangle.baseIcons.pos[2] *2}


storage.icons = {
   {tab = 'police', file = '/assets/police.png'}, 
   {tab = 'armor', file = '/assets/armor.png'}, 
   {tab = 'car', file = '/assets/car.png'}, 
}

function drawing()
    
    if (storage.state) then
        storage.effect.alpha = interpolateBetween(0,0,0,storage.effect.maxAlpha,0,0,(getTickCount() - storage.effect.tickStart)/storage.effect.temp,storage.effect.type)
        storage.effect.tickRemove = getTickCount()
    else
        storage.effect.alpha =interpolateBetween(storage.effect.maxAlpha,0,0,0,0,0,(getTickCount() - storage.effect.tickRemove)/storage.effect.temp,storage.effect.type) 
        if storage.effect.alpha < 10 then
            removeEventHandler('onClientRender',root,drawing)
        end
    end
    
    dxDrawRectangle(storage.rectangleEffect[1],storage.rectangleEffect[2],storage.rectangleEffect[3],storage.rectangleEffect[4],tocolor(settings.theme[1],settings.theme[2],settings.theme[3],storage.effect.alpha))
    
    dxDrawImage(storage.rectangle.background.pos[1],storage.rectangle.background.pos[2],storage.rectangle.background.size[1],storage.rectangle.background.size[2],
    storage.rectangle.background.img ,0,0,0,tocolor(storage.rectangle.background.color[1],storage.rectangle.background.color[2],storage.rectangle.background.color[3],storage.effect.alpha))

    dxDrawImage(storage.rectangle.baseIcons.pos[1],storage.rectangle.baseIcons.pos[2],storage.rectangle.baseIcons.size[1],storage.rectangle.baseIcons.size[2],
    storage.rectangle.baseIcons.img ,0,0,0,tocolor(storage.rectangle.background.color[1],storage.rectangle.background.color[2],storage.rectangle.background.color[3],storage.effect.alpha))

    dxDrawImage(storage.rectangle.baseButtons.pos[1],storage.rectangle.baseButtons.pos[2],storage.rectangle.baseButtons.size[1],storage.rectangle.baseButtons.size[2],
    storage.rectangle.baseButtons.img ,0,0,0,tocolor(storage.rectangle.baseButtons.color[1],storage.rectangle.baseButtons.color[2],storage.rectangle.baseButtons.color[3],storage.effect.alpha))
    
    dxDrawImage(storage.rectangle.collect.pos[1],storage.rectangle.collect.pos[2],storage.rectangle.collect.size[1],storage.rectangle.collect.size[2],
    storage.rectangle.collect.img ,0,0,0,tocolor(255,255,255,storage.effect.alpha))
    
    if (isMouseInPosition(storage.rectangle.collect.pos[1],storage.rectangle.collect.pos[2],storage.rectangle.collect.size[1],storage.rectangle.collect.size[2])) then
        storage.rectangle.collect.size[1],storage.rectangle.collect.size[2] = 38,38
    else
        storage.rectangle.collect.size[1],storage.rectangle.collect.size[2] = 35,35
    end

    for i,v in ipairs(storage.icons) do
        dxDrawImage(storage.rectangle.icons.pos[1],(storage.rectangle.icons.pos[2]) + storage.rectangle.icons.offset * ((i - 1)),storage.rectangle.icons.size[1],storage.rectangle.icons.size[2],
        v.file ,0,0,0,tocolor(255,255,255,storage.effect.alpha))
    end

    if (storage.icons.tab == 'police') then
        for i,v in ipairs(storage.corporation[storage.markerId].skin) do
            if (i <= 4) then
                dxDrawImage(storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),storage.rectangle.buttons.size[1],storage.rectangle.buttons.size[2],
                storage.rectangle.buttons.img ,0,0,0,storage.select == i and tocolor(settings.theme[1],settings.theme[2],settings.theme[3],storage.effect.alpha) or tocolor(storage.rectangle.background.color[1],storage.rectangle.background.color[2],storage.rectangle.background.color[3],storage.effect.alpha))
                dxDrawText('Farda '..i..'', storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),( storage.rectangle.buttons.pos[1] + storage.rectangle.buttons.size[1]),(storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1)+ storage.rectangle.buttons.size[2]),
                tocolor(200,200,200,storage.effect.alpha),1,storage.font,'center','center')
            end
        end
    elseif (storage.icons.tab == 'armor') then
        for i,v in ipairs(storage.corporation[storage.markerId].armor) do
            if (i <= 4) then
                dxDrawImage(storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),storage.rectangle.buttons.size[1],storage.rectangle.buttons.size[2],
                storage.rectangle.buttons.img ,0,0,0,storage.select == i and tocolor(settings.theme[1],settings.theme[2],settings.theme[3],storage.effect.alpha) or tocolor(storage.rectangle.background.color[1],storage.rectangle.background.color[2],storage.rectangle.background.color[3],storage.effect.alpha))
                dxDrawText('Armamento '..i..'', storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),( storage.rectangle.buttons.pos[1] + storage.rectangle.buttons.size[1]),(storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1)+ storage.rectangle.buttons.size[2]),
                tocolor(200,200,200,storage.effect.alpha),1,storage.font,'center','center')
            end
        end
    elseif (storage.icons.tab == 'car') then
        for i,v in ipairs(storage.corporation[storage.markerId].vehicle) do
            if (i <= 4) then
                dxDrawImage(storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),storage.rectangle.buttons.size[1],storage.rectangle.buttons.size[2],
                storage.rectangle.buttons.img ,0,0,0,storage.select == i and tocolor(settings.theme[1],settings.theme[2],settings.theme[3],storage.effect.alpha) or tocolor(storage.rectangle.background.color[1],storage.rectangle.background.color[2],storage.rectangle.background.color[3],storage.effect.alpha))
                dxDrawText('Veiculo '..i..'', storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),( storage.rectangle.buttons.pos[1] + storage.rectangle.buttons.size[1]),(storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1)+ storage.rectangle.buttons.size[2]),
                tocolor(200,200,200,storage.effect.alpha),1,storage.font,'center','center')
            end
        end
    end

end

function stateDrawing(corporation,markerId)
    if not (storage.state) then
        storage.effect.tickStart = getTickCount()
        storage.icons.tab = 'police'
        storage.state = true
        storage.select = {}
        storage.rectangleEffect = {0,0,0,0}
        --storage.markerId = markerId
        storage.corporation,storage.markerId  = corporation,markerId
        addEventHandler('onClientRender',root,drawing)
    end
end
addEvent('DrawingOnDisplay',true)
addEventHandler('DrawingOnDisplay',root,stateDrawing)

function removeDrawing()
    storage.state = false
    showCursor(false)
end
bindKey('backspace','down',removeDrawing)
   
addEventHandler('onClientClick',root,
function(b,s)
    if (b == 'left' and s == 'down') then
        for i,v in ipairs(storage.icons) do
            if (isMouseInPosition(storage.rectangle.icons.pos[1],(storage.rectangle.icons.pos[2]) + storage.rectangle.icons.offset * ((i - 1)),storage.rectangle.icons.size[1],storage.rectangle.icons.size[2])) then
                if (i == 1) then
                    storage.icons.tab = 'police'
                    storage.select = {}
                    storage.rectangleEffect = {storage.rectangle.icons.pos[1] - 20,(storage.rectangle.icons.pos[2]) + storage.rectangle.icons.offset * ((i - 1)),5,40}
                elseif (i == 2) then
                    storage.icons.tab = 'armor'
                    storage.select = {}
                    storage.rectangleEffect = {storage.rectangle.icons.pos[1] - 20,(storage.rectangle.icons.pos[2]) + storage.rectangle.icons.offset * ((i - 1)),5,40}
                elseif (i == 3) then
                    storage.icons.tab = 'car'
                    storage.select = {}
                    storage.rectangleEffect = {storage.rectangle.icons.pos[1] - 20,(storage.rectangle.icons.pos[2]) + storage.rectangle.icons.offset * ((i - 1)),5,40}
                end
            end
        end
        for i,v in ipairs(storage.corporation[storage.markerId].skin) do
            if isMouseInPosition(storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),storage.rectangle.buttons.size[1],storage.rectangle.buttons.size[2]) then
                storage.select = i 
            end
        end
        for i,v in ipairs(storage.corporation[storage.markerId].vehicle) do
            if isMouseInPosition(storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),storage.rectangle.buttons.size[1],storage.rectangle.buttons.size[2]) then
                storage.select = i 
            end
        end
        for i,v in ipairs(storage.corporation[storage.markerId].armor) do
            if isMouseInPosition(storage.rectangle.buttons.pos[1],storage.rectangle.buttons.pos[2] + storage.rectangle.buttons.offset * (i-1),storage.rectangle.buttons.size[1],storage.rectangle.buttons.size[2]) then
                storage.select = i 
            end
        end
        if isMouseInPosition(storage.rectangle.collect.pos[1],storage.rectangle.collect.pos[2],storage.rectangle.collect.size[1],storage.rectangle.collect.size[2]) then
            if (storage.icons.tab == 'police') then
                triggerServerEvent('skin',resourceRoot,localPlayer,storage.corporation[storage.markerId].skin[storage.select],storage.markerId)
            elseif (storage.icons.tab == 'armor') then
                triggerServerEvent('armor',resourceRoot,localPlayer,storage.corporation[storage.markerId].armor[storage.select],storage.markerId)
            elseif (storage.icons.tab == 'car') then
                triggerServerEvent('vehicle',resourceRoot,localPlayer,storage.corporation[storage.markerId].vehicle[storage.select],storage.markerId)
            end
        end
    end 
end)

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end