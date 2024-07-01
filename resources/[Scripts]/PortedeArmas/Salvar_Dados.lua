function Loadind_Porte ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			
			local Emprego = getAccountData ( conta, "TS:PorteDeArmas" ) or "Não"
			setElementData ( source, "TS:PorteDeArmas", Emprego )
			
		end
	end	
end
		
function Save_Porte ( conta )
	if conta then
		local source = getAccountPlayer ( conta )
		
		local Porte = getElementData ( source, "TS:PorteDeArmas" ) or "Não"
		setAccountData ( conta, "TS:PorteDeArmas", Porte )
	end
end

addEventHandler ( "onPlayerLogin", root,
  function ( _, acc )
	setTimer ( Loadind_Porte, 60, 1, acc )
  end
)

function Start_Porte ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Loadind_Porte ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), Start_Porte )

function Stop_Porte ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				Save_Porte ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), Stop_Porte )

function Quit_Server ( quitType )
	local acc = getPlayerAccount(source)
	if not isGuestAccount ( acc ) then
		if acc then
			Save_Porte ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), Quit_Server )