function onInventory(source)
    if not isGuestAccount(getPlayerAccount(source)) then
		triggerClientEvent(source, "N3xT.onOpenInventory", source)
	else
		messageS(source, "Você precisa estar logado para abrir o inventário!", "error")
	end
end

function onResStart()
	for index, player in ipairs(getElementsByType("player")) do
		bindKey(player, config.bind, "down", onInventory)
		if not isGuestAccount(getPlayerAccount(player)) then
			local acc = getAccountName(getPlayerAccount(player))
			loadItens(player, acc)
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, onResStart)

function onPlayerJoin()
	bindKey(source, config.bind, "down", onInventory)
end
addEventHandler("onPlayerJoin", getRootElement(), onPlayerJoin)

function cleanAll()
	for index, player in ipairs(getElementsByType("player")) do
		unbindKey(player, config.bind, "down", onInventory)
  	end
end
addEventHandler("onResourceStop", resourceRoot, cleanAll)