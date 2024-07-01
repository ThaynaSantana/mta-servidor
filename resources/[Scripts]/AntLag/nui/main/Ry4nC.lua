--[[

$$$$$$$\                      $$\              $$$$$$\    p              $$\                     
$$  __$$\                     $$ |            $$  __$$\                 $$ |                    
$$ |  $$ | $$$$$$\   $$$$$$$\ $$ |  $$\       $$ /  \__| $$$$$$\   $$$$$$$ | $$$$$$\   $$$$$$$\ 
$$ |  $$ |$$  __$$\ $$  _____|$$ | $$  |      $$ |      $$  __$$\ $$  __$$ |$$  __$$\ $$  _____|
$$ |  $$ |$$$$$$$$ |\$$$$$$\  $$$$$$  /       $$ |      $$ /  $$ |$$ /  $$ |$$$$$$$$ |\$$$$$$\  
$$ |  $$ |$$   ____| \____$$\ $$  _$$<        $$ |  $$\ $$ |  $$ |$$ |  $$ |$$   ____| \____$$\ 
$$$$$$$  |\$$$$$$$\ $$$$$$$  |$$ | \$$\       \$$$$$$  |\$$$$$$  |\$$$$$$$ |\$$$$$$$\ $$$$$$$  |
\_______/  \_______|\_______/ \__|  \__|       \______/  \______/  \_______| \_______|\_______/ 

]] 


screen = {guiGetScreenSize()}
resW, resH = 1920, 1080
sx, sy = (screen[1]/1920), (screen[2]/1080)

local nextpage = 0
local nextpage2 = 0
local nextpage3 = 0
local selectMira = nil
local maxLines = 7
local opacidade = 255
local MiraTela = false
local MiraPadrao = false

local colorr = config['gerais']['color']



renderLag = function ()
    
    drawRect(543, 258, 834, 564, 13, tocolor(29, 29, 29, 255), "", "", false)
    drawRect(1055, 410, 273, 43, 7, tocolor(255, 255, 255, 3), "", "", false)
    drawRect(1055, 498, 273, 43, 7, tocolor(255, 255, 255, 3), "", "", false)
    
    drawRect(1055, 584, 273, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
    drawRect(1263, 596, 43, 26, 4, cursor(1263, 596, 43, 26) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 3), "", "", false)
    dxDrawText('Mira na tela', 1078, 584, 273, 50, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 12), "left", "center")
    dxDrawImage(1274, 599, 19, 19, (MiraTela == true and svg['correct'] or svg['error']), 0, 0, 0, cursor(1263, 596, 43, 26) and tocolor(30, 30, 30, 255) or (MiraTela == true and tocolor (colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 75)))
    
    drawRect(1055, 641, 273, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
    drawRect(1263, 653, 43, 26, 4, cursor(1263, 653, 43, 26) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 3), "", "", false)
    dxDrawText('Mira Padrão', 1078, 641, 273, 50, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 12), "left", "center")
    dxDrawImage(1274, 656, 19, 19, (MiraPadrao == true and svg['correct'] or svg['error']), 0, 0, 0, cursor(1263, 653, 43, 26) and tocolor(30, 30, 30, 255) or (MiraPadrao == true and tocolor (colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 75)))
    
    drawRect(1055, 698, 273, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
    
    if cursor(1055, 698, 273, 50) then
        if getKeyState("mouse1") and isCursorShowing() and (cursor((1179 + (opacidade / 255 * 124 -5)), 718, 14, 14) or rolandobarra7) then
            _, opacidade = BarraUtil(255, 1, 1179, 1297, "x")
            rolandobarra7 = true
        end 
    end
    
    dxDrawText('Opacidade', 1078, 698, 72, 50, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 12), "left", "center")
    dxDrawImage(1179, 720, 124, 8, svg['barra'], 0, 0, 0, tocolor(255, 255, 255, 10))
    dxDrawImageSection(1179, 720, (124 / 100 * (opacidade / 255 * 100)), 8, 0, 0, (124 / 100 * (opacidade / 255 * 100)), 8, svg['barra'], 0, 0, 0, tocolor(colorr[1], colorr[2], colorr[3], 255))
    dxDrawImage((1179 + (opacidade / 255 * 124 - 8)), 717.5, 14, 14, svg['circle'], 0, 0, 0, tocolor(colorr[1], colorr[2], colorr[3], 255))
    
    
    dxDrawImage(578, 291, 29, 23, svg['icon:config'], 0, 0, 0, tocolor (colorr[1], colorr[2], colorr[3], 255))
    dxDrawText('Performance', 624, 285, 92, 19, tocolor(255, 255, 255, 255), 1.0, setFont('medium', 13), "left", "center")
    dxDrawText('Faça sua configuração de acordo com sua preferência.', 624, 303, 92, 19, tocolor(255, 255, 255, 125), 1.0, setFont('medium', 11), "left", "center")
    dxDrawImage(575, 347, 18, 18, svg['icon:configg'], 0, 0, 0, tocolor (colorr[1], colorr[2], colorr[3], 255))
    dxDrawText('Configurações', 599, 350, 84, 16, tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 11), "left", "center")
    dxDrawImage(575, 555, 18, 18, svg['icon:configgg'], 0, 0, 0, tocolor (colorr[1], colorr[2], colorr[3], 255))
    dxDrawText('Ajustes', 595, 555, 18, 18, tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 11), "left", "center")
    
    dxDrawImage(1052, 347, 18, 18, svg['mira'], 0, 0, 0, tocolor (colorr[1], colorr[2], colorr[3], 255))
    dxDrawText('Visual', 1074, 350, 35, 16, tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 13), "left", "center")
    dxDrawText('Escolher Mira', 1055, 375, 77, 13, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 11), "left", "center")
    dxDrawText('Escolha a mira de sua preferência ', 1055, 390, 77, 13, tocolor(255, 255, 255, 125), 1.0, setFont('medium', 10), "left", "center")
    
    dxDrawText('Cor da Mira', 1055, 461, 77, 13, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 11), "left", "center")
    dxDrawText('Deixe sua mira da cor de sua escolha', 1055, 477, 77, 13, tocolor(255, 255, 255, 125), 1.0, setFont('medium', 10), "left", "center")
    
    dxDrawText('Configurações', 1055, 548, 77, 13, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 11), "left", "center")
    dxDrawText('Deixe sua configuração de sua mira no seu gosto', 1055, 564, 77, 13, tocolor(255, 255, 255, 125), 1.0, setFont('medium', 10), "left", "center")
    
    dxDrawImage(1068, 424, 13, 13, svg['pass'], 180, 0, 0, cursor(1068, 424, 13, 13) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor (255, 255, 255, 150))
    dxDrawImage(1304, 425, 13, 13, svg['pass'], 0, 0, 0, cursor(1304, 425, 13, 13) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor (255, 255, 255, 150))
    
    line = 0
    for i, v in ipairs(config['cores']) do
        if (i > nextpage2 and line < 9) then
            line = line + 1
            local distancia = 29
            dxDrawImage(1073 - distancia + line * distancia, 512, 18, 18, svg['circle'], 0, 0, 0, (selectColor == i and tocolor(v[1], v[2], v[3], 65)) or cursor(1073 - distancia + line * distancia, 512, 13, 13) and tocolor(v[1], v[2], v[3], 125) or tocolor(v[1], v[2], v[3], 255))
            
        end
    end
    
    line = 0
    for i, v in ipairs(config['miras']) do
        if (i > nextpage and line < 7) then
            line = line + 1
            local distancia = 30
            dxDrawImage(1086 - distancia + line * distancia, 420, 24, 24, 'nui/interface/aim/'..v..'.png', 0, 0, 0, (selectMira == i and tocolor(colorr[1], colorr[2], colorr[3], 255)) or cursor(1086 - distancia + line * distancia, 420, 24, 24) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 125))
            
        end
    end
    
    -- renderização mapa
    
    local renderizacao = math.floor(config['Render:Slider']["Horizonte"]/50)
    
    if renderizacao >= 99 then 
        renderizacao = 100
    else
        renderizacao = math.floor(config['Render:Slider']["Horizonte"]/50)
    end
    
    
    
    drawRect(575, 379, 462, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
    
    if cursor(575, 379, 462, 51) then
        if getKeyState("mouse1") and isCursorShowing() and (cursor((743 + (config['Render:Slider']["Horizonte"] / 5000 * 247 - 5)), 401, 14, 14) or rolandobarra4) then
            _, config['Render:Slider']["Horizonte"] = BarraUtil(5000, 1, 743, 984, "x")
            rolandobarra4 = true
        end 
    end
    
    dxDrawText('Renderização do mapa', 595, 379, 136, 50, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 10), "left", "center")
        dxDrawText(''..renderizacao..'%', 1002, 379, 20, 50, tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 10), "left", "center")
        dxDrawImage(743, 401, 247, 8, svg['barra'], 0, 0, 0, tocolor(255, 255, 255, 10))
        dxDrawImageSection(743, 401, (247 / 100 * (config['Render:Slider']["Horizonte"] / 5000 * 100)), 8, 0, 0,  (247 / 100 * (config['Render:Slider']["Horizonte"] / 5000 * 100)), 8, svg['barra'], 0, 0, 0, tocolor(colorr[1], colorr[2], colorr[3], 255))
        dxDrawImage((743 + (config['Render:Slider']["Horizonte"] / 5000 * 247 - 8)), 398.5, 14, 14, svg['circle'], 0, 0, 0, tocolor(255, 255, 255, 255))
        
        -- renderização veiculos
        
        local renderizacaoVeh = math.floor(config['Render:Slider']["Veículos"]/5)
        
        if renderizacaoVeh == 99 then 
            renderizacaoVeh = 100 
        else
            renderizacaoVeh = math.floor(config['Render:Slider']["Veículos"]/5)
        end
        
        drawRect(575, 434, 462, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
        
        if cursor(575, 434, 462, 51) then
            if getKeyState("mouse1") and isCursorShowing() and (cursor((743 + (config['Render:Slider']["Veículos"] / 500 * 247 - 5)), 456, 14, 14) or rolandobarra4) then
                _, config['Render:Slider']["Veículos"] = BarraUtil(500, 1, 743, 984, "x")
                rolandobarra4 = true
            end 
        end
        
        dxDrawText('Renderização veiculos', 595, 434, 136, 50, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 10), "left", "center")
        dxDrawText(''..renderizacaoVeh..'%', 1002, 434, 20, 50, tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 10), "left", "center")
        dxDrawImage(743, 456, 247, 8, svg['barra'], 0, 0, 0, tocolor(255, 255, 255, 10))
        dxDrawImageSection(743, 456, (247 / 100 * (config['Render:Slider']["Veículos"] / 500 * 100)), 8, 0, 0,  (247 / 100 * (config['Render:Slider']["Veículos"] / 500 * 100)), 8, svg['barra'], 0, 0, 0, tocolor(colorr[1], colorr[2], colorr[3], 255))
        dxDrawImage((743 + (config['Render:Slider']["Veículos"] / 500 * 247 - 8)), 453.5, 14, 14, svg['circle'], 0, 0, 0, tocolor(255, 255, 255, 255))
        
        -- renderização Vegetal
        
        local renderizacaoNeblina = math.floor(config['Render:Slider']["Neblina"]/50)
        
        if renderizacaoNeblina == 99 then 
            renderizacaoNeblina = 100 
        else
            renderizacaoNeblina = math.floor(config['Render:Slider']["Neblina"]/50)
        end
        
        drawRect(575, 489, 462, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
        
        if cursor(575, 489, 462, 50) then
            if getKeyState("mouse1") and isCursorShowing() and (cursor((743 + (config['Render:Slider']["Neblina"] / 5000 * 247 - 5)), 511, 14, 14) or rolandobarra4) then
                _, config['Render:Slider']["Neblina"] = BarraUtil(5000, 1, 743, 984, "x")
                rolandobarra4 = true
            end 
        end
        
        dxDrawText('Distancia neblina', 595, 489, 136, 50, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 10), "left", "center")
        dxDrawText(''..renderizacaoNeblina..'%', 1002, 489, 20, 50, tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 10), "left", "center")
        dxDrawImage(743, 511, 247, 8, svg['barra'], 0, 0, 0, tocolor(255, 255, 255, 10))
        dxDrawImageSection(743, 511, (247 / 100 * (config['Render:Slider']["Neblina"] / 5000 * 100)), 8, 0, 0,  (247 / 100 * (config['Render:Slider']["Neblina"] / 5000 * 100)), 8, svg['barra'], 0, 0, 0, tocolor(colorr[1], colorr[2], colorr[3], 255))
        dxDrawImage((743 + (config['Render:Slider']["Neblina"] / 5000 * 247 - 8)), 508.5, 14, 14, svg['circle'], 0, 0, 0, tocolor(255, 255, 255, 255))
        
        nextpage3 = getScroll ('scroll') 
        line = 0
        for i, v in ipairs(config['Ajustes']) do
            if (i > nextpage3 and line < 3) then
                line = line + 1
                local distancia = 58 
                
                drawRect(575, 584 - distancia + line * distancia, 453, 50, 7, tocolor(255, 255, 255, 3), "", "", false)
                dxDrawText(v[1], 595, 594 - distancia + line * distancia, 79, 16, tocolor(255, 255, 255, 185), 1.0, setFont('medium', 11), "left", "center")
                dxDrawText(v[2], 595, 609 - distancia + line * distancia, 79, 16, tocolor(255, 255, 255, 125), 1.0, setFont('medium', 11), "left", "center")
                
               -- if v[3] == 'FPS' then 
                    --drawRect(939, 596 - distancia + line * distancia, 78, 26, 3, cursor(939, 596 - distancia + line * distancia, 78, 26) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 3), "", "", false)
                   -- dxDrawText(''..fps..' FPS', 939, 596 - distancia + line * distancia, 78, 26, cursor(939, 596 - distancia + line * distancia, 78, 26) and tocolor(30, 30, 30, 255) or tocolor(colorr[1], colorr[2], colorr[3], 255), 1.0, setFont('medium', 11), "center", "center")
              --  end
                
                if v[3] == 'Click' then 
                    drawRect(974, 596 - distancia + line * distancia, 43, 26, 5, cursor(974, 596 - distancia + line * distancia, 43, 26) and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 3), "", "", false)
                    dxDrawImage(985, 600 - distancia + line * distancia, 19, 19, (v[4] == true and svg['correct'] or svg['error']), 0, 0, 0, cursor(974, 596 - distancia + line * distancia, 43, 26) and tocolor(30, 30, 30, 255) or (v[4] == true and tocolor(colorr[1], colorr[2], colorr[3], 255) or tocolor(255, 255, 255, 75)))
                end
            end
        end
        
    end
    
    function event()
        if not eventoAtivo("onClientRender", root, renderLag) then
            addEventHandler("onClientRender", root, renderLag)
            showCursor(true)
            
            if #config['Ajustes'] > 3 then
                createScroll ('scroll', {x = 1034, y = 584, width = 3, height = 164, size = 38}, {background = {255, 255, 255, 3}, using = {colorr[1], colorr[2], colorr[3], 255}, scroll = {colorr[1], colorr[2], colorr[3], 255}}, false, function () return true end, 1, config['Ajustes'], 3, false)
            end 
        elseif eventoAtivo("onClientRender", root, renderLag) then
            removeEventHandler("onClientRender", root, renderLag)
            showCursor(false)
            destroyScroll('scroll')
        end
    end
    bindKey( 'f3', "down", event)
    
    
    addEventHandler('onClientClick', root, function( button, state ) -- neste exemplo irei criar uma variavel chamada 'select_item' para quando selecionar o meu item ele mudar a cor do meu item no evento acima de 'onClientRender'.
        if eventoAtivo("onClientRender", root, renderLag) then
            if button == 'left' and state == 'down' then
                if config['Ajustes'] then
                    line = 0
                    for i, v in ipairs(config['Ajustes']) do
                        if (i > nextpage3 and line < 3) then
                            
                            line = line + 1
                            local distancia = 58 
                            
                            if cursor(939, 596 - distancia + line * distancia, 78, 26) and v[3] == 'FPS' then -- Posição do meu item.
                                Shared(localPlayer, v[1], '')
                            end
                            
                            if cursor(974, 596 - distancia + line * distancia, 43, 26) then
                                if v[4] == true then 
                                    v[4] = false 
                                    Shared(localPlayer, v[1], false)
                                else
                                    v[4] = true
                                    Shared(localPlayer, v[1], true)
                                end
                            end
                        end
                    end
                end
            end
            
            if state == "up" then
                if cursor((743 + (config['Render:Slider']["Horizonte"] / 5000 * 247 - 8)), 398.5, 14, 14) then 
                    updateLags('mapa')
                elseif cursor((743 + (config['Render:Slider']["Veículos"] / 500 * 247 - 8)), 453.5, 14, 14) then 
                    updateLags('veh')
                elseif cursor((743 + (config['Render:Slider']["Neblina"] / 5000 * 247 - 8)), 508.5, 14, 14) then 
                    updateLags('Neblina')
                elseif cursor(1263, 596, 43, 26) then 
                    miraTela()
                elseif cursor(1263, 653, 43, 26) then 
                    miraPadrao()
                end
            end
        end
    end)
    
    function updateLags(nameLag)
        if nameLag == "mapa" then
            if config['Render:Slider']["Horizonte"] <= 500 then
                resetFarClipDistance()
            else
                setFarClipDistance(config['Render:Slider']["Horizonte"])
            end
        elseif nameLag == "veh" then 
            if config['Render:Slider']["Veículos"] <= 10 then
                resetVehiclesLODDistance( )
            else
                setVehiclesLODDistance(config['Render:Slider']["Veículos"])
            end
        elseif nameLag == "Neblina" then 
            if config['Render:Slider']["Neblina"] <= 500 then
                setFogDistance(10)
            else
                setFogDistance(config['Render:Slider']["Neblina"])
            end
        end
    end
    
    
    
    function miraTela () 
        if MiraTela == false then 
            MiraTela = true
            miraaTela()
            msg('Mira na tela ativada com sucesso!', 'info')
        else
            MiraTela = false
            msg('Mira na tela desativada com sucesso!', 'info')
        end 
    end
    
    function miraPadrao()
        if MiraPadrao == false then 
            setPlayerHudComponentVisible("crosshair", true) 
            selectMira = nil
            MiraTela = false
            MiraPadrao = true
            selectColor = nil
            msg('Mira padrão ativada com sucesso!', 'info')
        else
            MiraPadrao = false
            setPlayerHudComponentVisible("crosshair", false) 
            msg('Mira padrão desativada com sucesso!', 'info')
        end 
    end
    
    function miraaTela () 
        if selectMira ~= nil and MiraTela == true then 
            dxDrawImage(1004, 418, 29, 29, "nui/interface/aim/"..selectMira..".png", 0, 0, 0, (selectColor ~= nil and tocolor(config['cores'][selectColor][1], config['cores'][selectColor][2], config['cores'][selectColor][3], opacidade) or tocolor(255, 255, 255, opacidade)))
        end 
    end
    addEventHandler("onClientRender", root, miraaTela)
    
    
    function BarraUtil(TotalConteudos, MaxLinhas, posInicial, posFinal, type)
        if eventoAtivo("onClientRender", root, renderLag) then
            if string.lower(type) == "x" then 
                Tela = guiGetScreenSize()
                cy = getCursorPosition()
                posInicial = (posInicial*(Tela/1920)) / Tela
                posFinal = (posFinal*(Tela/1920)) / Tela 
            elseif string.lower(type) == "y" then 
                _,Tela = guiGetScreenSize()
                _,cy = getCursorPosition()
                posInicial = (posInicial*(Tela/1080)) / Tela
                posFinal = (posFinal*(Tela/1080)) / Tela 
            end 
            if cy >= (posFinal) then 
                cy = (posFinal)
            elseif cy <= (posInicial) then 
                cy = (posInicial)
            end             
            DeltaG = math.floor((Tela *  (posFinal)) - (Tela * (posInicial)))    
            DeltaA = math.floor((Tela *  cy) - (Tela * (posInicial)))
            cursorYProgress = Tela * (cy / (Tela/1080)) 
            proximaPaginaProgress = math.floor((TotalConteudos-MaxLinhas)/DeltaG*(DeltaA))
            return cursorYProgress, proximaPaginaProgress
        end 
    end
    
    function BarraUtilExata(TotalConteudos, MaxLinhas, posInicial, posFinal, type)
        if eventoAtivo("onClientRender", root, renderLag) then
            if string.lower(type) == "x" then 
                Tela = guiGetScreenSize()
                cy = getCursorPosition()
                posInicial = (posInicial*(Tela/1920)) / Tela
                posFinal = (posFinal*(Tela/1920)) / Tela 
            elseif string.lower(type) == "y" then 
                _,Tela = guiGetScreenSize()
                _,cy = getCursorPosition()
                posInicial = (posInicial*(Tela/1080)) / Tela
                posFinal = (posFinal*(Tela/1080)) / Tela 
            end  
            if cy >= (posFinal) then 
                cy = (posFinal)
            elseif cy <= (posInicial) then 
                cy = (posInicial)
            end             
            DeltaG = (Tela *  (posFinal)) - (Tela * (posInicial))   
            DeltaA = (Tela *  cy) - (Tela * (posInicial))
            cursorYProgress = Tela * (cy / (Tela/1080)) 
            proximaPaginaProgress = (TotalConteudos-MaxLinhas)/DeltaG*(DeltaA)
            return cursorYProgress, proximaPaginaProgress
        end 
    end 
    
    function MoveBarraUtil(TotalConteudos, MaxLinhas, posInicial, posFinal, type, proximaPaginaNovo)
        if eventoAtivo("onClientRender", root, renderLag) then
            if string.lower(type) == "x" then 
                Tela = guiGetScreenSize()
                posInicial = (posInicial*(Tela/1920)) / Tela
                posFinal = (posFinal*(Tela/1920)) / Tela 
            elseif string.lower(type) == "y" then 
                _,Tela = guiGetScreenSize()
                posInicial = (posInicial*(Tela/1080)) / Tela
                posFinal = (posFinal*(Tela/1080)) / Tela 
            end     
            cy = (((posFinal-posInicial)/(TotalConteudos-MaxLinhas))*proximaPaginaNovo)+posInicial
            DeltaG = math.floor((Tela *  (posFinal)) - (Tela * (posInicial)))    
            DeltaA = math.floor((Tela *  cy) - (Tela * (posInicial)))
            cursorYProgress = Tela * (cy / (Tela/1080)) 
            return cursorYProgress
        end
    end
    
    
    addEventHandler('onClientClick', root, function(button, state)
        if eventoAtivo("onClientRender", root, renderLag) then
            if button == 'left' and state == 'down' then
                if config['miras'] then
                    line = 0
                    for i, v in ipairs(config['miras']) do
                        if i > nextpage and line < 7 then
                            line = line + 1
                            local distancia = 30 
                            if cursor(1086 - distancia + line * distancia, 420, 24, 24) then 
                                if selectMira ~= i then
                                    selectMira = i
                                else
                                    selectMira = nil
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    addEventHandler('onClientClick', root, function(button, state)
        if eventoAtivo("onClientRender", root, renderLag) then
            if button == 'left' and state == 'down' then
                if config['cores'] then
                    line = 0
                    for i, v in ipairs(config['cores']) do
                        if i > nextpage2 and line < 9 then
                            line = line + 1
                            local distancia = 29 
                            if cursor(1073 - distancia + line * distancia, 512, 18, 18) then 
                                if selectColor ~= i then
                                    selectColor = i
                                else
                                    selectColor = nil
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    addEventHandler("onClientClick", root, function(_, state)
        if eventoAtivo('onClientRender', root, renderLag) then 
            if state == 'down' then
                if cursor(1304, 425, 13, 13) then 
                    line = 0
                    nextpage = nextpage + 1
                    if nextpage > #config['miras'] - maxLines then
                        nextpage = #config['miras'] - maxLines
                    end
                elseif cursor(1068, 424, 13, 13) then 
                    line = 0
                    if nextpage > 0 then
                        nextpage = nextpage - 1
                    end
                end
            end
        end
    end)
    
    function closeMenu()
        if eventoAtivo("onClientRender", root, renderLag) then
            removeEventHandler("onClientRender", root, renderLag)
            showCursor(false)
        end
    end
    bindKey("backspace", "down", closeMenu)
    
    function alterAim()
        if selectMira == nil then 
            setPlayerHudComponentVisible("crosshair", true)
            return
        end
        if isPedAiming(localPlayer) then
            if (getPedWeapon(localPlayer) ~= 28 and getPedWeapon(localPlayer) ~= 0) or MiraTela == true then
                setPlayerHudComponentVisible("crosshair", false)
                dxDrawImage(1004, 418, 29, 29, "nui/interface/aim/"..selectMira..".png", 0, 0, 0, (selectColor ~= nil and tocolor(config['cores'][selectColor][1], config['cores'][selectColor][2], config['cores'][selectColor][3], opacidade) or tocolor(255, 255, 255, opacidade)))
            end
        end
    end
    addEventHandler("onClientRender", root, alterAim)
    
    function isPedAiming (thePedToCheck)
        if isElement(thePedToCheck) then
            if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
                local weapon = getPedWeapon(thePedToCheck)
                if weapon then
                    if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(thePedToCheck) then
                        return true
                    end
                end
            end
        end
        return false
    end
	
	
	--[[
 ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
 ███╗   ███╗████████╗ █████╗    ███████╗ █████╗     ███╗   ███╗ ██████╗ ██████╗ ███████╗█
 ████╗ ████║╚══██╔══╝██╔══██╗██╗██╔════╝██╔══██╗    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝█
 ██╔████╔██║   ██║   ███████║╚═╝███████╗███████║    ██╔████╔██║██║   ██║██║  ██║███████╗█
 ██║╚██╔╝██║   ██║   ██╔══██║██╗╚════██║██╔══██║    ██║╚██╔╝██║██║   ██║██║  ██║╚════██║█
 ██║ ╚═╝ ██║   ██║   ██║  ██║╚═╝███████║██║  ██║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████║█
 █╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════█
 █                                                                                      █
 █                ┌───────────────────────────────────────────────────┐                 █
 █                ┤MAIS DE 1000 MODS DESCOMPILADOS COM DOWNLOAD DIRETO┤                 █
 █                └───────────────────────────────────────────────────┘                 █
 █                   ┌─────────────────────────────────────────────┐                    █
 █                   ┤ A MAIOR COMUNIDADE DE MODS DO MTA BRASIL 🥇 ┤                    █
 █                   └─────────────────────────────────────────────┘                    █
 █                          ┌───────────────────────────────┐                           █
 █                          ┤  LINK DE CONVITE PERMANENTE:  ┤                           █
 █                          ┤ https://discord.gg/KXV2GHtJtg ┤                           █
 █                          ┤ https://discord.gg/KXV2GHtJtg ┤                           █
 █                          ┤ https://discord.gg/KXV2GHtJtg	┤                           █
 █                          └───────────────────────────────┘                           █
 █ ┌────────────────────────────────────────┐                                           █
 ├≡┤ Canais que postamos mods todos os dias │                                           █
 █ └────────────────────────────────────────┘                                           █
 █ ┤ Veiculos-Low-Poly                                                                  █
 █ ┤ Armas-Exclusivas                                                                   █
 █ ┤ Skins-Exclusivas                                                                   █
 █ ┤ Concessionárias                                                                    █
 █ ┤ Modelagens                                                                         █
 █ ┤ Sons-Armas                                                                         █
 █ ┤ Exclusivos - Mods Exclusivos                                                       █
 █ ┤ Interiores                                                                         █
 █ ┤ Animações                                                                          █
 █ ┤ Resources                                                                          █
 █ ┤ ls-full-br - Uma conversão de mapas para deixar los santos brasileira              █
 █ ┤ Calçadas                                                                           █
 █ ┤ Mapas                                                                              █
 █ ┤ Radar                                                                              █
 █ ┤ Huds                                                                               █
 █                                                                                      █
 ██▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄██
 ]]