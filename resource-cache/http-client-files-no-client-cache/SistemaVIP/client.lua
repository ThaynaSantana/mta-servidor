local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

Painel_VIP_AirNewSCR = false

CorSel_R, CorSel_G, CorSel_B, CorSel_A = 51, 179, 93, 110

Abrir_Fechar_BindAirNewSCR = "F5"

setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Não" )
setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Não" )

setElementData ( localPlayer, "Bronze_Arma(s)", "Desbloqueado" )
setElementData ( localPlayer, "Prata_Arma(s)", "Desbloqueado" )

setElementData ( localPlayer, "Prata_Vida", "Desbloqueado" )
setElementData ( localPlayer, "Ouro_Vida", "Desbloqueado" )

function PainelVIP_AirNewSCR ( )

    dxDrawRectangle(x*0, y*0, x*1366, y*768, tocolor(255, 255, 255, 11), false)

    dxDrawRectangle(x*0, y*168, x*1366, y*433, tocolor(0, 0, 0, 70), false)
    dxDrawRectangle(x*0, y*172, x*1366, y*425, tocolor(0, 0, 0, 70), false)
	
	dxDrawRectangle(x*111, y*191, x*221, y*388, tocolor(0, 0, 0, 90), false)
    dxDrawRectangle(x*412, y*191, x*221, y*388, tocolor(0, 0, 0, 90), false)
    dxDrawRectangle(x*734, y*191, x*221, y*388, tocolor(0, 0, 0, 90), false)
    dxDrawRectangle(x*1034, y*191, x*221, y*388, tocolor(0, 0, 0, 90), false)

	dxDrawRectangle(x*0, y*85, x*1366, y*73, tocolor(0, 0, 0, 80), false)
    dxDrawRectangle(x*0, y*89, x*1366, y*64, tocolor(0, 0, 0, 80), false)

    if getElementData ( localPlayer, "VIP_01" ) ~= "Sim" then
	    dxDrawImage(x*153, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
	    dxDrawText("Para adquirir entre em nosso Discord!",   x*111, y*486, x*331, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	else
	    if P ( x*121, y*249, x*201, y*22 ) then
		    dxDrawRectangle(x*121, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*121, y*249, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*121, y*275, x*201, y*22 ) then
		    dxDrawRectangle(x*121, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*121, y*275, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*121, y*301, x*201, y*22 ) then
		    dxDrawRectangle(x*121, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*121, y*301, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	end

    if getElementData ( localPlayer, "VIP_02" ) ~= "Sim" then
	    dxDrawImage(x*456, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
		dxDrawText("Para adquirir entre em nosso Discord!", x*412, y*486, x*632, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	else
	    if P ( x*422, y*249, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*422, y*249, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*422, y*275, x*201, y*22 ) then
	    dxDrawRectangle(x*422, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*422, y*275, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*422, y*301, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*422, y*301, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*422, y*327, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*327, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*422, y*327, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*422, y*353, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*353, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*422, y*353, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*422, y*379, x*201, y*22 ) then
		    dxDrawRectangle(x*422, y*379, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*422, y*379, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	end
	
	if getElementData ( localPlayer, "VIP_03" ) ~= "Sim" then
	    dxDrawImage(x*778, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
		dxDrawText("Para adquirir entre em nosso Discord!",   x*734, y*486, x*954, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
	else
		if P ( x*744, y*249, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*249, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*744, y*275, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*275, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*744, y*301, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*301, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	    if P ( x*744, y*327, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*327, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*327, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*353, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*353, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*353, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*379, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*379, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*379, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*405, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*405, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*405, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*431, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*431, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*431, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*457, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*457, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*457, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*483, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*483, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*483, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
		if P ( x*744, y*509, x*201, y*22 ) then
		    dxDrawRectangle(x*744, y*509, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
		else
	        dxDrawRectangle(x*744, y*509, x*201, y*22, tocolor(0, 0, 0, 110), false)
		end
	end

	if getElementData ( localPlayer, "VIP_04" ) ~= "Sim" then
	    dxDrawImage(x*1078, y*263, x*135, y*173, "Arquivos/Cadeado.png" )
        dxDrawText("Para adquirir entre em nosso Discord!",   x*1034, y*486, x*1254, y*517, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    else
    	if P ( x*1044, y*249, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*249, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*249, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*275, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*275, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*275, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*301, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*301, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*301, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*327, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*327, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*327, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*353, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*353, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*353, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*379, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*379, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*379, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*405, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*405, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*405, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*431, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*431, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*431, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*457, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*457, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*457, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*483, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*483, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*483, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*509, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*509, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*509, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
        if P ( x*1044, y*535, x*201, y*22 ) then
    	    dxDrawRectangle(x*1044, y*535, x*201, y*22, tocolor(CorSel_R, CorSel_G, CorSel_B, CorSel_A), false)
    	else
            dxDrawRectangle(x*1044, y*535, x*201, y*22, tocolor(0, 0, 0, 110), false)
    	end
	end
    
	if getElementData ( localPlayer, "VIP_01" ) == "Sim" then
	    dxDrawText("Veículo - Bugatti",     x*121, y*249, x*322, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("Pack de Armas",    x*121, y*275, x*322, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("Skin VIP",   x*121, y*301, x*322, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	if getElementData ( localPlayer, "VIP_02" ) == "Sim" then
		dxDrawText("Veículo - Bugatti",     x*422, y*249, x*623, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veículo - Lamborghini",     x*422, y*275, x*623, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Curativo 80%",              x*422, y*301, x*623, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas",    x*422, y*327, x*623, y*349, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 1",   x*422, y*353, x*623, y*375, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 2",   x*422, y*379, x*623, y*401, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	if getElementData ( localPlayer, "VIP_03" ) == "Sim" then
		dxDrawText("Veículo - Bugatti",      x*744, y*249, x*945, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veículo - Lamborghini",     x*744, y*275, x*945, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Curativo 100%",             x*744, y*301, x*945, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Colete 50%",            x*744, y*327, x*945, y*349, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas 1",    x*744, y*353, x*945, y*375, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas 2",    x*744, y*379, x*945, y*401, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 1",   x*744, y*405, x*945, y*427, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 2",   x*744, y*431, x*945, y*453, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 3",   x*744, y*457, x*945, y*479, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veículo Colorido",      x*744, y*483, x*945, y*505, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Farol Colorido",        x*744, y*509, x*945, y*531, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	if getElementData ( localPlayer, "VIP_04" ) == "Sim" then
		dxDrawText("Veículo - Helicóptero",       x*1044, y*249, x*1245, y*271, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veículo - Lamborghini",        x*1044, y*275, x*1245, y*297, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Curativo 100%",                x*1044, y*301, x*1245, y*323, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Colete 100%",              x*1044, y*327, x*1245, y*349, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas 1",       x*1044, y*353, x*1245, y*375, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Pack de Armas 2",       x*1044, y*379, x*1245, y*401, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 1",      x*1044, y*405, x*1245, y*427, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 2",      x*1044, y*431, x*1245, y*453, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Skin VIP 3",      x*1044, y*457, x*1245, y*479, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Veículo Colorido",         x*1044, y*483, x*1245, y*505, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Farol Colorido",           x*1044, y*509, x*1245, y*531, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    	dxDrawText("Blindagem para o Veículo", x*1044, y*535, x*1245, y*557, tocolor(255, 255, 255, 255), x*1.00, "default", "center", "center", false, false, false, false, false)
    end
	
	dxDrawText("Bronze",   x*111 + 1, y*191 + 1, x*332 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Bronze",   x*111, y*191, x*332, y*249, tocolor(139, 69, 19, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Prata", x*412 + 1, y*191 + 1, x*633 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Prata", x*412, y*191, x*633, y*249, tocolor(255, 255, 240, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Ouro",   x*734 + 1, y*191 + 1, x*955 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Ouro",   x*734, y*191, x*955, y*249, tocolor(218, 165, 32, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Ametista",   x*1034 + 1, y*191 + 1, x*1255 + 1, y*249 + 1, tocolor(0, 0, 0, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText("Ametista",   x*1034, y*191, x*1255, y*249, tocolor(0, 255, 255, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
    
	dxDrawText("Painéis VIP", x*0 + 1, y*89 + 1, x*1366 + 1, y*153 + 1, tocolor(0, 0, 0, 255), x*1.70, "clear", "center", "center", false, false, false, false, false)
    dxDrawText("Painéis VIP", x*0, y*89, x*1366, y*153, tocolor(255, 255, 255, 255), x*1.70, "clear", "center", "center", false, false, false, false, false)

end

local AirNewSCR_Remover = { "area_name", "radar", "vehicle_name", "radio" }

function Abrir_Fechar_AirNewSCR ( )
	if Painel_VIP_AirNewSCR == false then
	    for _, v in ipairs( AirNewSCR_Remover ) do
	    end
		showCursor ( true )
		showChat ( false )
		Painel_VIP_AirNewSCR = true
		addEventHandler ( "onClientRender", getRootElement(), PainelVIP_AirNewSCR )
		playSoundFrontEnd ( 1 )
    else
	    for _, v in ipairs( AirNewSCR_Remover ) do
	    end
	    showCursor ( false )
		showChat ( true )
		Painel_VIP_AirNewSCR = false
		removeEventHandler ( "onClientRender", getRootElement(), PainelVIP_AirNewSCR )
		playSoundFrontEnd ( 2 )
	end
end
bindKey ( Abrir_Fechar_BindAirNewSCR, "down", Abrir_Fechar_AirNewSCR )

function P ( x, y, Largura, Altura )
	if not isCursorShowing ( ) then
		return false
	end
	local sx, sy = guiGetScreenSize()
	local cx, cy = getCursorPosition()
	local cx, cy = (cx*sx), (cy*sy)
	if (cx >= x and cx <= x + Largura) and (cy >= y and cy <= y + Altura) then
		return true
	else
		return false
	end
end

function Selecionar_Opcao_AirNewSCR ( _, state )
    if Painel_VIP_AirNewSCR == true then
        if state == "down" then
		    if getElementData ( localPlayer, "VIP_01" ) == "Sim" then
                if P ( x*121, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Bronze", 1 )
                elseif P ( x*121, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Bronze", 1 )
	            elseif P ( x*121, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Bronze", 1 )
	            end
			end

            if getElementData ( localPlayer, "VIP_02" ) == "Sim" then
                if P ( x*422, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Prata", 1 )
                elseif P ( x*422, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Prata", 2 )
                elseif P ( x*422, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Vida", "Prata", 1 )
                elseif P ( x*422, y*327, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Prata", 1 )
                elseif P ( x*422, y*353, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Prata", 1 )
                elseif P ( x*422, y*379, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Prata", 2 )
                end
			end
		
	        if getElementData ( localPlayer, "VIP_03" ) == "Sim" then
	            if P ( x*744, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Ouro", 1 )
                elseif P ( x*744, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Ouro", 2 )
                elseif P ( x*744, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Vida", "Ouro", 1 )
                elseif P ( x*744, y*327, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Colete", "Ouro", 1 )
   	            elseif P ( x*744, y*353, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Ouro", 1 )
	            elseif P ( x*744, y*379, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Ouro", 2 )
   	            elseif P ( x*744, y*405, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Ouro", 1 )
	            elseif P ( x*744, y*431, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Ouro", 2 )
	            elseif P ( x*744, y*457, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Ouro", 3 )
   	            elseif P ( x*744, y*483, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_VeiculoColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ouro", "Veículo colorido ativado!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ouro", "Veículo colorido desativado!" )
			    	end
	            elseif P ( x*744, y*509, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_FarolColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ouro", "Farol colorido ativado!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ouro", "Farol colorido desativado!" )
			    	end
	            end
			end

            if getElementData ( localPlayer, "VIP_04" ) == "Sim" then
                if P ( x*1044, y*249, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Ametista", 1 )
                elseif P ( x*1044, y*275, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Veiculo(s)", "Ametista", 2 )
                elseif P ( x*1044, y*301, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Vida", "Ametista", 1 )
                elseif P ( x*1044, y*327, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Colete", "Ametista", 1 )
                elseif P ( x*1044, y*353, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Ametista", 1 )
                elseif P ( x*1044, y*379, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Arma(s)", "Ametista", 2 )
                elseif P ( x*1044, y*405, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Ametista", 1 )
                elseif P ( x*1044, y*431, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Ametista", 2 )
                elseif P ( x*1044, y*457, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Skin(s)", "Ametista", 3 )
                elseif P ( x*1044, y*483, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_VeiculoColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ametista", "Veículo colorido ativado!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_VeiculoColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ametista", "Veículo colorido desativado!" )
			    	end
                elseif P ( x*1044, y*509, x*201, y*22 ) then
                    if getElementData ( localPlayer, "AirNewSCR_FarolColorido" ) == "Não" then
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Sim" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ametista", "Farol colorido ativado!" )
			    	else
			    	    setElementData ( localPlayer, "AirNewSCR_FarolColorido", "Não" )
						triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Mensagem", "Ametista", "Farol colorido desativado!" )
			    	end
                elseif P ( x*1044, y*535, x*201, y*22 ) then
                    triggerServerEvent ( "AirNewSCR_EnviarServidor", localPlayer, "Blindagem", "Ametista", 1 )
                end
			end
        end
    end
end
addEventHandler ( "onClientClick", root, Selecionar_Opcao_AirNewSCR )

AirNewSCR_VeiculoColorido = {}

function VIPCarRainbowVIP ( )
	for _, player in pairs(getElementsByType("player")) do
		if getElementData ( player, "AirNewSCR_VeiculoColorido" ) == "Sim" then
			local vehicle = getPedOccupiedVehicle(player)
			if vehicle then
			  local seat = getPedOccupiedVehicleSeat(localPlayer)
			    if seat == 0 then
				if not AirNewSCR_VeiculoColorido[player] then
					AirNewSCR_VeiculoColorido[player] = 0
					return
				end
				local r, g, b = getVehicleColor(vehicle, true)
				if AirNewSCR_VeiculoColorido[player] == 0 then
					if r < 250  then
						r = r + 3
						if r > 255 then
							r = 250
						end
					else
						AirNewSCR_VeiculoColorido[player] = 1
					end
				end
				if AirNewSCR_VeiculoColorido[player] == 1 then
					if g < 250 then
						g = g + 3
					else
						AirNewSCR_VeiculoColorido[player] = 2
					end
				elseif AirNewSCR_VeiculoColorido[player] == 2 then
					if b < 255 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						b = b + 3
						if b > 255 then
							b = 255
						end
					else
						AirNewSCR_VeiculoColorido[player] = 3
					end
				elseif AirNewSCR_VeiculoColorido[player] == 3 then
					if g > 0 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						g = g - 3
						if g < 0 then
							g = 0
						end
					else
						AirNewSCR_VeiculoColorido[player] = 4
					end
				elseif AirNewSCR_VeiculoColorido[player] == 4 then
					if b > 0 then
						b = b - 3
						if b < 0 then
							b = 0
						end
					else
						b = 0
						AirNewSCR_VeiculoColorido[player] = 0
					end
				end
				if r < 0 then r = 0 end
				if g < 0 then g = 0 end
				if b < 0 then b = 0 end
				setVehicleColor(vehicle, r, g, b)
			end
		end
	end
end
end
addEventHandler ( "onClientPreRender", getRootElement(), VIPCarRainbowVIP )

AirNewSCR_FarolColorido = {}

function Farol_Colorido ( )
	for _, player in pairs(getElementsByType("player")) do
		if getElementData ( player, "AirNewSCR_FarolColorido" ) == "Sim" then
			local vehicle = getPedOccupiedVehicle(player)
			if vehicle then
				if not AirNewSCR_FarolColorido[player] then
					AirNewSCR_FarolColorido[player] = 0
					return
				end
				local r, g, b = getVehicleHeadLightColor(vehicle)
				if AirNewSCR_FarolColorido[player] == 0 then
					if r < 250  then
						r = r + 3
						if r > 255 then
							r = 250
						end
					else
						AirNewSCR_FarolColorido[player] = 1
					end
				end
				if AirNewSCR_FarolColorido[player] == 1 then
					if g < 250 then
						g = g + 3
					else
						AirNewSCR_FarolColorido[player] = 2
					end
				elseif AirNewSCR_FarolColorido[player] == 2 then
					if b < 255 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						b = b + 3
						if b > 255 then
							b = 255
						end
					else
						AirNewSCR_FarolColorido[player] = 3
					end
				elseif AirNewSCR_FarolColorido[player] == 3 then
					if g > 0 then
						if r > 0 then
							r = r - 3
						else
							r = 0
						end
						g = g - 3
						if g < 0 then
							g = 0
						end
					else
						AirNewSCR_FarolColorido[player] = 4
					end
				elseif AirNewSCR_FarolColorido[player] == 4 then
					if b > 0 then
						b = b - 3
						if b < 0 then
							b = 0
						end
					else
						b = 0
						AirNewSCR_FarolColorido[player] = 0
					end
				end
				if r < 0 then r = 0 end
				if g < 0 then g = 0 end
				if b < 0 then b = 0 end
				setVehicleHeadLightColor(vehicle, r, g, b)
			end
		end
	end
end
addEventHandler("onClientPreRender", getRootElement ( ), Farol_Colorido )