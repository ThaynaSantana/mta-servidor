local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)

function Window(rnames)
  if isElement(myWindow) then return end
  local screenW, screenH = guiGetScreenSize()
	
  myWindow = guiCreateWindow((screenW - x*485) / 2, (screenH - y*404) / 2, x*485, y*404, "Rotas", false)
  rotas = guiCreateGridList(x*40, y*40, x*405, y*275, false, myWindow)
  guiWindowSetSizable(myWindow, false)
  guiSetAlpha(rotas, x*0.70)
  guiGridListAddColumn( rotas, "Rotas", x*0.85 )
	
  for k,v in pairs(rnames) do
   row =  guiGridListAddRow ( rotas )
   guiGridListSetItemText ( rotas, row, 1,  tostring(k), false, false )
  end
	
  showCursor(true)
	
  fechar = guiCreateButton(x*275, y*334, x*168, y*35, "Fechar", false, myWindow)
  escolher = guiCreateButton(x*42, y*334, x*168, y*35, "Carregar", false, myWindow)
end
addEvent("JOBUS>AbrirPainel<Client", true)
addEventHandler("JOBUS>AbrirPainel<Client", localPlayer, Window)

function botoes(bt,state)
	if state == "up" and bt == "left" then
		if source == fechar then
			if isElement(myWindow) then
				destroyElement(myWindow)
				showCursor(false)
			end
		end
		if source == escolher then
			local selectedItemx = guiGridListGetSelectedItem(rotas)
			local nome = guiGridListGetItemText(rotas, selectedItemx, 1)
			if nome == nil then
			exports.Script_Textos:createNewDxMessage('Selecione uma Rota Para Carregar seu Caminhão', 255, 255, 255) return end
			triggerServerEvent("request>Startrota>Server",localPlayer,localPlayer,nome)	
			if isElement(myWindow) then
				destroyElement(myWindow)
				showCursor(false)
			end			
		end
	end
end
addEventHandler("onClientGUIClick", root,botoes)

function blips(state,x,y,z)
	if state == true then
		if not isElement(blips) then
			blips = createBlip( x, y, z )
		end
	else
		if isElement(blips) then
			destroyElement(blips)
		end	
	end
end
addEvent("JOBUS>blips<Client", true)
addEventHandler("JOBUS>blips<Client", localPlayer, blips)

local g_screenX, g_screenY = guiGetScreenSize(); 
local gScale = 0.3; 
local gAlphaDistance = 25; 
local gMaxDistance = 50;
local gTextAlpha = 120; 
local gTextSize = 0.7; 
local gAlphaDiff = gMaxDistance - gAlphaDistance;  
gScale = 1 / gScale * 800 / g_screenY; 
local gMaxScaleCurve = { { 0, 0 }, { 3, 3 }, { 13, 5 } }; 
local gTextScaleCurve = { { 0, 0.8 }, { 0.8, 1.2 }, { 99, 99 } }; 
local gTextAlphaCurve = { { 0, 0 }, { 25, 100 }, { 120, 190 }, { 255, 190 } }; 

local x = 2720.826
local y = -2405.282
local z = 12.461
	            
addEventHandler("onClientRender",getRootElement(), 
function() 
    
	local px,py,pz = getElementPosition(getLocalPlayer()) 
    
	local distance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz ) 
    if distance <= 50 then
    
	local sx,sy = getScreenFromWorldPosition ( x, y, z+0.95, 0.06 ) 
	if not sx then return end 
	
	local scale = 1 / ( gScale * ( distance / gMaxDistance ) ); 
	local alpha = ( ( distance - gAlphaDistance ) / gAlphaDiff ); 
	alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha ); 
	scale = math.evalCurve( gMaxScaleCurve, scale ); 
	local textscale = math.evalCurve( gTextScaleCurve, scale ); 
	local textalpha = math.evalCurve( gTextAlphaCurve, alpha ); 
    
	dxDrawText ( "Entrada da\n\Área de Carregamento", sx, sy - 30, sx, sy - 30, tocolor ( 0, 0, 0, textalpha ), textscale * gTextSize, "arial", "center", "bottom", false, false, false, true ); 
	dxDrawText ( "Entrada da\n\Área de Carregamento", sx -2, sy - 30 -2, sx -1, sy - 30 -2, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "arial", "center", "bottom", false, false, false, true ); 
    
end 
end 
)

local x = 2761.043
local y = -2427
local z = 12.528
	            
addEventHandler("onClientRender",getRootElement(), 
function() 
    
	local px,py,pz = getElementPosition(getLocalPlayer()) 
    
	local distance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz ) 
    if distance <= 50 then
    
	local sx,sy = getScreenFromWorldPosition ( x, y, z+0.95, 0.06 ) 
	if not sx then return end 
	
	local scale = 1 / ( gScale * ( distance / gMaxDistance ) ); 
	local alpha = ( ( distance - gAlphaDistance ) / gAlphaDiff ); 
	alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha ); 
	scale = math.evalCurve( gMaxScaleCurve, scale ); 
	local textscale = math.evalCurve( gTextScaleCurve, scale ); 
	local textalpha = math.evalCurve( gTextAlphaCurve, alpha ); 
    
	dxDrawText ( "Saída da\n\Área de Carregamento", sx, sy - 30, sx, sy - 30, tocolor ( 0, 0, 0, textalpha ), textscale * gTextSize, "arial", "center", "bottom", false, false, false, true ); 
	dxDrawText ( "Saída da\n\Área de Carregamento", sx -2, sy - 30 -2, sx -1, sy - 30 -2, tocolor ( 255, 0, 0, textalpha ), textscale * gTextSize, "arial", "center", "bottom", false, false, false, true ); 
    
end 
end 
)

local x = 2744.395
local y = -2406.056
local z = 12.528
	            
addEventHandler("onClientRender",getRootElement(), 
function() 
    
	local px,py,pz = getElementPosition(getLocalPlayer()) 
    
	local distance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz ) 
    if distance <= 50 then
    
	local sx,sy = getScreenFromWorldPosition ( x, y, z+0.95, 0.06 ) 
	if not sx then return end 
	
	local scale = 1 / ( gScale * ( distance / gMaxDistance ) ); 
	local alpha = ( ( distance - gAlphaDistance ) / gAlphaDiff ); 
	alpha = ( alpha < 0 ) and gTextAlpha or gTextAlpha - ( alpha * gTextAlpha ); 
	scale = math.evalCurve( gMaxScaleCurve, scale ); 
	local textscale = math.evalCurve( gTextScaleCurve, scale ); 
	local textalpha = math.evalCurve( gTextAlphaCurve, alpha ); 
    
	dxDrawText ( "Área de\n\Carregamento", sx, sy - 30, sx, sy - 30, tocolor ( 0, 0, 0, textalpha ), textscale * gTextSize, "arial", "center", "bottom", false, false, false, true ); 
	dxDrawText ( "Área de\n\Carregamento", sx -2, sy - 30 -2, sx -1, sy - 30 -2, tocolor ( 8, 114, 246, textalpha ), textscale * gTextSize, "arial", "center", "bottom", false, false, false, true ); 
    
end 
end 
)
  
function math.evalCurve( curve, input ) 
    if input < curve[ 1 ][ 1 ] then 
        return curve[ 1 ][ 2 ]; 
    end 
    for idx = 2, #curve do 
        if input < curve[ idx ][ 1 ] then 
            local x1 = curve[ idx - 1 ][ 1 ]; 
            local y1 = curve[ idx - 1 ][ 2 ]; 
            local x2 = curve[ idx ][ 1 ]; 
            local y2 = curve[ idx ][ 2 ]; 
            local alpha = ( input - x1 ) / ( x2 - x1 ); 
            return math.lerp( y1, y2, alpha ); 
        end 
    end 
    return curve[ #curve ][ 2 ]; 
end 
  
function math.lerp( from, to, alpha ) 
    return from + ( to-from ) * alpha; 
end 