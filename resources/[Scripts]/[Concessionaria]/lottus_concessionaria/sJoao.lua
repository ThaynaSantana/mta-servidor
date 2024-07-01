marker = {}
proposta = {}
dadosVenda = {}
dados = {}
blip_create = {}
contaDono = {}
spam = {}
local vintage = exports["fipi_inventory"]

elementDatasTuning = {
    "JOAO.Neon",
    "JOAO.tuningRodas",
    "JOAO.tuningSpoiler",
    "JOAO.tuningBlindagem",
    "JOAO.tuningVidro fumê",
    "JOAO.tuningParachoque dianteiro",
    "JOAO.tuningParachoque traseiro",
    "JOAO.tuningCapô",
    "JOAO.tuningMotor",
    "JOAO.tuningRepro",
}



addEventHandler("onResourceStart", resourceRoot,
function()
    db = dbConnect("sqlite", "dados.sqlite")
    dbExec(db, "CREATE TABLE IF NOT EXISTS Estoque(ID, Quantia)")
    dbExec(db, "CREATE TABLE IF NOT EXISTS Carros(ID INTEGER PRIMARY KEY AUTOINCREMENT, account, idCar, state, placa, imposto, seguro, dataCar, dataTuning)")
    dbExec(db, "CREATE TABLE IF NOT EXISTS Slots(account, quantia)")
    dbExec(db, "CREATE TABLE IF NOT EXISTS SlotsBuy(account, quantia)")
    for i, v in ipairs(config["Markers"]) do
        marker[i] = createMarker(v[1], v[2], v[3], "cylinder", 1.1, 75, 0, 130, 90)
        if v[4] == "conce" then
            setElementData(marker[i], "markerData", {title = "Concessionária", desc = "Compre seu veículo", icon = "exchange"})
        elseif v[4] == "garagem" then
            setElementData(marker[i], "markerData", {title = "Garagem", desc = "Pegue seu veículo", icon = "garage"})
        elseif v[4] == "detran" then
            setElementData(marker[i], "markerData", {title = "Detran", desc = "Pague os impostos de seus veículo", icon = "office"})
        end
        blip_create[i] = createBlipAttachedTo(marker[i], v[4] == "conce" and 3 or v[4] == "garagem" and 3 or 3)
        addEventHandler("onMarkerHit", marker[i],
        function(player, dim)
            if player and isElement(player) and getElementType(player) == "player" then
                if dim then
                    sendData(player, v[4])
                    triggerClientEvent(player, "JOAO.openConce", player, v[4], i)
                end
            end
        end)
    end
    setTimer(function()
        for i, v in ipairs(config["IDs Veículos"]) do
            local result = dbPoll(dbQuery(db, "SELECT * FROM Estoque WHERE ID = ?", v), 3)
            if #result == 0 then
                dbExec(db, "INSERT INTO Estoque(ID, Quantia) VALUES(?,?)", v, 30)
            end
        end
    end, 3000, 1)
    for i, v in ipairs(getElementsByType("player")) do
        local result = dbPoll(dbQuery(db, "SELECT * FROM Slots WHERE account = ?", puxarConta(v)), 3)
        local resultTwo = dbPoll(dbQuery(db, "SELECT * FROM SlotsBuy WHERE account = ?", puxarConta(v)), 3)
        if #result == 0 then
            if #resultTwo > 0 then
                dbExec(db, "INSERT INTO Slots(account, quantia) VALUES(?,?)", puxarConta(v), (verifySlot(v)+resultTwo[1]["quantia"]))
            else
                dbExec(db, "INSERT INTO Slots(account, quantia) VALUES(?,?)", puxarConta(v), verifySlot(v))
            end
        end
    end
    setTimer(function()
        local result = dbPoll(dbQuery(db, "SELECT * FROM Carros"), -1)
        if #result > 0 then
            for i, v in ipairs(result) do
                local removeJSON = fromJSON(v.dataCar)
                if removeJSON[1].marca == "Exclusivo" then
                    if removeJSON[1].timestampVencer then
                        if removeJSON[1].timestampVencer > 0 then
                            if removeJSON[1].timestampVencer <= getRealTime().timestamp then
                                dbExec(db, "DELETE FROM Carros WHERE account = ? AND idCar = ?", v.account, v.idCar)
                            end
                        end
                    end
                end
            end
        end
    end, 3*60000, 0)
    dbExec(db, "UPDATE Carros SET state = ? WHERE state = ?", "Guardado", "Spawnado")
end)

addEventHandler("onPlayerLogin", root,
function(_, accountName)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Slots WHERE account = ?", getAccountName(accountName)), -1)
    local resultTwo = dbPoll(dbQuery(db, "SELECT * FROM SlotsBuy WHERE account = ?", getAccountName(accountName)), -1)
    if #result == 0 then
        if #resultTwo > 0 then
            dbExec(db, "INSERT INTO Slots(account, quantia) VALUES(?,?)", getAccountName(accountName), (verifySlot(source)+resultTwo[1]["quantia"]))
        else
            dbExec(db, "INSERT INTO Slots(account, quantia) VALUES(?,?)", getAccountName(accountName), verifySlot(source))
        end
    end
end)

addEventHandler("onPlayerQuit", root,
function()
    dbExec(db, "DELETE FROM Slots WHERE account = ?", puxarConta(source))
end)

addCommandHandler("setestoque",
function(player, cmd, id, qnt)
    if aclGetGroup("Console") and isObjectInACLGroup("user."..puxarConta(player), aclGetGroup("Console")) then
        local id = tonumber(id)
        local qnt = tonumber(qnt)
        if id and qnt then
            local result = dbPoll(dbQuery(db, "SELECT * FROM Estoque WHERE ID = ?", id), -1)
            if #result > 0 then
                dbExec(db, "UPDATE Estoque SET Quantia = ? WHERE ID = ?", result[1]["Quantia"]+qnt, id)
				exports["fipi_infobox"]:addBox(player,"Você adicionou "..qnt.."x de estoque para o carro do ID "..id, "success")
            else
                exports["fipi_infobox"]:addBox(player,"Esse carro não está na database!", "error")
            end
        else
            exports["fipi_infobox"]:addBox(player,"Digite /setestoque [ID] [QNT]", "info")
        end
    end
end)

function sendData(player, type)
    if type == "conce" then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Estoque"), -1)
        triggerClientEvent(player, "JOAO.sendDataCONCE", player, type, result)
    elseif type == "garagem" or type == "detran" then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Carros WHERE account = ?", puxarConta(player)), -1)
        local resultSlots = dbPoll(dbQuery(db, "SELECT * FROM Slots WHERE account = ?", puxarConta(player)), -1)
        triggerClientEvent(player, "JOAO.sendDataCONCE", player, type, result, resultSlots, getRealTime().timestamp)
    end
end

addEvent("JOAO.buySlotCONCE", true)
addEventHandler("JOAO.buySlotCONCE", root,
function(player)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Slots WHERE account = ?", puxarConta(player)), -1)
    local resultTwo = dbPoll(dbQuery(db, "SELECT * FROM SlotsBuy WHERE account = ?", puxarConta(player)), -1)
    if #result > 0 then
        local quantiaSlots = result[1]["quantia"]
        if ((quantiaSlots+1) > 30) then
        --    exports["fipi_infobox"]:addBox(player,"Não é possível comprar mais slots!", "error")
			notifyS(player,  "Não é possível comprar mais slots!", "error")	
        else
            local vpoints = (getElementData(player, "LT > Points") or 0)
            if #resultTwo > 0 then
                local quantiaSlotsTwo = resultTwo[1]["quantia"]
                calcSlots = ((quantiaSlots+quantiaSlotsTwo)+1)
            else
                calcSlots = (quantiaSlots+1)
            end
            if vpoints >= config["Slots Garagem"][calcSlots].priceSlot then
                setElementData(player, "vpoints", (vpoints-config["Slots Garagem"][calcSlots].priceSlot))
                dbExec(db, "UPDATE Slots SET quantia = ? WHERE account = ?", (quantiaSlots+1), puxarConta(player))
                if #resultTwo > 0 then
                    local quantiaSlotsTwo = resultTwo[1]["quantia"]
                    dbExec(db, "UPDATE SlotsBuy SET quantia = ? WHERE account = ?", (quantiaSlotsTwo+1), puxarConta(player))
                else
                    dbExec(db, "INSERT INTO SlotsBuy(account, quantia) VALUES(?,?)", puxarConta(player), 1)
                end
              exports["fipi_infobox"]:addBox(player,"Você comprou +1 slot com sucesso!", "success")
				
                sendData(player, "garagem")
            else
                exports["fipi_infobox"]:addBox(player,"Você não tem VP suficiente!", "error")
				
            end
        end
    else
        exports["fipi_infobox"]:addBox(player,"Não foi possível, relogue!", "error")
	
    end
end)

addEvent("JOAO.buyVehicle", true)
addEventHandler("JOAO.buyVehicle", root,
function(player, tableVehicle, tableColor, typeMethod)
    local data = dbPoll(dbQuery(db, 'SELECT * FROM Carros WHERE account=? AND idCar = ?', puxarConta(player), tableVehicle[2]), -1)
    if #data >= 1 then
      exports["fipi_infobox"]:addBox(player,'Você já possui o veículo '..tableVehicle[1]..', por isso não foi possivel comprar-lo!', 'error')
		
    else
        if verifySlotDisp(player) then
            exports["fipi_infobox"]:addBox(player,"Você não tem slot disponível!", "error")
		
        else
            --if verifyEstoque(tableVehicle[2]) then
                if verifyTypeMoney(player, typeMethod, typeMethod == "dinheiro" and tableVehicle[4] or tableVehicle[6], tableVehicle[1]) then
                    descPlayerMoney(player, typeMethod, typeMethod == "dinheiro" and tableVehicle[4] or tableVehicle[6])
                    exports["fipi_infobox"]:addBox(player,'Pegue seu veículo em uma garagem!', 'info')
					
                    dados_veh = { timestampVencer = 0, name = tableVehicle[1], marca = tableVehicle[3], aceleracao = tableVehicle[5], price = tableVehicle[4], pricevp = tableVehicle[6], typePago = typeMethod, vida = 1000, color = {tableColor[1], tableColor[2], tableColor[3], 255, 255, 255, 255, 255, 255, 255, 255, 255}, light = {255, 255, 255}, gasolina = 100 }
                    descEstoque(tableVehicle[2])
                    dbExec(db, 'INSERT INTO Carros (account, idCar, state, placa, imposto, seguro, dataCar, dataTuning) values(?,?,?,?,?,?,?,?)', puxarConta(player), tableVehicle[2], "Guardado", "Sem Placa", (getRealTime().timestamp+604800), "Não", toJSON({dados_veh}), null)
                    sendData(player, "conce")
                else
                    exports["fipi_infobox"]:addBox(player,"Você não tem "..typeMethod.." suficiente!", "error")
                     	
                end
            --else
            --    exports["fipi_infobox"]:addBox(player,"Não tem estoque na loja!", "error")
			--
            --end
        end
    end
end)

addEvent("JOAO.manageVehicleGARAGEM", true)
addEventHandler("JOAO.manageVehicleGARAGEM", root,
function(player, type, tabela, indexMarker)
    if insertSpam(player) then
        exports["fipi_infobox"]:addBox(player,"Aguarde alguns segundos...", "info")
		
        return
    end
    local vehicle = getVehicleCar2(player, tonumber(tabela.idCar))
    if type == "retirar" then
        if tabela.state == "Spawnado" then
            exports["fipi_infobox"]:addBox(player,"Seu veículo já está spawnado!", "error")
            
        else
            if tonumber(tabela.imposto) <= getRealTime().timestamp then
             exports["fipi_infobox"]:addBox(player,"Esse veículo está com imposto, portanto não é possível pegar ele!", "error")
			
            else
                if isElement(vehicle) then
                  exports["fipi_infobox"]:addBox(player,"Você já tem um veículo spawnado!", "error")
 				
                else
                    local dadosVeh = fromJSON(tabela.dataCar)
                    local color = (dadosVeh[1].color)
                    local colorLight = (dadosVeh[1].light)
                    local tuningA = fromJSON(tabela.tuning)
                    --print(tabela.tuning)
                    vehicle = createVehicle(tabela.idCar, config["Markers"][indexMarker][5], config["Markers"][indexMarker][6], config["Markers"][indexMarker][7]+1)
                    -- warpPedIntoVehicle( source, vehicle)
                    if tuningA then
                        for i, v in ipairs(tuningA) do
                            setElementData(vehicle, v.name, v.data)
                            if v.name == "JOAO.Neon" then
                                setElementData(vehicle, "vehicle.neon.active", true)
                                triggerEvent("tuning->Neon", root, vehicle, v.data.tuningTable)
                            elseif v.name == "JOAO.tuningRodas" or v.name == "JOAO.tuningSpoiler" or v.name == "JOAO.tuningParachoque dianteiro" or v.name == "JOAO.tuningParachoque traseiro" or v.name == "JOAO.tuningCapô" then
                                addVehicleUpgrade(vehicle, v.data.tuningTable)
                            elseif v.name == "JOAO.tuningBlindagem" then
                                setVehicleDamageProof(vehicle, true)
                            elseif v.name == "JOAO.tuningVidro fumê" then
                                triggerEvent("JOAO.handleWindowSmoke", player, vehicle, true)
                            elseif v.name == "JOAO.tuningMotor" then
                                setVehicleHandling(vehicle, "maxVelocity", v.data.tuningTable["maxVelocity"])
                                setVehicleHandling(vehicle, "dragCoeff", v.data.tuningTable["dragCoeff"])
                                setVehicleHandling(vehicle, "engineAcceleration", v.data.tuningTable["engineAcceleration"])

                            end
                        end
                    end
                    setVehicleHeadLightColor(vehicle, colorLight[1], colorLight[2], colorLight[3])
                    setVehicleColor(vehicle, color[1], color[2], color[3], color[4], color[5], color[6], color[7], color[8], color[9], color[10], color[11], color[12])
                    setElementData(vehicle, "JOAO.idVehicle", tabela.idColum)
                    setVehiclePlateText(vehicle, tabela.placa)
                    setElementHealth(vehicle, dadosVeh[1].vida)
                    setElementData(vehicle, "Gasolina", dadosVeh[1].gasolina)
                    setElementData(vehicle, "Owner", player)     
                    local idCarro = getElementModel ( vehicle )
                    local PesoMaxDoCarro = config["Pesos"][idCarro] or 0   
                   -- iprint(idCarro)
                  --  iprint(config["Pesos"][idCarro])  
                    setElementData(vehicle, "JOAO.sizePortaMalas", PesoMaxDoCarro)
					local nome = removeHex(getPlayerName(player))
					local idplayer = getElementData(player, "ID") or "N/A"
                    local veiculo = getPedOccupiedVehicle(player)
                    local IDVeiculo = getVehicleID(vehicle)

                    local carro = getNameVehicle(IDVeiculo, getVehicleType(IDVeiculo))
                   
					notifyS(player,   "Você Retirou o Veiculo Da Garagem!", "success")
               --     messageDiscord(">>> `🗽` **Jogador:** "..puxarNome(player).." ("..puxarID(player)..") \n`📑` **Mensagem:** Retirou o "..carro.." Da Garagem !", "`📄` Concessionaria", config["WebHook"]["Retirou"])
                    contaDono[vehicle] = getAccountName(getPlayerAccount(player))
                    dados[vehicle] = {owner = player, account = getAccountName(getPlayerAccount(player)), id = tabela.idColum, rgDono = puxarID(player), seguroCar = tabela.seguro}
                    dbExec(db, 'UPDATE Carros SET state = ? WHERE ID = ?', "Spawnado", tabela.idColum)
                end
            end
        end
    elseif type == "guardar" then

        if tabela.state == "Guardado" then
            exports["fipi_infobox"]:addBox(player,"Seu veículo já está guardado!", "error")
			
        else
            if isElement(vehicle) then
                local posVeh = {getElementPosition(vehicle)}
                local pos = {getElementPosition(player)}
					local nome = removeHex(getPlayerName(player))
					local idplayer = getElementData(player, "ID") or "N/A"
                    local veiculo = getPedOccupiedVehicle(player)
                    local IDVeiculo = getVehicleID(vehicle)

                local carro = getNameVehicle(IDVeiculo, getVehicleType(IDVeiculo))
            
                local distance = getDistanceBetweenPoints3D(posVeh[1], posVeh[2], posVeh[3], pos[1], pos[2], pos[3])
                if distance <= 10 then
                    saveDadosVeh(vehicle)
                    if isElement(vehicle) then destroyElement(vehicle) end
                    if isElement(blip[player]) then destroyElement(blip[player]) end
					notifyS(player,  "Você Guardou o Veiculo na Garagem!", "success")
                   -- messageDiscord(">>> `🗽` **Jogador:** "..puxarNome(player).." ("..puxarID(player)..") \n`📑` **Mensagem:** Guardou o "..carro.." Da Garagem !", "`📄` Concessionaria", config["WebHook"]["Guardou"])
                    dbExec(db, 'UPDATE Carros SET state = ? WHERE ID = ?', "Guardado", dados[vehicle].id)
                else
					notifyS(player,   "O veículo não está próximo a você!", "error")
                end
            else
				notifyS(player,   "Erro ao guardar o veículo!", "error")
            end
        end
    end
    sendData(player, "garagem")
end)

addEvent("JOAO.setVehicleGaragem", true)
addEventHandler("JOAO.setVehicleGaragem", root,
function(player, tableVehicle, priceVip, tempo)
    if verifySlotDisp(player) then
    exports["fipi_infobox"]:addBox(player,"Você não tem slot disponível!", "error")
			
    else
        local data = dbPoll(dbQuery(db, 'SELECT * FROM Carros WHERE account=? AND idCar = ?', puxarConta(player), config["Veiculos comprados"][tableVehicle[1]][1]), -1)
        if #data >= 1 then
           exports["fipi_infobox"]:addBox(player,'Você já possui o veículo '..tableVehicle[1]..', por isso não foi possivel comprar-lo!', 'error')
      
		else
            local atualPoints = (getElementData(player, "LT > Points") or 0)
            setElementData(player, "LT > Points", atualPoints-priceVip)
          exports["fipi_infobox"]:addBox(player,'Pegue seu veículo em uma garagem!', 'info')
			 

            dados_veh = { name = tableVehicle[1], marca = config["Veiculos comprados"][tableVehicle[1]][2], aceleracao = config["Veiculos comprados"][tableVehicle[1]][4], price = config["Veiculos comprados"][tableVehicle[1]][3], pricevp = config["Veiculos comprados"][tableVehicle[1]][5], typePago = "dinheiro", vida = 1000, color = {255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255}, light = {255, 255, 255}, gasolina = 100, timestampVencer = (getRealTime().timestamp+tempo) }
            dbExec(db, 'INSERT INTO Carros (account, idCar, state, placa, imposto, seguro, dataCar, dataTuning) values(?,?,?,?,?,?,?,?)', puxarConta(player), config["Veiculos comprados"][tableVehicle[1]][1], "Guardado", "SEM PLACA", (getRealTime().timestamp+604800), "Não", toJSON({dados_veh}), null)
            sendData(player, "conce")
        end
    end
end)

addEvent("JOAO.manageVehicleDETRAN", true)
addEventHandler("JOAO.manageVehicleDETRAN", root,
function(player, type, tableVehicle)
    if type == "recuperar" then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Carros WHERE idCar = ? AND account = ?", tableVehicle.idCar, puxarConta(player)), -1)
        if #result > 0 then
            if result[1]["state"] == "Recuperar" then
                local dataVehicle = fromJSON(result[1]["dataCar"])
                if exports["fipi_inventory"]:getItem(player, "Dinheiro") >= (30*dataVehicle[1].price/100) then
                    
                    --takePlayerMoney(player, (30*dataVehicle[1].price/100))
                    exports["fipi_inventory"]:takeItem(player, "Dinheiro", (30*dataVehicle[1].price/100))
                    dbExec(db, "UPDATE Carros SET state = ? WHERE idCar = ? AND account = ?", "Guardado", tableVehicle.idCar, puxarConta(player))
                   exports["fipi_infobox"]:addBox(player,"Você recuperou o veículo com sucesso!", "success")
					
                else
                 exports["fipi_infobox"]:addBox(player,"Você não tem dinheiro suficiente!", "error")
					
                end
            else
               exports["fipi_infobox"]:addBox(player,"Seu veículo não precisa ser recuperado!", "error")
				
            end
        else
            exports["fipi_infobox"]:addBox(player,"Veículo inexistente!", "error")
		
        end
    elseif type == "seguro" then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Carros WHERE idCar = ? AND account = ?", tableVehicle.idCar, puxarConta(player)), -1)
        if #result > 0 then
            if result[1]["seguro"] == "Não" then
                local dataVehicle = fromJSON(result[1]["dataCar"])
                if exports["fipi_inventory"]:getItem(player, "Dinheiro") >= (20*dataVehicle[1].price/100) then
                    exports["fipi_inventory"]:takeItem(player, "Dinheiro", (20*dataVehicle[1].price/100))
                    dbExec(db, "UPDATE Carros SET seguro = ? WHERE idCar = ? AND account = ?", "Sim", tableVehicle.idCar, puxarConta(player))
                    exports["fipi_infobox"]:addBox(player,"Você colocou seguro no seu veículo com sucesso!", "success")
					
                else
                  exports["fipi_infobox"]:addBox(player,"Você não tem dinheiro suficiente!", "error")
					
                end
            else
                exports["fipi_infobox"]:addBox(player,"Seu veículo já possui o seguro!", "error")
            end
        else
          exports["fipi_infobox"]:addBox(player,"Veículo inexistente!", "errr")
 			
        end
    elseif type == "emplacar" then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Carros WHERE idCar = ? AND account = ?", tableVehicle.idCar, puxarConta(player)), -1)
        if #result > 0 then
            if result[1]["placa"] == "SEM PLACA" then
                local dataVehicle = fromJSON(result[1]["dataCar"])
                if exports["fipi_inventory"]:getItem(player, "Dinheiro") >= (10*dataVehicle[1].price/100) then
                    exports["fipi_inventory"]:takeItem(player, "Dinheiro", (10*dataVehicle[1].price/100))
                  
                    dbExec(db, "UPDATE Carros SET placa = ? WHERE idCar = ? AND account = ?", gerarCodigo(2).."-"..gerarCodigo(2).."-"..gerarCodigo(2), tableVehicle.idCar, puxarConta(player))
                   exports["fipi_infobox"]:addBox(player,"Você emplacou o seu veículo com sucesso!", "success")
				
                else
                    exports["fipi_infobox"]:addBox(player,"Você não tem dinheiro suficiente!", "error")
                       
                end
            else
               exports["fipi_infobox"]:addBox(player,"Seu veículo já está emplacado!", "error")
		
            end
        else
            exports["fipi_infobox"]:addBox(player,"Veículo inexistente!", "errr")
        end
    elseif type == "imposto" then
        local result = dbPoll(dbQuery(db, "SELECT * FROM Carros WHERE idCar = ? AND account = ?", tableVehicle.idCar, puxarConta(player)), -1)
        if #result > 0 then
            if tonumber(result[1]["imposto"]) <= getRealTime().timestamp then
                local dataVehicle = fromJSON(result[1]["dataCar"])
                --if exports["fipi_inventory"]:getItem(player, "Dinheiro") >= (20*dataVehicle[1].price/100) then
                    --exports["fipi_inventory"]:takeItem(player, "Dinheiro", (20*dataVehicle[1].price/100))
                    dbExec(db, "UPDATE Carros SET imposto = ? WHERE idCar = ? AND account = ?", (getRealTime().timestamp+(604800)), tableVehicle.idCar, puxarConta(player))
                   -- exports["fipi_infobox"]:addBox(player,"Você pagou o imposto do seu veículo com sucesso!", "success")
					notifyS(player,   "Você pagou o imposto do seu veículo com sucesso!", "success")
                --else
                --    exports["fipi_infobox"]:addBox(player,"Você não tem dinheiro suficiente!", "error")
				--	
                --end
            else
                exports["fipi_infobox"]:addBox(player,"Seu veículo não precisa ser pago o imposto!", "error")
			
            end
        else
           exports["fipi_infobox"]:addBox(player,"Veículo inexistente!", "errr")
		
        end
    end
    sendData(player, "detran")
end)

addEvent("MeloSCR:onVehicleDesmanchado", true)
addEventHandler("MeloSCR:onVehicleDesmanchado", root, 
function (theVehicle)
    if dados[theVehicle] then
        dbExec(db, 'UPDATE Carros SET state = ? WHERE account = ? AND idCar = ?', 'Recuperar', dados[theVehicle].account, getElementModel(theVehicle))
    end 
end)

function saveDadosVeh(veh)
    db = dbConnect("sqlite", "dados.sqlite")
    if isElement(veh) and (getElementType(veh) == 'vehicle') then
        local result = dbPoll(dbQuery(db, 'SELECT * FROM Carros WHERE idCar = ? AND account = ?', getElementModel(veh), dados[veh].account), -1)
        if #result ~= 0 then
            local dataVehicle = fromJSON(result[1]["dataCar"])
            local tuningB = {}
            for i, v in ipairs(elementDatasTuning) do
                if (getElementData(veh, v) or false) then
                    table.insert(tuningB, {
                        name = v,
                        data = (getElementData(veh, v) or false),
                    })
                end
            end
           -- iprint(tuningB)
            local dados_veh = { name = dataVehicle[1].name, marca = dataVehicle[1].marca, timestampVencer = (dataVehicle[1].timestampVencer and dataVehicle[1].timestampVencer or 0), aceleracao = dataVehicle[1].aceleracao, price = dataVehicle[1].price, pricevp = dataVehicle[1].pricevp, typePago = dataVehicle[1].typePago, vida = getElementHealth(veh), color = {getVehicleColor(veh, true)}, light = {getVehicleHeadLightColor(veh)}, gasolina = (getElementData(veh, 'Gasolina') or 100) }
            dbExec(db, 'UPDATE Carros SET dataCar = ?, dataTuning = ? WHERE idCar = ? AND account = ?', toJSON({dados_veh}), toJSON(tuningB), getElementModel(veh), dados[veh].account)
        end
    end
end

function stopResource()
    for i, v in ipairs(getElementsByType('vehicle')) do
        if dados[v] then
            saveDadosVeh(v)
            local result = dbPoll(dbQuery(db, 'SELECT * FROM Carros WHERE idCar = ? AND account = ?', getElementModel(v), dados[v].account), - 1)
            if (#result ~= 0) and (type(result) == 'table') then
                if result[1]['state'] == 'Spawnado' then
                    dbExec(db, 'UPDATE Carros SET state = ? WHERE idCar = ? AND account = ?', 'Guardado', getElementModel(v), dados[v].account)
                end
            end
        end
    end
end
addEventHandler('onResourceStop', resourceRoot, stopResource)

blip = {}

function localizarVehicle(player, modelo)
    if (modelo) then
        local result = dbPoll(dbQuery(db, 'SELECT * FROM Carros WHERE idCar = ? AND account = ?', tonumber(modelo), puxarConta(player)), - 1)
        if (#result ~= 0) then
            if result[1]['Estado'] == 'Guardado' then
               exports["fipi_infobox"]:addBox(player,'O veículo não está spawnado.', 'error')
			
            else
                if result[1]['Placa'] == 'SEM PLACA' then
                    exports["fipi_infobox"]:addBox(player,'Seu veículo não possui placa para rastrear!', 'error')
				
                else
                    if result[1]['Seguro'] == 'Não' then
                     exports["fipi_infobox"]:addBox(player,'Seu veículo não possui seguro para rastrear!', 'error')
						
                    else
                        local vehicle = getVehicleCar2(player, tonumber(modelo))
                        if isElement(vehicle) then
                            if isElement(blip[player]) then
                             exports["fipi_infobox"]:addBox(player,'Este veículo já está sendo localizado.', 'error')
						
                            else
                                blip[player] = createBlipAttachedTo(vehicle, 41)
                                setElementVisibleTo(blip[player], root, false)
                                setElementVisibleTo(blip[player], player, true)
                            exports["fipi_infobox"]:addBox(player,'Seu veículo foi marcado no mapa!', 'info')
							
                                setTimer(function()
                                    if isElement(blip[player]) then
                                        destroyElement(blip[player])
                                    end
                                end, 1*60000, 1)
                            end
                        end
                    end
                end
            end
        end
    end
end 
addEvent('JOAO.localizarVehicle', true)
addEventHandler('JOAO.localizarVehicle', root, localizarVehicle)

addEvent("JOAO.venderVehicle", true)
addEventHandler("JOAO.venderVehicle", root,
function(player, tabela, id, valores, tipomoney, tipo)
    local infos = fromJSON(tabela.dataCar)
    local vehicle = getVehicleCar2(player, tonumber(tabela.idCar))
    if insertSpam(player) then
     exports["fipi_infobox"]:addBox(player,"Aguarde alguns segundos...", "info")
		
        return
    end
    if infos[1].marca == "Exclusivo" then
        exports["fipi_infobox"]:addBox(player,"Esse veículo é exclusivo!", "error")
         
    else
        if tipo == "conce" then
            if tabela.state == "Recuperar" or tonumber(tabela.imposto) <= getRealTime().timestamp then
              --  exports["fipi_infobox"]:addBox(player,"Seu veículo precisa ser recuperado ou pagar imposto para poder vender!", "error")
 				notifyS(player,   "Seu veículo precisa ser recuperado ou pagar imposto para poder vender!", "error")
            else
                if infos[1].typePago == "dinheiro" then
                   -- givePlayerMoney(player, (infos[1].price-(10*infos[1].price/100)))
                    exports["fipi_inventory"]:giveItem(player, "Dinheiro", (infos[1].price-(10*infos[1].price/100)))
                  exports["fipi_infobox"]:addBox(player,"Você vendeu seu carro para a concessionária e recebeu € "..formatNumber((infos[1].price-(10*infos[1].price/100)))..",00!", "info")
                    dbExec(db, 'DELETE FROM Carros WHERE ID = ?', tabela.idColum)
                    if isElement(vehicle) then destroyElement(vehicle) end
                    sendData(player, "garagem")
                else

                    local atualVP = (getElementData(player, "LT > Points") or 0)
                    setElementData(player, "LT > Points", atualVP+(infos[1].pricevp-(10*infos[1].pricevp/100)))
                   exports["fipi_infobox"]:addBox(player,"Você vendeu seu carro para a concessionária e recebeu v$ "..formatNumber((infos[1].pricevp-(10*infos[1].pricevp/100))).."!", "info")
                    dbExec(db, 'DELETE FROM Carros WHERE ID = ?', tabela.idColum)
                    if isElement(vehicle) then destroyElement(vehicle) end
                    sendData(player, "garagem")
                end
            end
        else
            if verifyNumber(valores) then
                exports["fipi_infobox"]:addBox(player,"Você precisa digitar um valor em número!", "error")
				
            else
                if verifyNumber(id) then
                   exports["fipi_infobox"]:addBox(player,"Você precisa digitar um ID em número!", "error")
			
                else
                    local receiver = getPlayerFromID(tonumber(id))
                    if isElement(receiver) then
                        if proposta[receiver] then
                          exports["fipi_infobox"]:addBox(player,"Esse jogador já tem uma proposta pendente!", "error")
						
                        else
                            if infos[1].typePago ~= "dinheiro" then notifyS(player,   "Você não pode vender carro que não seja comprado por money!", "error") return end
                            if tabela.state == "Recuperar" or tonumber(tabela.imposto) <= getRealTime().timestamp then
							
                            exports["fipi_infobox"]:addBox(player,"Seu veículo precisa ser recuperado ou pagar imposto para poder vender!", "error")
                            else
                                if tipomoney == "money" then
                                    if exports["fipi_inventory"]:getItem(player, "Dinheiro") >= valores then
                                        proposta[receiver] = {(getElementData(player, "ID") or 0)}
                                        dadosVenda[receiver] = {valores, infos[1].name, "money", tabela.idColum, tabela.idCar, tabela.state}
									
                                        exports["fipi_infobox"]:addBox(player,"Você enviou a proposta do veículo "..(infos[1].name).." com sucesso para o jogador "..puxarNome(receiver).."("..puxarID(receiver)..")", "success")
                                       
                                    else
                                       exports["fipi_infobox"]:addBox(player,"O jogador que você está oferecendo o carro não tem dinheiro suficiente!", "error")
										
                                    end
                                else
                                    local pontos = getElementData(receiver, "LT > Points") or 0
                                    if pontos >= valores then
                                        proposta[receiver] = {(getElementData(player, "ID") or 0)}
                                        dadosVenda[receiver] = {valores, infos[1].name, "pontos", tabela.idColum, tabela.idCar, tabela.state}
                                        setElementData(receiver, "propostaConce", (getElementData(player, "ID") or 0))
                                      exports["fipi_infobox"]:addBox(player,"Você enviou a proposta do veículo "..(infos[1].name).." com sucesso para o jogador "..puxarNome(receiver).."("..puxarID(receiver)..")", "success")
                      
                                    exports["fipi_infobox"]:addBox(recever,"Você recebeu a proposta do veículo "..(infos[1].name).." para aceitar digite /aceitarcar ou /negarcar", "info")
								
                
                                    else
                                      exports["fipi_infobox"]:addBox(player,"O jogador que você está oferecendo o carro não tem lPoints suficiente!", "error")
									
                                    end
                                end
                            end
                        end
                    else
                    exports["fipi_infobox"]:addBox(player,"Esse jogador não está online!", "error")
						
                    end
                end
            end
        end
    end
end)

addCommandHandler("placa",
function(player)
    if aclGetGroup("Corp") and isObjectInACLGroup("user."..puxarConta(player), aclGetGroup("Corp")) then
        local vehicle = getPedOccupiedVehicle(player)
        if vehicle then
            if dados[vehicle] then
                triggerClientEvent(player, "JOAO.openConsultarCARPLACA", player, dados[vehicle], vehicle)
            end
        end
    end
end)

addCommandHandler("aceitarcar",
function(receiver)
    if proposta[receiver] then
        local player = getPlayerFromID(proposta[receiver][1])
        if isElement(player) then
            local pontos = getElementData(receiver, "LT > Points") or 0
            local pontos2 = getElementData(player, "LT > Points") or 0
            local vehicle = getVehicleCar2(player, tonumber(dadosVenda[receiver][5]))
            if dadosVenda[3] == "pontos" then
                proposta[receiver] = false
                setElementData(receiver, "LT > Points", pontos-dadosVenda[receiver][1])
                setElementData(player, "LT > Points", pontos2+dadosVenda[receiver][1])
           exports["fipi_infobox"]:addBox(player,"O jogador aceitou sua proposta e você ganhou v$ "..formatNumber(dadosVenda[receiver][1]).."!", "success")
           exports["fipi_infobox"]:addBox(receiver,"Você aceitou a proposta do carro "..dadosVenda[receiver][2].." com sucesso!", "success")
                dbExec(db, 'UPDATE Carros SET account = ?, state = ? WHERE ID = ?', puxarConta(receiver), "Guardado", dadosVenda[receiver][4])
                if isElement(vehicle) then destroyElement(vehicle) end
                dadosVenda[receiver] = {}
                sendData(player, "garagem")
                sendData(receiver, "garagem")
            else
                proposta[receiver] = false
               -- takePlayerMoney(receiver, dadosVenda[receiver][1])
                exports["fipi_inventory"]:takeItem(player, "Dinheiro", dadosVenda[receiver][1])
              --  givePlayerMoney(player, dadosVenda[receiver][1])
                exports["fipi_inventory"]:giveItem(player, "Dinheiro", dadosVenda[receiver][1])
            --    exports["fipi_infobox"]:addBox(player,, "success")
				notifyS(player,   "O jogador aceitou sua proposta e você ganhou R€ "..formatNumber(dadosVenda[receiver][1])..",00!" , "success")	
                notifyS(receiver, "Você aceitou a proposta do carro "..dadosVenda[receiver][2].." com sucesso!", "success")
                dbExec(db, 'UPDATE Carros SET account = ?, state = ? WHERE ID = ?', puxarConta(receiver), "Guardado", dadosVenda[receiver][4])                   
             --    local carro = exports["lottus_concessionaria"]:getNameVehicle(IDVeiculo)
                    --print(carro)
                if isElement(vehicle) then destroyElement(vehicle) end
                dadosVenda[receiver] = {}
                sendData(player, "garagem")
                sendData(receiver, "garagem")
            end
        else
        exports["fipi_infobox"]:addBox(player,"Quem te ofereceu o veículo não está online!", "error")
			
        end
    else
       exports["fipi_infobox"]:addBox(receiver,"Você não tem nenhuma proposta pendente!","error")
        
    end
end)

addCommandHandler("negarcar",
function(receiver)
    if proposta[receiver] then
        local player = getPlayerFromID(proposta[receiver][1])
        if isElement(player) then
            proposta[receiver] = false
            setElementData(receiver, "propostaConce", 0)
           -- exports["fipi_infobox"]:addBox(player,"O jogador negou sua proposta!", "success")
			notifyS(player,   "O jogador negou sua proposta!" , "success")
            notifyS(receiver, "Você negou a proposta do carro "..dadosVenda[receiver][2].." com sucesso!", "success")
            dadosVenda[receiver] = {}
        else
           exports["fipi_infobox"]:addBox(player,"Quem te ofereceu o veículo não está online!" , "error")

        end
    else
       exports["fipi_infobox"]:addBox(receiver,"Você não tem nenhuma proposta pendente!","error")
    end
end)


function elementDestroy()
    if (getElementType(source) == 'vehicle') then
        if dados[source] then
            saveDadosVeh(source)
            local result = dbPoll(dbQuery(db, 'SELECT * FROM Carros WHERE idCar = ? AND account = ?', getElementModel(source), dados[source].account), - 1)
            if (#result ~= 0) and (type(result) == 'table') then
                if result[1]['state'] == 'Spawnado' then
                    dbExec(db, 'UPDATE Carros SET state = ? WHERE idCar = ? AND account = ?', 'Guardado', getElementModel(source), dados[source].account)
                end
            end
        end
        for i=0, 3 do
            local player = getVehicleOccupant(source, i)
            if (player and isElement(player) and getElementType(player) == 'player') then
                if getElementData(player, 'JOAO.cinto') then
                    removeElementData(player, 'JOAO.cinto')
                end
            end
        end
    end
end
addEventHandler('onElementDestroy', root, elementDestroy)

addEventHandler('onPlayerLogin', root,
function(_, accountName)
    for i,v in ipairs(getElementsByType("vehicle")) do 
        if contaDono[v] and contaDono[v] == getAccountName(accountName) then 
            setElementData(v, "Owner", source)
            dados[v].owner = source 
        end 
    end 
end)

function verifyTypeMoney(player, type, amount, nameVeh)
    if type == "dinheiro" then
        local item = exports["fipi_inventory"]:getItem(player, "Dinheiro") or 0
        if item >= amount then

			local name = getPlayerName(player)
			local id = getElementData(player, "ID") or "N/A"
         exports["fipi_infobox"]:addBox(player, 'Você comprou o veiculo '..nameVeh..' por € '..formatNumber(amount)..',00 com sucesso!' , "success")
            --messageDiscord(">>> `🗽` **Jogador:** "..puxarNome(player).." ("..puxarID(player)..") \n`📑` **Mensagem:** Comprou o "..nameVeh.." Da Concessionaria !", "`📄` Concessionaria", config["WebHook"]["Buy"])
            return true
        end
    else
        if (getElementData(player, "LT > Points") or 0) >= amount then
           exports["fipi_infobox"]:addBox(player,'Você comprou o veiculo '..nameVeh..' por v$ '..formatNumber(amount)..' com sucesso!', 'success')
            return true
        end
    end
    return false
end

function verifyEstoque(model)
    local estoques = dbPoll(dbQuery(db, 'SELECT * FROM Estoque WHERE ID = ?', model), - 1)
    if #estoques > 0 then
        if tonumber(estoques[1]['Quantia']) > 0 then
            return true
        end
    end
    return false
end

function descEstoque(model)         
    local estoques = dbPoll(dbQuery(db, 'SELECT * FROM Estoque WHERE ID = ?', model), - 1)
    if tonumber(estoques[1]['Quantia']) > 0 then
        dbExec(db, 'UPDATE Estoque SET Quantia = ? WHERE ID = ?', (estoques[1]['Quantia'] - 1), model)
        return true
    else
        return false
    end
end

function isVehicleFromConce(theVehicle)
    if theVehicle and isElement(theVehicle) and dados[theVehicle] then 
        for i,v in ipairs((getVehicleType(theVehicle) == "Automobile" and config['Veiculos']['Carros'] or config['Veiculos']['Motos'])) do 
            if v[2] == getElementModel(theVehicle) then 
                return true, v[4]
            end 
        end 
    end 
    return false
end

function getCarProx(player)
    local posv = {getElementPosition(player)}
    for i, v in ipairs(getElementsByType('vehicle')) do
        local pos = {getElementPosition(v)}
        if (getDistanceBetweenPoints3D(posv[1], posv[2], posv[3], pos[1], pos[2], pos[3]) < 5) then
            if (dados[v]) then
                return v
            end
        end
    end
    return false
end

function descPlayerMoney(player, type, amount)
    if type == 'dinheiro' then
        return  exports["fipi_inventory"]:takeItem(player, "Dinheiro", tonumber(amount))
    end
end

function verifySlot(player)
    for i, v in pairs(config["Slots VIPs"]) do
        if aclGetGroup(i) and isObjectInACLGroup("user."..puxarConta(player), aclGetGroup(i)) then
            return v
        end
    end
    return 3
end

function verifySlotDisp(player)
    local result = dbPoll(dbQuery(db, "SELECT * FROM Slots WHERE account = ?", puxarConta(player)), -1)
    local resultTwo = dbPoll(dbQuery(db, "SELECT * FROM Carros WHERE account = ?", puxarConta(player)), -1)
    if #result > 0 then
        if #resultTwo >= result[1]["quantia"] then
            return true
        end
    end
    return false
end

function getPlayerFromID(id)
    if tonumber(id) then
        for _, player in ipairs(getElementsByType('player')) do
            if getElementData(player, 'ID') and (getElementData(player, 'ID') == tonumber(id)) then
                return player
            end
        end
    end
    return false
end

function gerarCodigo(qntLetras)
    Letters = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}
    sas = ''
    for i=1, qntLetras do
        sas = sas ..Letters[math.random(#Letters)]
    end
    return sas
end

function getVehicleCar2(player, modelo)
    if (modelo) then
        local posv = {getElementPosition(player)}
        for i, v in ipairs(getElementsByType('vehicle')) do
            if (getElementModel(v) == tonumber(modelo)) then
                if (dados[v]) and (dados[v].owner == player) then
                    return v
                end
            end
        end
    end
    return false
end

function insertSpam(player)
    if not spam[player] then spam[player] = 0 end
    if not (getTickCount() >= (spam[player]+200)) then
        return true
    end
    spam[player] = getTickCount()
    return false
end



function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

function messageDiscord(mensagem, title, link)
    local data = {
        content = "",
        username = "Vida Real Portugal",
        avatar_url = "https://images-ext-1.discordapp.net/external/nGPPeQSf5o5GbsGXt4DlAA4dwoCnNtHmeK1z40iX2cE/%3Fsize%3D2048/https/cdn.discordapp.com/icons/1079553700420395170/253a45152e1e755273cd160c33a6b917.png?width=400&height=400",
        embeds = {
            {
                title = title,
                color = 3092790,
                description = ""..mensagem.."",
                footer = {
                    text = "Vida Real Portugal | Todos os seus direitos reservados",
                    icon_url = "https://images-ext-1.discordapp.net/external/nGPPeQSf5o5GbsGXt4DlAA4dwoCnNtHmeK1z40iX2cE/%3Fsize%3D2048/https/cdn.discordapp.com/icons/1079553700420395170/253a45152e1e755273cd160c33a6b917.png?width=400&height=400",
                },
                    image = {
                      url = "",
                    },
                    thumbnail = { 
                      url = "https://images-ext-1.discordapp.net/external/nGPPeQSf5o5GbsGXt4DlAA4dwoCnNtHmeK1z40iX2cE/%3Fsize%3D2048/https/cdn.discordapp.com/icons/1079553700420395170/253a45152e1e755273cd160c33a6b917.png?width=400&height=400",
                    },
            }
        }
    }
  
    local jsonData = toJSON(data)
          jsonData = string.sub(jsonData, 3, #jsonData - 2)
  
    local sendOptions = {
        headers = {
            ["Content-Type"] = "application/json"
        },
        postData = jsonData,
    }
  
    fetchRemote ( link, sendOptions, function () return end)
  end