local resource = {}
local window = "index"
local banList = {}

local client = {
    ["visible"] = false;
    ["radius"] = {255, 0};
	["tick"] = nil;
    ["button"] = "";
    ["type"] = "";

    ["pag"] = 0;
    ["edits"] = {};
    ["max"] = 5;

    ["edits"] = {
        {false, guiCreateEdit(9999, 9999, 0, 0, "", false)};
        {false, guiCreateEdit(9999, 9999, 0, 0, "", false)};
        {false, guiCreateEdit(9999, 9999, 0, 0, "", false)};
    };
    
    ["selected"] = 0;

    ["fonts"] = {
        [1] = dxCreateFont("assets/fonts/Roboto-Regular.ttf", 9);
        [2] = dxCreateFont("assets/fonts/Roboto-Medium.ttf", 10);
        [3] = dxCreateFont("assets/fonts/Roboto-Regular.ttf", 7);
        [4] = dxCreateFont("assets/fonts/Roboto-Regular.ttf", 8);
    };
};
---------- // \\ ---------
local function onClientRenderPunishment()
    local alpha = interpolateBetween (client["radius"][1], 0, 0, client["radius"][2], 0, 0, (getTickCount ( ) - client["tick"])/300, "Linear")	

    dxDrawImage(528, 189, 309, 391, "assets/gfx/bg.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
    
    if window == "index" then
        dxDrawText("Painel punir", 558, 253, 66, 19, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        dxDrawText("Olá administrador, abaixo busque pelas informações do\nusuário que deseja aplicar uma punição.", 558, 276, 253, 24, tocolor(123, 123, 123, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)

        dxDrawImage(558, 311, 190, 36, "assets/gfx/bg_search.png", 0, 0, 0, tocolor(70, 70, 70, alpha), true)
        dxDrawImage(753, 311, 53, 36, "assets/gfx/bg_icon-search.png", 0, 0, 0, tocolor(70, 70, 70, alpha), true)
        dxDrawRectangle(558, 353, 248, 110, tocolor(54, 54, 54, alpha), true)
        dxDrawImage(672, 383, 22, 20.64, "assets/gfx/icon_identy.png", 0, 0, 0, tocolor(77, 77, 77, alpha), true)
        dxDrawImage(569, 320, 17, 18.7, "assets/gfx/icon_user.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawImage(769, 319, 21, 21, "assets/gfx/icon_list.png", 0, 0, 0, (isCursorOnElement (769, 319, 21, 21) and tocolor (14, 158, 247, alpha) or tocolor (255, 255, 255, alpha)), true)
        dxDrawText("Enter", 710, 321, 28, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "right", "top", false, false, true, false, false)
        dxDrawText("SEM DADOS", 654, 417, 59, 17, tocolor(77, 77, 77, alpha), 1.0, client["fonts"][1], "center", "top", false, false, true, false, false)
        dxDrawImage(557, 481, 17, 17.85, "assets/gfx/icon_terms.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)

        dxDrawText("Aplicar punição sem motivo resultará em restrição a\neste recurso e banimento de nosso servidor/equipe.", 579, 478, 212, 24, tocolor(239, 239, 239, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)
        
        if (client["edits"][1][1] and isElement(client["edits"][1][2])) then 
            dxDrawText((guiGetText(client["edits"][1][2]) or "").."|", 600, 321, 29, 17, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        elseif (#guiGetText(client["edits"][1][2]) >= 1) then 
            dxDrawText((guiGetText(client["edits"][1][2]) or ""), 600, 321, 29, 17, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        else
            dxDrawText("ID/RG", 600, 321, 29, 17, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        end
    end

    if (resource.data) and window == "infos" then
        dxDrawText("Painel punir", 558, 253, 66, 19, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        dxDrawText("Olá administrador, abaixo busque pelas informacoes do\nusuario que deseja aplicar uma punicao.", 558, 276, 253, 24, tocolor(123, 123, 123, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)

        dxDrawRectangle(558, 353, 248, 110, tocolor(54, 54, 54, alpha), true)
        dxDrawImage(558, 311, 190, 36, "assets/gfx/bg_search.png", 0, 0, 0, tocolor(70, 70, 70, alpha), true)
        dxDrawImage(753, 311, 53, 36, "assets/gfx/bg_icon-search.png", 0, 0, 0, tocolor(70, 70, 70, alpha), true)
        dxDrawImage(569, 320, 17, 18.7, "assets/gfx/icon_user.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawImage(569, 320, 17, 18.7, "assets/gfx/icon_user.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawImage(769, 319, 21, 21, "assets/gfx/icon_list.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawText("Enter", 710, 321, 28, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "right", "top", false, false, true, false, false)
        dxDrawImage(557, 481, 17, 17.85, "assets/gfx/icon_terms.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawText("Aplicar punicao sem motivo resultara em restricao a\neste recurso e banimento de nosso servidor/equipe.", 579, 478, 212, 24, tocolor(239, 239, 239, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)
        if (client["edits"][1][1] and isElement(client["edits"][1][2])) then 
            dxDrawText((guiGetText(client["edits"][1][2]) or "").."|", 600, 321, 29, 17, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        elseif (#guiGetText(client["edits"][1][2]) >= 1) then 
            dxDrawText((guiGetText(client["edits"][1][2]) or ""), 600, 321, 29, 17, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        else
            dxDrawText("ID/RG", 600, 321, 29, 17, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        end

        dxDrawImage(784, 361, 10, 10, "assets/gfx/icon_eclipse.png", 0, 0, 0, ((resource["data"].status) == "Online" and tocolor(0, 255, 0, alpha) or tocolor(255, 0, 0, alpha)), true)
        dxDrawText("#FFFFFFNome: #727070"..(resource["data"].acc).." #"..(resource["data"].id).."", 566, 366, 33, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFConta: #727070"..(resource["data"].acc).."", 566, 388, 32, 16, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFStatus: #727070"..(resource["data"].statusB).."", 566, 410, 33, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFPunicoes: #727070"..(resource["data"].punishs).." banimentos.", 566, 433, 33, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawImage(558, 516, 248, 36, "assets/gfx/bg_button.png", 0, 0, 0, (isCursorOnElement (558, 516, 248, 36) and tocolor (14, 158, 247, alpha) or tocolor (54, 54, 54, alpha)), true)
        dxDrawText("CONTINUAR", 558, 527, 248, 19, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "center", "top", false, false, true, false, false)
    end

    if (selecionado) and window == "selecionado" then 
        dxDrawText("Painel punir", 541, 253, 66, 19, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        dxDrawText("Ola administrador, abaixo busque pelas informacoes do\nusuario que deseja aplicar uma punicao.", 541, 276, 253, 24, tocolor(123, 123, 123, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)

        dxDrawRectangle(542, 306, 282, 125, tocolor(54, 54, 54, alpha), true)
        dxDrawRectangle(542, 440, 282, 88, tocolor(54, 54, 54, alpha), true)

        --dxDrawImage(767, 318, 43, 43, ":[MOD]Prefeitura/files/avatars/"..resource["data"].avatar..".png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        dxDrawImage(800, 322, 8, 8, "assets/gfx/icon_eclipse.png", 0, 0, 0, ((resource["data"].status) == "Online" and tocolor(0, 255, 0, alpha) or tocolor(255, 0, 0, alpha)), true)
        dxDrawText("#FFFFFFNome: #727070"..(resource["data"].acc).." #"..(resource["data"].id).."", 551, 318, 114, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFConta: #727070"..(resource["data"].acc).."", 551, 341, 33, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFStatus: #727070"..(resource["data"].statusB).."", 551, 363, 106, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFPunicoes: #727070"..(resource["data"].punishs).." banimentos.", 551, 386, 33, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawText("#FFFFFFSerial: #727070"..(resource["data"].serial).."", 551, 409, 127, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, true, false)
        dxDrawImage(541, 531, 282, 36, "assets/gfx/bg_button.png", 0, 0, 0, (isCursorOnElement (541, 531, 282, 36) and tocolor (14, 158, 247, alpha) or tocolor (54, 54, 54, alpha)), true)
        dxDrawText("PUNIR USUARIO", 637, 541, 90, 20, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "center", "top", false, false, true, false, false)

        dxDrawRectangle(546, 443, 141, 27, (tocolor(60, 60, 63, alpha)), true)
        dxDrawRectangle(696, 443, 28, 27, (client["buttons"] == "M" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)
        dxDrawRectangle(728, 443, 28, 27, (client["buttons"] == "H" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)
        dxDrawRectangle(760, 443, 28, 27, (client["buttons"] == "D" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)
        dxDrawRectangle(793, 443, 28, 27, (client["buttons"] == "P" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)

        dxDrawText("M", 705, 450, 10, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, false, false)
        dxDrawText("H", 738, 450, 10, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, false, false)
        dxDrawText("D", 770, 450, 10, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, false, false)
        dxDrawText("P", 802, 450, 10, 17, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][4], "left", "top", false, false, true, false, false)

        dxDrawRectangle(549, 478, 11, 11, (client["type"] == "Fora" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)
        dxDrawRectangle(637, 478, 11, 11, (client["type"] == "Dentro" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)
        --dxDrawRectangle(736, 478, 11, 11, (client["type"] == "Serial" and tocolor (14, 158, 247, alpha) or tocolor(60, 60, 63, alpha)), true)

        dxDrawText("Fora do jogo.", 564, 477, 58, 15, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)
        dxDrawText("Dentro do jogo.", 653, 477, 58, 15, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)
        --dxDrawText("Serial.", 752, 477, 58, 15, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)

        dxDrawImage(555, 450, 13, 13, "assets/gfx/icon_pen.png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
        
        dxDrawRectangle(546, 497, 96, 27, (tocolor(60, 60, 63, alpha)), true)

        if (client["edits"][2][1] and isElement(client["edits"][2][2])) then    
            dxDrawText((guiGetText(client["edits"][2][2]) or "").."|", 581, 449, 73, 15, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        elseif (#guiGetText(client["edits"][2][2]) >= 1) then 
            dxDrawText((guiGetText(client["edits"][2][2]) or ""), 581, 449, 73, 15, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        else
            dxDrawText("Motivo", 581, 449, 73, 15, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        end

        if (client["edits"][3][1] and isElement(client["edits"][3][2])) then    
            dxDrawText((guiGetText(client["edits"][3][2]) or "").."|", 553, 503, 73, 15, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        elseif (#guiGetText(client["edits"][3][2]) >= 1) then 
            dxDrawText((guiGetText(client["edits"][3][2]) or ""), 553, 503, 73, 15, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        else
            dxDrawText("Tempo", 553, 503, 73, 15, tocolor(150, 150, 150, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        end
    end

    if window == "gridlist" then 
        dxDrawText("Punidos", 541, 253, 66, 19, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "left", "top", false, false, true, false, false)
        dxDrawText("Ola administrador, abaixo veja os jogadores ja punidos pela\n administracao da cidade.", 541, 276, 253, 24, tocolor(123, 123, 123, alpha), 1.0, client["fonts"][3], "left", "top", false, false, true, false, false)
    
        for i, ban in ipairs(banList) do 
            local count = 243 + (i * 47)
            dxDrawImage(541, count, 282, 44, "assets/gfx/bg_gridlist.png", 0, 0, 0, tocolor(255, 0, 255, alpha), true)
        end
    end

    --dxDrawImage(767, 318, 43, 43, ":[MOD]Prefeitura/files/avatars/"..(getElementData(localPlayer, "Avatar") or 0)..".png", 0, 0, 0, tocolor(255, 255, 255, alpha), true)
    --dxDrawImage(558, 516, 248, 36, "assets/gfx/bg_button.png", 0, 0, 0, (isCursorOnElement (558, 516, 248, 36) and tocolor (14, 158, 247, alpha) or tocolor (54, 54, 54, alpha)), true)
    --dxDrawText("CONTINUAR", 558, 527, 248, 19, tocolor(255, 255, 255, alpha), 1.0, client["fonts"][1], "center", "top", false, false, true, false, false)
end
---------- // \\ ----------
addEvent("squady.openAdminPanel", true)
addEventHandler("squady.openAdminPanel", getRootElement(), function()
    if not client["visible"] then 
        client["visible"] = true 
        window = "index"
        client["buttons"] = nil
        client["type"] = nil
        addEventHandler("onClientRender", getRootElement(), onClientRenderPunishment)
        showCursor(true)
        resource["data"] = nil
        client["radius"] = {0, 255};
		client["tick"] = getTickCount ()
    end
end)

addEvent("squady.admin-manager-data", true)
addEventHandler("squady.admin-manager-data", getRootElement(), function(data)
    resource.data = data
end)

bindKey("backspace", "down", function()
    if client["visible"] then 
        client["visible"] = false 
        removeEventHandler("onClientRender", getRootElement(), onClientRenderPunishment)
        showCursor(false)
        client["radius"] = {255, 0};
        client["tick"] = getTickCount ()
    end
end)
---------- // \\ ----------
addEventHandler ("onClientClick", getRootElement (), function (button, state) 
    if client["visible"] and button == "left" and state == "down" then 
        client["edits"][1][1] = false
        client["edits"][2][1] = false
        client["edits"][3][1] = false

        if window == "index" then 
            if (isCursorOnElement(769, 319, 21, 21)) then 
                --window = "gridlist"
            end
        end

        if (isCursorOnElement(558, 311, 147, 36)) then 
            if (guiEditSetCaretIndex(client["edits"][1][2], (string.len(guiGetText(client["edits"][1][2]))))) then
                guiSetProperty(client["edits"][1][2], "ValidationString", "^[0-9]*");
                guiEditSetMaxLength(client["edits"][1][2], 8);
                guiBringToFront(client["edits"][1][2]);
                guiSetInputMode("no_binds_when_editing");
                client["edits"][1][1] = true;
            end 
        elseif (isCursorOnElement(546, 443, 141, 27)) then 
            if (guiEditSetCaretIndex(client["edits"][2][2], (string.len(guiGetText(client["edits"][2][2]))))) then
                guiEditSetMaxLength(client["edits"][2][2], 15);
                guiBringToFront(client["edits"][2][2]);
                guiSetInputMode("no_binds_when_editing");
                client["edits"][2][1] = true;
            end 
        elseif (isCursorOnElement(546, 497, 96, 27)) then 
            if (guiEditSetCaretIndex(client["edits"][3][2], (string.len(guiGetText(client["edits"][3][2]))))) then
                guiSetProperty(client["edits"][3][2], "ValidationString", "^[0-9]*");
                guiEditSetMaxLength(client["edits"][3][2], 4);
                guiBringToFront(client["edits"][3][2]);
                guiSetInputMode("no_binds_when_editing");
                client["edits"][3][1] = true;
            end 
        end

        if isCursorOnElement(558, 516, 248, 36) then 
            window = "selecionado"
            selecionado = resource["data"]
        end

        if window == "selecionado" then 
            if isCursorOnElement(551, 409, 260, 17) then 
                setClipboard(resource["data"].serial)
                sendMessage("client", localPlayer, "Serial copiado para area de transferencia.", "success")
            end

            if isCursorOnElement(696, 443, 28, 27) then
                client["buttons"] = "M"
            elseif isCursorOnElement(728, 443, 28, 27) then
                client["buttons"] = "H"
            elseif isCursorOnElement(760, 443, 28, 27) then
                client["buttons"] = "D"
            elseif isCursorOnElement(793, 443, 28, 27) then
                client["buttons"] = "P"

            elseif isCursorOnElement(549, 478, 11, 11) then
                client["type"] = "Fora"
            elseif isCursorOnElement(637, 478, 11, 11) then
                client["type"] = "Dentro"
            --elseif isCursorOnElement(736, 478, 11, 11) then
            --    client["type"] = "Serial"
            end

            if isCursorOnElement(541, 531, 282, 36) and window == "selecionado" then
                if guiGetText(client["edits"][2][2]) ~= "" and guiGetText(client["edits"][3][2]) ~= "" and client["buttons"] ~= "" and client["type"] ~= "" then
                    triggerServerEvent("squady.apply-player-punish", localPlayer, resource.data, guiGetText(client["edits"][2][2]), guiGetText(client["edits"][3][2]), client["buttons"], client["type"])
                else
                    sendMessage("client", localPlayer, "Preencha as informações", "error")
                end
            end
        end
    end
end)

---------- // FUNCTIONS \\ ----------

addEventHandler ("onClientKey", getRootElement(), function(button, press)
    if client["visible"] then
        --if isCursorOnElement(577, 209, 356, 280) then
        --    if button == "mouse_wheel_up" and client["pag"] > 0 then
        --        client["pag"] = client["pag"] - 1
        --    elseif button == "mouse_wheel_down" and (#tablemusic - client["max"] > 0) then
        --        client["pag"] = client["pag"] + 1
        --        if client["pag"] > #tablemusic - client["max"] then
        --            client["pag"] = #tablemusic - client["max"]
        --        end
        --    end
        --elseif isCursorOnElement(427, 297, 150, 191) then 
        --    if button == "mouse_wheel_up" and client["pag2"] > 0 then
        --        client["pag2"] = client["pag2"] - 1
        --    elseif button == "mouse_wheel_down" and (#favorites - client["max"] > 0) then
        --        client["pag2"] = client["pag2"] + 1
        --        if client["pag2"] > #favorites - client["max"] then
        --            client["pag2"] = #favorites - client["max"]
        --        end
        --    end
        --end
        if button == "enter" and press then 
            if guiGetText(client["edits"][1][2]) ~= "" then
                window = "infos"
                triggerServerEvent("squady.search-player", localPlayer, "*2Ar632#E&Wd", guiGetText(client["edits"][1][2]))
            end
        end
    end
end)
-------- // FUNCTIONS \\ ----------