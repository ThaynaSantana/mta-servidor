function createNewDxMessage(text,p,r,g,b)
	if p == "Root" or p == root then
		for _, h in ipairs( getElementsByType 'player' ) do
			sourceAccount = getPlayerAccount ( h )
			if sourceAccount then
				if isGuestAccount ( sourceAccount ) then
				else
				triggerClientEvent(h,"EQPdx.createNewDxMessage",h,text,r,g,b)
				end
			end
		end
	else
		if isElement(p) then
			triggerClientEvent(p,"EQPdx.createNewDxMessage",p,text,r,g,b)
		end
	end
end
addEvent("ifplayerloggedtxt", true)
addEventHandler("ifplayerloggedtxt", getRootElement(), createNewDxMessage)

function createNewDxMessageLogin(p,text,r,g,b)
triggerClientEvent(p,"EQPdx.createNewDxMessage",p,text,r,g,b)
end