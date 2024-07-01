addEventHandler("onResourceStart", resourceRoot, 
    function() 
        for i,v in ipairs(getElementsByType('player')) do 
            setElementData(v, "data.playerID", i) 
        end 
    end 
) 

addEventHandler("onPlayerJoin", root, 
    function() 
        for i,v in ipairs(getElementsByType('player')) do 
            setElementData(v, "data.playerID", i) 
        end 
    end 
) 

local blip = {}

function outputDxBox(thePlayer, text, type)
	exports.FR_DxMessages:addBox(thePlayer, text, type)
end

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end	

function setPlayerFallen(player, state)
	if state == true then
		toggleAllControls(player, false)  
		toggleControl(player, "chatbox", true) 
		setElementHealth(player, 50)
		setElementData(player, "playerFallen", true)
		setElementFrozen(player, true)
		triggerClientEvent(player, "startDeadTime", player)
	end
	if state == false then
		setElementHealth(player, 50)
		triggerClientEvent(player, "stopDeadTime", player)
		toggleAllControls(player, true)  
		setElementData(player, "playerFallen", false)
		setElementFrozen(player, false)
	end
end

function checkData()
	for i, player in pairs (getElementsByType("player")) do
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("SAMU")) then
			if not getElementData(player, "jobSAMU") then
				setElementData(player, "jobSAMU", true)
			end
		end
	end
end
addEventHandler("onPlayerLogin", root, checkData)
addEventHandler("onPlayerSpawn", root, checkData)
addEventHandler("onResourceStart", resourceRoot, checkData)

function checkHealth()
	for i, player in pairs (getElementsByType("player")) do
		if not getElementData(player, "playerFallen") then
			local conta = getAccountName(getPlayerAccount(player))
	        if not isObjectInACLGroup("user."..conta, aclGetGroup("SAMU")) then
				if getElementHealth(player) >= 1 then
					if getElementHealth(player) <= hpFallen then 
						removePedFromVehicle(player)
						setPlayerFallen(player, true)
						setPedAnimation(player, "SWEET", "Sweet_injuredloop", 1000, false, false, false, true)
						triggerClientEvent(player, "startDeadTime", player)
						outputDxBox(player, 'INFO: Chame o SAMU digitando /192 ou poderá não resistir!', "warning")
							setTimer(function()
								if getElementData(player, "playerFallen") then	
									setElementData(player, "playerFallen", false)
									setPlayerFallen(player, false)
									triggerClientEvent(player, "stopDeadTime", player)
									if isElement ( blip[player] ) then
									    destroyElement(blip[player])
									end
									killPed(player)
									outputDxBox(player, "INFO: Você demorou para ser curado e acabou morrendo!", "info")
								end
							end, 180000, 1)
					end
				end
			end
		end
	end
end
setTimer(checkHealth, 1000, 0)

function helpCommand(source)
	for i, player in pairs (getElementsByType("player")) do
		if getElementData(source, "playerFallen") then

			local accName = getAccountName ( getPlayerAccount ( player ) )
			outputDxBox(source, "INFO: Você chamou o SAMU. Aguarde!", "info")
			if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "SAMU" ) )) then
			    outputChatBox("#00FF00• INFO: #FFFFFFO cidadão "..getPlayerName(source).." #FFFFFFestá pedindo socorro! A localização foi marcada em seu mapa (blip de coração)", player, 255, 255, 255, true)  
			    outputChatBox("#00FF00• INFO: #FFFFFFChamada ID: #ffff00"..getElementData(source, "data.playerID").."", player, 255, 255, 255, true)
			    if blip[source] and isElement(blip[source]) then 
			    	destroyElement(blip[source]) 
			    	blip[source] = nil 
			    end
			    local x, y, z = getElementPosition(source)
			    blip[source] = createBlip(x, y, z, 21)
			end
	    else
			outputDxBox(source, "INFO: Você não precisa de atendimento!", "error")
		end
end
end
addCommandHandler("192", helpCommand)

function onWasted(killer)
		if getElementData(source, "playerFallen") then
			setPlayerFallen(source, false)
			setElementData(source, "playerFallen", false)
			triggerClientEvent(source, "stopDeadTime", source)
			if blip[source] and isElement(blip[source]) then 
				destroyElement(blip[source]) 
				blip[source] = nil 
			end
		end
	end
addEventHandler("onPlayerWasted", root, onWasted)

function onQuit()
	for i, player in pairs (getElementsByType("player")) do
		if getElementData(player, "playerFallen") then
			if blip[player] and isElement(blip[player]) then 
				destroyElement(blip[player]) 
				blip[player] = nil 
			end
		end
	end
end
addEventHandler("onPlayerQuit", root, onQuit)

function secret()
	for i, player in pairs (getElementsByType("player")) do
		setPlayerFallen(player, false)
	end
end
addCommandHandler("curartodos", secret)

function curarPlayer(thePlayer, _, idP)
	if tonumber(idP) then
		local conta = getAccountName (getPlayerAccount(thePlayer))
		if isObjectInACLGroup("user."..conta, aclGetGroup("SAMU")) then
			local namePlayer = getPlayerFromID(tonumber(idP))
			if namePlayer then
				local nameR = getPlayerName(namePlayer)
				local wanted = getPlayerWantedLevel(namePlayer)
				local px, py, pz = getElementPosition(thePlayer) 
				local rx, ry, rz = getElementPosition(namePlayer) 
				local distancia = getDistanceBetweenPoints3D(px, py, pz, rx, ry, rz) 
				local medKit = getElementData(thePlayer, "KitMedico") or 10000000
				if (distancia > 3)  then 
					outputDxBox(thePlayer, "INFO: Você precisa chegar mais perto da pessoa para curá-la!", "error")
				elseif (distancia < 2) then 
					if getElementData(namePlayer, "playerFallen") then 
						
						setPedAnimation(thePlayer, "BOMBER", "BOM_Plant", 1000, false)
						if isElement ( blip[namePlayer] ) then
							destroyElement(blip[namePlayer])
						end
						outputDxBox(thePlayer, "Curando...", "info")
						setTimer(function()
							setPedAnimation(thePlayer, "ped", "facanger")
							setPedAnimation(namePlayer, "ped", "facanger")
						end, 5000, 1)
						setTimer(outputDxBox, 5000, 1, thePlayer, "INFO: Cidadão curado!", "success")
						setTimer(outputDxBox, 5000, 1, namePlayer, "INFO: Você foi curado por um médico!", "success")
						setTimer(givePlayerMoney, 5000, 1, thePlayer, 0)
						setTimer(setPlayerFallen, 5000, 1, namePlayer, false)
						setTimer(function()
							setElementData ( thePlayer, "AirNewSCR_LiberarXP", "Sim" )
							setPedAnimation ( thePlayer )
							setPedAnimation ( namePlayer )
						end, 6000, 1)								
					else
						outputDxBox(thePlayer, "INFO: Essa pessoa não precisa ser curada!", "error")
					end
				end
			else			
				outputDxBox(thePlayer, "INFO: Permissão negada para este comando!", "error") 
			end
		end
	end
end
addCommandHandler("curar", curarPlayer)

function getPlayerFromID(id)
	local pReturn = false 
	for i, v in ipairs(getElementsByType("player")) do 
		if getElementData(v, "ID") == id then 
			pReturn = v
		end 
	end
	return pReturn 
end