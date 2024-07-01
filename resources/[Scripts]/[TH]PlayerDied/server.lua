function playerDied(totalAmmo, killer, killerWeapon, bodypart)

	outputChatBox(getPlayerName(source).." Morreu por "..killer.." na "..bodypart"!")
	
end
addEventHandler("onPlayerWasted", getRootElement(), playerDied)