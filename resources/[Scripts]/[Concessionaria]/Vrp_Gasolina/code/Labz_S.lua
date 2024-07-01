function frozengas(ply, veh, tipo)
    if tipo == 1 then
        setElementFrozen(ply, true)
        setElementFrozen(veh, true)
    elseif tipo == 2 then
        setElementFrozen(ply, false)
        setElementFrozen(veh, false)
        setPedAnimation(ply, nil)
        setPedAnimation(ply, "rapping", "laugh_01", -1, true, false, false)
		setTimer(setPedAnimation, 50, 1, ply, nil)
    end
end
addEvent("AC-FrozenGas", true)
addEventHandler("AC-FrozenGas", root, frozengas)
------------------------------------------------------------------------------

factor = 0.03
function createVehicles(player)
	for i,v in ipairs(getElementsByType("vehicle")) do
		if not (getVehicleType (v) == "BMX") then
			if not getElementData(v, "Gasolina") then
			Combustivel = math.random(40,100)
			setElementData(v, "Gasolina", Combustivel)
		end
	end
end

function processFuel(player)
	for i,v in ipairs(getElementsByType("vehicle")) do
		if not (getVehicleType (v) == "BMX") then
			local Combustivel = getElementData(v, "Gasolina") or math.random(40,100)
			if (getVehicleEngineState(v) == true and Combustivel > 0 ) then
				Combustivel = Combustivel - factor
			end
			if (Combustivel <= 0.99) then
				Combustivel = 0
				setVehicleEngineState(v, false)			
			end
			setElementData(v, "Gasolina", Combustivel)
		end
	end
end
end

createVehicles()
setTimer(processFuel, 1000, 0)