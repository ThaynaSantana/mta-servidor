tabela = {
	--[ID] = {mass, turnMass, maxVelocity, engineAcceleration, steeringLock, brakeDeceleration, tractionLoss},

	[522] = {2000, 400, 450, 70, 40, 50, 1},--H2 - 254
	[586] = {2000, 400, 240, 45, 40, 20, 1},--MOTA DA GNR - 220
	[521] = {1200, 500, 280, 43, 40, 20, 1},--cbr - 215
	[463] = {1200, 500, 185, 38, 40, 20, 1},--MOTO 4 - 200
	[468] = {2700, 300, 290, 50, 40, 50, 1},--HUSQVARNA - 206
	--[581] = {1000, 500, 138, 30, 40, 15, 0.9},--160 - 150
	[581] = {2500, 500, 500, 80, 40, 50, 1},--TIGER 1200 - 277
}

function onVehEnter()
	local id = getElementModel(source)
	if tabela[id] then
		setVehicleHandling(source, "mass", tabela[id][1])
		setVehicleHandling(source, "turnMass", tabela[id][2])
		setVehicleHandling(source, "maxVelocity", tabela[id][3])
		setVehicleHandling(source, "engineAcceleration", tabela[id][4])
		setVehicleHandling(source, "steeringLock", tabela[id][5])
		setVehicleHandling(source, "brakeDeceleration", tabela[id][6])
    	setVehicleHandling(source, "tractionLoss", tabela[id][7])
    	if tabela[id][8] then
    		setVehicleHandling(source, "driveType", tabela[id][8])
    	end
	end
end
addEventHandler("onVehicleEnter", root, onVehEnter)