addEvent("N3xT.buyItem", true)
addEvent("N3xT.submitItem", true)
addEvent("N3xT.dropItem", true)

local dropitem = {}

function setItem(source, cmd, id, quantia, ...)
	if isStaff(source) then
		local id_v = tonumber(id)
		if (id_v) then
			local receiver = getPlayerID(id_v)
			if (receiver) then
				if tonumber(quantia) then
					local item = table.concat({...}, " ")
					if (item) then
						for i, v in ipairs(config.itens) do
							if (item == v.nome) then
								if not isItemEquipped(receiver, item) then
									if (cmd == config.give) then
										giveItemS(source, receiver, item, tonumber(quantia))
										break
									elseif (cmd == config.take) then
										takeItemS(source, receiver, item, tonumber(quantia))
										break
									end
								else
									messageS(source, "A quantidade desse item + a do jogador ultrapassa o limite máximo!", "error")
									break
								end
							else
								if (i == #config.itens) then
									messageS(source, "#ff0000* O item não foi encontrado!", "error")
								end
							end
						end
					else
						outputChatBox("* Sintaxe: /"..cmd.." [ID jogador] [quantia] [nome_item]", source, 255,0,0)
					end
				else
					outputChatBox("* Sintaxe: /"..cmd.." [ID jogador] [quantia] [nome_item]", source, 255,0,0)
				end
			else
				outputChatBox("* O jogador não foi encontrado!", source, 255,0,0)
			end
		else
			outputChatBox("* Sintaxe: /"..cmd.." [ID jogador] [quantia] [nome_item]", source, 255,0,0)
		end
	else
		outputChatBox("* Você não tem permissão para usar esse comando!", source, 255,0,0)
	end
end
addCommandHandler(config.give, setItem)
addCommandHandler(config.take, setItem)

addCommandHandler(config.comandorevistar,
	function(source, cmd, id)
		for _, v in ipairs(config.gruposrevistar) do
			if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
				local id_v = tonumber(id)
				if (id_v) then
					local receiver = getPlayerID(id_v)
					if (receiver) then
						local x, y, z    = getElementPosition(source) 
						local px, py, pz = getElementPosition(receiver)
						if (getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= 2) then
							for _, v in ipairs(config.itens) do
								local data = getElementData(receiver, v.nome)
								if tonumber(data) and (data >= 1) then
									triggerClientEvent(source, "N3xT.onRevistarInv", source, v.nome, data, v.peso)
								end
							end
						else
							messageS(source, "Chegue mais perto do Jogador!", "error")	
						end
					else
						messageS(source, "Jogador não encontrado!", "error")
					end
				else
					messageS(source, "Coloque um ID válido!", "error")
				end
			end
		end
	end
)

addCommandHandler(config.comandoretirar,
	function(source, cmd, id, quantia, ...)
		for _, v in ipairs(config.gruposretirar) do
			if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
				local id_v = tonumber(id)
				if (id_v) then
					local receiver = getPlayerID(id_v)
					if (receiver) then
						if tonumber(quantia) then
							local item = table.concat({...}, " ")
							if (item) then
								for _, v in ipairs(config.itens) do
									if (item == v.nome) then
										if not isItemEquipped(receiver, item) then
											takeItemS(source, receiver, item, tonumber(quantia))
											break
										else
											messageS(source, "A quantidade desse item + a do jogador ultrapassa o limite máximo!", "error")
											break
										end
									else
										if (i == #config.itens) then
											messageS(source, "#ff0000* O item não foi encontrado!", "error")
										end
									end
								end
							else
								messageS(source, "* Sintaxe: /"..cmd.." [ID jogador] [quantia] [nome_item]", "error")
							end
						else
							messageS(source, "* Sintaxe: /"..cmd.." [ID jogador] [quantia] [nome_item]", "error")
						end
					else
						messageS(source, "* O jogador não foi encontrado!", "error")
					end
				else
					messageS(source, "* Sintaxe: /"..cmd.." [ID jogador] [quantia] [nome_item]", "error")
				end
			end
		end
	end
)

addEventHandler("N3xT.buyItem", root,
	function(index, quantia, fudeo)
		local quantia = quantia or 1
		if (index == 13) and (fudeo ~= "mochila") or (index ~= 13) then
			giveItem(source, config.itens[index].nome, quantia, config.itens[index].valor)
			
		elseif (index == 13) and (fudeo == "mochila") then
			local data = getElementData(source, "Mochila")
			if tonumber(data) and (data > 4) then
				messageS(source, "Você já possuí uma mochila!", "error")
			else
				takePlayerMoney(source, config.mochila.valor)
				setElementData(source, "Mochila", 10)
				messageS(source, "Você comprou "..quantia.."x #00ff7f"..config.mochila.nome.." #ffffffcom sucesso.", "success")
			end
		end
	end
)

addEventHandler("N3xT.submitItem", root,
	function(item, quantia)
		if not isPedInVehicle(source) then
			if tonumber(quantia) and (tonumber(quantia) > 0) then
				local quantia = tonumber(quantia)
				local data = getElementData(source, item)
				if (data >= quantia) then
					for _, player in ipairs(getElementsByType("player")) do
						if (player ~= source) then
							local x, y, z    = getElementPosition(source)
							local px, py, pz = getElementPosition(player)
							if (getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= 2) then
								if not isPedInVehicle(player) then
									if not isGuestAccount(getPlayerAccount(player)) then
										local pesop   = getElementData(player, "Peso") or 0
										local mochila = getElementData(player, "Mochila") or 4
										local pesop2  = (findPesoByName(item) * quantia)
										local soma    = (pesop + pesop2)
										if (soma <= mochila) then
											local datap  = getElementData(player, item) or 0
											local soma2  = (datap + quantia)
											local limite = getMaxItemByName(item)
											local index  = getIndexByName(item)
											if (soma2 <= limite) then
												if not isItemEquipped(player, item) then
													local peso = getElementData(source, "Peso")
													setElementData(source, item, data - quantia)
													setElementData(source, "Peso", peso - pesop2)
													setElementData(player, item, soma2)
													setElementData(player, "Peso", soma)
													setPedAnimation(source, "GANGS", "Invite_Yes", 3000, false, false, false, false)
													setPedAnimation(player, "GANGS", "Invite_Yes", 3000, false, false, false, false)
													messageS(source, "Você enviou "..quantia.."x #00ff7f"..item.." #ffffffcom sucesso.", "success")
													messageS(player, "Você recebeu "..quantia.."x #00ff7f"..item.." #ffffffcom sucesso.", "success")
													break
												else
													messageS(source, "A quantidade desse item + a do jogador ultrapassa o limite máximo!", "error")
												end
											else
												messageS(source, "A quantidade desse item + a do jogador ultrapassa o limite máximo!", "error")
											end
										else
											messageS(source, "A mochila do jogador não tem espaço para esse item!", "error")
										end
									else
										messageS("O jogador não está logado!", "error")
									end
								end
							end
						end
					end
				else
					messageS(source, "Você não possuí essa quantidade!", "error")
				end
			else
				messageS(source, "Coloque uma quantidade válida!", "error")
			end
		else
			messageS(source, "Saia do veículo para concluir essa ação!", "error")
		end
	end
)

addEventHandler("N3xT.dropItem", root,
	function(item, quantia)
		if (item == "Dinheiro Sujo") then return messageS(source, "Você não pode dropar Dinheiro Sujo!", "error") end
		if not isPedInVehicle(source) then
			if (getElementDimension(source) == 0) and (getElementInterior(source) == 0) then
				if tonumber(quantia) and (tonumber(quantia) > 0) then
					local quantia = tonumber(quantia)
					local data    = getElementData(source, item)
					if (data >= quantia) then
						local x, y, z = getElementPosition(source)
						local name    = getPlayerName(source)
						setPedAnimation(source, "BOMBER", "BOM_Plant", 3000, false, false, false, false)
						takeItem(source, item, quantia)
						createDropItem(item, quantia, x, y, z)
						messagePerto(name, item, x, y, z)
						messageS(source, "Você dropou "..quantia.."x #00ff7f"..item.." #ffffffno chão.", "success")
					else
						messageS(source, "Você não possuí essa quantidade!", "error")
					end
				else
					messageS(source, "Coloque uma quantidade válida!", "error")
				end
			else
				messageS(source, "Você não pode dropar itens em outras dimensões/interiores.", "error")
			end
		else
			messageS(source, "Saia do veículo para concluir essa ação!", "error")
		end
	end
)

addEventHandler("onPlayerMarkerHit", root,
	function(marker, dimension)
		if (dimension) then
			if not isPedInVehicle(source) and not isGuestAccount(getPlayerAccount(source)) then
				for i = 1, #config.itens do
					if isElement(marker) then
						local data = getElementData(marker, config.itens[i].nome)
						if tonumber(data) and (data >= 1) then
							messageS(source, "Você achou um item no chão, "..data.."x #00ff7f"..config.itens[i].nome.."#ffffff. Para pegar #ff0000/pegaritem#ffffff.", "info")
							break
						end
					end
				end
			end
		end
	end
)

addCommandHandler("pegaritem",
	function(source)
		if not isPedInVehicle(source) and not isGuestAccount(getPlayerAccount(source)) then
			for index, v in ipairs(dropitem) do
				if isElementWithinMarker(source, v) then
					for i = 1, #config.itens do
						local data = getElementData(v, config.itens[i].nome)
						if tonumber(data) and (data >= 1) then
							local peso    = getElementData(source, "Peso") or 0
							local mochila = getElementData(source, "Mochila") or 4
							local soma    = (config.itens[i].peso * data + peso)
							if (soma <= mochila) then
								local sdata = getElementData(source, config.itens[i].nome) or 0 
								local soma2 = (sdata + data)
								if (soma2 <= config.itens[i].maxitem) then
									if not isItemEquipped(source, config.itens[i].nome) then
										setElementData(source, config.itens[i].nome, soma2)
										setElementData(source, "Peso", soma)
										destroyElement(v)
										table.remove(dropitem, index)
										messageS(source, "O item foi pegado com sucesso.", "success")
										break
									else
										messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
									end
								else
									messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
								end
							else
								messageS(source, "Sua mochila não tem espaço para esse item!", "error")
							end
						end
					end
				end
			end
		end
	end
)

addEventHandler("onPlayerWasted", root,
	function()
		if (config.perderitem == true) then
			for _, v in ipairs(config.itens) do
            	local data = getElementData(source, v.nome)
				if tonumber(data) and (data >= 1) then
					setElementData(source, "Peso", nil)
					setElementData(source, v.nome, nil)
				end
			end
		end
    end
)

function createDropItem(item, quantia, x, y, z)
	local index = (#dropitem + 1)
	dropitem[index] = createMarker(x, y + 1, z + 0.6, "arrow", 0.7, 0, 255, 127, 20)
	setElementData(dropitem[index], item, quantia)
	setTimer(
		function()
			if isElement(dropitem[index]) then
				destroyElement(dropitem[index])
				dropitem[index] = nil
			end
		end,
	60000 * config.deleteitem, 1)
end

function messagePerto(name, item, x, y, z)
	for _, player in ipairs(getElementsByType("player")) do
		local px, py, pz = getElementPosition(player)
		if (getDistanceBetweenPoints3D(x, y, z, px, py, pz) <= 10) then
			outputChatBox("* #00ff7fO jogador #ffffff"..name.." #00ff7fdropou #ffffff"..item.." #00ff7fpor perto#ffffff.", player, 255,255,255, true)
		end
	end
end