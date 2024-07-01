zombiehunterpickup55555 = createPickup (2536.5932617188,-1555.0544433594,32.155364990234, 3, 1275, 1000 )
function zombiehunterskinpickup55555 ( thePlayer )
		local nomeAcc = getAccountName (getPlayerAccount (thePlayer)) --Variável 'nomeAcc' recebe a conta de quem executou o comando. (no caso, a sua conta)
	if isObjectInACLGroup ("user."..nomeAcc, aclGetGroup("CV")) then --Se o jogador que executou o comando estiver na ACL "EB", faz o seguinte:
		setElementModel (thePlayer, 201) --Coloca skin 287 nele.
	else --Se não estiver na ACL "EB", faz o seguinte:
		outputChatBox ("Somente membros da #00BB00CV#FF0000 podem pegar a skin!", thePlayer, 255, 0, 0, true) --Manda isso em vermelho, onde "Exército Brasileiro" fica em verde e o resto vermelho. Manda isso somente para quem executou o comando.
	end --Finaliza o If e o Else.
end
addEventHandler ( "onPickupUse", zombiehunterpickup55555, zombiehunterskinpickup55555 )
addEventHandler ("onPickupUse", getRootElement(), 

function (playerWhoUses)
  if (source == zombiehunterpickup55555) then
    setPlayerNametagText (playerWhoUses, "" .. getPlayerName (playerWhoUses))
    setElementData (playerWhoUses, "job", "farm")
  end
end)