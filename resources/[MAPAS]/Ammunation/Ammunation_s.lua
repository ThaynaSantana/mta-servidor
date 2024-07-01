local anmarkerenter = createMarker(1368.5,-1279.8,12.5,"cylinder",1.5,255,255,0,255)
local anmarkerexit = createMarker(285.8,-86.3,1000.5,"cylinder",1.5,255,255,0,255)
local anmarkershop = createMarker(291.1,-84.1,1000.5,"cylinder",2,50,50,255,255)
createBlipAttachedTo(anmarkerenter,6,0, 0, 0, 0, 0, 1, 100)
setElementInterior(anmarkerexit,4)
setElementInterior(anmarkershop,4)
setElementDimension(anmarkerexit,201)
setElementDimension(anmarkershop,201)

addEventHandler("onMarkerHit",anmarkerenter,
function(hitElement)
if (getElementType(hitElement) == "player") then
	if (getElementDimension(hitElement) == 0) and (getElementInterior(hitElement) == 0) then
		if not isPedInVehicle(hitElement) then
			setElementInterior(hitElement,4)
			setElementDimension(hitElement,201)
			setElementPosition(hitElement,285.93014526367, -83.689826965332, 1001.515625)
			setElementRotation(hitElement,0,0,0)
			setCameraTarget(hitElement,hitElement)
		else
			triggerClientEvent(hitElement,"ADaddPlayerMSG",hitElement,"Você deve sair do veiculo!")
		end
	end
end
end)
addEventHandler("onMarkerHit",anmarkerexit,
function(hitElement)
if (getElementType(hitElement) == "player") then
	if (getElementDimension(hitElement) == 201) and (getElementInterior(hitElement) == 4) then
		if not isPedInVehicle(hitElement) then
			setElementInterior(hitElement,0)
			setElementDimension(hitElement,0)
			setElementPosition(hitElement,1365.6807861328, -1279.8157958984, 13.546875)
			setElementRotation(hitElement,0,0,90)
			setCameraTarget(hitElement,hitElement)
		else
			triggerClientEvent(hitElement,"ADaddPlayerMSG",hitElement,"Você deve sair do veiculo!")
		end
	end
end
end)
addEventHandler("onMarkerHit",anmarkershop,
function(hitElement)
if (getElementType(hitElement) == "player") then
	if (getElementDimension(hitElement) == 201) and (getElementInterior(hitElement) == 4) then
		if not isPedInVehicle(hitElement) then
			setCameraMatrix(hitElement,301.53118896484, -78.985656738281, 1003.0477905273, 394.61657714844, -81.277969360352, 966.58056640625)
			triggerClientEvent(hitElement,"ADANshopshow",hitElement)
		else
			triggerClientEvent(hitElement,"ADaddPlayerMSG",hitElement,"Você deve sair do veiculo!")
		end
	end
end
end)

function buyweaponsadan(plr,wpn)
if wpn == "m4" then
	if (getPlayerMoney(plr) >= 48000) then
		takePlayerMoney(plr,48000)
		giveWeapon(plr,31,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma M4!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "ak47" then
	if (getPlayerMoney(plr) >= 42500) then
		takePlayerMoney(plr,42500)
		giveWeapon(plr,30,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma AK-47!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "mp5" then
	if (getPlayerMoney(plr) >= 30000) then
		takePlayerMoney(plr,30000)
		giveWeapon(plr,29,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma MP5!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "sniper" then
	if (getPlayerMoney(plr) >= 49000) then
		takePlayerMoney(plr,49000)
		giveWeapon(plr,34,45)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um Sniper rifle!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "country" then
	if (getPlayerMoney(plr) >= 35000) then
		takePlayerMoney(plr,35000)
		giveWeapon(plr,33,65)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um Country rifle!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "tec" then
	if (getPlayerMoney(plr) >= 28000) then
		takePlayerMoney(plr,28000)
		giveWeapon(plr,32,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma TEC-9!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "uzi" then
	if (getPlayerMoney(plr) >= 28000) then
		takePlayerMoney(plr,28000)
		giveWeapon(plr,28,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma UZI!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "deagle" then
	if (getPlayerMoney(plr) >= 25000) then
		takePlayerMoney(plr,25000)
		giveWeapon(plr,24,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma Desert Eagle!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "silenced" then
	if (getPlayerMoney(plr) >= 18000) then
		takePlayerMoney(plr,18000)
		giveWeapon(plr,23,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma Silenced pistol!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "colt" then
	if (getPlayerMoney(plr) >= 10000) then
		takePlayerMoney(plr,10000)
		giveWeapon(plr,22,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma Pistola!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "obrzyn" then
	if (getPlayerMoney(plr) >= 8000) then
		takePlayerMoney(plr,8000)
		giveWeapon(plr,26,40)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um Sawed-off!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "shotgun" then
	if (getPlayerMoney(plr) >= 10000) then
		takePlayerMoney(plr,10000)
		giveWeapon(plr,25,50)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma Shotgun!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "spaz" then
	if (getPlayerMoney(plr) >= 30000) then
		takePlayerMoney(plr,30000)
		giveWeapon(plr,27,90)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma Combat shotgun!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "granat" then
	if (getPlayerMoney(plr) >= 7500) then
		takePlayerMoney(plr,7500)
		giveWeapon(plr,16,1)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uma granada!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "c4" then
	if (getPlayerMoney(plr) >= 15000) then
		takePlayerMoney(plr,15000)
		giveWeapon(plr,39,1)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou uns explosivos!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "molotov" then
	if (getPlayerMoney(plr) >= 1000) then
		takePlayerMoney(plr,1000)
		giveWeapon(plr,18,1)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um cocktail molotov!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "teargas" then
	if (getPlayerMoney(plr) >= 1500) then
		takePlayerMoney(plr,1500)
		giveWeapon(plr,17,1)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um gás lacrimogêneo!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
elseif wpn == "parachute" then
if (getPedWeapon(plr,11)== 46) then
	triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você já tem um pára-quedas!")
else
	if (getPlayerMoney(plr) >= 5000) then
		takePlayerMoney(plr,5000)
		giveWeapon(plr,46,1)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um paraquedas!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
end
elseif wpn == "miotacz" then
	triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Esta arma não está disponível!")
elseif wpn == "kamizelka" then
if getPedArmor(plr) ~= 100 then
	if (getPlayerMoney(plr) >= 5000) then
		takePlayerMoney(plr,5000)
		setPedArmor(plr,100)
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você comprou um colete!")
		playSoundFrontEnd(plr,11)
	else
		triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você não tem dinheiro suficiente!")
	end
else
	triggerClientEvent(plr,"ADaddPlayerMSG",plr,"Você já possui um colete!")
end
end
end
addEvent("ADANbuyweapon",true)
addEventHandler("ADANbuyweapon",resourceRoot,buyweaponsadan)