local carSchoolPickup = createPickup(-2020, -101, 35, 3, 1239)
local specSchoolPickup = createPickup(816.832031 , 856.734375 , 12.789062, 3, 1239)

local boatSchoolPickup = createPickup(-1574.241211 , 1267.456055 , 1.453125, 3, 1239)

local heliSchoolPickup = createPickup(1935.16479, -2233.88599, 13.54688, 3, 1239)

local planeSchoolPickup = createPickup(1938.43713, -2233.99683, 13.54688, 3, 1239)

createBlip( -2023.609375 , -101.049804687, 35, 53, 2, 255, 0, 0, 255, 0, 700) -- CARROS MOTOS CAMINHÕES E ONIBUS
createBlip( -1574.253906 , 1267.251953, 35, 9, 2, 255, 0, 0, 255, 0, 700) -- BARCOS
createBlip( 1935.16479, -2233.88599, 13.54688, 9, 2, 255, 0, 0, 255, 0, 700) -- HELI
createBlip( 1938.43713, -2233.99683, 13.54688, 9, 2, 255, 0, 0, 255, 0, 700) -- AVIÕES

local GUI = {
    button = {},
    window = {},
    memo = {},
    staticimage = {},
    label = {}
}

dx = {}
dx.sw, dx.sh = guiGetScreenSize()
dx.px, dx.py = dx.sw/1920, dx.sh/1080
dx.fonts = {
	["font"] = dxCreateFont("assets/fonts/GothamPro-Medium.ttf", 11*dx.px),
}

dx.images = {
	["main"] = dxCreateTexture("assets/images/main.png"),
	["close"] = dxCreateTexture("assets/images/close.png"),
	["moto"] = dxCreateTexture("assets/images/moto.png"),
	["car"] = dxCreateTexture("assets/images/car.png"),
	["load"] = dxCreateTexture("assets/images/load.png"),
	["bus"] = dxCreateTexture("assets/images/bus.png"),
	["yes"] = dxCreateTexture("assets/images/yes.png"),
}

dx.enableAlpha = false
dx.click = false
dx.alpha = 0

dx.render = function()
	if dx.enableAlpha == true then
		if dx.alpha <= 245 then
			dx.alpha = dx.alpha + 10
		end
	elseif dx.enableAlpha == false then
		if dx.alpha >= 10 then
			dx.alpha = dx.alpha - 10
		end
	end
	--  Escurecendo o fundo
	dxDrawRectangle(0, 0, dx.sw, dx.sh, tocolor(0, 0, 0, 125 * (dx.alpha/255)))

	--  Janela principal
	dxDrawImage((dx.sw - 686*dx.px)/2, (dx.sh - 482*dx.px)/2, 686*dx.px, 482*dx.py, dx.images.main, 0, 0, 0, tocolor(255, 255, 255, dx.alpha))

	--  Botão para alterar a licença de motocicletas
	dxCreateButton((dx.sw - 1257*dx.px), (dx.sh - 676*dx.px), 287*dx.px, 147*dx.py, dx.images.moto, dx.images.moto, 0)
	--  Botão para entrega de licença de veículos
	dxCreateButton((dx.sw - 953*dx.px), (dx.sh - 676*dx.px), 287*dx.px, 147*dx.py, dx.images.car, dx.images.car, 1)
	--  Botão para entrega de direitos de carga
	dxCreateButton((dx.sw - 1257*dx.px), (dx.sh - 518*dx.px), 287*dx.px, 147*dx.py, dx.images.load, dx.images.load, 2)
	--  Botão para entrega de licença para ônibus
	dxCreateButton((dx.sw - 953*dx.px), (dx.sh - 518*dx.px), 287*dx.px, 147*dx.py, dx.images.bus, dx.images.bus, 3)

	--  Licença de motocicleta marca A, se houver, uma marca de seleção aparece
	if doesPlayerHaveLic(localPlayer, "bike") then
		dxDrawImage((dx.sw - 1021*dx.px), (dx.sh - 661*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, dx.alpha))
	else
		dxDrawImage((dx.sw - 1021*dx.px), (dx.sh - 661*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, 0 * (dx.alpha/255)))
	end

	--  Verificando a licença da máquina B, se houver, então uma marca de seleção aparecerá
	if doesPlayerHaveLic(localPlayer, "car") then
		dxDrawImage((dx.sw - 719*dx.px), (dx.sh - 661*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, dx.alpha))
	else
		dxDrawImage((dx.sw - 719*dx.px), (dx.sh - 661*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, 0 * (dx.alpha/255)))
	end

	--  Verifique a licença do Truck C, se houver, uma marca de seleção aparecerá
	if doesPlayerHaveLic(localPlayer, "truck") then
		dxDrawImage((dx.sw - 1021*dx.px), (dx.sh - 503*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, dx.alpha))
	else
		dxDrawImage((dx.sw - 1021*dx.px), (dx.sh - 503*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, 0 * (dx.alpha/255)))
	end

	--  Verificando a licença do ônibus D, se houver, então uma marca de seleção aparece
	if doesPlayerHaveLic(localPlayer, "bus") then
		dxDrawImage((dx.sw - 719*dx.px), (dx.sh - 503*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, dx.alpha))
	else
		dxDrawImage((dx.sw - 719*dx.px), (dx.sh - 503*dx.px), 38*dx.px, 38*dx.py, dx.images.yes, 0, 0, 0, tocolor(255, 255, 255, 0 * (dx.alpha/255)))
	end

 	--  Fechar
	if cursorPosition((dx.sw - 662*dx.px), (dx.sh - 756*dx.px), 25*dx.px, 26*dx.py) then
		dxDrawImage((dx.sw - 662*dx.px), (dx.sh - 756*dx.px), 25*dx.px, 26*dx.py, dx.images.close, 0, 0, 0, tocolor(255, 255, 255, 175 * (dx.alpha/255)))
	else
		dxDrawImage((dx.sw - 662*dx.px), (dx.sh - 756*dx.px), 25*dx.px, 26*dx.py, dx.images.close, 0, 0, 0, tocolor(255, 255, 255, dx.alpha))
	end

	if getKeyState("mouse1") then dx.click = true else dx.click = false end
end

click = function (button, state)
	if (button=="left" and state=="down") then
		return false
	end
	if cursorPosition((dx.sw - 662*dx.px), (dx.sh - 756*dx.px), 25*dx.px, 26*dx.py) then --  Fechar
		click_sound()
		closeWindows()
		removeEventHandler("onClientClick", root, click)
	elseif cursorPosition((dx.sw - 1257*dx.px), (dx.sh - 676*dx.px), 287*dx.px, 147*dx.py) then -- Categoria A
		click_sound()
		closeWindows()
		removeEventHandler("onClientClick", root, click)
		triggerServerEvent("startExam", resourceRoot, "bike", price.bikeExam.num)
	elseif cursorPosition((dx.sw - 953*dx.px), (dx.sh - 676*dx.px), 287*dx.px, 147*dx.py) then -- Categoria B
		click_sound()
		closeWindows()
		removeEventHandler("onClientClick", root, click)
		triggerServerEvent("startExam", resourceRoot, "car", price.carExam.num)
	elseif cursorPosition((dx.sw - 1257*dx.px), (dx.sh - 518*dx.px), 287*dx.px, 147*dx.py) then -- Categoria C
		click_sound()
		closeWindows()
		removeEventHandler("onClientClick", root, click)
		triggerServerEvent("startExam", resourceRoot, "truck", price.truckExam.num)
	elseif cursorPosition((dx.sw - 953*dx.px), (dx.sh - 518*dx.px), 287*dx.px, 147*dx.py) then -- Categoria D
		click_sound()
		closeWindows()
		removeEventHandler("onClientClick", root, click)
		triggerServerEvent("startExam", resourceRoot, "bus", price.busExam.num)
	end
end

addEventHandler("onClientResourceStart", resourceRoot,
    function()
		local screenW, screenH = guiGetScreenSize()
        GUI.window.carMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de condução", false)
        guiWindowSetSizable(GUI.window.carMain, false)
        GUI.button.carExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.carExam.str..")", false, GUI.window.carMain)
        GUI.label.carLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.carMain)
        guiLabelSetHorizontalAlign(GUI.label.carLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.carLicExists, "center")
        guiSetFont(GUI.label.carLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.carLicExists, 70, 255, 50)
        GUI.staticimage.carLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.carMain)
        GUI.memo.carRules = guiCreateMemo(10, 85, 370, 265, [[Regras de trânsito automóvel do servidor CCDPlanet
            Última modificação: 10/12/2015

			1. É proibido dirigir na faixa oposta.
			2.1. No território dos complexos montanhosos de Akina e Okaru, o tráfego é realizado no lado esquerdo da faixa de rodagem.
			2.2. O tráfego pela direita é aceito em todo o resto do território.
			3. O estacionamento do veículo é permitido apenas em locais especialmente designados, ou na berma da estrada, se o veículo não interferir na passagem de outros veículos.
			4. É proibido o escurecimento excessivo do pára-brisa e dos vidros laterais dianteiros do veículo.
			5. Acidentes de trânsito são altamente desencorajados.
			6. É proibido bloquear estradas que não sejam homologadas pela polícia.
			7. Danos intencionais a veículos de outros usuários da estrada são proibidos.
			8. É proibido conduzir veículos com os faróis abaixados apagados ou seus substitutos.]], false, GUI.window.carMain)
        guiMemoSetReadOnly(GUI.memo.carRules, true)
        GUI.button.carClose = guiCreateButton(310, 360, 70, 30, "Закрыть", false, GUI.window.carMain)
		

        GUI.window.truckMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de condução", false)
        guiWindowSetSizable(GUI.window.truckMain, false)
        GUI.button.truckExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.truckExam.str..")", false, GUI.window.truckMain)
        GUI.label.truckLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.truckMain)
        guiLabelSetHorizontalAlign(GUI.label.truckLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.truckLicExists, "center")
        guiSetFont(GUI.label.truckLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.truckLicExists, 70, 255, 50)
        GUI.staticimage.truckLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.truckMain)
        GUI.memo.truckRules = guiCreateMemo(10, 85, 370, 265, [[Regras de tráfego de frete do servidor CCDPlanet
            Última modificação: 10/12/2015
			
			1. É obrigatório o cumprimento de todos os pontos descritos nas normas para veículos leves.
			2. Ao dirigir em vias públicas, o veículo deve ser posicionado o mais próximo possível da borda da faixa de rodagem.
			3. Ao dirigir em locais estreitos da faixa de rodagem, você deve pular outros veículos se eles não tiverem a capacidade de contornar seu veículo]], false, GUI.window.truckMain)
        guiMemoSetReadOnly(GUI.memo.truckRules, true)
        GUI.button.truckClose = guiCreateButton(310, 360, 70, 30, "Закрыть", false, GUI.window.truckMain)   
		

        GUI.window.busMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de condução", false)
        guiWindowSetSizable(GUI.window.busMain, false)
        GUI.button.busExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.busExam.str..")", false, GUI.window.busMain)
        GUI.label.busLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.busMain)
        guiLabelSetHorizontalAlign(GUI.label.busLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.busLicExists, "center")
        guiSetFont(GUI.label.busLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.busLicExists, 70, 255, 50)
        GUI.staticimage.busLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.busMain)
        GUI.memo.busRules = guiCreateMemo(10, 85, 370, 265, [[Regras de transporte de passageiros do servidor CCDPlanet
            Última modificação: 10/12/2015
			
			1. É obrigatório o cumprimento de todos os pontos descritos nas normas para veículos leves.
			2. Ao dirigir em vias públicas, o veículo deve ser posicionado o mais próximo possível da borda da faixa de rodagem.
			3. Ao dirigir em locais estreitos da faixa de rodagem, você deve pular outros veículos se eles não tiverem a capacidade de contornar seu veículo]], false, GUI.window.busMain)
        guiMemoSetReadOnly(GUI.memo.busRules, true)
        GUI.button.busClose = guiCreateButton(310, 360, 70, 30, "Закрыть", false, GUI.window.busMain)  
		

        GUI.window.bikeMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de condução", false)
        guiWindowSetSizable(GUI.window.bikeMain, false)
        GUI.button.bikeExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.bikeExam.str..")", false, GUI.window.bikeMain)
        GUI.label.bikeLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.bikeMain)
        guiLabelSetHorizontalAlign(GUI.label.bikeLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.bikeLicExists, "center")
        guiSetFont(GUI.label.bikeLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.bikeLicExists, 70, 255, 50)
        GUI.staticimage.bikeLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.bikeMain)
        GUI.memo.bikeRules = guiCreateMemo(10, 85, 370, 265, [[Regras de tráfego de veículos motorizados do servidor CCDPlanet
              Última modificação: 15.12.2015

			1. É proibido dirigir na faixa oposta.
			2. No território dos complexos montanhosos de Akina e Okaru, o tráfego é realizado no lado esquerdo da faixa de rodagem. O tráfego pela direita é aceito em todo o resto do território.
			3. O estacionamento do veículo é permitido apenas em locais especialmente designados, ou na berma da estrada, se o veículo não interferir na passagem de outros veículos.
			4. Ao andar de motocicleta, o motorista e os passageiros devem usar equipamentos (capa para F5).
			5. O movimento da scooter deve ser efectuado na berma da estrada ou na faixa da extrema direita.]], false, GUI.window.bikeMain)
        guiMemoSetReadOnly(GUI.memo.bikeRules, true)
        GUI.button.bikeClose = guiCreateButton(310, 360, 70, 30, "Закрыть", false, GUI.window.bikeMain)   
		

        GUI.window.specMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de condução", false)
        guiWindowSetSizable(GUI.window.specMain, false)
        GUI.button.specExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.specExam.str..")", false, GUI.window.specMain)
        GUI.label.specLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.specMain)
        guiLabelSetHorizontalAlign(GUI.label.specLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.specLicExists, "center")
        guiSetFont(GUI.label.specLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.specLicExists, 70, 255, 50)
        GUI.staticimage.specLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.specMain)
        GUI.memo.specRules = guiCreateMemo(10, 85, 370, 265, [[Regras especiais de tráfego de transporte do servidor CCDPlanet
             Última modificação: 27/12/2015

			1. É obrigatório o cumprimento de todos os pontos descritos nas regras para carros e caminhões.
			2. Se a carga for especial. o equipamento se projeta além de seus limites, então o movimento deve ser realizado apenas ao longo da faixa da extrema direita, a uma velocidade de no máximo 60 km / he com um farol amarelo piscando aceso.]], false, GUI.window.specMain)
        guiMemoSetReadOnly(GUI.memo.specRules, true)
        GUI.button.specClose = guiCreateButton(310, 360, 70, 30, "Fechar", false, GUI.window.specMain)    
		

        GUI.window.boatMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de barcos", false)
        guiWindowSetSizable(GUI.window.boatMain, false)
        GUI.button.boatExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.boatExam.str..")", false, GUI.window.boatMain)
        GUI.label.boatLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.boatMain)
        guiLabelSetHorizontalAlign(GUI.label.boatLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.boatLicExists, "center")
        guiSetFont(GUI.label.boatLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.boatLicExists, 70, 255, 50)
        GUI.staticimage.boatLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.boatMain)
        GUI.memo.boatRules = guiCreateMemo(10, 85, 370, 265, [[1. Danos intencionais e capotamento do transporte aquático de outra pessoa são proibidos.
			2. O abandono intencional do transporte aquático em terra é proibido.]], false, GUI.window.boatMain)
        guiMemoSetReadOnly(GUI.memo.boatRules, true)
        GUI.button.boatClose = guiCreateButton(310, 360, 70, 30, "Fechar", false, GUI.window.boatMain)   
		

        GUI.window.heliMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de Helicopteros", false)
        guiWindowSetSizable(GUI.window.heliMain, false)
        GUI.button.heliExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.heliExam.str..")", false, GUI.window.heliMain)
        GUI.label.heliLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.heliMain)
        guiLabelSetHorizontalAlign(GUI.label.heliLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.heliLicExists, "center")
        guiSetFont(GUI.label.heliLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.heliLicExists, 70, 255, 50)
        GUI.staticimage.heliLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.heliMain)
        GUI.memo.heliRules = guiCreateMemo(10, 85, 370, 265, [[1. É proibido pousar deliberadamente na rodovia para transporte terrestre e territórios adjacentes.
			2. Danos intencionais a aeronaves de outros participantes do tráfego aéreo são proibidos.
			3. Voos em baixa altitude da superfície da terra são proibidos.]], false, GUI.window.heliMain)
        guiMemoSetReadOnly(GUI.memo.heliRules, true)
        GUI.button.heliClose = guiCreateButton(310, 360, 70, 30, "Fechar", false, GUI.window.heliMain)   
		

        GUI.window.planeMain = guiCreateWindow((screenW - 390) / 2, (screenH - 400) / 2, 390, 400, "Escola de Aviões", false)
        guiWindowSetSizable(GUI.window.planeMain, false)
        GUI.button.planeExam = guiCreateButton(50, 25, 120, 50, "Passar no exame\n("..price.planeExam.str..")", false, GUI.window.planeMain)
        GUI.label.planeLicExists = guiCreateLabel(220, 25, 70, 50, "Licença recebida", false, GUI.window.planeMain)
        guiLabelSetHorizontalAlign(GUI.label.planeLicExists, "center", true)
        guiLabelSetVerticalAlign(GUI.label.planeLicExists, "center")
        guiSetFont(GUI.label.planeLicExists, "default-bold-small")
        guiLabelSetColor(GUI.label.planeLicExists, 70, 255, 50)
        GUI.staticimage.planeLicExists = guiCreateStaticImage(290, 25, 50, 50, "yes.png", false, GUI.window.planeMain)
        GUI.memo.planeRules = guiCreateMemo(10, 85, 370, 265, [[1. É proibido pousar deliberadamente na rodovia para transporte terrestre e territórios adjacentes.
			2. Danos intencionais a aeronaves de outros participantes do tráfego aéreo são proibidos.
			3. Voos em baixa altitude da superfície da terra são proibidos.]], false, GUI.window.planeMain)
        guiMemoSetReadOnly(GUI.memo.planeRules, true)
        GUI.button.planeClose = guiCreateButton(310, 360, 70, 30, "Fechar", false, GUI.window.planeMain)   

		
		guiSetVisible(GUI.window.carMain, false)
		guiSetVisible(GUI.window.truckMain, false)
		guiSetVisible(GUI.window.busMain, false)
		guiSetVisible(GUI.window.bikeMain, false)
		guiSetVisible(GUI.window.specMain, false)
		guiSetVisible(GUI.window.boatMain, false)
		guiSetVisible(GUI.window.heliMain, false)
		guiSetVisible(GUI.window.planeMain, false)	
    end
)

function schoolPickupHit(thePlayer, matchingDimension)
	if (thePlayer == localPlayer) and (matchingDimension) and not getPedOccupiedVehicle(thePlayer) then
		if (source == carSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "car") then
				guiSetVisible(GUI.label.carLicExists, true)
				guiSetVisible(GUI.staticimage.carLicExists, true)
			else
				guiSetVisible(GUI.label.carLicExists, false)
				guiSetVisible(GUI.staticimage.carLicExists, false)
			end
			dx.enableAlpha = true

			if (not isEventHandlerAdded("onClientRender", root, dx.render)) then
      			addEventHandler("onClientRender", root, dx.render)
    		end
    		if (not isEventHandlerAdded("onClientClick", root, click)) then
      			addEventHandler("onClientClick", root, click)
    		end
		--	guiSetVisible(GUI.window.carMain, true)
			
		elseif (source == truckSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "truck") then
				guiSetText(GUI.button.busExam, "Passar no exame\n("..price.truckExam.str..")")
				guiSetEnabled(GUI.button.truckExam, true)
				guiSetVisible(GUI.label.truckLicExists, true)
				guiSetVisible(GUI.staticimage.truckLicExists, true)
			elseif doesPlayerHaveLic(localPlayer, "car") then
				guiSetText(GUI.button.busExam, "Passar no exame\n("..price.truckExam.str..")")
				guiSetEnabled(GUI.button.truckExam, true)
				guiSetVisible(GUI.label.truckLicExists, false)
				guiSetVisible(GUI.staticimage.truckLicExists, false)
			else
				guiSetText(GUI.button.truckExam, "Primeiro pegue\ncarro de passageiros")
				guiSetEnabled(GUI.button.truckExam, false)
				guiSetVisible(GUI.label.truckLicExists, false)
				guiSetVisible(GUI.staticimage.truckLicExists, false)
			end
			guiSetVisible(GUI.window.truckMain, true)
			
		elseif (source == busSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "bus") then
				guiSetText(GUI.button.busExam, "Passar no exame\n("..price.busExam.str..")")
				guiSetEnabled(GUI.button.busExam, true)
				guiSetVisible(GUI.label.busLicExists, true)
				guiSetVisible(GUI.staticimage.busLicExists, true)
			elseif doesPlayerHaveLic(localPlayer, "car") then
				guiSetText(GUI.button.busExam, "Passar no exame\n("..price.busExam.str..")")
				guiSetEnabled(GUI.button.busExam, true)
				guiSetVisible(GUI.label.busLicExists, false)
				guiSetVisible(GUI.staticimage.busLicExists, false)
			else
				guiSetText(GUI.button.busExam, "Primeiro pegue\ncarro de passageiros")
				guiSetEnabled(GUI.button.busExam, false)
				guiSetVisible(GUI.label.busLicExists, false)
				guiSetVisible(GUI.staticimage.busLicExists, false)
			end
			guiSetVisible(GUI.window.busMain, true)
			
		elseif (source == bikeSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "bike") then
				guiSetVisible(GUI.label.bikeLicExists, true)
				guiSetVisible(GUI.staticimage.bikeLicExists, true)
			else
				guiSetVisible(GUI.label.bikeLicExists, false)
				guiSetVisible(GUI.staticimage.bikeLicExists, false)
			end
			guiSetVisible(GUI.window.bikeMain, true)
			
		elseif (source == specSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "spec") then
				guiSetText(GUI.button.specExam, "Passar no exame\n("..price.specExam.str..")")
				guiSetEnabled(GUI.button.specExam, true)
				guiSetVisible(GUI.label.specLicExists, true)
				guiSetVisible(GUI.staticimage.specLicExists, true)
			elseif doesPlayerHaveLic(localPlayer, "car") and doesPlayerHaveLic(localPlayer, "truck") then
				guiSetText(GUI.button.specExam, "Passar no exame\n("..price.specExam.str..")")
				guiSetEnabled(GUI.button.specExam, true)
				guiSetVisible(GUI.label.specLicExists, false)
				guiSetVisible(GUI.staticimage.specLicExists, false)
			else
				guiSetText(GUI.button.specExam, "Primeiro pegue um carro de passageiros e\ncarga")
				guiSetEnabled(GUI.button.specExam, false)
				guiSetVisible(GUI.label.specLicExists, false)
				guiSetVisible(GUI.staticimage.specLicExists, false)
			end
			guiSetVisible(GUI.window.specMain, true)
			
		elseif (source == boatSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "boat") then
				guiSetVisible(GUI.label.boatLicExists, true)
				guiSetVisible(GUI.staticimage.boatLicExists, true)
			else
				guiSetVisible(GUI.label.boatLicExists, false)
				guiSetVisible(GUI.staticimage.boatLicExists, false)
			end
			guiSetVisible(GUI.window.boatMain, true)
			
		elseif (source == heliSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "heli") then
				guiSetVisible(GUI.label.heliLicExists, true)
				guiSetVisible(GUI.staticimage.heliLicExists, true)
			else
				guiSetVisible(GUI.label.heliLicExists, false)
				guiSetVisible(GUI.staticimage.heliLicExists, false)
			end
			guiSetVisible(GUI.window.heliMain, true)
			
		elseif (source == planeSchoolPickup) then
			if doesPlayerHaveLic(localPlayer, "plane") then
				guiSetVisible(GUI.label.planeLicExists, true)
				guiSetVisible(GUI.staticimage.planeLicExists, true)	
			else
				guiSetVisible(GUI.label.planeLicExists, false)
				guiSetVisible(GUI.staticimage.planeLicExists, false)	
			end
			guiSetVisible(GUI.window.planeMain, true)
		
		end
		showCursor(true)
	end
end
addEventHandler("onClientPickupHit", carSchoolPickup, schoolPickupHit)
addEventHandler("onClientPickupHit", specSchoolPickup, schoolPickupHit)
addEventHandler("onClientPickupHit", boatSchoolPickup, schoolPickupHit)
addEventHandler("onClientPickupHit", heliSchoolPickup, schoolPickupHit)
addEventHandler("onClientPickupHit", planeSchoolPickup, schoolPickupHit)

function buttonClicks()
	if (source == GUI.button.carClose) or (source == GUI.button.truckClose) or (source == GUI.button.busClose) or (source == GUI.button.bikeClose) or
		(source == GUI.button.specClose) or (source == GUI.button.boatClose) or (source == GUI.button.heliClose) or (source == GUI.button.planeClose) then
		closeWindows()
		
    elseif (source == GUI.button.carExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "car", price.carExam.num)
		
    elseif (source == GUI.button.truckExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "truck", price.truckExam.num)
		
    elseif (source == GUI.button.busExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "bus", price.busExam.num)
		
    elseif (source == GUI.button.bikeExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "bike", price.bikeExam.num)
		
    elseif (source == GUI.button.specExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "spec", price.specExam.num)
		
    elseif (source == GUI.button.boatExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "boat", price.boatExam.num)
		
    elseif (source == GUI.button.heliExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "heli", price.heliExam.num)
		
    elseif (source == GUI.button.planeExam) then
		closeWindows()
		triggerServerEvent("startExam", resourceRoot, "plane", price.planeExam.num)
		
	end
end
addEventHandler("onClientGUIClick", resourceRoot, buttonClicks)

function closeWindows()
	dx.enableAlpha = false
	if dx.alpha <= 0 then
		removeEventHandler("onClientRender", root, dx.render)
	end
	removeEventHandler("onClientClick", root, click)
	guiSetVisible(GUI.window.carMain, false)
	guiSetVisible(GUI.window.truckMain, false)
	guiSetVisible(GUI.window.busMain, false)
	guiSetVisible(GUI.window.bikeMain, false)
	guiSetVisible(GUI.window.specMain, false)
	guiSetVisible(GUI.window.boatMain, false)
	guiSetVisible(GUI.window.heliMain, false)
	guiSetVisible(GUI.window.planeMain, false)
	showCursor(false)
end

function spawnFrozenCar(x, y, z, rotZ)
	local licCh = {"a", "b", "e", "k", "m", "h", "o", "p", "c", "t", "y", "x"}
	local licReg = {50, 77, 97, 99, 150, 177, 197, 199, 777}
	local lic = "a-"..licCh[math.random(#licCh)]..math.random(0,9)..math.random(0,9)..math.random(0,9)..licCh[math.random(#licCh)]..licCh[math.random(#licCh)]..licReg[math.random(#licReg)]

	local vedro = createVehicle(429, x, y, z, 0, 0, rotZ)
	setTimer(setVehicleColor, 500, 1, vedro, 255,255,255, 255,253,208)
	setElementData(vedro, "wheels", 36)
	setElementData(vedro, "wheels_color", "#FFFDD0")
	setElementData(vedro, "paintjob", "golf_0")
	setElementData(vedro, "licensep", lic)
	setElementData(vedro, "tint_side", 50)
	setElementData(vedro, "tint_rear", 80)
	setVehicleOverrideLights(vedro, 1)
	setElementFrozen(vedro, true)
	--triggerEvent("forceUpdateVehicleComponents", vedro)
end
spawnFrozenCar(-2078.950195 , -273.686523 , 35.2 , 90)
spawnFrozenCar(-2078.910156 , -278.90332 , 35.2 , 90)
spawnFrozenCar(-2088.735352 , -254.078125 , 35.2 , 0)
spawnFrozenCar(-2088.986328 , -242.145508 , 35.2 , 0)

function spawnFrozenKamaz(x, y, z, rotZ)
	local licCh = {"a", "b", "e", "k", "m", "h", "o", "p", "c", "t", "y", "x"}
	local licReg = {50, 77, 97, 99, 150, 177, 197, 199, 777}
	local lic = "a-"..licCh[math.random(#licCh)]..math.random(0,9)..math.random(0,9)..math.random(0,9)..licCh[math.random(#licCh)]..licCh[math.random(#licCh)]..licReg[math.random(#licReg)]

	local vedro = createVehicle(403, x, y, z, 0, 0, rotZ)
	setVehicleOverrideLights(vedro, 1)
	setElementFrozen(vedro, true)
	setElementData(vedro, "licensep", lic)
end
spawnFrozenKamaz(-2053.222656 , -278.144531 , 35.574564 , 90)
spawnFrozenKamaz(-2052.992188 , -270.455078 , 35.565858 , 90)
spawnFrozenKamaz(-2064.341797 , -235.000977 , 35.57221 , 0)
spawnFrozenKamaz(-2064.496094 , -256.806641 , 35.56719 , 0)

-- ==========     Verificando a licença de um jogador     ==========
function doesPlayerHaveLic(player, licType)
	return getElementData(player, "license."..licType)
end


function showLicensesC ( name, car, aero, boat)
	licenseWindow = guiCreateWindow(0.36, 0.36, 0.20, 0.20, "Licenças de jogador"..name, true)
	guiWindowSetSizable(licenseWindow, false)
	guiSetAlpha(licenseWindow, 1.00)
	carLic = "Não"
	if car then
		carLic = "há"
	end
	aeroLic = "Não"
	if aero then
		aeroLic = "há"
	end
	boatLic = "Não"
	if boat then
		boatLic = "há"
	end
	vehicleLabel = guiCreateLabel(0.06, 0.17, 1, 0.11, "Carteira de habilitação de carro: "..carLic, true, licenseWindow)
	aeroLabel = guiCreateLabel(0.06, 0.33, 1, 0.10, "Licença de vôo: "..aeroLic, true, licenseWindow)
	boatLabel = guiCreateLabel(0.06, 0.49, 1, 0.10, "Licença de transporte aquaviário: "..boatLic, true, licenseWindow)
	closeButton = guiCreateButton(0.29, 0.68, 0.43, 0.18, "Fechar", true, licenseWindow)
	guiSetProperty(closeButton, "NormalTextColour", "FFAAAAAA")
	
	addEventHandler("onClientGUIClick", closeButton,
		function ()
			showCursor ( false )
			guiSetVisible ( licenseWindow, false )
			destroyElement ( licenseWindow )
	end,false)

end
addEvent( "showLicenses", true )
addEventHandler( "showLicenses", getRootElement(), showLicensesC )

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end

    return false
end

local G_ALPHA_HOVER = {}
local COLOR_STATE = tocolor(255, 255, 255, dx.alpha)
local COLOR_HOVER = tocolor(175, 175, 175, dx.alpha)

function dxCreateButton(X, Y, W, H, IMAGE_STATE, IMAGE_HOVER, INDEX)
    if G_ALPHA_HOVER[INDEX] == nil then
        G_ALPHA_HOVER[INDEX] = {}
        G_ALPHA_HOVER[INDEX] = 0
    end
    
    
    if cursorPosition(X, Y, W, H) then
        if G_ALPHA_HOVER[INDEX] <= 240 then
            G_ALPHA_HOVER[INDEX] = G_ALPHA_HOVER[INDEX] + 10
        end
        COLOR_HOVER = tocolor(175, 175, 175, G_ALPHA_HOVER[INDEX] * (dx.alpha/255))
    else
        if G_ALPHA_HOVER[INDEX] ~= 0 then
            G_ALPHA_HOVER[INDEX] = G_ALPHA_HOVER[INDEX] - 10
        end
        COLOR_HOVER = tocolor(175, 175, 175, G_ALPHA_HOVER[INDEX] * (dx.alpha/255))
    end
    dxDrawImage(X, Y, W, H, IMAGE_STATE, 0,0,0, tocolor(255, 255, 255, dx.alpha))
    dxDrawImage(X, Y, W, H, IMAGE_HOVER, 0,0,0, COLOR_HOVER)
end

function dxCreateText(x, y, w, h, text, fontText, colorText, posX, posY)
    local posX = posX or "center"
    local posY = posY or "center"
    local colorText = colorText or tocolor(255, 255, 255, 255)
    local fontText = fontText or dx.fonts.font
    dxDrawText(text, x, y, w + x, h + y, colorText, 0.9*px, fontText, posX, posY, true, false, false, true)
end

function cursorPosition(x,y,w,h)
	if isCursorShowing() then
		local mx,my = getCursorPosition() -- relative
		local cursorx,cursory = mx*dx.sw,my*dx.sh
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		end
	end
return false
end

function click_sound()
    local sound = playSound("assets/sounds/click.mp3")
	setSoundVolume(sound, 0.8)
end