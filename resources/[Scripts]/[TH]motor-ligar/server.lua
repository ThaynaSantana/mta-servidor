local function toggle_engine_state(player)
	local vehicle = getPedOccupiedVehicle(player)
	
	if not vehicle then
		return
	end
	
	local engine_state = getVehicleEngineState(vehicle)
	
	setVehicleEngineState(vehicle, not engine_state)
end

local function on_vehicle_entered(player)
	bindKey(player, "x", "down", toggle_engine_state)
end

local function on_vehicle_exited(player)
	unbindKey(player, "x", "down", toggle_engine_state)
end

addEventHandler("onVehicleEnter", root, on_vehicle_entered)
addEventHandler("onVehicleExit", root, on_vehicle_exited)
