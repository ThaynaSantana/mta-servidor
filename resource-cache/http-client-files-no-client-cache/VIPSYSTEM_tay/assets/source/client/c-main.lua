
local resource = {};

local function onPanelVipRender()
    if (resource.state) then
        local alpha = interpolateBetween(resource['transition']['alpha'][1], 0, 0, resource['transition']['alpha'][2], 0, 0, ((getTickCount() - resource['transition'].tickCount) / 800), "Linear");

        dxDrawImage(0, 0, 1360, 768, "assets/archives/imgs/background.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawImage(250, 98, 860, 572, "assets/archives/imgs/player/painel-vip.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawText(getSystemLanguage("title"), 411, 152, 195, 36, tocolor(250, 251, 252, alpha), 1.00, resource['libs']['fonts'][1], "left", "center", false, false, true, false, false)
        dxDrawText(getSystemLanguage("subtitle"), 411, 188, 225, 20, tocolor(250, 251, 252, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)

        dxDrawText(getSystemLanguage("others window"), 780, 465, 277, 30, tocolor(227, 228, 229, alpha), 1.00, resource['libs']['fonts'][4], "left", "center", false, false, true, false, false)
        dxDrawText(getSystemLanguage("weapons window"), 804, 274, 275, 30, tocolor(227, 228, 229, alpha), 1.00, resource['libs']['fonts'][4], "left", "center", false, false, true, false, false)
        dxDrawText(getSystemLanguage("persons window"), 469, 465, 250, 30, tocolor(227, 228, 229, alpha), 1.00, resource['libs']['fonts'][4], "left", "center", false, false, true, false, false)
        dxDrawText(getSystemLanguage("vehicle window"), 469, 274, 275, 30, tocolor(227, 228, 229, alpha), 1.00, resource['libs']['fonts'][4], "left", "center", false, false, true, false, false)

        dxDrawText(getSystemLanguage("warning get benefit"), 460, 233, 620, 40, tocolor(158, 161, 166, alpha), 1.00, resource['libs']['fonts'][5], "left", "center", false, false, true, false, false)

        dxDrawText(system['vips'][1].name, 302, 273, 110, 20, (resource.index == 1 and tocolor(232, 233, 235, alpha) or tocolor(92, 93, 94, alpha)), 1.00, (resource.index == 1 and resource['libs']['fonts'][3] or resource['libs']['fonts'][4]), "left", "center", false, false, true, false, false)
        dxDrawText(system['vips'][2].name, 302, 300, 110, 20, (resource.index == 2 and tocolor(232, 233, 235, alpha) or tocolor(92, 93, 94, alpha)), 1.00, (resource.index == 2 and resource['libs']['fonts'][3] or resource['libs']['fonts'][4]), "left", "center", false, false, true, false, false)
        dxDrawText(system['vips'][3].name, 302, 327, 110, 20, (resource.index == 3 and tocolor(232, 233, 235, alpha) or tocolor(92, 93, 94, alpha)), 1.00, (resource.index == 3 and resource['libs']['fonts'][3] or resource['libs']['fonts'][4]), "left", "center", false, false, true, false, false)
        dxDrawText(system['vips'][4].name, 302, 354, 110, 20, (resource.index == 4 and tocolor(232, 233, 235, alpha) or tocolor(92, 93, 94, alpha)), 1.00, (resource.index == 4 and resource['libs']['fonts'][3] or resource['libs']['fonts'][4]), "left", "center", false, false, true, false, false)

        for i = 1, resource['scroll'].max do
            local others = resource['scroll']['list']['others'][i + resource['scroll']['page'].others];
            local weapons = resource['scroll']['list']['weapons'][i + resource['scroll']['page'].weapons];
            local persons = resource['scroll']['list']['persons'][i + resource['scroll']['page'].persons];
            local vehicles = resource['scroll']['list']['vehicles'][i + resource['scroll']['page'].vehicles];

            if (others) then 
                local posY = (495 + 35 * i - 35); 
                dxDrawText(others.name, 756, posY, 323, 35, (isCursorOnElement(741, posY, 338, 35) and tocolor(185, 187, 191, alpha) or tocolor(105, 106, 107, alpha)), 1.00, resource['libs']['fonts'][3], "left", "center", false, false, true, false, false)  
            end

            if (persons) then 
                local posY = (495 + 35 * i - 35); 
                dxDrawText(persons.name, 446, posY, 273, 35, (isCursorOnElement(431, posY, 288, 35) and tocolor(185, 187, 191, alpha) or tocolor(105, 106, 107, alpha)), 1.00, resource['libs']['fonts'][3], "left", "center", false, false, true, false, false) 
            end

            if (weapons) then 
                local posY = (304 + 35 * i - 35); 
                dxDrawText(weapons.name, 781, posY, 298, 35, (isCursorOnElement(766, posY, 313, 35) and tocolor(185, 187, 191, alpha) or tocolor(105, 106, 107, alpha)), 1.00, resource['libs']['fonts'][3], "left", "center", false, false, true, false, false) 
            end

            if (vehicles) then
                local posY = (304 + 35 * i - 35); 
                dxDrawText(vehicles.name, 446, posY, 298, 35, (isCursorOnElement(431, posY, 313, 35) and tocolor(185, 187, 191, alpha) or tocolor(105, 106, 107, alpha)), 1.00, resource['libs']['fonts'][3], "left", "center", false, false, true, false, false) 
            end
        end
    end
end

local function onLoadScrollList(index)
    resource['scroll']['list'].vehicles = {};
    resource['scroll']['page'].vehicles = 0;
    resource['scroll']['list'].persons = {};
    resource['scroll']['page'].persons = 0;
    resource['scroll']['list'].weapons = {};
    resource['scroll']['page'].weapons = 0;
    resource['scroll']['list'].others = {};
    resource['scroll']['page'].others = 0;

    for k, v in ipairs(system['vips'][index]['items'].vehicles) do table.insert(resource['scroll']['list'].vehicles, {['columnIndex'] = k, ['name'] = v.name, ['id'] = v.id}); end
    for k, v in ipairs(system['vips'][index]['items'].others) do table.insert(resource['scroll']['list'].others, {['columnIndex'] = k, ['name'] = v.name, ['func'] = v.func}); end
    for k, v in ipairs(system['vips'][index]['items'].persons) do table.insert(resource['scroll']['list'].persons, {['columnIndex'] = k, ['name'] = v.name, ['id'] = v.id}); end
    for k, v in ipairs(system['vips'][index]['items'].weapons) do table.insert(resource['scroll']['list'].weapons, {['columnIndex'] = k, ['name'] = v.name, ['id'] = v.id}); end
end

local function onLoadInfos()
    resource = 
    {
        ['libs'] = {},
        ['data'] = {},

        ['index'] = 1,
        ['state'] = true,

        ['transition'] =
        {
            ['alpha'] = {0, 255},
            ['tickCount'] = getTickCount()
        },

        ['scroll'] =
        {
            ['max'] = 4,
            ['page']= {
                ['vehicles'] = 0,
                ['weapons'] = 0,
                ['persons'] = 0,
                ['others'] = 0
            },

            ['list'] = {
                ['vehicles'] = {},
                ['weapons'] = {},
                ['persons'] = {},
                ['others'] = {}
            }
        }
    };
end

local function onLoadLibs(state)
    if (state) then
        resource.libs =
        {
            ['fonts'] = 
            {
                [5] = dxCreateFont("assets/archives/fonts/sf-ui-display-regular.ttf", 11),
                [4] = dxCreateFont("assets/archives/fonts/sf-ui-display-regular.ttf", 12),
                [3] = dxCreateFont("assets/archives/fonts/sf-ui-display-medium.ttf", 12),
                [2] = dxCreateFont("assets/archives/fonts/sf-ui-display-light.ttf", 14),
                [1] = dxCreateFont("assets/archives/fonts/sf-ui-display-bold.ttf", 24),
            }
        };
    else
        for index, array in pairs(resource.libs) do
            for k, v in ipairs(array) do
                if (type(v) == "table") then
                    destroyElement(v[2]);
                    break;
                end
                destroyElement(v);
            end
        end
        resource.libs = {};
    end
end

addEvent("vipSystem >> manager render", true);
addEventHandler("vipSystem >> manager render", root,
    function()
        if (not resource.state) then
            onLoadInfos();
            addEventHandler("onClientRender", root, onPanelVipRender);
            others.managerHud(localPlayer, false);
            onLoadScrollList(1);
            showCursor(true);
            onLoadLibs(true);
            showChat(false);
        else
            setTimer(
                function()
                    removeEventHandler("onClientRender", root, onPanelVipRender);
                    others.managerHud(localPlayer, true);
                    resource.state = false;
                    onLoadLibs(false);
                    showCursor(false);
                    showChat(true);
                end,
            800, 1);

           resource['transition'].tickCount = getTickCount();
           resource['transition'].alpha = {255, 0};
        end
    end
);

addEventHandler("onClientClick", root,
    function(button, state)
        if (resource.state) then
            if (button == "left" and state == "down") then
                if (isCursorOnElement(302, 273, 110, 20)) then playSoundFrontEnd(41); onLoadScrollList(1); resource.index = 1;
                elseif (isCursorOnElement(302, 300, 110, 20)) then playSoundFrontEnd(41); onLoadScrollList(2); resource.index = 2;
                elseif (isCursorOnElement(302, 327, 110, 20)) then playSoundFrontEnd(41); onLoadScrollList(3); resource.index = 3;
                elseif (isCursorOnElement(302, 354, 110, 20)) then playSoundFrontEnd(41); onLoadScrollList(4); resource.index = 4;
                elseif (isCursorOnElement(280, 586, 122, 49)) then triggerServerEvent("vipSystem >> get salary", localPlayer, localPlayer, {['index'] = resource.index, ['vip'] = system['vips'][resource.index]}); 
                end
            end
        end
    end
);

addEventHandler("onClientDoubleClick", root,
    function(button, state)
        if (resource.state) then
            if (button == "left") then
                if (isCursorOnElement(430, 273, 315, 171)) then
                    for i = 1, resource['scroll'].max do
                        local vehicle = resource['scroll']['list']['vehicles'][i + resource['scroll']['page'].vehicles];
                        if (vehicle) then
                            local posY = (304 + 35 * i - 35);
                            if (isCursorOnElement(431, posY, 313, 35)) then
                                triggerServerEvent("vipSystem >> get vehicle", localPlayer, localPlayer, {['index'] = resource.index, ['item'] = vehicle, ['vip'] = system['vips'][resource.index]});
                                break;
                            end
                        end
                    end

                elseif (isCursorOnElement(765, 273, 315, 171)) then
                    for i = 1, resource['scroll'].max do
                        local weapon = resource['scroll']['list']['weapons'][i + resource['scroll']['page'].weapons];
                        if (weapon) then
                            local posY = (304 + 35 * i - 35);
                            if (isCursorOnElement(765, posY, 313, 35)) then
                                triggerServerEvent("vipSystem >> get weapon", localPlayer, localPlayer, {['index'] = resource.index, ['item'] = weapon, ['vip'] = system['vips'][resource.index]});
                                break;
                            end
                        end
                    end

                elseif (isCursorOnElement(430, 464, 290, 171)) then
                    for i = 1, resource['scroll'].max do
                        local person = resource['scroll']['list']['weapons'][i + resource['scroll']['page'].persons];
                        if (person) then
                            local posY = (495 + 35 * i - 35);
                            if (isCursorOnElement(431, posY, 288, 35)) then
                                triggerServerEvent("vipSystem >> get person", localPlayer, localPlayer, {['index'] = resource.index, ['item'] = person, ['vip'] = system['vips'][resource.index]});
                                break;
                            end
                        end
                    end

                elseif (isCursorOnElement(740, 464, 340, 171)) then
                    for i = 1, resource['scroll'].max do
                        local other = resource['scroll']['list']['others'][i + resource['scroll']['page'].others];
                        if (other) then
                            local posY = (495 + 35 * i - 35);
                            if (isCursorOnElement(741, posY, 338, 35)) then
                                triggerServerEvent("vipSystem >> get other", localPlayer, localPlayer, {['index'] = resource.index, ['item'] = other, ['vip'] = system['vips'][resource.index]});
                                break;
                            end
                        end
                    end
                end
            end
        end
    end
);

addEventHandler("onClientKey", root,
    function(button, state)
        if (resource.state) then
            if (button == "backspace" and state) then
                triggerEvent("vipSystem >> manager render", localPlayer);
            end
            
            if (isCursorOnElement(430, 273, 315, 171)) then
                if (button == "mouse_wheel_up" and state) then
                    if resource['scroll']['page'].vehicles > 0 then
                        resource['scroll']['page'].vehicles = (resource['scroll']['page'].vehicles - 1);
                    end
                    
                elseif (button == "mouse_wheel_down" and state) then
                    if (#resource['scroll']['list'].vehicles - resource['scroll'].max) > 0 then
                        resource['scroll']['page'].vehicles = (resource['scroll']['page'].vehicles + 1); 
                        if (resource['scroll']['page'].vehicles > (#resource['scroll']['list'].vehicles - resource['scroll'].max)) then
                            resource['scroll']['page'].vehicles = (#resource['scroll']['list'].vehicles - resource['scroll'].max)
                        end
                    end
                end

            elseif (isCursorOnElement(765, 273, 315, 171)) then
                if (button == "mouse_wheel_up" and state) then
                    if resource['scroll']['page'].weapons > 0 then
                        resource['scroll']['page'].weapons = (resource['scroll']['page'].weapons - 1);
                    end
                    
                elseif (button == "mouse_wheel_down" and state) then
                    if (#resource['scroll']['list'].weapons - resource['scroll'].max) > 0 then
                        resource['scroll']['page'].weapons = (resource['scroll']['page'].weapons + 1); 
                        if (resource['scroll']['page'].weapons > (#resource['scroll']['list'].weapons - resource['scroll'].max)) then
                            resource['scroll']['page'].weapons = (#resource['scroll']['list'].weapons - resource['scroll'].max)
                        end
                    end
                end

            elseif (isCursorOnElement(430, 464, 290, 171)) then
                if (button == "mouse_wheel_up" and state) then
                    if resource['scroll']['page'].persons > 0 then
                        resource['scroll']['page'].persons = (resource['scroll']['page'].persons - 1);
                    end
                    
                elseif (button == "mouse_wheel_down" and state) then
                    if (#resource['scroll']['list'].persons  - resource['scroll'].max) > 0 then
                        resource['scroll']['page'].persons = (resource['scroll']['page'].persons + 1); 
                        if (resource['scroll']['page'].persons > (#resource['scroll']['list'].persons - resource['scroll'].max)) then
                            resource['scroll']['page'].persons = (#resource['scroll']['list'].persons - resource['scroll'].max)
                        end
                    end
                end

            elseif (isCursorOnElement(740, 464, 340, 171)) then
                if (button == "mouse_wheel_up" and state) then
                    if resource['scroll']['page'].others > 0 then
                        resource['scroll']['page'].others = (resource['scroll']['page'].others - 1);
                    end
                    
                elseif (button == "mouse_wheel_down" and state) then
                    if (#resource['scroll']['list'].others - resource['scroll'].max) > 0 then
                        resource['scroll']['page'].others = (resource['scroll']['page'].others + 1); 
                        if (resource['scroll']['page'].others > (#resource['scroll']['list'].others - resource['scroll'].max)) then
                            resource['scroll']['page'].others = (#resource['scroll']['list'].others - resource['scroll'].max)
                        end
                    end
                end
            end
        end
    end
);

--------------
-- VEHICLES --
--------------

local vHeadLightRainbow = {};
local vRainbow = {};

function onVehicleHeadLightRainbow()
    for _, player in pairs(getElementsByType("player")) do
        local vehicle = getPedOccupiedVehicle(player)
        if (vehicle) then
            if (getPedOccupiedVehicleSeat(localPlayer) == 0) then
                if (not vHeadLightRainbow[player]) then
                    vHeadLightRainbow[player] = 0
                    return
                end

                local r, g, b = getVehicleHeadLightColor(vehicle, true)
                if (vHeadLightRainbow[player] == 0) then
                    if (r < 250)  then
                        r = (r + 3)

                        if (r > 255) then
                            r = 250
                        end
                    else
                        vHeadLightRainbow[player] = 1
                    end
                end
                
                if (vHeadLightRainbow[player] == 1) then
                    if (g < 250) then
                        g = (g + 3)
                    else
                        vHeadLightRainbow[player] = 2
                    end

                elseif (vHeadLightRainbow[player] == 2) then
                    if (b < 255) then
                        if (r > 0) then
                            r = (r - 3)
                        else
                            r = 0
                        end

                        b = (b + 3)
                        if (b > 255) then
                            b = 255
                        end
                    else
                        vHeadLightRainbow[player] = 3
                    end

                elseif (vHeadLightRainbow[player] == 3) then
                    if (g > 0) then
                        if (r > 0) then
                            r = (r - 3)
                        else
                            r = 0
                        end

                        g = (g - 3)
                        if (g < 0) then
                            g = 0
                        end
                    else
                        vHeadLightRainbow[player] = 4
                    end

                elseif (vHeadLightRainbow[player] == 4) then
                    if (b > 0) then
                        b = (b - 3)
                        if (b < 0) then
                            b = 0
                        end
                    else
                        vHeadLightRainbow[player] = 0
                        b = 0
                    end
                end

                if (r < 0) then r = 0 end
                if (g < 0) then g = 0 end
                if (b < 0) then b = 0 end
                setVehicleHeadLightColor(vehicle, r, g, b)
            end
        end
    end
end

function onVehicleRainbow()
    for _, player in pairs(getElementsByType("player")) do
        local vehicle = getPedOccupiedVehicle(player)
        if (vehicle) then
            if (getPedOccupiedVehicleSeat(localPlayer) == 0) then
                if (not vRainbow[player]) then
                    vRainbow[player] = 0
                    return
                end

                local r, g, b = getVehicleColor(vehicle, true)
                if (vRainbow[player] == 0) then
                    if (r < 250)  then
                        r = (r + 3)

                        if (r > 255) then
                            r = 250
                        end
                    else
                        vRainbow[player] = 1
                    end
                end
                
                if (vRainbow[player] == 1) then
                    if (g < 250) then
                        g = (g + 3)
                    else
                        vRainbow[player] = 2
                    end

                elseif (vRainbow[player] == 2) then
                    if (b < 255) then
                        if (r > 0) then
                            r = (r - 3)
                        else
                            r = 0
                        end

                        b = (b + 3)
                        if (b > 255) then
                            b = 255
                        end
                    else
                        vRainbow[player] = 3
                    end

                elseif (vRainbow[player] == 3) then
                    if (g > 0) then
                        if (r > 0) then
                            r = (r - 3)
                        else
                            r = 0
                        end

                        g = (g - 3)
                        if (g < 0) then
                            g = 0
                        end
                    else
                        vRainbow[player] = 4
                    end

                elseif (vRainbow[player] == 4) then
                    if (b > 0) then
                        b = (b - 3)
                        if (b < 0) then
                            b = 0
                        end
                    else
                        vRainbow[player] = 0
                        b = 0
                    end
                end

                if (r < 0) then r = 0 end
                if (g < 0) then g = 0 end
                if (b < 0) then b = 0 end
                setVehicleColor(vehicle, r, g, b)
            end
        end
    end
end

addEvent("vipSystem >> start color", true)
addEventHandler("vipSystem >> start color", root, 
    function()
        if (not isEventHandlerAdded("onClientPreRender", root, onVehicleRainbow)) then
            addEventHandler("onClientPreRender", root, onVehicleRainbow);
        end
    end
);

addEvent("vipSystem >> stop color", true)
addEventHandler("vipSystem >> stop color", root, 
    function()
        if (isEventHandlerAdded("onClientPreRender", root, onVehicleRainbow)) then
            removeEventHandler("onClientPreRender", root, onVehicleRainbow);
        end
    end
);

addEvent("vipSystem >> start headlight", true)
addEventHandler("vipSystem >> start headlight", root, 
    function()
        if (not isEventHandlerAdded("onClientPreRender", root, onVehicleHeadLightRainbow)) then
            addEventHandler("onClientPreRender", root, onVehicleHeadLightRainbow);
        end
    end
);

addEvent("vipSystem >> stop headlight", true)
addEventHandler("vipSystem >> stop headlight", root, 
    function()
        if (isEventHandlerAdded("onClientPreRender", root, onVehicleHeadLightRainbow)) then
            removeEventHandler("onClientPreRender", root, onVehicleHeadLightRainbow);
        end
    end
);



--[[


    ██████╗  ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗██╗   ██╗
    ██╔══██╗██╔═══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝██║   ██║
    ██████╔╝██║   ██║██╔████╔██║███████║██╔██╗ ██║██║  ██║█████╗  ██║   ██║
    ██╔══██╗██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║██╔══╝  ╚██╗ ██╔╝
    ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████╗ ╚████╔╝ 
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ╚═══╝  


]]--
