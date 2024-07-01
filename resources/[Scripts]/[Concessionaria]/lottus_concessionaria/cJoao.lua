local screen = {guiGetScreenSize()}local
sx, sy = (screen[1]/1368), (screen[2]/768)

function isMouseInPosition(x,y,w,h)
    if isCursorShowing() then
        local sx,sy = guiGetScreenSize()
        local cx,cy = getCursorPosition()
        local cx,cy = (cx*sx),(cy*sy)
        if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
            return true
        end
    end
end

_dxDrawImage = dxDrawImage
function dxDrawImage (x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawImage (x, y, w, h, ...)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection (x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawImageSection (x, y, w, h, ...)
end

_isMouseInPosition = isMouseInPosition
function isMouseInPosition (x, y, w, h)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _isMouseInPosition (x, y, w, h)
end

_dxCreateFont = dxCreateFont
function dxCreateFont (file, tamanho)
    local tamanho = sx * tamanho
    return _dxCreateFont (file, tamanho)
end

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle (x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawRectangle (x, y, w, h, ...)
end

_dxDrawText = dxDrawText
function dxDrawText (text, x, y, w, h, ...)
    local x, y, w, h = sx * x, sy * y, sx * w, sy * h
    return _dxDrawText (text, x, y, w, h, ...)
end

CageColors = {
    {1097, 438, 20, 20},
    {1123, 438, 20, 20},
    {1149, 438, 20, 20},
    {1175, 438, 20, 20},
    {1201, 438, 20, 20},
    {1227, 438, 20, 20},
    {1253, 438, 20, 20},
    {1279, 438, 20, 20},
    {1305, 438, 20, 20},

    {1097, 463, 20, 20},
    {1123, 463, 20, 20},
    {1149, 463, 20, 20},
    {1175, 463, 20, 20},
    {1201, 463, 20, 20},
    {1227, 463, 20, 20},
    {1253, 463, 20, 20},
    {1279, 463, 20, 20},
    {1305, 463, 20, 20},
}

timeStampAtual = 0

edits = {}

local font = dxCreateFont("files/fonts/Roboto-Medium.ttf", 15)
local font2 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 10)
local font3 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 11)
local font4 = dxCreateFont("files/fonts/Roboto-Medium.ttf", 22)
local font5 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 19)
local font6 = dxCreateFont("files/fonts/Roboto-Medium.ttf", 11)
local font7 = dxCreateFont("files/fonts/Roboto-Regular.ttf", 9)
local font8 = dxCreateFont("files/fonts/Roboto-Medium.ttf", 9)
local font9 = dxCreateFont("files/fonts/Roboto-Medium.ttf", 10)

function dx()
    if window == "conce" then
        dxDrawImage(703, 768, 663, 768, "files/imgs/background.png")
        if isMouseInPosition(1097, 560, 212, 52) and not subAba then
            dxDrawImage(1097, 560, 212, 52, "files/imgs/comprar_select.png")
        else
            dxDrawImage(1097, 560, 212, 52, "files/imgs/comprar.png")
        end
        linha = 0
        for i, v in ipairs(config["Veiculos"][selectAba]) do
            if (i > proxPage and linha < 3) then
                linha = linha + 1
                if ((isMouseInPosition(1097, (212 + 44 * linha), 212, 40) and not subAba) or selectCar == i) then
                    dxDrawImage(1088, (206 + 44 * linha), 230, 52, "files/imgs/cage_select.png", 0, 0, 0, tocolor(255, 255, 255), true)
                    dxDrawText(v[1].." ("..config["Pesos"][v[2]].."Kg)", 1109, (212 + 44 * linha), 1202, (251 + 44 * linha), tocolor(255, 255, 255, 255), 1.00, font3, "left", "center", false, false, true, false, false)
                    dxDrawText(formatNumber(v[4]).."€", 1212, (212 + 44 * linha), 1305, (251 + 44 * linha), tocolor(255, 255, 255, 191), 1.00, font3, "right", "center", false, false, true, false, false)
                else
                    dxDrawImage(1097, (212 + 44 * linha), 212, 40, "files/imgs/cage.png")
                    dxDrawText(v[1].." ("..config["Pesos"][v[2]].."Kg)", 1109, (212 + 44 * linha), 1202, (251 + 44 * linha), tocolor(255, 255, 255, 255), 1.00, font2, "left", "center", false, false, true, false, false)
                    dxDrawText(formatNumber(v[4]).."€", 1212, (212 + 44 * linha), 1305, (251 + 44 * linha), tocolor(255, 255, 255, 191), 1.00, font2, "right", "center", false, false, true, false, false)
                end
            end
        end
        for i, v in ipairs(config["Cores"]) do
            if (i < 19) then
                if (isMouseInPosition(CageColors[i][1], CageColors[i][2], CageColors[i][3], CageColors[i][4]) or selectColor == i) and not subAba then
                    dxDrawImage(CageColors[i][1]-2, CageColors[i][2]-2, CageColors[i][3]+4, CageColors[i][4]+4, "files/imgs/color_select.png")
                end
                dxDrawImage(CageColors[i][1], CageColors[i][2], CageColors[i][3], CageColors[i][4], "files/imgs/color.png", 0, 0, 0, tocolor(v[1], v[2], v[3], 255))
            end
        end
        dxDrawRectangle(1324, 256, 2, 128, tocolor(0, 0, 0, 20))
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition(1324, cursorY, 2, 40) or rolandobarra) and (#config["Veiculos"][selectAba] > 3) then
            cursorY,proxPage = BarraUtilExata(#config["Veiculos"][selectAba], 3, 256, 344, "y")
            rolandobarra = true
        end
        dxDrawRectangle(1324, cursorY, 2, 40, tocolor(198, 78, 206))
        dxDrawImage(1097, 412, 94, 16, "files/imgs/corlataria.png")
        dxDrawText("€"..formatNumber(config["Veiculos"][selectAba][selectCar][4]), 1184, 499, 1305, 543, tocolor(255, 255, 255, 255), 1.00, font, "right", "center", false, false, true, false, false)
        if (isMouseInPosition(1256, 26, 58, 23) or selectAba == "Carros") and not subAba then
            dxDrawText("Carros", 1256, 24, 1314, 49, tocolor(255, 255, 255, 255), 1.00, font6, "center", "center", false, false, false, false, false)
        else
            dxDrawText("Carros", 1256, 24, 1314, 49, tocolor(255, 255, 255, 140), 1.00, font6, "center", "center", false, false, false, false, false)
        end
        if (isMouseInPosition(1193, 26, 58, 23) or selectAba == "Motos") and not subAba then
            dxDrawText("Motos", 1193, 24, 1251, 49, tocolor(255, 255, 255, 255), 1.00, font6, "center", "center", false, false, false, false, false)
        else
            dxDrawText("Motos", 1193, 24, 1251, 49, tocolor(255, 255, 255, 140), 1.00, font3, "center", "center", false, false, false, false, false)
        end
        if (isMouseInPosition(1135, 26, 58, 23) or selectAba == "Barcos") and not subAba then
            dxDrawText("Barcos", 1134, 24, 1192, 49, tocolor(255, 255, 255, 255), 1.00, font6, "center", "center", false, false, false, false, false)
        else
            dxDrawText("Barcos", 1134, 24, 1192, 49, tocolor(255, 255, 255, 140), 1.00, font3, "center", "center", false, false, false, false, false)
        end
        if (isMouseInPosition(1044, 25, 86, 23) or selectAba == "helicoptero") and not subAba then
            dxDrawText("Helicóptero", 1044, 25, 1130, 48, tocolor(255, 255, 255, 255), 1.00, font6, "center", "center", false, false, false, false, false)
        else
            dxDrawText("Helicóptero", 1044, 25, 1130, 48, tocolor(255, 255, 255, 140), 1.00, font3, "center", "center", false, false, false, false, false)
        end
        dxDrawText(string.upper(config["Veiculos"][selectAba][selectCar][1]), 1144, 202, 1308, 238, tocolor(255, 255, 255, 255), 1.00, font4, "right", "center", false, false, true, false, false)
        dxDrawText(string.upper(config["Veiculos"][selectAba][selectCar][3]), 1144, 164, 1308, 200, tocolor(255, 255, 255, 216), 1.00, font5, "right", "center", false, false, true, false, false)
        if subAba == "comprar" then
            dxDrawRectangle(0, 0, 1366, 768, tocolor(0, 0, 0, 89))
            dxDrawImage(477, 243, 412, 282, "files/imgs/base_confirmar.png")
            if isMouseInPosition(520, 433, 326, 53) then
                dxDrawImage(520, 433, 326, 53, "files/imgs/confirmar_select.png")
            else
                dxDrawImage(520, 433, 326, 53, "files/imgs/confirmar.png")
            end
            if isMouseInPosition(520, 403, 12, 12) or selectTypeMethod == "dinheiro" then
                dxDrawImage(520, 403, 12, 12, "files/imgs/elipse_select.png")
            else
                dxDrawImage(520, 403, 12, 12, "files/imgs/elipse.png")
            end
            --if isMouseInPosition(592, 403, 12, 12) or selectTypeMethod == "vp" then
            --    dxDrawImage(592, 403, 12, 12, "files/imgs/elipse_select.png")
            --else
            --    dxDrawImage(592, 403, 12, 12, "files/imgs/elipse.png")
            --end
            dxDrawText("Dinheiro", 537, 402, 590, 418, tocolor(255, 255, 255, 216), 1.00, font2, "left", "center", false, false, true, false, false)
            --dxDrawText("VP", 609, 402, 662, 418, tocolor(255, 255, 255, 216), 1.00, font2, "left", "center", false, false, true, false, false)
            dxDrawText("Deseja comprar "..config["Veiculos"][selectAba][selectCar][1].."? por\n€"..formatNumber(config["Veiculos"][selectAba][selectCar][4]), 523, 337, 763, 410, tocolor(241, 241, 241, 204), 1.00, font3, "left", "center", false, false, true, false, false)
        end
    elseif window == "garagem" then
        dxDrawImage(390, 206, 585, 356, "files/imgs/base_garagem.png")
        if selectVehicle then
            local dataCar = fromJSON(config["Slots Garagem"][selectVehicle].dataCar)
            dxDrawImageSection(422, 334, (179/1000*dataCar[1].vida), 2, 0, 0, (179/1000*dataCar[1].vida), 2, "files/imgs/bar.png")
            dxDrawImageSection(422, 383, (179/100*dataCar[1].gasolina), 2, 0, 0, (179/100*dataCar[1].gasolina), 2, "files/imgs/bar.png")
            dxDrawImageSection(422, 432, (179/800*dataCar[1].aceleracao), 2, 0, 0, (179/800*dataCar[1].aceleracao), 2, "files/imgs/bar.png")
            dxDrawImage((420+179*dataCar[1].vida/1000), 333, 4, 4, "files/imgs/boll.png")
            dxDrawImage((420+179*dataCar[1].gasolina/100), 382, 4, 4, "files/imgs/boll.png")
            dxDrawImage((420+179*dataCar[1].aceleracao/800), 431, 4, 4, "files/imgs/boll.png")
            dxDrawText(math.ceil(dataCar[1].vida/10).."%", 469, 309, 598, 327, tocolor(241, 241, 241, 89), 1.00, font7, "right", "center", false, false, false, false, false)
            dxDrawText(math.floor(dataCar[1].gasolina).."%", 469, 358, 598, 376, tocolor(241, 241, 241, 89), 1.00, font7, "right", "center", false, false, false, false, false)
            dxDrawText(math.ceil(dataCar[1].aceleracao).."km/h", 469, 406, 598, 424, tocolor(241, 241, 241, 89), 1.00, font7, "right", "center", false, false, false, false, false)
            dxDrawImage(422, 449, 179, 36, "files/imgs/button.png")
            dxDrawImage(422, 492, 179, 36, "files/imgs/button.png")
            if isMouseInPosition(422, 449, 179, 36) and not subAba then
                dxDrawText(config["Slots Garagem"][selectVehicle].state == "Guardado" and "Retirar" or config["Slots Garagem"][selectVehicle].state == "Spawnado" and "Guardar" or "Retido", 421, 447, 602, 486, tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, false, false, false)
            else
                dxDrawText(config["Slots Garagem"][selectVehicle].state == "Guardado" and "Retirar" or config["Slots Garagem"][selectVehicle].state == "Spawnado" and "Guardar" or "Retido", 421, 447, 602, 486, tocolor(255, 255, 255, 114), 1.00, font2, "center", "center", false, false, false, false, false)
            end
            if isMouseInPosition(422, 492, 179, 36) and not subAba then
                dxDrawText("Vender", 421, 489, 602, 528, tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, false, false, false)
            else
                dxDrawText("Vender", 421, 489, 602, 528, tocolor(255, 255, 255, 114), 1.00, font2, "center", "center", false, false, false, false, false)
            end
        else
            dxDrawImageSection(422, 334, 0, 2, 0, 0, 0, 2, "files/imgs/bar.png")
            dxDrawImageSection(422, 383, 0, 2, 0, 0, 0, 2, "files/imgs/bar.png")
            dxDrawImageSection(422, 432, 0, 2, 0, 0, 0, 2, "files/imgs/bar.png")
            dxDrawImageSection(420, 333, 4, 4, 0, 0, 4, 4, "files/imgs/boll.png")
            dxDrawImageSection(420, 382, 4, 4, 0, 0, 4, 4, "files/imgs/boll.png")
            dxDrawImageSection(420, 431, 4, 4, 0, 0, 4, 4, "files/imgs/boll.png")
            dxDrawText("0%", 469, 309, 598, 327, tocolor(241, 241, 241, 89), 1.00, font7, "right", "center", false, false, false, false, false)
            dxDrawText("0%", 469, 358, 598, 376, tocolor(241, 241, 241, 89), 1.00, font7, "right", "center", false, false, false, false, false)
            dxDrawText("0km/h", 469, 406, 598, 424, tocolor(241, 241, 241, 89), 1.00, font7, "right", "center", false, false, false, false, false)
        end
        if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition(953, cursorY, 2, 53) or rolandobarra) and (#config["Slots Garagem"] > 5) then
            cursorY,proxPage = BarraUtilExata(#config["Slots Garagem"], 5, 296, 484, "y")
            rolandobarra = true
        end
        dxDrawImage(953, cursorY, 2, 53, "files/imgs/bar_scroll.png")
        linha = 0
        for i, v in ipairs(config["Slots Garagem"]) do
            if (i > proxPage and linha < 5) then
                linha = linha + 1
                if v.isActive then
                    if v.carroOccupied then
                        if ((isMouseInPosition(625, (247 + 49 * linha), 321, 45) and not isMouseInPosition(639, (264 + 49 * linha), 10, 12)) or selectVehicle == i) and not subAba then
                            dxDrawImage(625, (247 + 49 * linha), 321, 45, "files/imgs/slot_mouse.png")
                        else
                            dxDrawImage(625, (247 + 49 * linha), 321, 45, "files/imgs/slot_select.png")
                        end
                        if isMouseInPosition(639, (264 + 49 * linha), 10, 12) and not subAba then
                            dxDrawImage(639, (264 + 49 * linha), 10, 12, "files/imgs/pin.png", 0, 0, 0, tocolor(198, 78, 206, 255))
                        else
                            dxDrawImage(639, (264 + 49 * linha), 10, 12, "files/imgs/pin.png", 0, 0, 0, tocolor(240, 240, 240, 89))
                        end
                        dxDrawText(v.nameVehicle, 658, (247 + 49 * linha), 884, (293 + 49 * linha), tocolor(241, 241, 241, 219), 1.00, font8, "left", "center", false, false, false, false, false)
                        dxDrawText(v.state, 713, (253 + 49 * linha), 939, (268 + 49 * linha), tocolor(241, 241, 241, 63), 1.00, font7, "right", "center", false, false, false, false, false)
                        dxDrawText(v.placa, 713, (269 + 49 * linha), 939, (285 + 49 * linha), tocolor(241, 241, 241, 165), 1.00, font2, "right", "center", false, false, false, false, false)
                    else
                        dxDrawImage(625, (247 + 49 * linha), 321, 45, "files/imgs/slot.png")
                        dxDrawText("Slot Vazio", 637, (246 + 49 * linha), 863, (292 + 49 * linha), tocolor(241, 241, 241, 63), 1.00, font8, "left", "center", false, false, false, false, false)
                    end
                else
                    dxDrawImage(625, (247 + 49 * linha), 321, 45, "files/imgs/slot.png")
                    if isMouseInPosition(914, (264 + 49 * linha), 12, 11) then
                        dxDrawImage(914, (264 + 49 * linha), 12, 11, "files/imgs/cart.png", 0, 0, 0, tocolor(198, 78, 206, 255))
                    else
                        dxDrawImage(914, (264 + 49 * linha), 12, 11, "files/imgs/cart.png", 0, 0, 0, tocolor(240, 240, 240, 89))
                    end
                    dxDrawText("Slot Vazio", 637, (246 + 49 * linha), 863, (292 + 49 * linha), tocolor(241, 241, 241, 63), 1.00, font8, "left", "center", false, false, false, false, false)
                end
            end
        end
        if subAba == "vender" then
            dxDrawImage(390, 206, 585, 356, "files/imgs/background_sub.png")
            dxDrawImage(572, 283, 222, 201, "files/imgs/base_sub.png")
            dxDrawImage(592, 390, 179, 36, "files/imgs/button.png")
            dxDrawImage(592, 431, 179, 36, "files/imgs/button.png")
            if isMouseInPosition(592, 390, 179, 36) then
                dxDrawText("Player", 595, 389, 771, 425, tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, true, false, false)
            else
                dxDrawText("Player", 595, 389, 771, 425, tocolor(255, 255, 255, 114), 1.00, font2, "center", "center", false, false, true, false, false)
            end
            if isMouseInPosition(592, 431, 179, 36) then
                dxDrawText("Concessionária", 595, 431, 771, 467, tocolor(255, 255, 255, 255), 1.00, font2, "center", "center", false, false, true, false, false)
            else
                dxDrawText("Concessionária", 595, 431, 771, 467, tocolor(255, 255, 255, 114), 1.00, font2, "center", "center", false, false, true, false, false)
            end
            local dataCar = fromJSON(config["Slots Garagem"][selectVehicle].dataCar)
            dxDrawText("#B0B0B0Escolha o metodo de venda\ndo seu #DDDDDD"..dataCar[1].name, 592, 329, 768, 374, tocolor(255, 255, 255, 255), 1.00, font8, "left", "center", false, false, true, true, false)
        elseif subAba == "buySlot" then
            dxDrawImage(477, 257, 412, 253, "files/imgs/slot/base.png")
            if isMouseInPosition(520, 416, 326, 53) then
                dxDrawImage(520, 416, 326, 53, "files/imgs/confirmar_select.png")
            else
                dxDrawImage(520, 416, 326, 53, "files/imgs/confirmar.png")
            end
            dxDrawText("Deseja comprar Slot veículo? por\nVP "..formatNumber(priceSlot), 520, 340, 841, 408, tocolor(241, 241, 241, 165), 1.00, font2, "left", "center", false, false, true, false, false)
        elseif subAba == "player" then
            dxDrawImage(390, 206, 585, 356, "files/imgs/background_sub.png")
            dxDrawImage(572, 259, 222, 250, "files/imgs/base_venda.png")
            if isMouseInPosition(591, 454, 179, 36) then
                dxDrawImage(591, 454, 179, 36, "files/imgs/vender_select.png")
            else
                dxDrawImage(591, 454, 179, 36, "files/imgs/vender.png")
            end
            if isMouseInPosition(592, 430, 12, 12) or selectType == "money" then
                dxDrawImage(592, 430, 12, 12, "files/imgs/notselect_select.png")
            else
                dxDrawImage(592, 430, 12, 12, "files/imgs/notselect.png")
            end
            if isMouseInPosition(664, 430, 12, 12) or selectType == "vp" then
                dxDrawImage(664, 430, 12, 12, "files/imgs/notselect_select.png")
            else
                dxDrawImage(664, 430, 12, 12, "files/imgs/notselect.png")
            end
            dxDrawText(select == 1 and guiGetText(edits[1]).."|" or guiGetText(edits[1]), 608, 344, 776, 376, tocolor(255, 255, 255, 114), 1.00, font2, "left", "center", false, false, true, true, false)
            dxDrawText(select == 2 and guiGetText(edits[2]).."|" or guiGetText(edits[2]), 608, 383, 776, 415, tocolor(255, 255, 255, 114), 1.00, font2, "left", "center", false, false, true, true, false)
        end
    elseif window == "detran" then
        if typeWindow == "impostos" then
            dxDrawImage(347, 180, 671, 408, "files/imgs/detran/base_detran_imp.png")
            if isMouseInPosition(859, 203, 66, 22) or typeWindow == "impostos" then
                dxDrawText("Impostos", 863, 206, 923, 223, tocolor(255, 255, 255, 255), 1.00, font9, "center", "center", false, false, false, false, false)
            else
                dxDrawText("Impostos", 863, 206, 923, 223, tocolor(255, 255, 255, 140), 1.00, font2, "center", "center", false, false, false, false, false)
            end
            if isMouseInPosition(931, 203, 66, 22) or typeWindow == "veiculos" then
                dxDrawText("Veículos", 937, 206, 987, 223, tocolor(255, 255, 255, 255), 1.00, font9, "center", "center", false, false, false, false, false)
            else
                dxDrawText("Veículos", 937, 206, 987, 223, tocolor(255, 255, 255, 140), 1.00, font2, "center", "center", false, false, false, false, false)
            end
            linha = 0
            for i, v in ipairs(config["Slots Garagem"]) do
                if v.isActive then
                    if v.carroOccupied then
                        if tonumber(v.imposto) <= timeStampAtual then
                            if (i > proxPage and linha < 5) then
                                linha = linha + 1
                                local dataJSON = fromJSON(v.dataCar)
                                if isMouseInPosition(377, (231 + 49 * linha), 611, 45) or selectCar == i then
                                    dxDrawImage(377, (231 + 49 * linha), 611, 45, "files/imgs/detran/cage_select.png")
                                else
                                    dxDrawImage(377, (231 + 49 * linha), 611, 45, "files/imgs/detran/cage.png")
                                end
                                dxDrawText("IPVA "..v.nameVehicle, 391, (229 + 49 * linha), 717, (277 + 49 * linha), tocolor(241, 241, 241, 219), 1.00, font9, "left", "center", false, false, true, false, false)
                                dxDrawText("€"..formatNumber(20*dataJSON[1].price/100), 654, (229 + 49 * linha), 980, (277 + 49 * linha), tocolor(241, 241, 241, 165), 1.00, font2, "right", "center", false, false, true, false, false)
                            end
                        end
                    end
                end
            end
            if selectCar then
                if isMouseInPosition(832, 524, 158, 36) then
                    dxDrawImage(832, 524, 158, 36, "files/imgs/detran/pagar_select.png")
                else
                    dxDrawImage(832, 524, 158, 36, "files/imgs/detran/pagar.png")
                end
            end
            if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition(1000, cursorY, 2, 56) or rolandobarra) and (#config["Slots Garagem"] > 5) then
                cursorY,proxPage = BarraUtilExata(#config["Slots Garagem"], 5, 280, 451, "y")
                rolandobarra = true
            end
            dxDrawImage(1000, cursorY, 2, 56, "files/imgs/detran/bar.png")
        else
            dxDrawImage(347, 180, 671, 408, "files/imgs/detran/base_veiculos.png")
            if isMouseInPosition(859, 203, 66, 22) or typeWindow == "impostos" then
                dxDrawText("Impostos", 863, 206, 923, 223, tocolor(255, 255, 255, 255), 1.00, font9, "center", "center", false, false, false, false, false)
            else
                dxDrawText("Impostos", 863, 206, 923, 223, tocolor(255, 255, 255, 140), 1.00, font2, "center", "center", false, false, false, false, false)
            end
            if isMouseInPosition(931, 203, 66, 22) or typeWindow == "veiculos" then
                dxDrawText("Veículos", 937, 206, 987, 223, tocolor(255, 255, 255, 255), 1.00, font9, "center", "center", false, false, false, false, false)
            else
                dxDrawText("Veículos", 937, 206, 987, 223, tocolor(255, 255, 255, 140), 1.00, font2, "center", "center", false, false, false, false, false)
            end
            if getKeyState("mouse1") and isCursorShowing() and (isMouseInPosition(1000, cursorY, 2, 56) or rolandobarra) and (#config["Slots Garagem"] > 5) then
                cursorY,proxPage = BarraUtilExata(#config["Slots Garagem"], 5, 280, 451, "y")
                rolandobarra = true
            end
            dxDrawImage(1000, cursorY, 2, 56, "files/imgs/detran/bar.png")
            linha = 0
            for i, v in ipairs(config["Slots Garagem"]) do
                if (i > proxPage and linha < 5) then
                    linha = linha + 1
                    if v.isActive then
                        if v.carroOccupied then
                            local dataJSON = fromJSON(v.dataCar)
                            if isMouseInPosition(377, (231 + 49 * linha), 611, 45) or selectCar == i then
                                dxDrawImage(377, (231 + 49 * linha), 611, 45, "files/imgs/detran/cage_select.png")
                            else
                                dxDrawImage(377, (231 + 49 * linha), 611, 45, "files/imgs/detran/cage.png")
                            end
                            dxDrawText(v.nameVehicle, 391, (229 + 49 * linha), 717, (277 + 49 * linha), tocolor(241, 241, 241, 219), 1.00, font9, "left", "center", false, false, true, false, false)
                            dxDrawText(v.placa, 654, (229 + 49 * linha), 980, (277 + 49 * linha), tocolor(241, 241, 241, 165), 1.00, font2, "right", "center", false, false, true, false, false)
                            dxDrawText(v.seguro, 555, (229 + 49 * linha), 881, (277 + 49 * linha), tocolor(241, 241, 241, 165), 1.00, font2, "right", "center", false, false, true, false, false)
                            dxDrawText(v.state == "Recuperar" and "Sim" or "Não", 455, (229 + 49 * linha), 781, (277 + 49 * linha), tocolor(241, 241, 241, 165), 1.00, font2, "right", "center", false, false, true, false, false)
                        end
                    end
                end
            end
            if selectCar then
                if isMouseInPosition(521, 524, 135, 36) then
                    dxDrawImage(521, 524, 135, 36, "files/imgs/detran/recuperar_select.png")
                else
                    dxDrawImage(521, 524, 135, 36, "files/imgs/detran/recuperar.png")
                end
                if isMouseInPosition(666, 524, 156, 36) then
                    dxDrawImage(666, 524, 156, 36, "files/imgs/detran/pagarseguro_select.png")
                else
                    dxDrawImage(666, 524, 156, 36, "files/imgs/detran/pagarseguro.png")
                end
                if isMouseInPosition(832, 524, 158, 36) then
                    dxDrawImage(832, 524, 158, 36, "files/imgs/detran/emplacar_select.png")
                else
                    dxDrawImage(832, 524, 158, 36, "files/imgs/detran/emplacar.png")
                end
            end
        end
    end
end

addEvent("JOAO.openConce", true)
addEventHandler("JOAO.openConce", root,
function(window_, indexMarker_)
    if not isEventHandlerAdded("onClientRender", root, dx) then
        proxPage = 0
        select = 0
        selectTypeMethod = false
        EditBox("add")
        selectCar = false
        indexMarker = indexMarker_
        typeWindow = "impostos"
        selectVehicle = false
        if window_ == "conce" then
            cursorY = ((256)/screen[1]) * screen[1]
            setElementData(localPlayer, "BloqHud", true)
            selectAba = "Carros"
            selectCar = 1
            showChat(false)
			setCameraMatrix(1776.545, -1707.755, 15.25, 1776.545, -1707.755, 15.25, 0, 360)
			setElementFrozen(localPlayer, true)
			if isElement(car) and destroyElement(car) then end
			car = createVehicle(config["Veiculos"][selectAba][selectCar][2], 1776.5, -1702.2998, 14.434)
			RotCar = setTimer(function()
				local rx, ry, rz = getElementRotation(car)
				setElementRotation(car, rx, ry, rz+0.8)
			end, 0, 0)
        elseif window_ == "garagem" then
            cursorY = ((296)/screen[1]) * screen[1]
        elseif window_ == "detran" then
            cursorY = ((280)/screen[1]) * screen[1]
        end
        window = window_
        addEventHandler("onClientRender", root, dx)
        showCursor(true)
    end
end)

addEventHandler("onClientClick", root,
function(_, state)
    if state == "up" then
        if isEventHandlerAdded("onClientRender", root, dx) then
            if window == "conce" then
                if isMouseInPosition(1097, 560, 212, 52) and not subAba then
                    subAba = "comprar"
                end
                linha = 0
                for i, v in ipairs(config["Veiculos"][selectAba]) do
                    if (i > proxPage and linha < 3) then
                        linha = linha + 1
                        if isMouseInPosition(1097, (212 + 44 * linha), 212, 40) and not subAba then
                            selectCar = i
                            if isElement(car) and destroyElement(car) then end
                            if isTimer(RotCar) then killTimer(RotCar) end
                            car = createVehicle(config["Veiculos"][selectAba][selectCar][2], 1776.5, -1702.2998, 14.434)
                            RotCar = setTimer(function()
                                local rx, ry, rz = getElementRotation(car)
                                setElementRotation(car, rx, ry, rz+0.8)
                            end, 0, 0)
                        end
                    end
                end
                for i, v in ipairs(config["Cores"]) do
                    if (i < 19) then
                        if isMouseInPosition(CageColors[i][1], CageColors[i][2], CageColors[i][3], CageColors[i][4]) and not subAba then
                            selectColor = i
                            setVehicleColor(car, v[1], v[2], v[3])
                        end
                    end
                end
                if isMouseInPosition(1256, 26, 58, 23) and not subAba then
                    selectAba = "Carros"
                end
                if isMouseInPosition(1193, 26, 58, 23) and not subAba then
                    selectAba = "Motos"
                end
                if isMouseInPosition(1135, 26, 58, 23) and not subAba then
                    selectAba = "Barcos"
                end
                if isMouseInPosition(1044, 25, 86, 23) and not subAba then
                    selectAba = "helicoptero"
                end
                if subAba == "comprar" then
                    if isMouseInPosition(520, 403, 12, 12) then
                        selectTypeMethod = "dinheiro"
                    end
                    if isMouseInPosition(592, 403, 12, 12) then
                        selectTypeMethod = "vp"
                    end
                    if isMouseInPosition(520, 433, 326, 53) then
                        if selectTypeMethod then
                            triggerServerEvent("JOAO.buyVehicle", localPlayer, localPlayer, config["Veiculos"][selectAba][selectCar], (selectColor and config["Cores"][selectColor] or {0, 0, 0}), selectTypeMethod)
                        else
                            triggerEvent("send", localPlayer, "Selecione um tipo de pagamento!", "error")
                        end
                    end
                end
            elseif window == "detran" then
                if typeWindow == "impostos" then
                    if isMouseInPosition(859, 203, 66, 22) then
                        cursorY = ((280)/screen[1]) * screen[1]
                        proxPage = 0
                        typeWindow = "impostos"
                        selectCar = false
                    end
                    if isMouseInPosition(931, 203, 66, 22) then
                        cursorY = ((280)/screen[1]) * screen[1]
                        proxPage = 0
                        typeWindow = "veiculos"
                        selectCar = false
                    end
                    linha = 0
                    for i, v in ipairs(config["Slots Garagem"]) do
                        if v.isActive then
                            if v.carroOccupied then
                                if tonumber(v.imposto) <= timeStampAtual then
                                    if (i > proxPage and linha < 5) then
                                        linha = linha + 1
                                        local dataJSON = fromJSON(v.dataCar)
                                        if isMouseInPosition(377, (231 + 49 * linha), 611, 45) then
                                            selectCar = i
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if isMouseInPosition(832, 524, 158, 36) then
                        if selectCar then
                            triggerServerEvent("JOAO.manageVehicleDETRAN", localPlayer, localPlayer, "imposto", config["Slots Garagem"][selectCar])
                        end
                    end
                else
                    if isMouseInPosition(859, 203, 66, 22) then
                        cursorY = ((280)/screen[1]) * screen[1]
                        proxPage = 0
                        typeWindow = "impostos"
                        selectCar = false
                    end
                    if isMouseInPosition(931, 203, 66, 22) then
                        cursorY = ((280)/screen[1]) * screen[1]
                        proxPage = 0
                        typeWindow = "veiculos"
                        selectCar = false
                    end
                    linha = 0
                    for i, v in ipairs(config["Slots Garagem"]) do
                        if (i > proxPage and linha < 5) then
                            linha = linha + 1
                            if v.isActive then
                                if v.carroOccupied then
                                    if isMouseInPosition(377, (231 + 49 * linha), 611, 45) then
                                        selectCar = i
                                    end
                                end
                            end
                        end
                    end
                    if selectCar then
                        if isMouseInPosition(521, 524, 135, 36) then
                            triggerServerEvent("JOAO.manageVehicleDETRAN", localPlayer, localPlayer, "recuperar", config["Slots Garagem"][selectCar])
                        end
                        if isMouseInPosition(666, 524, 156, 36) then
                            triggerServerEvent("JOAO.manageVehicleDETRAN", localPlayer, localPlayer, "seguro", config["Slots Garagem"][selectCar])
                        end
                        if isMouseInPosition(832, 524, 158, 36) then
                            triggerServerEvent("JOAO.manageVehicleDETRAN", localPlayer, localPlayer, "emplacar", config["Slots Garagem"][selectCar])
                        end
                    end
                end
            elseif window == "garagem" then
                if subAba == "buySlot" then
                    if isMouseInPosition(520, 416, 326, 53) then
                        triggerServerEvent("JOAO.buySlotCONCE", localPlayer, localPlayer)
                    end
                end
                if selectVehicle then
                    if isMouseInPosition(422, 449, 179, 36) and not subAba then
                        triggerServerEvent("JOAO.manageVehicleGARAGEM", localPlayer, localPlayer, config["Slots Garagem"][selectVehicle].state == "Guardado" and "retirar" or "guardar", config["Slots Garagem"][selectVehicle], indexMarker)
                    end
                    if isMouseInPosition(422, 492, 179, 36) and not subAba then
                        subAba = "vender"
                    end
                    if subAba == "vender" then
                        if isMouseInPosition(592, 390, 179, 36) then
                            subAba = "player"
                        end
                        if isMouseInPosition(592, 431, 179, 36) then
                            triggerServerEvent("JOAO.venderVehicle", localPlayer, localPlayer, config["Slots Garagem"][selectVehicle], _, _, _, "conce")
                            selectVehicle = false
                            closeMenu()
                            closeMenu()
                            return
                        end
                    elseif subAba == "player" then
                        if isMouseInPosition(592, 342, 179, 36) then
                            select = 0
                            if guiEditSetCaretIndex(edits[1], string.len(guiGetText(edits[1]))) then
                                select = 1
                                guiBringToFront(edits[1])
                                guiSetInputMode("no_binds_when_editing") 
                                if (guiGetText(edits[1]) == "ID") then 
                                    guiSetText(edits[1], "")
                                end
                            end
                        end
                        if isMouseInPosition(592, 382, 179, 36) then
                            select = 0
                            if guiEditSetCaretIndex(edits[2], string.len(guiGetText(edits[2]))) then
                                select = 2
                                guiBringToFront(edits[2])
                                guiSetInputMode("no_binds_when_editing") 
                                if (guiGetText(edits[2]) == "Valor") then 
                                    guiSetText(edits[2], "")
                                end
                            end
                        end
                        if isMouseInPosition(591, 454, 179, 36) then
                            if guiGetText(edits[1]) == "" or guiGetText(edits[1]) == "ID" then
                                triggerEvent("send", localPlayer, "Você precisa inserir o ID!", "error")
                            else
                                if guiGetText(edits[2]) == "" or guiGetText(edits[2]) == "Valor" then
                                    triggerEvent("send", localPlayer, "Você precisa inserir o valor!", "error")
                                else
                                    local id = tonumber(guiGetText(edits[1]))
                                    local valor = tonumber(guiGetText(edits[2]))
                                    if id and valor then
                                        if selectType then
                                            triggerServerEvent("JOAO.venderVehicle", localPlayer, localPlayer, config["Slots Garagem"][selectVehicle], id, valor, selectType, "player")
                                            selectVehicle = false
                                            closeMenu()
                                            closeMenu()
                                            return
                                        else
                                            exports['fipi_infobox']:send(player, "Você precisa colocar o tipo de dinheiro!", "error")
                                        end
                                    else
                                        exports['fipi_infobox']:send(player, "O ID e valor tem que ser número!", "error")
                                    end
                                end
                            end
                        end
                        if isMouseInPosition(592, 430, 12, 12) then
                            selectType = "money"
                        end
                        if isMouseInPosition(664, 430, 12, 12) then
                            selectType = "vp"
                        end
                    end
                end
                linha = 0
                for i, v in ipairs(config["Slots Garagem"]) do
                    if (i > proxPage and linha < 5) then
                        linha = linha + 1
                        if v.isActive then
                            if v.carroOccupied then
                                if (isMouseInPosition(625, (247 + 49 * linha), 321, 45) and not isMouseInPosition(639, (264 + 49 * linha), 10, 12)) and not subAba then
                                    selectVehicle = i
                                end
                                if isMouseInPosition(639, (264 + 49 * linha), 10, 12) and not subAba then
                                    triggerServerEvent("JOAO.localizarVehicle", localPlayer, localPlayer, v.idCar)
                                end
                            end
                        else
                            if isMouseInPosition(914, (264 + 49 * linha), 12, 11) and not subAba then
                                priceSlot = v.priceSlot
                                subAba = "buySlot"
                            end
                        end
                    end
                end
            end
        end
    end
end)

function closeMenu()
    if isEventHandlerAdded("onClientRender", root, dx) then
        if subAba then
            subAba = nil
            selectVehicle = false
        else
            EditBox("destroy")
            removeEventHandler("onClientRender", root, dx)
            showCursor(false)
            setElementData(localPlayer, "BloqHud", false)
            if isElement(car) then destroyElement(car) end
            if isTimer(RotCar) then killTimer(RotCar) end
            showChat(true)
            setCameraTarget(localPlayer)
            setElementFrozen(localPlayer, false)
        end
    end
end
bindKey("backspace", "down", closeMenu)
addEvent("Daniel.Fechar", true)
addEventHandler("Daniel.Fechar", root, closeMenu)

addEventHandler("onClientKey", root,
function (button, press)
	if isEventHandlerAdded("onClientRender", root, dx) then
		if button == "mouse_wheel_up" and press then
            if window == "conce" then
                if (proxPage > 0) then
                    proxPage = proxPage - 1
                end
                if #config["Veiculos"][selectAba] > 3 then
                    cursorY = MoveBarraUtil(#config["Veiculos"][selectAba], 3, 256, 344, "y", proxPage)
                end
            elseif window == "garagem" then
                if (proxPage > 0) then
                    proxPage = proxPage - 1
                end
                if #config["Slots Garagem"] > 5 then
                    cursorY = MoveBarraUtil(#config["Slots Garagem"], 5, 296, 484, "y", proxPage)
                end
            elseif window == "detran" then
                if (proxPage > 0) then
                    proxPage = proxPage - 1
                end
                if #config["Slots Garagem"] > 5 then
                    cursorY = MoveBarraUtil(#config["Slots Garagem"], 5, 280, 451, "y", proxPage)
                end
            end
		elseif button == "mouse_wheel_down" and press then
            if window == "conce" then
                proxPage = proxPage + 1
                if (proxPage > #config["Veiculos"][selectAba] - 3) then
                    proxPage = #config["Veiculos"][selectAba] - 3
                end
                if #config["Veiculos"][selectAba] > 3 then
                    cursorY = MoveBarraUtil(#config["Veiculos"][selectAba], 3, 256, 344, "y", proxPage)
                end
            elseif window == "garagem" then
                proxPage = proxPage + 1
                if (proxPage > #config["Slots Garagem"] - 5) then
                    proxPage = #config["Slots Garagem"] - 5
                end
                if #config["Slots Garagem"] > 5 then
                    cursorY = MoveBarraUtil(#config["Slots Garagem"], 5, 296, 484, "y", proxPage)
                end
            elseif window == "detran" then
                proxPage = proxPage + 1
                if (proxPage > #config["Slots Garagem"] - 5) then
                    proxPage = #config["Slots Garagem"] - 5
                end
                if #config["Slots Garagem"] > 5 then
                    cursorY = MoveBarraUtil(#config["Slots Garagem"], 5, 280, 451, "y", proxPage)
                end
            end
		end
	end
end)

addEvent("JOAO.sendDataCONCE", true)
addEventHandler("JOAO.sendDataCONCE", root,
function(type, table_, tableSlots_, timeStampK)
    estoques = {}
    for i=1, #config["Slots Garagem"] do
        config["Slots Garagem"][i].isActive = false
        config["Slots Garagem"][i].carroOccupied = false
    end
    if type == "conce" then
        for i, v in ipairs(table_) do
            estoques[v.ID] = v.Quantia
        end
    elseif type == "garagem" or type == "detran" then
        subAba = false
        timeStampAtual = timeStampK
        if tableSlots_[1] then
            if tableSlots_[1]["quantia"] then
                --print(tableSlots_[1]["quantia"])
                for i=1, tableSlots_[1]["quantia"] do
                    --print(config["Slots Garagem"][i].isActive)
                    config["Slots Garagem"][i].isActive = true
                end
                for i, v in ipairs(table_) do
                    local removeJSON = fromJSON(v.dataCar)
                    config["Slots Garagem"][i].carroOccupied = true
                    config["Slots Garagem"][i].state = v.state
                    config["Slots Garagem"][i].dataCar = v.dataCar
                    config["Slots Garagem"][i].placa = v.placa
                    config["Slots Garagem"][i].imposto = v.imposto
                    config["Slots Garagem"][i].seguro = v.seguro
                    config["Slots Garagem"][i].idColum = v.ID
                    config["Slots Garagem"][i].idCar = v.idCar
                    config["Slots Garagem"][i].tuning = v.dataTuning
                    config["Slots Garagem"][i].nameVehicle = removeJSON[1].name
                end
            end
        end
    end
end)

function EditBox(tipo)
    if tipo == 'destroy' then
        for i=1, #edits do
            if isElement(edits[i]) then 
                destroyElement(edits[i])
            end
        end
    elseif tipo == 'add' then
        edits[1] = guiCreateEdit(-1000, -1000, 325, 50, 'ID', false)
        guiEditSetMaxLength(edits[1], 12)
        guiSetProperty(edits[1], 'ValidationString', '[0-9]*')
        edits[2] = guiCreateEdit(-1000, -1000, 325, 50, 'Valor', false)
        guiEditSetMaxLength(edits[2], 12)
        guiSetProperty(edits[2], 'ValidationString', '[0-9]*')
	end 
end

function BarraUtilExata(TotalConteudos, MaxLinhas, posInicial, posFinal, type)
    if string.lower(type) == "x" then 
        Tela = guiGetScreenSize()
        cy = getCursorPosition()
        posInicial = (posInicial*(Tela/1366)) / Tela
        posFinal = (posFinal*(Tela/1366)) / Tela 
    elseif string.lower(type) == "y" then 
        _,Tela = guiGetScreenSize()
        _,cy = getCursorPosition()
        posInicial = (posInicial*(Tela/768)) / Tela
        posFinal = (posFinal*(Tela/768)) / Tela 
    end  
    if cy >= (posFinal) then 
        cy = (posFinal)
    elseif cy <= (posInicial) then 
        cy = (posInicial)
    end             
    DeltaG = (Tela *  (posFinal)) - (Tela * (posInicial))   
    DeltaA = (Tela *  cy) - (Tela * (posInicial))
    cursorYProgress = Tela * (cy / (Tela/768)) 
    proximaPaginaProgress = (TotalConteudos-MaxLinhas)/DeltaG*(DeltaA)
    return cursorYProgress, proximaPaginaProgress
end 

function MoveBarraUtil(TotalConteudos, MaxLinhas, posInicial, posFinal, type, proximaPaginaNovo)
    if string.lower(type) == "x" then 
        Tela = guiGetScreenSize()
        posInicial = (posInicial*(Tela/1366)) / Tela
        posFinal = (posFinal*(Tela/1366)) / Tela 
    elseif string.lower(type) == "y" then 
        _,Tela = guiGetScreenSize()
        posInicial = (posInicial*(Tela/768)) / Tela
        posFinal = (posFinal*(Tela/768)) / Tela 
    end     
    cy = (((posFinal-posInicial)/(TotalConteudos-MaxLinhas))*proximaPaginaNovo)+posInicial
    DeltaG = math.floor((Tela *  (posFinal)) - (Tela * (posInicial)))    
    DeltaA = math.floor((Tela *  cy) - (Tela * (posInicial)))
    cursorYProgress = Tela * (cy / (Tela/768)) 
    return cursorYProgress
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == "string" and isElement( pElementAttachedTo ) and type( func ) == "function" then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == "table" and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end