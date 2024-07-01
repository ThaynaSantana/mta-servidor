
local resource = {};

local function onPanelManagerRender()
    if (resource.state) then
        local alpha = interpolateBetween(resource['transition']['alpha'][1], 0, 0, resource['transition']['alpha'][2], 0, 0, ((getTickCount() - resource['transition'].tickCount) / 800), "Linear");
        dxDrawImage(0, 0, 1360, 768, "assets/archives/imgs/background.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        
        if (resource.window == "home") then
            dxDrawImage(395, 144, 570, 479, "assets/archives/imgs/manager/manager-list.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
            
            dxDrawText(getSystemLanguage("window manager"), 425, 169, 125, 37, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][1], "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("window keys"), 550, 169, 125, 37, (isCursorOnElement(550, 169, 125, 37) and tocolor(255, 255, 255, alpha) or tocolor(82, 82, 82, alpha)), 1.00, (isCursorOnElement(550, 169, 125, 37) and resource['libs']['fonts'][1] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("button rem vip"), 645, 563, 140, 35, (isCursorOnElement(645, 563, 140, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(645, 563, 140, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("button add vip"), 795, 563, 140, 35, (isCursorOnElement(795, 563, 140, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(795, 563, 140, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            
            if (resource['libs']['edits'][1][1] and isElement(resource['libs']['edits'][1][2])) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or "").."|", 462, 563, 158, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            elseif (#guiGetText(resource['libs']['edits'][1][2]) >= 1) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or ""), 462, 563, 158, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            else dxDrawText("Search account...", 462, 563, 158, 35, tocolor(84, 84, 84, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)  end
            
            for i = 1, resource['scroll'].max do
                local list = resource['scroll']['list'][i + resource['scroll'].page];
                if (list) then
                    local posY = (278 + 30 * i - 30);
                    dxDrawRectangle(425, posY, 510, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(146, 51, 51, alpha) or tocolor(255, 255, 255, 0)), true)
                    dxDrawText(list.id, 439, posY, 35, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.finish, 734, posY, 80, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.product, 505, posY, 90, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.account, 613, posY, 90, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.duration, 845, posY, 85, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                end
            end
        elseif (resource.window == "add-vip") then
            dxDrawImage(395, 144, 570, 479, "assets/archives/imgs/manager/add-vip.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)

            dxDrawText(getSystemLanguage("add vip title"), 475, 302, 195, 35, tocolor(153, 153, 153, alpha), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("window manager"), 425, 169, 125, 37, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][1], "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("window keys"), 550, 169, 125, 37, (isCursorOnElement(550, 169, 125, 37) and tocolor(255, 255, 255, alpha) or tocolor(82, 82, 82, alpha)), 1.00, (isCursorOnElement(550, 169, 125, 37) and resource['libs']['fonts'][1] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)

            dxDrawRectangle(475, 337, 195, 31, (resource.add_vip == 1 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawRectangle(475, 369, 195, 31, (resource.add_vip == 2 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawRectangle(475, 401, 195, 31, (resource.add_vip == 3 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawRectangle(475, 433, 195, 31, (resource.add_vip == 4 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawText(system['vips'][1].name, 475, 337, 195, 31, (resource.add_vip == 1 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(system['vips'][2].name, 475, 369, 195, 31, (resource.add_vip == 2 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(system['vips'][3].name, 475, 401, 195, 31, (resource.add_vip == 3 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(system['vips'][4].name, 475, 433, 195, 31, (resource.add_vip == 4 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)

            dxDrawText(getSystemLanguage("add vip button add"), 690, 390, 195, 35, (isCursorOnElement(690, 390, 195, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(690, 390, 195, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("add vip button cancel"), 690, 430, 195, 35, (isCursorOnElement(690, 430, 195, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(690, 430, 195, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)

            if (resource['libs']['edits'][1][1] and isElement(resource['libs']['edits'][1][2])) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or "").."|", 700, 302, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            elseif (#guiGetText(resource['libs']['edits'][1][2]) >= 1) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or ""), 700, 302, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            else dxDrawText(getSystemLanguage("add vip edit id"), 700, 302, 185, 35, tocolor(84, 84, 84, alpha), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)  end

            if (resource['libs']['edits'][2][1] and isElement(resource['libs']['edits'][2][2])) then dxDrawText((guiGetText(resource['libs']['edits'][2][2]) or "").."|", 700, 346, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            elseif (#guiGetText(resource['libs']['edits'][2][2]) >= 1) then dxDrawText((guiGetText(resource['libs']['edits'][2][2]) or ""), 700, 346, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            else dxDrawText(getSystemLanguage("add vip edit duration"), 700, 346, 185, 35, tocolor(84, 84, 84, alpha), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)  end

            -- -- -- --
            --  KEYS --
            -- -- -- --

        elseif (resource.window == "keys") then
            dxDrawImage(395, 144, 570, 479, "assets/archives/imgs/keys/keys-list.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
            
            dxDrawText(getSystemLanguage("window keys"), 550, 169, 125, 37, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][1], "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("window manager"), 425, 169, 125, 37, (isCursorOnElement(425, 169, 125, 37) and tocolor(255, 255, 255, alpha) or tocolor(82, 82, 82, alpha)), 1.00, (isCursorOnElement(425, 169, 125, 37) and resource['libs']['fonts'][1] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)

            dxDrawText(getSystemLanguage("button rem key"), 645, 563, 140, 35, (isCursorOnElement(645, 563, 140, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(645, 563, 140, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("button add key"), 795, 563, 140, 35, (isCursorOnElement(795, 563, 140, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(795, 563, 140, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            
            if (resource['libs']['edits'][1][1] and isElement(resource['libs']['edits'][1][2])) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or "").."|", 462, 563, 158, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            elseif (#guiGetText(resource['libs']['edits'][1][2]) >= 1) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or ""), 462, 563, 158, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            else dxDrawText("Search key...", 462, 563, 158, 35, tocolor(84, 84, 84, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)  end
            
            for i = 1, resource['scroll'].max do
                local list = resource['scroll']['list'][i + resource['scroll'].page];
                if (list) then
                    local posY = (278 + 30 * i - 30);
                    dxDrawRectangle(425, posY, 510, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(146, 51, 51, alpha) or tocolor(255, 255, 255, 0)), true)
                    dxDrawText(list.vip, 425, posY, 148, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.key, 565, posY, 100, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.created, 708, posY, 75, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                    dxDrawText(list.duration, 820, posY, 70, 30, ((i + resource['scroll'].page) == resource['scroll'].selected and tocolor(255, 255, 255, alpha) or tocolor(122, 122, 122, alpha)), 1.00, ((i + resource['scroll'].page) == resource['scroll'].selected and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
                end
            end
        elseif (resource.window == "add-key") then
            dxDrawImage(395, 144, 570, 479, "assets/archives/imgs/keys/add-key.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)

            dxDrawText(getSystemLanguage("add key title"), 475, 302, 195, 35, tocolor(153, 153, 153, alpha), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("window keys"), 550, 169, 125, 37, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][1], "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("window manager"), 425, 169, 125, 37, (isCursorOnElement(425, 169, 125, 37) and tocolor(255, 255, 255, alpha) or tocolor(82, 82, 82, alpha)), 1.00, (isCursorOnElement(425, 169, 125, 37) and resource['libs']['fonts'][1] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)

            dxDrawRectangle(475, 337, 195, 31, (resource.add_vip == 1 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawRectangle(475, 369, 195, 31, (resource.add_vip == 2 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawRectangle(475, 401, 195, 31, (resource.add_vip == 3 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawRectangle(475, 433, 195, 31, (resource.add_vip == 4 and tocolor(146, 51, 51, alpha) or tocolor(0, 0, 0, 0)), true)
            dxDrawText(system['vips'][1].name, 475, 337, 195, 31, (resource.add_vip == 1 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(system['vips'][2].name, 475, 369, 195, 31, (resource.add_vip == 2 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(system['vips'][3].name, 475, 401, 195, 31, (resource.add_vip == 3 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)
            dxDrawText(system['vips'][4].name, 475, 433, 195, 31, (resource.add_vip == 4 and tocolor(255, 255, 255, alpha) or tocolor(153, 153, 153, alpha)), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)

            dxDrawText(getSystemLanguage("add key button add"), 690, 390, 195, 35, (isCursorOnElement(690, 390, 195, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(690, 390, 195, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)
            dxDrawText(getSystemLanguage("add key button cancel"), 690, 430, 195, 35, (isCursorOnElement(690, 430, 195, 35) and tocolor(255, 255, 255, alpha) or tocolor(84, 84, 84, alpha)), 1.00, (isCursorOnElement(690, 430, 195, 35) and resource['libs']['fonts'][3] or resource['libs']['fonts'][2]), "center", "center", false, false, true, false, false)

            if (resource['libs']['edits'][1][1] and isElement(resource['libs']['edits'][1][2])) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or "").."|", 700, 302, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            elseif (#guiGetText(resource['libs']['edits'][1][2]) >= 1) then dxDrawText((guiGetText(resource['libs']['edits'][1][2]) or ""), 700, 302, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            else dxDrawText(getSystemLanguage("add key edit key"), 700, 302, 185, 35, tocolor(84, 84, 84, alpha), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)  end

            if (resource['libs']['edits'][2][1] and isElement(resource['libs']['edits'][2][2])) then dxDrawText((guiGetText(resource['libs']['edits'][2][2]) or "").."|", 700, 346, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            elseif (#guiGetText(resource['libs']['edits'][2][2]) >= 1) then dxDrawText((guiGetText(resource['libs']['edits'][2][2]) or ""), 700, 346, 185, 35, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][2], "left", "center", false, false, true, false, false)
            else dxDrawText(getSystemLanguage("add key edit duration"), 700, 346, 185, 35, tocolor(84, 84, 84, alpha), 1.00, resource['libs']['fonts'][2], "center", "center", false, false, true, false, false)  end
        end
    end
end

local function isEditBoxActive()
    for k = 1, #resource['libs'].edits do
        if (resource['libs']['edits'][k][1]) then
            return true;
        end
    end
    return false;
end

function onSearchBuys()
    if (resource.state) then
        resource['scroll'].list = {};
        if (resource.window == "home") then
            if (#guiGetText(resource['libs']['edits'][1][2]) > 0) then
                for k, v in ipairs(resource['data'].vip) do
                    if (string.lower(v.id):find(guiGetText(resource['libs']['edits'][1][2]):lower()) or string.lower(v.account):find(guiGetText(resource['libs']['edits'][1][2]):lower())) then
                        table.insert(resource['scroll'].list, v);
                        resource['scroll'].selected = 0;
                        resource['scroll'].page = 0;
                    end
                end
            else
                resource['scroll'].list = resource['data'].vip;
                resource['scroll'].selected = 0;
                resource['scroll'].page = 0;
            end
        elseif (resource.window == "keys") then
            if (#guiGetText(resource['libs']['edits'][1][2]) > 0) then
                for k, v in ipairs(resource['data'].keys) do
                    if (string.lower(v.vip):find(guiGetText(resource['libs']['edits'][1][2]):lower()) or string.lower(v.key):find(guiGetText(resource['libs']['edits'][1][2]):lower())) then
                        table.insert(resource['scroll'].list, v);
                        resource['scroll'].selected = 0;
                        resource['scroll'].page = 0;
                    end
                end
            else
                resource['scroll'].list = resource['data'].keys;
                resource['scroll'].selected = 0;
                resource['scroll'].page = 0;
            end
        end
    end
end

local function onLoadInfos()
    resource = 
    {
        ['libs'] = {},
        ['data'] = {},

        ['state'] = true,
        ['window'] = "home",

        ['add_vip'] = 0,

        ['transition'] =
        {
            ['alpha'] = {0, 255},
            ['tickCount'] = getTickCount()
        },

        ['scroll'] =
        {
            ['max'] = 12,
            ['page']= 0,
            ['list'] = {},
            ['selected'] = 0
        }
    };
end

local function onLoadLibs(state)
    if (state) then
        resource.libs =
        {
            ['fonts'] = 
            {
                [2] = dxCreateFont("assets/archives/fonts/sf-ui-display-regular.ttf", 11),
                [3] = dxCreateFont("assets/archives/fonts/sf-ui-display-medium.ttf", 11),
                [1] = dxCreateFont("assets/archives/fonts/sf-ui-display-bold.ttf", 11),
            },

            ['edits'] =
            {
                [1] = {false, guiCreateEdit(1000, 1000, 0, 0, "", false)},
                [2] = {false, guiCreateEdit(1000, 1000, 0, 0, "", false)}
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

addEvent("vipManager >> manager render", true);
addEventHandler("vipManager >> manager render", root,
    function()
        if (not resource.state) then
            onLoadInfos();
            addEventHandler("onClientRender", root, onPanelManagerRender);
            others.managerHud(localPlayer, false);
            showCursor(true);
            onLoadLibs(true);
            showChat(false);
        else
            setTimer(
                function()
                    removeEventHandler("onClientRender", root, onPanelManagerRender);
                    others.managerHud(localPlayer, true);
                    resource.state = false;
                    onLoadLibs(false);
                    showCursor(false);
                    showChat(true);
                end,
            800, 1);

           resource['transition'].tickCount = getTickCount();
           resource['transition'].alpha = {255, 0};

            if (isEventHandlerAdded("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys)) then 
                removeEventHandler("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys); 
            end
        end
    end
);

addEvent("vipManager >> manager data", true);
addEventHandler("vipManager >> manager data", root,
    function(data)
        if (resource.state) then
            resource['scroll'].list = data.vip;
            resource.data = data;
        end
    end
);

addEventHandler("onClientClick", root,
    function(button, state)
        if (resource.state) then
            if (button == "left" and state == "down") then
                resource['libs']['edits'][1][1] = false;
                resource['libs']['edits'][2][1] = false;
                if (isEventHandlerAdded("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys)) then 
                    removeEventHandler("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys); 
                end

                if (isCursorOnElement(912, 177, 23, 23)) then
                    triggerEvent("vipManager >> manager render", localPlayer);
                end

                if (resource.window == "home") then
                    if (isCursorOnElement(550, 169, 125, 37)) then
                        guiSetText(resource['libs']['edits'][1][2], "");
                        guiSetText(resource['libs']['edits'][2][2], "");
                        resource['scroll'].list = resource['data'].keys;
                        resource['scroll'].selected = 0;
                        resource['scroll'].page = 0;
                        resource.window = "keys";


                    elseif (isCursorOnElement(425, 563, 195, 35)) then
                        if (guiEditSetCaretIndex(resource['libs']['edits'][1][2], (string.len(guiGetText(resource['libs']['edits'][1][2]))))) then
                            guiEditSetMaxLength(resource['libs']['edits'][1][2], 16);
                            guiBringToFront(resource['libs']['edits'][1][2]);
                            guiSetInputMode("no_binds_when_editing");
                            resource['libs']['edits'][1][1] = true;

                            if (not isEventHandlerAdded("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys)) then 
                                addEventHandler("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys); 
                            end
                        end

                    elseif (isCursorOnElement(795, 563, 140, 35)) then
                        guiSetText(resource['libs']['edits'][1][2], "");
                        guiSetText(resource['libs']['edits'][2][2], "");
                        resource.window = "add-vip";
                        resource.add_vip = 0;

                    elseif (isCursorOnElement(645, 563, 140, 35)) then
                        if (resource['scroll'].selected > 0) then
                            local list = resource['scroll']['list'][resource['scroll'].selected];
                            if (list) then
                                triggerServerEvent("vipSystem >> manager >> remove vip", localPlayer, localPlayer, list);
                            end
                        else
                            geral.cNotify(localPlayer, getSystemLanguage("remove vip warning select"), "warning");
                        end
                    else
                        for i = 1, resource['scroll'].max do
                            local list = resource['scroll']['list'][i + resource['scroll'].page];
                            if (list) then
                                local posY = (278 + 30 * i - 30);
                                if (isCursorOnElement(425, posY, 510, 30)) then
                                    resource['scroll'].selected = (i + resource['scroll'].page);
                                    break;
                                end
                            end
                        end
                    end
                elseif (resource.window == "add-vip") then
                    if (isCursorOnElement(475, 337, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 1;

                    elseif (isCursorOnElement(475, 369, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 2;

                    elseif (isCursorOnElement(475, 401, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 3;

                    elseif (isCursorOnElement(475, 433, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 4;

                    elseif (isCursorOnElement(690, 302, 195, 35)) then
                        if (guiEditSetCaretIndex(resource['libs']['edits'][1][2], (string.len(guiGetText(resource['libs']['edits'][1][2]))))) then
                            guiSetProperty(resource['libs']['edits'][1][2], "ValidationString", "^[0-9]*");
                            guiEditSetMaxLength(resource['libs']['edits'][1][2], 6);
                            guiBringToFront(resource['libs']['edits'][1][2]);
                            guiSetInputMode("no_binds_when_editing");
                            resource['libs']['edits'][1][1] = true;
                        end

                    elseif (isCursorOnElement(690, 346, 195, 35)) then
                        if (guiEditSetCaretIndex(resource['libs']['edits'][2][2], (string.len(guiGetText(resource['libs']['edits'][2][2]))))) then
                            guiSetProperty(resource['libs']['edits'][2][2], "ValidationString", "^[0-9]*");
                            guiEditSetMaxLength(resource['libs']['edits'][2][2], 2);
                            guiBringToFront(resource['libs']['edits'][2][2]);
                            guiSetInputMode("no_binds_when_editing");
                            resource['libs']['edits'][2][1] = true;
                        end

                    elseif (isCursorOnElement(690, 390, 195, 35)) then
                        if (resource.add_vip > 0) then
                            if (#guiGetText(resource['libs']['edits'][1][2]) > 0 and tonumber(guiGetText(resource['libs']['edits'][1][2]))) then
                                if (#guiGetText(resource['libs']['edits'][2][2]) > 0 and tonumber(guiGetText(resource['libs']['edits'][2][2]))) then
                                    triggerServerEvent("vipSystem >> manager >> add vip", localPlayer, localPlayer, {['vip'] = system['vips'][resource.add_vip], ['id'] = tonumber(guiGetText(resource['libs']['edits'][1][2])), ['days'] = tonumber(guiGetText(resource['libs']['edits'][2][2]))});
                                else
                                    geral.cNotify(localPlayer, getSystemLanguage("add vip warning edit"), "warning");
                                end
                            else
                                geral.cNotify(localPlayer, getSystemLanguage("add vip warning edit"), "warning");
                            end
                        else
                            geral.cNotify(localPlayer, getSystemLanguage("add vip warning select"), "warning");
                        end

                    elseif (isCursorOnElement(690, 430, 195, 35)) then
                        guiSetText(resource['libs']['edits'][1][2], "");
                        guiSetText(resource['libs']['edits'][2][2], "");
                        resource['scroll'].selected = 0;
                        resource['scroll'].page = 0;
                        resource.window = "home";
                    end

                -- -- -- --
                --  KEYS --
                -- -- -- --

                elseif (resource.window == "keys") then
                    if (isCursorOnElement(425, 169, 125, 37)) then
                        guiSetText(resource['libs']['edits'][1][2], "");
                        guiSetText(resource['libs']['edits'][2][2], "");
                        resource['scroll'].list = resource['data'].vip;
                        resource['scroll'].selected = 0;
                        resource['scroll'].page = 0;
                        resource.window = "home";


                    elseif (isCursorOnElement(425, 563, 195, 35)) then
                        if (guiEditSetCaretIndex(resource['libs']['edits'][1][2], (string.len(guiGetText(resource['libs']['edits'][1][2]))))) then
                            guiEditSetMaxLength(resource['libs']['edits'][1][2], 16);
                            guiBringToFront(resource['libs']['edits'][1][2]);
                            guiSetInputMode("no_binds_when_editing");
                            resource['libs']['edits'][1][1] = true;

                            if (not isEventHandlerAdded("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys)) then 
                                addEventHandler("onClientGUIChanged", resource['libs']['edits'][1][2], onSearchBuys); 
                            end
                        end

                    elseif (isCursorOnElement(795, 563, 140, 35)) then
                        local key = generateString(12);
                        setClipboard((system['keys-command']).." "..(key));
                        guiSetText(resource['libs']['edits'][1][2], key);
                        guiSetText(resource['libs']['edits'][2][2], "");
                        resource.window = "add-key";
                        resource.add_vip = 0;

                    elseif (isCursorOnElement(645, 563, 140, 35)) then
                        if (resource['scroll'].selected > 0) then
                            local list = resource['scroll']['list'][resource['scroll'].selected];
                            if (list) then
                                triggerServerEvent("vipSystem >> manager >> remove key", localPlayer, localPlayer, list);
                            end
                        else
                            geral.cNotify(localPlayer, getSystemLanguage("remove key warning select"), "warning");
                        end
                    else
                        for i = 1, resource['scroll'].max do
                            local list = resource['scroll']['list'][i + resource['scroll'].page];
                            if (list) then
                                local posY = (278 + 30 * i - 30);
                                if (isCursorOnElement(425, posY, 510, 30)) then
                                    resource['scroll'].selected = (i + resource['scroll'].page);
                                    break;
                                end
                            end
                        end
                    end
                elseif (resource.window == "add-key") then
                    if (isCursorOnElement(475, 337, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 1;

                    elseif (isCursorOnElement(475, 369, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 2;

                    elseif (isCursorOnElement(475, 401, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 3;

                    elseif (isCursorOnElement(475, 433, 195, 31)) then 
                        playSoundFrontEnd(41);
                        resource.add_vip = 4;

                    elseif (isCursorOnElement(690, 346, 195, 35)) then
                        if (guiEditSetCaretIndex(resource['libs']['edits'][2][2], (string.len(guiGetText(resource['libs']['edits'][2][2]))))) then
                            guiSetProperty(resource['libs']['edits'][2][2], "ValidationString", "^[0-9]*");
                            guiEditSetMaxLength(resource['libs']['edits'][2][2], 2);
                            guiBringToFront(resource['libs']['edits'][2][2]);
                            guiSetInputMode("no_binds_when_editing");
                            resource['libs']['edits'][2][1] = true;
                        end

                    elseif (isCursorOnElement(690, 390, 195, 35)) then
                        if (resource.add_vip > 0) then
                            if (#guiGetText(resource['libs']['edits'][1][2]) > 0) then
                                if (#guiGetText(resource['libs']['edits'][2][2]) > 0 and tonumber(guiGetText(resource['libs']['edits'][2][2]))) then
                                    triggerServerEvent("vipSystem >> manager >> add key", localPlayer, localPlayer, {['vip'] = system['vips'][resource.add_vip], ['key'] = guiGetText(resource['libs']['edits'][1][2]), ['days'] = tonumber(guiGetText(resource['libs']['edits'][2][2]))});
                                else
                                    geral.cNotify(localPlayer, getSystemLanguage("add key warning edit"), "warning");
                                end
                            else
                                geral.cNotify(localPlayer, getSystemLanguage("add key warning edit"), "warning");
                            end
                        else
                            geral.cNotify(localPlayer, getSystemLanguage("add key warning select"), "warning");
                        end

                    elseif (isCursorOnElement(690, 430, 195, 35)) then
                        guiSetText(resource['libs']['edits'][1][2], "");
                        guiSetText(resource['libs']['edits'][2][2], "");
                        resource['scroll'].selected = 0;
                        resource['scroll'].page = 0;
                        resource.window = "keys";
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
                if (not isEditBoxActive()) then
                    triggerEvent("vipManager >> manager render", localPlayer);
                end

                if (resource.window == "home") then
                    if (button == "mouse_wheel_up" and state) then
                        if resource['scroll'].page > 0 then
                            resource['scroll'].page = (resource['scroll'].page - 1);
                        end
                        
                    elseif (button == "mouse_wheel_down" and state) then
                        if (#resource['scroll'].list - resource['scroll'].max) > 0 then
                            resource['scroll'].page = (resource['scroll'].page + 1); 
                            if (resource['scroll'].page > (#resource['scroll'].list - resource['scroll'].max)) then
                                resource['scroll'].page = (#resource['scroll'].list - resource['scroll'].max)
                            end
                        end
                    end
                end
            end
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
