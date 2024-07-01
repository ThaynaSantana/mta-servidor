﻿local animEnable = {}
local syncPlayers = {}

function handleCommand(player,anim)
	if (anim == "continencia") then
		triggerClientEvent(syncPlayers, "anim", player, anim, true)
		if animEnable[player] then animEnable[player] = false end
	elseif (anim == "continencia8") then
		if (not animEnable[player]) then
			animEnable[player] = true
			triggerClientEvent(syncPlayers, "anim", player, anim, true)
			outputChatBox("*Continência #00FF00ativada", player, 255, 255, 255, true)
		else
			animEnable[player] = false
			triggerClientEvent(syncPlayers, "anim", player, false)
			outputChatBox("*Continência #FF0000desativada", player, 255, 255, 255, true)
		end
	end
end
addCommandHandler("continencia",handleCommand)
addCommandHandler("continencia8",handleCommand)

addEvent("onClientSync", true )
addEventHandler("onClientSync", resourceRoot,
    function()
        table.insert(syncPlayers, client)
		for player, enable in ipairs(animEnable) do
			if (enable) then
				triggerClientEvent(client, "anim", player, "continencia2", true)
			end
		end
    end
)

addEventHandler("onPlayerQuit", root,
    function()
        for i, player in ipairs(syncPlayers) do
            if source == player then 
                table.remove(syncPlayers, i)
                break
            end 
        end
        if (animEnable[source] == true or animEnable[source] == false) then animEnable[source] = nil end
    end
)