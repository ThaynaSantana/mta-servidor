local scx,scy = guiGetScreenSize()
local px = scx/1920
local sizeX, sizeY = 400*px,600*px
local posX,posY = 10*px,scy-sizeY-100*px
local screen = dxCreateScreenSource( scx,scy )

local selectionsi_tab = 0
local presi_tab = false
local scrollsi_tab = 0
local scrollMaxsi_tab = 0
local rtsi_azs = dxCreateRenderTarget( 590,345, true )
local clksi_azs = false
local tab_s = dxCreateFont("tab_t.ttf", 11)
local tab_p = dxCreateFont("tab_t.ttf", 10)

stat_tab = false

max_slots = 200

function main_scoreboard ()

	dxDrawWindow( scx / 2 - 300, scy / 2 - 180, 600, 405, "")
		
	dxDrawButtonTextR(scx / 2 + 245, scy / 2 - 153, 0, 15, "\n #FFFFFF"..#getElementsByType("player").." / "..max_slots, 0.75, 0.75)

	
	local CRL = getElementData(localPlayer, "ColorR") or standartR
	local CGL = getElementData(localPlayer, "ColorG") or standartG
	local CBL = getElementData(localPlayer, "ColorB") or standartB
	local veh = getPedOccupiedVehicle(localPlayer)
	dxUpdateScreenSource( screen )
	dxSetRenderTarget( rtsi_azs,true )
	if scrollsi_tab < 0 then scrollsi_tab = 0
	elseif scrollsi_tab >= scrollMaxsi_tab then scrollsi_tab = scrollMaxsi_tab end
	local sy = 0
		for k,player in pairs(getElementsByType("player")) do
				
				local Nick = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '')
				local ID = getElementData(player,"ID") or 0
				local Times = getElementData(player,"Play Time") or 0   
				local pings = getPlayerPing(player) or 0 
				
				if ( playerTeam ) then           
					r, g, b = getTeamColor ( playerTeam )
					dxDrawText(ID,16,sy-scrollsi_tab - 230,30,sy-scrollsi_tab+324,tocolor(255,30,0,255),1,tab_s,"center","center", false, false, false, true)
					dxDrawText(Nick,19,sy-scrollsi_tab - 120,300,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_p,"center","center", false, false, false, true)
					dxDrawText(convertNumber(Times).." Minutos.",485,sy-scrollsi_tab - 120,218,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_s,"center","center", false, false, false, true)
					dxDrawText(convertNumber(pings) ,698,sy-scrollsi_tab - 120,410,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_s,"center","center", false, false, false, true)
				else
					dxDrawText(ID,16,sy-scrollsi_tab - 120,30,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_s,"center","center", false, false, false, true)
					dxDrawText(Nick,19,sy-scrollsi_tab - 120,300,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_p,"center","center", false, false, false, true)
					dxDrawText(convertNumber(Times).." Minutos.",485,sy-scrollsi_tab - 120,265,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_p,"center","center", false, false, false, true)
					dxDrawText(convertNumber(pings) ,665,sy-scrollsi_tab - 120,410,sy-scrollsi_tab+324,tocolor(255,255,255,255),1,tab_s,"center","center", false, false, false, true)
				end
			sy = sy + 46
		end
	dxSetRenderTarget()
	dxDrawImage(scx / 2 - 295, scy / 2 - 145,590,345,rtsi_azs)
	if sy >= 345 then
		scrollMaxsi_tab = sy-345
	end
end

function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function open_tab ()
	if stat_tab == false then
		stat_tab = true
		addEventHandler("onClientRender", root, main_scoreboard)
	else
		stat_tab = false
		removeEventHandler("onClientRender", root, main_scoreboard)
	end
end
bindKey("tab", "both" ,open_tab)

addEventHandler("onClientKey",root,function(key,presi_tab)
	if presi_tab then
		if not stat_tab then return end
		if key == "mouse_wheel_down" then
			scrollsi_tab = scrollsi_tab + 12
		elseif key == "mouse_wheel_up" then
			scrollsi_tab = scrollsi_tab - 12
		end
	end
end)



   --NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!  NÃO RETIRAR CREDITOS!   
  --              https://discord.gg/KXV2GHtJtg                              


--PROCURANDO SCRIPTS, MAPAS, MODELAGENS EXCLUSIVOS?
--NOSSA COMUNIDADE ESTÁ SEMPRE A ATIVA SOLTANDO VARIOS MODS DE GRAÇA!

--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO
--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO
--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO
--MAIS DE 300 MODS GRÁTIS COM DOWNLOAD DIRETO

--LINK DE CONVITE PERMANENTE:

--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
--https://discord.gg/KXV2GHtJtg   
