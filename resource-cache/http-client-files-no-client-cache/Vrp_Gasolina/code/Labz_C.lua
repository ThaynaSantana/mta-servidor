---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- RESOLUÇÃO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)

local font = dxCreateFont("files/fontt3.ttf", 7)
local font2 = dxCreateFont("files/fontt4.ttf", 8)
local font3 = dxCreateFont("files/fontt2.ttf", 15)
local font4 = dxCreateFont("files/fontt2.ttf", 7)
local font5 = dxCreateFont("files/fontt4.ttf", 22)
local font6 = dxCreateFont("files/fontt5.ttf", 9)
local font7 = dxCreateFont("files/fontt5.ttf", 11)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- DX
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

abastecendo = false
precoo = 0

function dxgasinfo()
    for i,v in ipairs(cfg.gasolina) do
        if (getDistanceBetweenPoints3D(v[1], v[2], v[3], getElementPosition(getLocalPlayer()))) < 3 then
            if not getPedOccupiedVehicle(localPlayer) then
                local veh = getproxveh(localPlayer, 15)
                if veh then
                    local x, y, z = getElementPosition(veh)
                    local gasolina = math.floor(getElementData(veh, "Gasolina")) or 0
                    if abastecendo == false then
                        dxDrawACRectangle("#007AF1#ffffff H para abastecer", x, y, z + 0.5, 3, tocolor(255, 255, 255, 130), tocolor(30, 30, 30, 100), 1.0, font2)
                    else
                        dxDrawACRectangle("#007AF1#ffffff H para cancelar", x, y, z + 0.5, 3, tocolor(255, 255, 255, 130), tocolor(30, 30, 30, 100), 1.0, font2)
                        dxDrawACRectangle("Tanque: #007AF1"..gasolina.."%  #ffffffPreço: #007AF1€"..precoo.."", x, y, z + 0.4, 3, tocolor(255, 255, 255, 130), tocolor(30, 30, 30, 100), 1.0, font2)
                    end
                end
            end
        end
    end
end
addEventHandler("onClientRender", root, dxgasinfo)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- COMEÇAR ABASTECER
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

timerabst = nil
function acabastecer()
    if abastecendo == false then
        for i,v in ipairs(cfg.gasolina) do
            if (getDistanceBetweenPoints3D(v[1], v[2], v[3], getElementPosition(getLocalPlayer()))) < 3 then
                if not getPedOccupiedVehicle(localPlayer) then
                    local veh = getproxveh(localPlayer, 3)
                    local gasolina = getElementData(veh, "Gasolina") or 0
                    if veh then
                        if getElementData(veh, "SendoAbastecido") == false then
                            if gasolina >= 100 then
                            else
                                if getPlayerMoney(localPlayer) >= 0 then
                                    setElementData(veh, "SendoAbastecido", true)
                                    abastecendo = true
                                    triggerServerEvent("AC-FrozenGas", localPlayer, localPlayer, veh, 1)
                                    setElementData(localPlayer, "AC-Abastecendo", true)
                                    timerabst = setTimer(
                                    function()
                                        setElementData(veh, "Gasolina", getElementData(veh, "Gasolina") + 1)
                                        precoo = precoo + 2
                                        if getElementData(veh, "Gasolina") >= 99 then
                                            killTimer(timerabst)
                                            setElementData(veh, "Gasolina", 100)
                                            setPedAnimation(localPlayer, nil)
                                            triggerServerEvent("AC-FrozenGas", localPlayer, localPlayer, veh, 2)
                                            setElementData(localPlayer, "AC-Abastecendo", false)
                                            setElementData(veh, "SendoAbastecido", false)
                                            if tonumber(precoo) >= 0 then
                                                takePlayerMoney (precoo)
                                            end
                                            abastecendo = false
                                            precoo = 0
                                        end
                                    end, 1000, 100)
                                else
                                    exports["fipi_infobox"]:addBox(player, "Você não possui #ffffff€"..1*100-gasolina.."#bebebe.", "warning")



                                end
                            end
                        end
                    end
                end
            end
        end
    else
        local veh = getproxveh(localPlayer, 3)
        if veh then
            killTimer(timerabst)
            triggerServerEvent("AC-FrozenGas", localPlayer, localPlayer, veh, 2)
            setElementData(localPlayer, "AC-Abastecendo", false)
            setElementData(veh, "SendoAbastecido", false)
            setPedAnimation(localPlayer, nil)
            if tonumber(precoo) >= 0 then
                takePlayerMoney (precoo)
            end
            abastecendo = false
            precoo = 0     
        end   
    end
end
bindKey("H", "down", acabastecer)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEL
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function dxDrawACRectangle(text, x, y, z, distance, color, color2, scale, font) 
    if (getDistanceBetweenPoints3D(x, y, z, getElementPosition(getLocalPlayer()))) < distance then
    local rx = {getScreenFromWorldPosition( x, y, z )}
    local x2 = dxGetTextWidth(text, 1.0, font, true)
        if rx[1] and rx[2] and rx[3] then
            dxDrawRectangle(rx[1] - (10 + (0.5 * x2)), rx[2], x2 + 20, 25, color2)
            dxDrawText(text, rx[1], rx[2] + 27, rx[1], rx[2], color, scale, font, "center", "center", false, false, false, true, false)
        end    
    end
end

---

function convertTime(ms) 
    local hr = math.floor((ms/3600000)%60) 
    local min = math.floor((ms/60000)%60) 
    local sec = math.floor((ms/1000)%60) 
    return hr, min, sec 
end

---

function convertNumber ( number )  
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end

---

function isCursorOnElement( posX, posY, width, height )
    if isCursorShowing( ) then
      local mouseX, mouseY = getCursorPosition( )
      local clientW, clientH = guiGetScreenSize( )
      local mouseX, mouseY = mouseX * clientW, mouseY * clientH
      if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
        return true
      end
    end
    return false
end

---

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if 
        type( sEventName ) == 'string' and 
        isElement( pElementAttachedTo ) and 
        type( func ) == 'function' 
    then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

---
function renderAnimation()
    for k, v in ipairs(getElementsByType("player")) do
        if getElementData(v, "AC-Abastecendo") then
        local block, animation = getPedAnimation(v)
            if animation ~= "jetpack_idle" then
                setPedAnimation(v, "ped", "jetpack_idle", 200, true, false, false, true)
            end
        end
    end
end
addEventHandler("onClientRender", root, renderAnimation)

function getproxveh(ply,distance)
	local x, y, z = getElementPosition (ply) 
	local dist = distance
	local id = false
    local players = getElementsByType("vehicle")
    for i, v in ipairs (players) do 
        if ply ~= v then
            local pX, pY, pZ = getElementPosition (v) 
            if getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ) < dist then
                dist = getDistanceBetweenPoints3D (x, y, z, pX, pY, pZ)
                id = v
            end
        end
    end
    if id then
        return id
    else
        return false
    end
end