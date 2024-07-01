local db_inv = dbConnect("sqlite", "files/inventario.db")
dbExec(db_inv, "CREATE TABLE IF NOT EXISTS inventory (nome TEXT, quantia INT, peso REAL, conta TEXT)")
dbExec(db_inv, "CREATE TABLE IF NOT EXISTS mochila (peso INT, conta TEXT)")

function loadItens(player, acc)
	local result = dbPoll(dbQuery(db_inv, "SELECT * FROM inventory WHERE conta=?", acc), -1)
	local result2 = dbPoll(dbQuery(db_inv, "SELECT * FROM mochila WHERE conta=?", acc), -1)
	if (#result > 0) then
		for _, search in ipairs(result) do
			if not getElementData(player, search["nome"]) then
				local peso = getElementData(player, "Peso") or 0
				setElementData(player, search["nome"], search["quantia"])
				setElementData(player, "Peso", peso + search["peso"])
				dbExec(db_inv, "DELETE FROM inventory WHERE nome=? AND conta=?", search["nome"], acc)
			end
		end
	end
	if (#result2 > 0) then
		for _, search in ipairs(result2) do
			if not getElementData(player, "Mochila") then
				setElementData(player, "Mochila", tonumber(search["peso"]))
				dbExec(db_inv, "DELETE FROM mochila WHERE peso=? AND conta=?", search["peso"], acc)
			end
		end
	end
end

addEventHandler("onPlayerLogin", root,
	function(_, acc)
		loadItens(source, getAccountName(acc))
	end
)

function saveItens()
	if not isGuestAccount(getPlayerAccount(source)) then
		local acc = getAccountName(getPlayerAccount(source))
		for _, v in ipairs(config.itens) do
			local data = getElementData(source, v.nome)
			if tonumber(data) and (data >= 1) then
				local result = dbPoll(dbQuery(db_inv, "SELECT * FROM inventory WHERE nome=? AND conta=?", v.nome, acc), -1)
				if (#result == 0) then
					local soma = (v.peso * data)
					dbExec(db_inv, "INSERT INTO inventory (nome, quantia, peso, conta) VALUES (?, ?, ?, ?)", v.nome, data, soma, acc)
				end
			end
		end
		local data = getElementData(source, "Mochila")
		if tonumber(data) and (data > 4) then
			local result = dbPoll(dbQuery(db_inv, "SELECT * FROM mochila WHERE conta=?", acc), -1)
			if (#result == 0) then
				dbExec(db_inv, "INSERT INTO mochila (peso, conta) VALUES (?, ?)", data, acc)
			end
		end
	end
end
addEventHandler("onPlayerQuit", root, saveItens)