local pizzaDeliveryTarget
local pizzaDeliveryBlip

local function clickToThrow(btn, state)
	if btn == "lalt" and state == true then
		if not isElement (pizzaDeliveryTarget) then
			removeEventHandler ("onClientKey", root, clickToThrow)
		else
			local localPos = {getElementPosition (localPlayer)}
			local targetPos = {getElementPosition (pizzaDeliveryTarget)}
			if getDistanceBetweenPoints3D (localPos[1], localPos[2], localPos[3], targetPos[1], targetPos[2], targetPos[3]) < 10 then
				local pizza = createObject (1582, localPos[1], localPos[2] - 0.1, localPos[3] + 0.7)
				moveObject (pizza, 400, targetPos[1], targetPos[2], targetPos[3])
				setTimer (destroyElement, 3000, 1, pizza)
				setElementCollisionsEnabled (pizza, false)
				
				localPos = nil
				targetPos = nil
				clearPizzaboyMission()
				triggerServerEvent ("payMeWhatYouOweMe", localPlayer)
			end
		end
	end
end

addEvent ("requestPizzajobStart", true)
local function startPizzajob (locationTable)
	local randomLocation = locationTable[math.random(#locationTable)]
	pizzaDeliveryTarget = createMarker (randomLocation[1], randomLocation[2], randomLocation[3], "cylinder", 4, 255, 50, 50, 100)
	pizzaDeliveryBlip = createBlipAttachedTo (pizzaDeliveryTarget, 31)
	addEventHandler ("onClientKey", root, clickToThrow)
end
addEventHandler ("requestPizzajobStart", localPlayer, startPizzajob)

function clearPizzaboyMission()
	if isElement (pizzaDeliveryTarget) then
		destroyElement (pizzaDeliveryTarget)
	end
	
	if isElement (pizzaDeliveryBlip) then
		destroyElement (pizzaDeliveryBlip) 
	end
	removeEventHandler ("onClientKey", root, clickToThrow)
end
addEventHandler ("onClientPlayerWasted", localPlayer, clearPizzaboyMission)

function removeHelmetOnExit ( vehicle, seat, jacked )
	if isElement (pizzaDeliveryTarget) then
		destroyElement (pizzaDeliveryTarget)
	end
	
	if isElement (pizzaDeliveryBlip) then
		destroyElement (pizzaDeliveryBlip) 
	end
	removeEventHandler ("onClientKey", root, clickToThrow)
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), removeHelmetOnExit )
addEvent( "AirNew:CancelarEmpregoPizza", true )
addEventHandler( "AirNew:CancelarEmpregoPizza", localPlayer, removeHelmetOnExit )