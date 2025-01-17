local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)
local screenWidth, screenHeight = guiGetScreenSize()
local myScreenSource = dxCreateScreenSource(screenWidth, screenHeight)
local flickerStrength = 0
local dxfont0_fonte = dxCreateFont("font/fonte.ttf", 13)

addEventHandler("onClientKey", root, 
	function (button, press)
		if getElementData(getLocalPlayer(),"playerFallen") then
			if button == "F1" or button == "F2" or button == "F3" or button == "F4" or button == "F5" or button == "F6" or button == "F7" or button == "F8" or button == "F9" or button == "F10" or button == "F11" then
				cancelEvent()
			end
		end
	end
)

function blockDead()
	if getElementHealth(localPlayer) <= 20 then
		if not getElementData(localPlayer, "jobSAMU") then
			if not getElementData(localPlayer, "playerFallen") then
				cancelEvent()
			end
		end
	end
end
addEventHandler("onClientPlayerDamage", localPlayer, blockDead)

function text()
    for _, player in ipairs(getElementsByType('player')) do
        if isElementOnScreen(player) and getElementData(player, "playerFallen") then
            local x, y, z = getElementPosition(player)
            local cx, cy, cz = getCameraMatrix()
            local vx, vy, vz = getPedBonePosition(player, 8)
            local dist = getDistanceBetweenPoints3D(cx, cy, cz, vx, vy, vz)
            local drawDistance = 30.0
            if (dist < drawDistance or player == target) then
                if(isLineOfSightClear(cx, cy, cz, vx, vy, vz, true, false, false)) then
                    local x, y = getScreenFromWorldPosition (vx, vy, vz + 0.6)
                    if(x and y) then
                        local px, py = getScreenFromWorldPosition (vx, vy, vz + 0.3)
                        local w = dxGetTextWidth("PRECISANDO DE CURA!", 1, "default-bold")
                        local h = dxGetFontHeight(1, "default-bold")
                        dxDrawImage(x -6  - w / 2,y - 15 - h - 12, w + 25, h + 115, 'images/hp.png', 0, 0, 0, tocolor(255, 0, 0, math.abs(math.sin(getTickCount()/170))*200))
                    end
                end
            end
        end
    end
end
addEventHandler("onClientRender", root, text)

function convertTime(ms) 
    local min = math.floor ( ms/60000 ) 
    local sec = math.floor( (ms/1000)%60 ) 
    return min, sec 
end 

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

function contador()
	local timer = interpolateBetween(deadTime, 0, 0, 0, 0, 0, (getTickCount()-tick)/deadTime, "Linear")
    local minutes, seconds = convertTime(timer)

    if minutes < 10 then
        minutes = "0"..minutes
    end
    if seconds < 10 then
        seconds = "0"..seconds
    end
        dxDrawRectangle(screenW * 0.3580, screenH * 0.8099, screenW * 0.2621, screenH * 0.1328, tocolor(0, 0, 0, 182), false)
        dxDrawText("EMERGÊNCIA", screenW * 0.3580, screenH * 0.7878, screenW * 0.6201, screenH * 0.8151, tocolor(255, 25, 25, 255), 1.20, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Você está ferido e precisa de um médico.", screenW * 0.3580, screenH * 0.8229, screenW * 0.6201, screenH * 0.8477, tocolor(255, 255, 255, 255), 1.20, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Chame os paramédicos digitando /192", screenW * 0.3580, screenH * 0.8477, screenW * 0.6201, screenH * 0.8724, tocolor(255, 255, 255, 255), 1.20, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("e aguarde um paramédico chegar.", screenW * 0.3580, screenH * 0.8724, screenW * 0.6201, screenH * 0.8971, tocolor(255, 255, 255, 255), 1.20, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("TEMPO DE VIDA:", screenW * 0.3616, screenH * 0.9154, screenW * 0.4305, screenH * 0.9375, tocolor(255, 254, 254, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("#ff0000".. minutes.."#ffffff:#ff0000"..seconds, screenW * 0.3580, screenH * 0.9023, screenW * 0.6201, screenH * 0.9505, tocolor(255, 25, 25, 255), 1.40, "default-bold", "center", "center", false, false, false, true, false)
end

function createShader()
    oldFilmShader, oldFilmTec = dxCreateShader("shaders/old_film.fx")
end

function DxChamar()
       dxDrawText("Você chamou um paramédico, aguarde.", screenW * 0.3580, screenH * 0.7500, screenW * 0.6223, screenH * 0.7799, tocolor(245, 254, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
end

function updateShader()
    upDateScreenSource()

    if (oldFilmShader) then
        local flickering = math.random(100 - flickerStrength, 100)/100
        dxSetShaderValue(oldFilmShader, "ScreenSource", myScreenSource);
        dxSetShaderValue(oldFilmShader, "Flickering", flickering);
        dxDrawImage(0, 0, screenWidth, screenHeight, oldFilmShader)
    end
end

function upDateScreenSource()
    dxUpdateScreenSource(myScreenSource)
end

function render()
    if not isEventHandlerAdded("onClientRender", root, contador) then
      tick = getTickCount()
      createShader()
      addEventHandler("onClientRender", root, contador)
      addEventHandler("onClientPreRender", root, updateShader)
    end
end
addEvent("startDeadTime", true)
addEventHandler("startDeadTime", root, render)

function remove()
    if isEventHandlerAdded("onClientRender", root, contador) then
      removeEventHandler("onClientRender", root, contador)
      removeEventHandler("onClientPreRender", root, updateShader)
    end
end
addEvent("stopDeadTime", true)
addEventHandler("stopDeadTime", root, remove)