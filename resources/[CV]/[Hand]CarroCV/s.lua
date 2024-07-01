function loadHandling(v)	
		if getElementModel(v) == 579 then 
			setVehicleHandling(v, "mass", 10000)
			setVehicleHandling(v, "turnMass", 20000)
			setVehicleHandling(v, "dragCoeff", 1.8)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			setVehicleHandling(v, "percentSubmerged", 75)
			setVehicleHandling(v, "tractionMultiplier", 0.9)
			setVehicleHandling(v, "tractionLoss", 0.9)
			setVehicleHandling(v, "tractionBias", 0.497)
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "maxVelocity", 300)
			setVehicleHandling(v, "engineAcceleration", 50)
			setVehicleHandling(v, "engineInertia", 50)
			setVehicleHandling(v, "driveType", "awd")
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "brakeDeceleration", 100)
			setVehicleHandling(v, "ABS", false)
			setVehicleHandling(v, "steeringLock", 35)
			setVehicleHandling(v, "headLight", 0)
			setVehicleHandling(v, "tailLight", 1)
			setVehicleHandling(v, "animGroup", 0)
			setVehicleHandling(v, "suspensionUpperLimit", 0.0)
			setVehicleHandling(v, "suspensionLowerLimit", -0.2)
		end


end

function loadHandlings()
	for k, v in ipairs(getElementsByType("vehicle")) do
		loadHandling(v)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadHandlings)

function vehicleEnter()
	loadHandling(source)
end
addEventHandler("onVehicleEnter", getRootElement(), vehicleEnter)