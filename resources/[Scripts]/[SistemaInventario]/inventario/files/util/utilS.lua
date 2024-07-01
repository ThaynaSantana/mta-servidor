function messageS(player, message, type)
    exports.FR_DxMessages:addBox(player, message, type)
end

function getAllItens(player)
	local itemTable = {}
	for _, v in ipairs(config.itens) do
		local item = getElementData(player, v.nome) or 0
		if (item >= 1) then
			table.insert(itemTable, {v.nome, item})
		end
	end
	return itemTable
end

function giveItem(source, nome, quantia, money)
	local peso    = getElementData(source, "Peso") or 0
	local mochila = getElementData(source, "Mochila") or 4
	local index   = getIndexByName(nome)
	local data    = getElementData(source, config.itens[index].nome) or 0 -- ERROR AQUI 
	local soma    = (config.itens[index].peso * quantia + peso)
	local soma2   = (data + quantia)
	if (soma <= mochila) then
		if (soma2 <= config.itens[index].maxitem) then
			if (money) then
				if (getPlayerMoney(source) >= money) then
					takePlayerMoney(source, money)
					setElementData(source, config.itens[index].nome, data + quantia)
					setElementData(source, "Peso", soma)
					messageS(source, "Você comprou "..quantia.."x #00ff7f"..config.itens[index].nome.." #ffffffcom sucesso.", "success")
				else
					messageS(source, "Você não tem dinheiro suficiente!", "error")	
				end
			else
				setElementData(source, config.itens[index].nome, data + quantia)
				setElementData(source, "Peso", soma)
				messageS(source, "Você recebeu "..quantia.."x #00ff7f"..config.itens[index].nome.."#ffffff.", "success")
			end
		else
			messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
		end
	else
		messageS(source, "Sua mochila não tem espaço para esse item!", "error")
	end
end

function takeItem(player, nome, quantia)
	for _, v in ipairs(config.itens) do
		if (v.nome == nome) then
			local data = getElementData(player, nome)
			if tonumber(data) and (data >= quantia) then
				local peso = getElementData(player, "Peso")
				local data = getElementData(player, nome)
				local soma = (v.peso * quantia)
				setElementData(player, nome, data - quantia)
				setElementData(player, "Peso", peso - soma)
				outputChatBox("#00ff7f* #ffffffFoi retirado de você "..quantia.."x #00ff7f"..nome.."#ffffff.", player, 255,255,255, true)
				break
			else
				messageS(player, "Você não possuí esse item ou a quantia do item!", "error")
			end
		end
	end
end

function giveItemS(player, source, nome, quantia)
	local peso    = getElementData(source, "Peso") or 0
	local mochila = getElementData(source, "Mochila") or 4
	local name    = getPlayerName(source)
	local index   = getIndexByName(nome)
	local data    = getElementData(source, config.itens[index].nome) or 0
	local soma    = (config.itens[index].peso * quantia + peso)
	local soma2   = (data + quantia)
	if (soma <= mochila) then
		if (soma2 <= config.itens[index].maxitem) then
			setElementData(source, config.itens[index].nome, data + quantia)
			setElementData(source, "Peso", soma)
			messageS(source, "Você recebeu "..quantia.."x #00ff7f"..nome.."#ffffff.", "success")
			messageS(player, "#00ff7f* #ffffffVocê setou + "..quantia.."x #00ff7f"..nome.." #ffffffpara "..name.."#ffffff.", "success")
		else
			messageS(player, "A quantidade desse item + a do jogador ultrapassa o limite máximo!", "error")
		end
	else
		messageS(player, "A mochila do jogador não tem espaço para esse item!", "error")
	end
end

function takeItemS(source, player, nome, quantia)
	for _, v in ipairs(config.itens) do
		if (v.nome == nome) then
			local data = getElementData(player, nome)
			if tonumber(data) and (data >= quantia) then
				local peso = getElementData(player, "Peso")
				local data = getElementData(player, nome)
				local soma = (v.peso * quantia)
				local name = getPlayerName(source)
				setElementData(player, nome, data - quantia)
				setElementData(player, "Peso", peso - soma)
				messageS(player, "#00ff7f* #ffffffFoi retirado de você "..quantia.."x #00ff7f"..nome.."#ffffff.", "info")
				messageS(source, "#00ff7f* #ffffffVocê retirou - "..quantia.."x #00ff7f"..nome.." #ffffffdo jogador "..name.."#ffffff.", "success")
				break
			else
				messageS(source, "O jogador não possuí esse item ou a quantia do item!", "error")
			end
		end
	end
end

function getSpaceMochila(source, nome, quantia)
	local peso    = getElementData(source, "Peso") or 0
	local mochila = getElementData(source, "Mochila") or 4
	local index   = getIndexByName(nome)
	local data    = getElementData(source, config.itens[index].nome) or 0
	local soma    = (config.itens[index].peso * quantia + peso)
	local soma2   = (data + quantia)
	if (soma <= mochila) then
		if (soma2 <= config.itens[index].maxitem) then
			return true
		else
			messageS(source, "A quantidade desse item + a sua ultrapassa o limite máximo!", "error")
			return false
		end
	else
		messageS(source, "Sua mochila não tem espaço para esse item!", "error")
		return false
	end
end

function isItemEquipped(source, item)
	for i, v in ipairs(config.itens) do
		if (v.nome == item) then
			if (v.tipo == "mascaras") then
				if (getElementData(source, "Mascara") == item) then
					return true
				end
			elseif (v.tipo == "armas") then
				if (getElementData(source, "ArmaMao") == item) then
					return true
				end
			end
		end
	end
	return false
end

function getWeaponByName(name)
	if (name == "Glock") then
		return 22
	elseif (name == "Taser") then
		return 23
	elseif (name == "38") then
		return 24
	elseif (name == "DOZE") then
		return 25
	elseif (name == "MP5") then
		return 29
	elseif (name == "AK47") then
		return 30
	elseif (name == "AR15") then
		return 31
	elseif (name == "AR10") then
		return 34
	end
end

function getAmmoByName(name)
	if (name == "Glock") then
		return "Munição 9mm"
	elseif (name == "Taser") then
		return "Munição 9mm"
	elseif (name == "38") then
		return "Munição 9mm"
	elseif (name == "DOZE") then
		return "Cartucho 12"
	elseif (name == "MP5") then
		return "Munição 556"
	elseif (name == "AK47") then
		return "Munição 762"
	elseif (name == "AR15") then
		return "Munição 762"
	elseif (name == "AR10") then
		return "Munição Sniper"
	end
end

function getItem(source, nome)
	for _, v in ipairs(config.itens) do
		if (v.nome == nome) then
			local data = getElementData(source, tostring(nome))
			if tonumber(data) and (data >= 1) then
				return data
			end
		end
	end
end

function getIndexByName(name)
	findIndex = false
	for i = 1, #config.itens do
		if (config.itens[i].nome == name) then
			findIndex = i
			break
		end
	end
	return findIndex
end

function findPesoByName(name)
	findPeso = false
	for i = 1, #config.itens do
		if (config.itens[i].nome == name) then
			findPeso = config.itens[i].peso
			break
		end
	end
	return findPeso
end

function getMaxItemByName(name)
	findMaxItem = false
	for i = 1, #config.itens do
		if (config.itens[i].nome == name) then
			findMaxItem = config.itens[i].maxitem
			break
		end
	end
	return findMaxItem
end

function getPlayerID(id)
    v = false
    for i, player in ipairs (getElementsByType("player")) do
        if getElementData(player, "ID") == id then
            v = player
            break
        end
    end
    return v
end

function isStaff(player)
	isstaff = false
	local acc = getPlayerAccount(player)
	if not isGuestAccount(acc) then
		for _, v in ipairs(config.aclstaff) do
			if isObjectInACLGroup("user."..getAccountName(acc), aclGetGroup(v)) then
				isstaff = true
				break
			end
		end
	end
	return isstaff
end

function isPM(player)
    ispm = false
    for _, v in ipairs(config.grupospolicia) do
        if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(v)) then
            ispm = true
            break
        end
    end
    return ispm
end