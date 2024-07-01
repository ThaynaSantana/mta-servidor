 	scripts = {
	[1] = {
	----------------------------- SISTEMAS
   	"TelaLoading",
   	"SaveSystem",
   	"SpawnConfig",
   	"infobox",
   	"RadarMinimapa",
   	"Hud",
   	"Blur",
   	"Cursor",
   	"Banco",
   	"dxmessages",
   	"inventario",
   	"getpos",
   	"Velocimetro",
   	"dgs",
   	"bone_attach",
   	"object_preview",
   	"tab",
   	"FR_DxMessages",
   	"SistemaID",
   	"n3xt_dxmessages",
   	"Chat",
   	"Voice",
   	"SimpleStats",
   	"headshot",
   	"RemoverFolhas",
   	"RemoverSomAmbiente",
   	"EntregadorJornais",
   	"FreteLV",
   	"FreteSF",
   	"Level",
   	"MotoristaOnibus",
   	"Pescador",
   	"Petroleiro",
   	"Pizzaboy",
   	"Scripts_OnMarkerMsgs_",
   	"Scripts_Textos",
   	"SistemaAgencia",
   	"MapaAgencia",
   	"CustomPersonagem",
   	"AluguelBike",
   	"Habilidades",
   	"AntLag",
   	"Mira",
   	"Continencia",
   	"AntBugMapa",
   	"AntBugHud",
   	"scoreboard",
   	"LojaDeSkins",
   	"Sonsdearmas2",
   	"animacoes",
   	"maospracima",
   	-------------------------------- MAPAS
   	"Ammunation",
   	"LojasBR1",
   	"Lojas-enfeite50",
   	"RECORD",
   	"Ruas",
   	"SAMSUNG",
   	"Semafaro",
   	"Mapa-Concessionaria",
   	"PostoMapa",
   	"PostoModel",
   	------------------------------ VEICULOS
   	"velocidadeeditada",
   	"Caminhao[578]",
   	"CaminhaoD60[514]",
   	"Caminhaodelixo",
   	"Onibus[437]",
   	"Bmwm5",
   	"Bmwz4",
   	"Chevette",
   	"Gol-quadrado",
   	"Hilux",
   	"Koesnagione1",
   	"Punto",
   	"Rang-rover",
   	"s10",
   	"Uno-fire",

   	---------------- MOTOS
   	"Biz[586]",
   	"Harley[463]",
   	"Hornet[581]", 
   	"BizPizza[448]",
   	"PCX[468]",
   	---------------------------------- VIPS
   	"SistemaVIP_tay",
   	"[VIP]Ducatti[522]",
   	"LamborghiniVeneno[411]",
   	"Helicoptero[469]",
   	"Kawasaki[521]",
   	"NissanGTR[480]",
   	"BugattiDivo[541]",
   	"XT[461]",
   	------- skins
   	"Panico[95]",
   	"SistemaVIP",
   	"Executivo[85]",
   	"Kratos[300]",
   	"Boi[11]",
   	"GirlAsa[12]",
   	"Menino[302]",
   	"Panico[95]",
   	"Unicornio[33]",
   	-------------------------------- SKINS
   	"Skin-Ifood",
   	--------------------------------- SAMU
   	"VTRSAMU[416]",
   	"SkinMas[274]",
   	"SkinFem[251]",
   	"SistemaSAMU",
   	"maps_hospital_txd",
   	"maps_hospital",
   	--------------------------------- GANGS
   	---------------- CV
   	"PainelCV",
   	"FavelaCV",
   	"[200]SkinCV",
   	"[201]SkinCV",
   	"[579]CarroCV",
   	"[Hand]CarroCV",
   	"[Script]PortaoCV",
   	"[Script]ProtecaoCV",
   	"[Spaw]CarroCV",
   	"[Spaw]Skin201",
   	"[Spaw]SkinCV",
   	------------------- GROTA
   	"BMWGrota[598]",
   	"FavelaGROTA",
   	"PainelGROTA",
   	"SkinGrota01[44]",
   	"SkinGrota02[217]",
   	"SkinGrota03[45]",
   	--------------------------------- POLICIAL
   	"SistemaPolicial",
   	"dp",
   	"MotoR1200",
   	"VTR",
   	"SistemaPolicial",
   	"Skin1[1]",
   	"Skin2[285]",
   	"Fianca",
   	"PortedeArmas",
   	"Prender",
   	"res-LimparFicha",
   	------------------- ROTA
   	"[ROTA]",
   	------------------- PF

   	------------------- BOPE

   	----------------------------------- STAFF
   	"ComandosStaff",
   	"Punicao",

   	-- painel de login por ultimo
   	"PainelLogin",
	},
}

function startServer(id)
	local sucess = 0
	local fail = 0
	local att = 0
	local size = #scripts[(id)]	
	for i=1 , size do
		local resource = getResourceFromName(scripts[tonumber(id)][tonumber(i)])
		if (resource) then
			resstate = startResource(resource, true)
			if resstate then
				sucess = sucess + 1
				outputDebugString("* Resource: '"..scripts[tonumber(id)][tonumber(i)].."' Iniciado!" )	
			else
				att = att + 1
			end
		else
			fail = fail + 1
			outputDebugString("* Resource: '"..scripts[tonumber(id)][tonumber(i)].."' não encontrado, indo para o próximo...")
		end
	end
end

function displayLoadedRes ( res )
    local thisResource = getThisResource ( )
    local resourceName = getResourceName ( thisResource )
	if res == thisResource then
	    startServer ( tonumber ( 1 ) )
	end
end
addEventHandler ( "onResourceStart", getRootElement ( ), displayLoadedRes )