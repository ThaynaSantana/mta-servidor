Veiculo_VIPs = {}

Grupo_01 = "Bronze"
VIP_Bronze_ID_Veiculo_01 = 541
VIP_Bronze_Pack_de_Armas_01 = { 5, 22 }
VIP_Bronze_Personagem_01 = 300

Grupo_02 = "Prata"
VIP_Prata_ID_Veiculo_01 = 541
VIP_Prata_ID_Veiculo_02 = 411
VIP_Prata_Pack_de_Armas_01 = { 5, 22, 25, 43, 46 }
VIP_Prata_Personagem_01 = 300
VIP_Prata_Personagem_02 = 85
VIP_Prata_Vida = 80

Grupo_03 = "Ouro"
VIP_Ouro_ID_Veiculo_01 = 541
VIP_Ouro_ID_Veiculo_02 = 411
VIP_Ouro_Pack_de_Armas_01 = { 4, 22, 25, 43, 46 }
VIP_Ouro_Pack_de_Armas_02 = { 5, 24 }
VIP_Ouro_Personagem_01 = 300
VIP_Ouro_Personagem_02 = 85
VIP_Ouro_Personagem_03 = 95
VIP_Ouro_Vida = 100
VIP_Ouro_Colete = 50

Grupo_04 = "Ametista"
VIP_Ametista_ID_Veiculo_01 = 469
VIP_Ametista_ID_Veiculo_02 = 411
VIP_Ametista_Pack_de_Armas_01 = { 4, 22, 25, 43, 46 }
VIP_Ametista_Pack_de_Armas_02 = { 5, 24, 30, 34 }
VIP_Ametista_Personagem_01 = 300
VIP_Ametista_Personagem_02 = 85
VIP_Ametista_Personagem_03 = 95
VIP_Ametista_Vida = 100
VIP_Ametista_Colete = 100

function Receber_Client_AirNewSCR ( Tipo, VIP, ID )
    if Tipo == "Veiculo(s)" then
		local Jogador_X, Jogador_Y, Jogador_Z = getElementPosition ( source )
	    local Rotacao_X, Rotacao_Y, Rotacao_Z = getElementRotation ( source )
		if isElement ( Veiculo_VIPs[source] ) then
		    destroyElement ( Veiculo_VIPs[source] )
		end
		if VIP == "Bronze" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Bronze_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Prata" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Prata_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Prata" and ID == 2 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Prata_ID_Veiculo_02, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Ouro" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Ouro_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Ouro" and ID == 2 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Ouro_ID_Veiculo_02, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Ametista" and ID == 1 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Ametista_ID_Veiculo_01, Jogador_X, Jogador_Y, Jogador_Z )
		elseif VIP == "Ametista" and ID == 2 then
		    Veiculo_VIPs[source] = createVehicle ( VIP_Ametista_ID_Veiculo_02, Jogador_X, Jogador_Y, Jogador_Z )
		end
		setElementRotation ( Veiculo_VIPs[source], Rotacao_X, Rotacao_Y, Rotacao_Z )
		warpPedIntoVehicle ( source, Veiculo_VIPs[source] )
		exports['FR_DxMessages']:addBox( source, "Veículo #ffff00VIP "..VIP.." #ffffffgerado!", "success" )
	elseif Tipo == "Arma(s)" then
		if VIP == "Bronze" and ID == 1 then
		    if getElementData ( source, "Bronze_Arma(s)" ) == "Bloqueado" then
			    exports['FR_DxMessages']:addBox( source, "Você está bloqueado de usar está opção temporariamente! [1 minuto]", "warning" )
			else
		        setElementData ( source, "Bronze_Arma(s)", "Bloqueado" )
		        for _, Armas in ipairs ( VIP_Bronze_Pack_de_Armas_01 ) do
			        giveWeapon ( source, Armas, 999 )
			    end
				exports['FR_DxMessages']:addBox( source, "Pack de armas #ffff00VIP "..VIP.." #ffffffgerado!", "success" )
				setTimer ( setElementData, 60000, 1, source, "Bronze_Arma(s)", "Desbloqueado" )
			end
		elseif VIP == "Prata" and ID == 1 then
		    if getElementData ( source, "Prata_Arma(s)" ) == "Bloqueado" then
                exports['FR_DxMessages']:addBox( source, "Você está bloqueado de usar está opção temporariamente! [10 segundos]", "warning" )
			else
		        setElementData ( source, "Prata_Arma(s)", "Bloqueado" )
		        for _, Armas in ipairs ( VIP_Prata_Pack_de_Armas_01 ) do
			        giveWeapon ( source, Armas, 999 )
			    end
				exports['FR_DxMessages']:addBox( source, "Pack de armas #ffff00VIP "..VIP.." #ffffffgerado!", "success" )
				setTimer ( setElementData, 10000, 1, source, "Prata_Arma(s)", "Desbloqueado" )
			end
		elseif VIP == "Ouro" and ID == 1 then
		    for _, Armas in ipairs ( VIP_Ouro_Pack_de_Armas_01 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		elseif VIP == "Ouro" and ID == 2 then
		    for _, Armas in ipairs ( VIP_Ouro_Pack_de_Armas_02 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		elseif VIP == "Ametista" and ID == 1 then
		    for _, Armas in ipairs ( VIP_Ametista_Pack_de_Armas_01 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		elseif VIP == "Ametista" and ID == 2 then
		    for _, Armas in ipairs ( VIP_Ametista_Pack_de_Armas_02 ) do
			    giveWeapon ( source, Armas, 999 )
			end
		end
		if getElementData ( source, "Bronze_Arma(s)" ) == "Bloqueado" or getElementData ( source, "Prata_Arma(s)" ) == "Bloqueado" then return end
		exports['FR_DxMessages']:addBox ( source, "Pack de armas #ffff00VIP "..VIP.." #ffffffgerado!", "success" )
	elseif Tipo == "Skin(s)" then
		if VIP == "Bronze" and ID == 1 then
		    setElementModel ( source, VIP_Bronze_Personagem_01 )
		elseif VIP == "Prata" and ID == 1 then
		    setElementModel ( source, VIP_Prata_Personagem_01 )
		elseif VIP == "Prata" and ID == 2 then
		    setElementModel ( source, VIP_Prata_Personagem_02 )
		elseif VIP == "Ouro" and ID == 1 then
		    setElementModel ( source, VIP_Ouro_Personagem_01 )
		elseif VIP == "Ouro" and ID == 2 then
		    setElementModel ( source, VIP_Ouro_Personagem_02 )
		elseif VIP == "Ouro" and ID == 3 then
		    setElementModel ( source, VIP_Ouro_Personagem_03 )
		elseif VIP == "Ametista" and ID == 1 then
		    setElementModel ( source, VIP_Ametista_Personagem_01 )
		elseif VIP == "Ametista" and ID == 2 then
		    setElementModel ( source, VIP_Ametista_Personagem_02 )
		elseif VIP == "Ametista" and ID == 3 then
		    setElementModel ( source, VIP_Ametista_Personagem_03 )
		end
		exports['FR_DxMessages']:addBox ( source, "Skin #ffff00VIP "..VIP.." #ffffffgerado!", "success" )
	elseif Tipo == "Vida" then
		if VIP == "Prata" and ID == 1 then
		    if getElementData ( source, "Prata_Vida" ) == "Bloqueado" then
		        exports['FR_DxMessages']:addBox ( source, "Você está bloqueado de usar está opção temporariamente! [2 minutos]", "warning" )
			else
				if getElementHealth ( source ) < VIP_Prata_Vida then
					setElementData ( source, "Prata_Vida", "Bloqueado" )
					setElementHealth ( source, VIP_Prata_Vida )
					exports['FR_DxMessages']:addBox ( source, "Curativo #ffff00"..VIP_Prata_Vida.."% #ffffffusado!", "success" )
					setTimer ( setElementData, 120000, 1, source, "Prata_Vida", "Desbloqueado" )
				else
				    exports['FR_DxMessages']:addBox ( source, "Você não precisa usar curativo no momento!", "error" )
				end
			end		
		elseif VIP == "Ouro" and ID == 1 then
		    if getElementData ( source, "Ouro_Vida" ) == "Bloqueado" then
			    exports['FR_DxMessages']:addBox ( source, "Você está bloqueado de usar está opção temporariamente! [2 minutos]", "warning" )
			else
			    if getElementHealth ( source ) < VIP_Ouro_Vida then
		            setElementData ( source, "Ouro_Vida", "Bloqueado" )
			        setElementHealth ( source, VIP_Ouro_Vida )
					exports['FR_DxMessages']:addBox ( source, "Curativo #ffff00"..VIP_Ouro_Vida.."% #ffffffusado!", "success" )
					setTimer ( setElementData, 120000, 1, source, "Ouro_Vida", "Desbloqueado" )
				else
				    exports['FR_DxMessages']:addBox ( source, "Você não precisa usar curativo no momento!", "error" )
				end
			end
	    elseif VIP == "Ametista" and ID == 1 then
			if getElementHealth ( source ) < VIP_Ametista_Vida then
			    setElementHealth ( source, VIP_Ametista_Vida )
				exports['FR_DxMessages']:addBox ( source, "Curativo #ffff00"..VIP_Ametista_Vida.."% #ffffffusado!", "success" )
			else
				exports['FR_DxMessages']:addBox ( source, "Você não precisa usar curativo no momento!", "error" )
			end
		end
	elseif Tipo == "Colete" then
	    if VIP == "Ouro" and ID == 1 then
		    if getPedArmor ( source ) < VIP_Ouro_Colete then
		        setPedArmor ( source, VIP_Ouro_Colete )
				exports['FR_DxMessages']:addBox ( source, "Colete #ffff00"..VIP_Ouro_Colete.."% #ffffffcolocado!", "success" )
			else
			    exports['FR_DxMessages']:addBox ( source, "Seu colete ainda está bom!", "error" )
			end
	    elseif VIP == "Ametista" and ID == 1 then
            if getPedArmor ( source ) < VIP_Ametista_Colete then
		        setPedArmor ( source, VIP_Ametista_Colete )
				exports['FR_DxMessages']:addBox ( source, "Colete #ffff00"..VIP_Ametista_Colete.."% #ffffffcolocado!", "success" )
			else
			    exports['FR_DxMessages']:addBox ( source, "Seu colete ainda está bom!", "error" )
			end
	    end
	elseif Tipo == "Blindagem" then
	    if VIP == "Ametista" and ID == 1 then
	        if isPedInVehicle ( source ) then
		        if isVehicleDamageProof ( getPedOccupiedVehicle ( source ) ) == false then
		    	    setVehicleDamageProof ( getPedOccupiedVehicle ( source ), true )
		    	    exports['FR_DxMessages']:addBox ( source, "Blindagem aplicada!", "success")
				else
				    exports['FR_DxMessages']:addBox ( source, "Esse veículo já está blindado!", "error")
		        end
	        else
	            exports['FR_DxMessages']:addBox ( source, "Entre em seu veículo para aplicar a blindagem!", "error")
	        end
	    end
	elseif Tipo == "Mensagem" then
	    if VIP == "Ouro" or VIP == "Ametista" then
		    if ID then
			    exports['FR_DxMessages']:addBox ( source, ID, "info")
			end
		end		
	end
end
addEvent ( "AirNewSCR_EnviarServidor", true )
addEventHandler ( "AirNewSCR_EnviarServidor", getRootElement ( ), Receber_Client_AirNewSCR )
		
function Sair_do_Servidor_AirNewSCR ( quitType )
	if isElement ( Veiculo_VIPs[source] ) then
	    destroyElement ( Veiculo_VIPs[source] )
	end
end
addEventHandler ( "onPlayerQuit", getRootElement ( ), Sair_do_Servidor_AirNewSCR )

function Morrer_no_Servidor_AirNewSCR ( )
	if isElement ( Veiculo_VIPs[source] ) then
	    destroyElement ( Veiculo_VIPs[source] )
	end
end
addEventHandler( "onPlayerWasted", getRootElement( ), Morrer_no_Servidor_AirNewSCR )
		
function Verificar_VIP_AirNewSCR ( )
	for i, player in ipairs ( getElementsByType ( "player" ) ) do
		local acc = getPlayerAccount ( player )
		if acc and not isGuestAccount ( acc ) then
			local accName = getAccountName (acc)
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_01 ) ) then
			    setElementData ( player, "VIP_01", "Sim" )
			else
			    setElementData ( player, "VIP_01", "Não" )
			end
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_02 ) ) then
			    setElementData ( player, "VIP_02", "Sim" )
			else
			    setElementData ( player, "VIP_02", "Não" )
			end
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_03 ) ) then
			    setElementData ( player, "VIP_03", "Sim" )
			else
			    setElementData ( player, "VIP_03", "Não" )
			end
			if isObjectInACLGroup ("user."..accName, aclGetGroup ( Grupo_04 ) ) then
			    setElementData ( player, "VIP_04", "Sim" )
			else
			    setElementData ( player, "VIP_04", "Não" )
			end
		end
	end
end
setTimer ( Verificar_VIP_AirNewSCR, 1500, 0 )