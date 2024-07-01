local resource = {
    ["data"] = {};
    ["time"] = {};
    ["timer"] = {};
    ["state"] = true;
    ["finish"] = false;
    ["actualTime"] = {};
}

local client = {
    ["visible"] = false;

    ["fonts"] = {
        [1] = dxCreateFont("assets/fonts/Roboto-Regular.ttf", 9);
        [2] = dxCreateFont("assets/fonts/Roboto-Medium.ttf", 10);
        [3] = dxCreateFont("assets/fonts/Roboto-Regular.ttf", 6);
        [4] = dxCreateFont("assets/fonts/Roboto-Regular.ttf", 7);
    };
};

local function onClientRenderPrison()
    dxDrawImage(541, 586, 284, 106, "assets/gfx/bg_prison.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawText("Punicao in game", 563, 597, 92, 19, tocolor(255, 255, 255, 255), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)

    dxDrawImage(563, 624, 22, 22, "assets/gfx/icon_clock.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    
    if resource.data then
        local timeLeft = resource.data["timeLeft"]

        if timeLeft then
            if timeLeft <= 0 then
                removeEventHandler("onClientRender", root, onClientRenderPrison)
                client["visible"] = false
                triggerServerEvent("squady.prisonFinish", localPlayer)
            else
                local days = math.floor(timeLeft / (24 * 3600))
                local hours = math.floor((timeLeft % (24 * 3600)) / 3600)
                local minutes = math.floor((timeLeft % 3600) / 60)
                local seconds = math.floor(timeLeft % 60)

                dxDrawText("Tempo restante: #0E9EF7"..days.."d, #0E9EF7"..hours.."h, #0E9EF7"..minutes.."m, #0E9EF7"..seconds.."s", 596, 627, 200, 200, tocolor(255, 255, 255, 255), 1.0, client["fonts"][1], "left", "top", false, false, true, true, false)
            end
        else
            dxDrawText("Tempo: Indefinido", 596, 627, 200, 200, tocolor(255, 255, 255, 255), 1.0, client["fonts"][1], "left", "top", false, true, true, false, false)
        end
    end

    dxDrawImage(563, 661, 17, 17.85, "assets/gfx/icon_terms.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawText("Voce foi punido in game, aguarde dentro da\ncidade para que o tempo possa diminuir.", 589, 658, 211, 24, tocolor(239, 239, 239, 255), 1.0, client["fonts"][4], "left", "top", false, false, true, false, false)
end

local function updateTimeLeft()
    if resource.data and resource.data["timeLeft"] then
        resource.data["timeLeft"] = resource.data["timeLeft"] - 1
    end
end
setTimer(updateTimeLeft, 1000, 0)

addEvent("squady.prisonData", true)
addEventHandler("squady.prisonData", getRootElement(), function(data)
    resource.data = data
    client["visible"] = true
end)

addEvent("squady.prisonRender", true)
addEventHandler("squady.prisonRender", getRootElement(), function()
    if not client["visible"] then 
        addEventHandler("onClientRender", root, onClientRenderPrison)
    end
end)

addEvent("squady.prisonRender-remove", true)
addEventHandler("squady.prisonRender-remove", getRootElement(), function()
    if client["visible"] then 
        removeEventHandler("onClientRender", root, onClientRenderPrison)
    end
end)

addEventHandler("onClientPlayerDamage", getRootElement(), function()
    if (getElementData(source, "admin.prison")) then 
        cancelEvent()
        return
    end
end)