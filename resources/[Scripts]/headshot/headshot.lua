addEventHandler("onPlayerDamage", getRootElement(),
	function (attacker, weapon, bodypart, loss)
		if bodypart == 9 then
			setElementHealth(source, 1)
		end
	end
)