-- 'main parameters'
root = getRootElement()
player = getLocalPlayer()
vehicle = nil
 
 
-- 'round value'
function roundValue(value)
    local var = math.floor((value) + 0.5)
    return var
end
 

 
-- CAMBIO DO VEICULO
 
function getVehicleGear()   
    if (vehicle) then
        local vehicleGear = getVehicleCurrentGear(vehicle)
       
        return tonumber(vehicleGear)
    else
        return 0
    end
end
 
 
function getFormattedVehicleGear()
    local gear = getVehicleGear()
    local rearString = "R"
   
    if (gear > 0) then
        return gear
    else
        return rearString
    end
end
--====================================================================================
-- FUN??O DO CONTA GIROS
 
g_Player = getLocalPlayer()
function getVehicleSpeed()
    if isPedInVehicle(g_Player) then
        local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(g_Player))
        return math.sqrt(vx^2 + vy^2 + vz^2) * 187.5
    end
    return 0
end
function getElementSpeed(element,unit)
    assert(isElement(element), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(element) .. ")")
    assert(getElementType(element) == "player" or getElementType(element) == "ped" or getElementType(element) == "object" or getElementType(element) == "vehicle", "Invalid element type @ getElementSpeed (player/ped/object/vehicle expected, got " .. getElementType(element) .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    return (Vector3(getElementVelocity(element)) * mult).length
end
--====================================================================================
 
local screenWidth, screenHeight = guiGetScreenSize()
 
 
-- 'fonts'
local myFont = dxCreateFont( "font/opensans.ttf", 30 )
--local myFont2 = dxCreateFont( "files/bitsu.ttf", 7 )
local myFont3 = dxCreateFont( "font/Prototype.ttf", 17 )
--local myFont4 = dxCreateFont( "files/aero.ttf", 11 )
--local myFont5 = dxCreateFont( "files/aero.ttf", 9 )
 
 
local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280, 720
local x, y =  (screenW/resW), (screenH/resH)
 
 
--  'Alpha'
local textAlpha = 255
 
fadeIn = false
function checkApha()
  if textAlpha < 100 then
    fadeIn = true
  elseif textAlpha >= 200 and textAlpha <= 255 and fadeIn == true then
    fadeIn = false
  end
end

		
			
 
 
local screenX, screenY = guiGetScreenSize ( );
local maxAngle = 180;
function VelocimetroSZ() --======== RENDER ==========--
--if getElementData (localPlayer, "EsconderHUD") == true then return end
  
local time = 8.110
if fadeIn == false then
    textAlpha = textAlpha - time
  elseif fadeIn == true then
    textAlpha = textAlpha + time
end
 
  checkApha()
    vehicle = getPedOccupiedVehicle(getLocalPlayer())
	if vehicle and getVehicleController(vehicle) == localPlayer and not isPlayerMapVisible() then

           	if getVehicleEngineState ( vehicle, true ) then
-- FUNDO DO VELOCIMETRO
        dxDrawImage(roundValue(screenWidth - 260), roundValue(screenHeight - 245), 250, 250, "img/speedo1.png", 0, 0, 0, tocolor(255, 255, 255 , 255), true)


-- CONTA GIROS
	local vehicleSpeed = getElementSpeed(vehicle,1)
	dxDrawImage(roundValue(screenWidth - 260), roundValue(screenHeight - 238), 250, 250, "img/needle1.png", (vehicleSpeed/1.55)-116, 0, 0, tocolor(255, 0, 0 , 255), true)	
	--dxDrawImage(roundValue(screenWidth - 260), roundValue(screenHeight - 238), 250, 250, "img/circ.png", (vehicleSpeed/1.4)-135, 0, 0, tocolor(255, 255, 255 , 255), true)	

	
	
-- VELOCIDADE
local vehicleSpeed = getElementSpeed(vehicle,1)
local getSpeed = string.format("%03d",vehicleSpeed)
        dxDrawText(getSpeed, screenWidth - 106, screenHeight - 118, screenWidth - 158, screenHeight - 115, tocolor(0, 0, 0, 255), 1, myFont, "center", "top", false, false, true)
        dxDrawText(getSpeed, screenWidth - 106, screenHeight - 120, screenWidth - 160, screenHeight - 115, tocolor(255, 255, 255, 255), 1, myFont, "center", "top", false, false, true)

 
 
-- CAMBIO
local cambio = getFormattedVehicleGear()
local neutro = math.floor(vehicleSpeed)
        if neutro > 0 then
			dxDrawText(cambio, screenWidth - 83, screenHeight - 153, screenWidth - 160, screenHeight - 115, tocolor(0, 0, 0, 255), 1, myFont3, "center", "top", false, false, true)
			dxDrawText(cambio, screenWidth - 80, screenHeight - 155, screenWidth - 160, screenHeight - 115, tocolor(141, 198, 63, 255), 1, myFont3, "center", "top", false, false, true)
        else
			dxDrawText("N", screenWidth - 83, screenHeight - 153, screenWidth - 160, screenHeight - 115, tocolor(0, 0, 0, 255), 1, myFont3, "center", "top", false, false, true)
			dxDrawText("N", screenWidth - 85, screenHeight - 155, screenWidth - 160, screenHeight - 115, tocolor(141, 198, 63, 255), 1, myFont3, "center", "top", false, false, true)
		end 
		
--dxDrawImage(roundValue(screenWidth - 184), roundValue(screenHeight - 40), 256, 256, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255 , 255), true)			



-- SETA ESQUERDA
	if(getElementData ( vehicle, 'i:left' )) then   
        dxDrawImageSection(roundValue(screenWidth - 174), roundValue(screenHeight - 42), 28, 18, 10, -2, 28, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, textAlpha), true)
	else
        dxDrawImageSection(roundValue(screenWidth - 174), roundValue(screenHeight - 42), 28, 18, 10, -2, 28, 18, "img/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
		
		
-- SETA DIREITA
	if(getElementData ( vehicle, 'i:right' )) then
        dxDrawImageSection(roundValue(screenWidth - 123), roundValue(screenHeight - 42), 28, 18, 61, -2, 28, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, textAlpha), true)       
	else
        dxDrawImageSection(roundValue(screenWidth - 123), roundValue(screenHeight - 42), 28, 18, 61, -2, 28, 18, "img/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true) 
	end
	



-- FREIO DO VEICULO
	if isElementFrozen( vehicle ) then   
        dxDrawImageSection(roundValue(screenWidth - 144), roundValue(screenHeight - 42), 18, 18, 40, -2, 18, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	else
        dxDrawImageSection(roundValue(screenWidth - 144), roundValue(screenHeight - 42), 18, 18, 40, -2, 18, 18, "img/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end


	-- PORTA TRANCADA
if isVehicleLocked( vehicle ) or ( getElementData( vehicle, "cl_vehiclelocked" ) ) then 
        dxDrawImageSection(roundValue(screenWidth - 194), roundValue(screenHeight - 22), 28, 18, -10, 18, 28, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
else
        dxDrawImageSection(roundValue(screenWidth - 194), roundValue(screenHeight - 22), 28, 18, -10, 18, 28, 18, "img/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
end

-- MOTOR DO VEICULO
if getVehicleEngineState ( vehicle ) then     
        dxDrawImageSection(roundValue(screenWidth - 161), roundValue(screenHeight - 22), 28, 18, 23, 18, 28, 18, "img/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true) 
else
        dxDrawImageSection(roundValue(screenWidth - 161), roundValue(screenHeight - 22), 28, 18, 23, 18, 28, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)     
end


-- VIDRO DO CARRO       
        dxDrawImageSection(roundValue(screenWidth - 135), roundValue(screenHeight - 22), 28, 18, 50, 18, 28, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
 
 
 -- FAROL DO VEICULO     
if getVehicleOverrideLights ( vehicle ) ~= 2 then
        dxDrawImageSection(roundValue(screenWidth - 104), roundValue(screenHeight - 22), 28, 18, 80, 18, 28, 18, "img/icon.png", 0, 0, 0, tocolor(255, 255, 255, 255), true) 
else
        dxDrawImageSection(roundValue(screenWidth - 104), roundValue(screenHeight - 22), 28, 18, 80, 18, 28, 18, "img/iconglow.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)     
end  


 
        
local veh = getPedOccupiedVehicle(getLocalPlayer())
--local fuel = getElementData(veh,"fuel")
local fuel = tonumber ( getElementData ( veh, "veh:fuel" ) )

if not fuel then return false end
		local fuel = math.floor(fuel)
		
		--[[
		if fuel >= 60 then
			r, g, b = 0, 255, 0
		elseif fuel < 50 then
			r, g, b = 255, 255, 0
		elseif fuel < 30 then
			r, g, b = 255, 10, 0
		end]]--
		r, g, b = 255, 255, 255

local fuel2 = 50
if getVehicleType(veh) ~= "BMX" then
	dxDrawImage(roundValue(screenWidth - 440), roundValue(screenHeight - 190), 256, 256, "img/fuelbase.png", 0, 0, 0, tocolor(255, 255, 255 , 155), true)
	dxDrawImage(roundValue(screenWidth - 440), roundValue(screenHeight - 190), 256, 256, "img/fuelline.png", 0, 0, 0, tocolor(0, 0, 0 , 155), true)
	dxDrawImage(roundValue(screenWidth - 440), roundValue(screenHeight - 190), 256, 256, "img/fuelindicator.png", (fuel/0.55), 0, 0, tocolor(255, 255, 255 , 255), true)
	


	if getVehicleOverrideLights ( vehicle ) ~= 2 then
        --dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum.png", 0, 0, 0, tocolor(r, g, b , 255), true)
	else
        local r, g, b = getVehicleHeadLightColor(vehicle)
        dxDrawImage(roundValue(screenWidth - 440), roundValue(screenHeight - 190), 256, 256, "img/fuelnum2.png", 0, 0, 0, tocolor(r, g, b , 155), true)
	end  
	
	local r, g, b = getVehicleHeadLightColor(vehicle)
	dxDrawImage(roundValue(screenWidth - 440), roundValue(screenHeight - 190), 256, 256, "img/fuelnum.png", 0, 0, 0, tocolor(r, g, b , 155), true)

end



 --[[	
 
 
       

       
local veh = getPedOccupiedVehicle(getLocalPlayer())
--local fuel = getElementData(veh,"fuel")
local fuel = tonumber ( getElementData ( veh, "veh:fuel" ) )
if not fuel then return false end
		local fuel = math.floor(fuel)
		if fuel >= 60 then
			r, g, b = 0, 255, 0
		elseif fuel < 50 then
			r, g, b = 255, 255, 0
		elseif fuel < 30 then
			r, g, b = 255, 10, 0
		end

local fuel2 = 50
if getVehicleType(veh) ~= "BMX" then
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelbase.png", 0, 0, 0, tocolor(255, 255, 255 , 255), true)
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelline.png", 0, 0, 0, tocolor(0, 0, 0 , 255), true)
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelindicator.png", fuel/0.55, 0, 0, tocolor(255, 255, 255 , 255), true)
	
	dxDrawText("Gasolina "..fuel.."%", screenWidth - 450, screenHeight - 200, screenWidth - 160, screenHeight - 115, tocolor(255, 255, 255, 200), 1, myFont5, "center", "top", false, false, true)

	
	if getVehicleOverrideLights ( vehicle ) ~= 2 then
        --dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum.png", 0, 0, 0, tocolor(r, g, b , 255), true)
	else
        local r, g, b = getVehicleHeadLightColor(vehicle)
        dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum2.png", 0, 0, 0, tocolor(r, g, b , 255), true)
	end  
	
	local r, g, b = getVehicleHeadLightColor(vehicle)
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum.png", 0, 0, 0, tocolor(r, g, b , 255), true)
end
 
       

       

   
 
 
-- NOME DO VEICULO
local VehicleName = getVehicleName(getPedOccupiedVehicle(localPlayer))
        dxDrawText(VehicleName, screenWidth - 109, screenHeight - 189, screenWidth - 160, screenHeight - 115, tocolor(0, 0  , 0  , 200), 1, myFont4, "center", "top", false, false, true)
        dxDrawText(VehicleName, screenWidth - 110, screenHeight - 190, screenWidth - 160, screenHeight - 115, tocolor(255, 255 , 255  , 200), 1, myFont4, "center", "top", false, false, true)
 
       
-- DANO DO VEICULO     
local damage = getElementHealth(getPedOccupiedVehicle(getLocalPlayer()))
local dano = math.floor((damage*100)/1000)     
        dxDrawImageSection(roundValue(screenWidth - 60), roundValue(screenHeight - 280), 29, 33, 0, 0, 29, 33, "image/shieldBase.png", 0, 0, 0, tocolor(255, 255, 255, 150), true)
        dxDrawImageSection(roundValue(screenWidth - 60), roundValue(screenHeight - 247),29,-(33/100*dano),0,0,29,-(33/100*dano),"image/shieldFull.png", 0, 0, 0, tocolor(255, 255, 255, 200), true)
        dxDrawText("armor", screenWidth - 14, screenHeight - 279, screenWidth - 160, screenHeight - 115, tocolor(0, 0  , 0  , 200), 1, myFont5, "center", "top", false, false, true)
        dxDrawText("armor", screenWidth - 15, screenHeight - 280, screenWidth - 160, screenHeight - 115, tocolor(255, 255 , 255  , 200), 1, myFont5, "center", "top", false, false, true)
 
 
 
-- NITRO DI VEICULO
local nitro = getVehicleNitroLevel(getPedOccupiedVehicle(getLocalPlayer()))
local id = 8
local slot = getVehicleUpgradeOnSlot(vehicle, tonumber(id))
        dxDrawImageSection(roundValue(screenWidth - 30), roundValue(screenHeight - 270), 26, 65, 0, 0, 26, 65, "image/nitro.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        if slot then       
                if nitro ~= false and nitro ~= nil and nitro > 0  then
                        local NitroLevel = getVehicleNitroLevel(vehicle)
                        dxDrawImageSection(roundValue(screenWidth - 24), roundValue(screenHeight - 228),12,-(33/1*NitroLevel),0,0,12,-(33/1*NitroLevel),"image/nitrolevel.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
                end
        end
 

	
-- GASOLINA
local veh = getPedOccupiedVehicle(getLocalPlayer())
--local fuel = getElementData(veh,"fuel")
local fuel = tonumber ( getElementData ( veh, "fuel" ) )
if not fuel then return false end
		local fuel = math.floor(fuel)
		if fuel >= 60 then
			r, g, b = 0, 255, 0
		elseif fuel < 50 then
			r, g, b = 255, 255, 0
		elseif fuel < 30 then
			r, g, b = 255, 10, 0
		end



local fuel2 = 50
if getVehicleType(veh) ~= "BMX" then
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelbase.png", 0, 0, 0, tocolor(255, 255, 255 , 255), true)
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelline.png", 0, 0, 0, tocolor(0, 0, 0 , 255), true)
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelindicator.png", fuel/0.55, 0, 0, tocolor(255, 255, 255 , 255), true)
	
	dxDrawText("Gasolina "..fuel.."%", screenWidth - 450, screenHeight - 200, screenWidth - 160, screenHeight - 115, tocolor(255, 255, 255, 200), 1, myFont5, "center", "top", false, false, true)

	
	if getVehicleOverrideLights ( vehicle ) ~= 2 then
        --dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum.png", 0, 0, 0, tocolor(r, g, b , 255), true)
	else
        local r, g, b = getVehicleHeadLightColor(vehicle)
        dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum2.png", 0, 0, 0, tocolor(r, g, b , 255), true)
	end  
	
	local r, g, b = getVehicleHeadLightColor(vehicle)
	dxDrawImage(roundValue(screenWidth - 420), roundValue(screenHeight - 190), 256, 256, "image/fuelnum.png", 0, 0, 0, tocolor(r, g, b , 255), true)
end
	
	
--]]
end
    end
end
addEventHandler("onClientRender", root, VelocimetroSZ)
 
 fuellessVehicle = { [510]=true, [481]=true, [509]=true, [441]=true, [464]=true, [501]=true, [465]=true, [564]=true, [594]=true }
 enginelessVehicle = { [510]=true, [509]=true, [481]=true }
 function onVehicleEnter(thePlayer, seat)
	if (thePlayer==getLocalPlayer()) then
		if (seat<2) then
		--[[
			local id = getElementModel(source)
			if seat == 0 and not (fuellessVehicle[id]) then
				drawFuel = true
			end]]--
			if not (enginelessVehicle[id]) then
				addEventHandler("onClientRender", getRootElement(), VelocimetroSZ)
			end
		end
	end
end
addEventHandler("onClientVehicleEnter", getRootElement(), onVehicleEnter)

function onVehicleExit(thePlayer, seat)
	if (thePlayer==getLocalPlayer()) then
		if (seat<2) then
		--[[
			local id = getElementModel(source)
			if seat == 0 and not (fuellessVehicle[id]) then
				drawFuel = false
			end
			]]--
			if not(enginelessVehicle[id]) then
				removeEventHandler("onClientRender", getRootElement(), VelocimetroSZ)
			end
		end
	end
end
addEventHandler("onClientVehicleExit", getRootElement(), onVehicleExit)


function showSpeedo()
	source = getPedOccupiedVehicle(getLocalPlayer())
	if source then
		if getVehicleOccupant( source ) == getLocalPlayer() then
			onVehicleEnter(getLocalPlayer(), 0)
		elseif getVehicleOccupant( source, 1 ) == getLocalPlayer() then
			onVehicleEnter(getLocalPlayer(), 1)
		end
	end
end
addEventHandler( "onClientResourceStart", getResourceRootElement(), showSpeedo )


 
local veh = false
local nosOn = false
bindKey("vehicle_fire", "both",
function(_,state)
        veh = getPedOccupiedVehicle(localPlayer)
        if veh and state == "up" and isVehicleNitroActivated(veh) and getVehicleController(veh) == localPlayer then
                setVehicleNitroActivated(veh, false)
                nosOn = false
        elseif veh and state == "down" and getVehicleController(veh) == localPlayer then
                setVehicleNitroActivated(veh, true)
                nosOn = true
        end
end)
 
 
 
function playSoundPlayerVehicle (player)
    local theVehicle = getPedOccupiedVehicle(localPlayer)
    if theVehicle and getVehicleController(theVehicle) == localPlayer then
                sound = playSound("files/starter.mp3")
                --setSoundMaxDistance(sound, 10)
        end
end
addEvent( "playSoundPlayerVehicle", true )
addEventHandler( "playSoundPlayerVehicle", getLocalPlayer(), playSoundPlayerVehicle)

 --[[
bindKey("l", "down",
function()
   local theVehicle = getPedOccupiedVehicle(localPlayer)
   if theVehicle and getVehicleController(theVehicle) == localPlayer then
        playSound("files/centrallock.mp3")
   end
end)]]--


