function convertS(s)
	if type(tonumber(s)) == "number" then
		milisegundo = s
		local horas_seg=3600
		local hora = math.floor(milisegundo/horas_seg)
		local minuto = math.floor((milisegundo-(horas_seg*hora))/60)
		local segundo = math.floor((milisegundo-(horas_seg*hora)-(minuto*60)))	
		local tudo = string.format("%02d:%02d:%02d",hora,minuto,segundo)	
		local dia = math.floor(s/86400)

		return hora,minuto,segundo,tudo,dia
	else
		return 0,0,0,0,0		
	end
end

function saveData(conta)
	if conta then
			local source = getAccountPlayer(conta)
			local level = getElementData(source,"Level") or 0
			local exp = getElementData(source,"LSys:EXP") or 0
			local onlinetime = getElementData(source,"LSys:Online") or 0
			local mins = getElementData(source,"LSys:Mins") or 0
			setAccountData (conta, "Level",level)
			setAccountData (conta, "LSys:EXP",exp)
			setAccountData (conta, "LSys:Online",onlinetime)
			setAccountData (conta, "LSys:Mins",mins)
	end	
end

function loaddata(conta)
	if not (isGuestAccount (conta)) then
		if (conta) then	
			local source = getAccountPlayer(conta)	
			local level = getAccountData(conta,"Level")
			if type(level) == "boolean" or level == nil then
				level = 0
			end
			setElementData (source, "Level", tonumber(level))
			setElementData (source, "LSys:EXP",tonumber(getAccountData(conta,"LSys:EXP")) or 0)
			setElementData (source, "LSys:Online",tonumber(getAccountData(conta,"LSys:Online")) or 0)
			setElementData (source, "LSys:Mins",tonumber(getAccountData(conta,"LSys:Mins")) or 0)
		end
	end	
end

function timecount()
	for i, player in ipairs(getElementsByType("player")) do
		local acc = getPlayerAccount(player)
		if acc then
			if not isGuestAccount(acc) then
				local level = getElementData(player,"Level") or 0 if tonumber(level) == nil then level = 0 end
				local exp = getElementData(player,"LSys:EXP") or 0 if tonumber(exp) == nil then exp = 0 end
				local onlinetime = getElementData(player,"LSys:Online") or 0 if tonumber(onlinetime) == nil then onlinetime = 0 end
				local mins = getElementData(player,"LSys:Mins") or 0 if tonumber(mins) == nil then mins = 0 end
				if not getElementData(player,"afkdate",true) then				
				if tonumber(mins) == 600 then
					setElementData(player,"LSys:Mins",1)
					if tonumber(exp) == 5 then
						setElementData(player,"LSys:EXP",0)
						setElementData(player,"Level",tonumber(level)+1)
						outputChatBox ( "#00FF00• INFO: #ffffffVocê ganhou #FFFF00+1 #ffffffde experiência (".. tonumber(exp)+1 .."/6)", player, 255, 255, 255, true )
						outputChatBox ( "#00FF00• INFO: #ffffffVocê juntou #FFFF006 #ffffffde experiência e ganhou #FFFF00+1 #fffffflevel ("..tonumber(level)+1 ..")", player, 255, 255, 255, true )
						playSoundFrontEnd ( player, 45 )
					else
					   outputChatBox ( "#00FF00• INFO: #ffffffVocê ganhou #FFFF00+1 #ffffffde experiência (".. tonumber(exp)+1 .."/6)", player, 255, 255, 255, true )
						setElementData(player,"LSys:EXP",tonumber(exp)+1)
						playSoundFrontEnd ( player, 44 )
					end
				elseif tonumber(mins) < 600 then
					setElementData(player,"LSys:Mins",tonumber(mins)+1)
				end
				setElementData(player,"LSys:Online",tonumber(onlinetime)+1)
				
			end
		end
	end
end
end
setTimer(timecount,1000,0)	

addEventHandler("onPlayerLogin", root,
  function( _, acc )
	setTimer(loaddata,1000,1,acc)
  end
)

function startScript ( res )
	if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				loaddata(acc)			
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement(), startScript )

function stopScript( res )
    if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				saveData(acc)	
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), stopScript )

function deslogar(acc)
	cancelEvent ()
end
addEventHandler("onPlayerLogout",getRootElement(),deslogar)

function sair ( quitType )
	local acc = getPlayerAccount(source)
	if not (isGuestAccount (acc)) then
		if acc then
			saveData(acc)
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )