 --[[


 ################################################
 #                                              #                                                  
 #             SCRIPT DESENVOLVIDO POR:         #
 #             Facebook.com/FENIXMTA/           #
 #             Youtube.com/FENIXMTA             #
 #             Não retire os créditos !         #
 #                                              #
 ################################################




 --]]
 

addEventHandler("onPlayerLogin", root, 
function (_, account) 
   if not getAccountData(account, "SaveDX") then 
    triggerClientEvent( source,"FeniX:abrirDx", getRootElement())
    setAccountData(account, "SaveDX", true) 
	end 
end)

addEventHandler("onPlayerLogin", root,
function( _, acc )
 CarregarLoginPlay ( acc )
 end
)

function CarregarLoginPlay ( conta )
	if not isGuestAccount ( conta ) then
		if conta then	
			local source = getAccountPlayer ( conta )
			local emp = getAccountData ( conta, "FeniX_RG_Nome" ) or "N/C"
			setElementData ( source, "FeniX_RG_Nome", emp )
			local emp = getAccountData ( conta, "FeniX_RG_DataNascimento" ) or "N/C"
			setElementData ( source, "FeniX_RG_DataNascimento", emp )
			local emp = getAccountData ( conta, "FeniX_RG_Sexo" ) or "N/C"
			setElementData ( source, "FeniX_RG_Sexo", emp )
			local emp = getAccountData ( conta, "FeniX_RG_LocalOrigem" ) or "N/C"
			setElementData ( source, "FeniX_RG_LocalOrigem", emp )
		end
	end	
end

function ReiniciarScript ( res )
	if res == getThisResource ( ) then
		for i, player in ipairs ( getElementsByType ( "player" ) ) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				CarregarLoginPlay ( acc )
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), ReiniciarScript )

function SalvarLoginPlay ( conta )
	if conta then
	local source = getAccountPlayer ( conta )
	local rg_Nome = getElementData ( source, "FeniX_RG_Nome" ) or "N/C"
	setAccountData ( conta, "FeniX_RG_Nome", rg_Nome )
	local rg_DataNascimento = getElementData ( source, "FeniX_RG_DataNascimento" ) or "N/C"
	setAccountData ( conta, "FeniX_RG_DataNascimento", rg_DataNascimento )
	local rg_Sexo = getElementData ( source, "FeniX_RG_Sexo" ) or "N/C"
	setAccountData ( conta, "FeniX_RG_Sexo", rg_Sexo )
	local rg_LocalOrigem = getElementData ( source, "FeniX_RG_LocalOrigem" ) or "N/C"
	setAccountData ( conta, "FeniX_RG_LocalOrigem", rg_LocalOrigem )
	end	
end

function DesligarScript ( res )
    if res == getThisResource ( ) then
		for i, player in ipairs ( getElementsByType ( "player" ) ) do
			local acc = getPlayerAccount ( player )
			if not isGuestAccount ( acc ) then
				SalvarLoginPlay ( acc )
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement ( ), DesligarScript )

function JogadorQuit ( quitType )
	local acc = getPlayerAccount ( source )
	if not isGuestAccount ( acc ) then
		if acc then
			SalvarLoginPlay ( acc )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement ( ), JogadorQuit ) 