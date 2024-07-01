
resource = 
{
    ['libs'] = {},
    ['data'] = {},
    ['queue'] = {},        
    ['sound'] = {},

    ['state'] = false,

    ['transition'] =
    {
        ['alpha'] = {0, 255},
        ['tickCount'] = getTickCount()
    }
};

local function onPanelRender()
    if (resource.state) then
        local alpha = interpolateBetween(resource['transition']['alpha'][1], 0, 0, resource['transition']['alpha'][2], 0, 0, ((getTickCount() - resource['transition'].tickCount) / 800), "Linear");
        dxDrawText(formatString(system['active']['screen'].message,
            {
                ['${product}'] = resource['data'].product,
                ['${user}'] = getPlayerName(resource['data'].player),
                ['${id}'] = others.getPlayerID(resource['data'].player)
            }
        ), 0, 0, 1360, 100, tocolor(255, 255, 255, alpha), 1.00, resource['libs']['fonts'][1], "center", "center", false, false, true, true, false)
    end
end

local function onLoadLibs(state)
    if (state) then
        resource.libs =
        {
            ['fonts'] = 
            {
                [1] = dxCreateFont("assets/archives/fonts/montserrat-bold.ttf", 18);
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

addEvent("vipSystem >> active >> start render", true);
addEventHandler("vipSystem >> active >> start render", root,
    function(player, product, sound)
        if (not resource.state) then            
            setTimer(triggerEvent, 15 * 1000, 1, "vipSystem >> active >> stop render", localPlayer);
            resource.transition = {['alpha'] = {0, 255}, ['tickCount'] = getTickCount()}
            resource.sound = playSound(system['musics'][sound].path, true);
            setSoundVolume(resource.sound, system['musics'][sound].volume);
            resource.data = {['player'] = player, ['product'] = product};
            addEventHandler("onClientRender", root, onPanelRender);
            resource.state = true;
            onLoadLibs(true);
        else
            table.insert(resource.queue, 
                {
                    ['sound'] = sound,
                    ['player'] = player,
                    ['product'] = product
                }
            );
        end
    end
);

addEvent("vipSystem >> active >> stop render", true);
addEventHandler("vipSystem >> active >> stop render", root,
    function()
        if (resource.state) then
            setTimer(
                function()
                    removeEventHandler("onClientRender", root, onPanelRender);
                    resource.state = false;
                    onLoadLibs(false);

                    if (resource.sound and isElement(resource.sound)) then
                        destroyElement(resource.sound);
                        resource.sound = nil;
                    end

                    if (#resource.queue > 0) then
                        triggerEvent("vipSystem >> active >> start render", localPlayer, resource['queue'][1].player, resource['queue'][1].product, resource['queue'][1].sound);
                        table.remove(resource.queue, 1);
                    end
                end,
            800, 1);

           resource['transition'].tickCount = getTickCount();
           resource['transition'].alpha = {255, 0};
        end
    end
);

-----

jogador = {};

local function onPanelRenderToPlayer()
    if (jogador.state) then
        local alpha = interpolateBetween(jogador['transition']['alpha'][1], 0, 0, jogador['transition']['alpha'][2], 0, 0, ((getTickCount() - jogador['transition'].tickCount) / 800), "Linear");

        dxDrawImage(0, 0, 1360, 768, "assets/archives/imgs/player/active.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawText(formatString(getSystemLanguage("product activated user"), 
            {
                ['${user}'] = getPlayerName(jogador['data'].player)
            }
        ), 0, 248, 1360, 196, tocolor(255, 255, 255, alpha), 1.00, jogador['libs']['fonts'][2], "center", "center", false, false, true, true, false)

        dxDrawText(formatString(getSystemLanguage("product activated product"), 
            {
                ['${product}'] = jogador['data'].product
            }
        ), 0, 293, 1360, 196, tocolor(255, 255, 255, alpha), 1.00, jogador['libs']['fonts'][1], "center", "center", false, false, true, true, false)
    end
end

local function onLoadPlayerInfos()
    jogador = 
    {
        ['libs'] = {},
        ['data'] = {},

        ['state'] = true,

        ['transition'] =
        {
            ['alpha'] = {0, 255},
            ['tickCount'] = getTickCount()
        }
    }
end

local function onLoadPlayerLibs(state)
    if (state) then
        jogador.libs =
        {
            ['fonts'] = 
            {
                [2] = dxCreateFont("assets/archives/fonts/montserrat-bold.ttf", 46);
                [1] = dxCreateFont("assets/archives/fonts/montserrat-bold.ttf", 24)
            }
        };
    else
        for index, array in pairs(jogador.libs) do
            for k, v in ipairs(array) do
                if (type(v) == "table") then
                    destroyElement(v[2]);
                    break;
                end
                destroyElement(v);
            end
        end
        jogador.libs = {};
    end
end

addEvent("vipSystem >> active >> player >> start render", true);
addEventHandler("vipSystem >> active >> player >> start render", root,
    function(player, product)
        if (not jogador.state) then
            onLoadPlayerInfos();
            setTimer(triggerEvent, 15 * 1000, 1, "vipSystem >> active >> player >> stop render", localPlayer);
            addEventHandler("onClientRender", root, onPanelRenderToPlayer);
            jogador.data = {['player'] = player, ['product'] = product};
            others.managerHud(localPlayer, false);
            onLoadPlayerLibs(true);
            showChat(false);
        end
    end
);

addEvent("vipSystem >> active >> player >> stop render", true);
addEventHandler("vipSystem >> active >> player >> stop render", root,
    function()
        setTimer(
            function()
                removeEventHandler("onClientRender", root, onPanelRenderToPlayer);
                others.managerHud(localPlayer, true);
                onLoadPlayerLibs(false);
                jogador.state = false;
                showChat(true);
            end,
        800, 1);

        jogador['transition'].tickCount = getTickCount();
        jogador['transition'].alpha = {255, 0};
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

