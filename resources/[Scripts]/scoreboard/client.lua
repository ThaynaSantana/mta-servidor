-- Sitemiz : https://sparrow-mta.blogspot.com/
-- Facebook : https://facebook.com/sparrowgta/
-- İnstagram : https://instagram.com/sparrowmta/
-- YouTube : https://youtube.com/c/SparroWMTA/
-- Discord : https://discord.gg/DzgEcvy

local sx,sy = guiGetScreenSize()
local font = dxCreateFont("dosyalar/tip3.ttf",10)
--olaylar önemli
batmazscoreboard = {}
local sira_sayisi =  math.floor(sy / 20) - 2
local sefaflikpanel = 0
local baslangic = 0
local scrolldownby = 1
local lastscrolldown = 0
local scrollbarWidth = 1

function getLevelPlayer(conta)
	if conta then
		local source = getAccountPlayer(conta)
		local level = getElementData(source,"Level") or 0
	end
end

bindKey("mouse_wheel_down", "down", function()
	if sira_sayisi > #batmazscoreboard then
	return
	end
  local time = getTickCount()
  if time - lastscrolldown < 60 then
    scrolldownby = math.min(scrolldownby + 3, 16)
  else
    if time - lastscrolldown < 120 then
      scrolldownby = math.min(scrolldownby + 2, 16)
    end
    scrolldownby = 1
  end
  lastscrolldown = time
  local sira_sayisi = math.min(#batmazscoreboard, sira_sayisi - 1)
  baslangic = math.min(#batmazscoreboard - sira_sayisi, baslangic + scrolldownby)
end
)

bindKey("mouse_wheel_up", "down", function()
	if sira_sayisi > #batmazscoreboard then
	return
	end
  local time = getTickCount()
  if time - lastscrolldown < 100 then
    scrollupby = math.min(scrollupby + 2, 16)
  else
    scrollupby = 1
  end
  lastscrolldown = time
  baslangic = math.max(1, baslangic - scrollupby)
end
)

local verileriguncelle = function()
	batmazscoreboard = {}
	table.insert(batmazscoreboard,{})
	players = getElementsByType("player")
    local teams = getElementsByType("team")
    local teamID = {}
    for id,team in ipairs(teams) do
      teamID[getTeamName(team)] = id
    end
    local playersOrderedByTeams = {}
    for i = 1, #teams + 1 do
      playersOrderedByTeams[i] = {}
    end
    for id,player in ipairs(players) do
		local pTeam = getPlayerTeam(player)
		if pTeam then
			pTeam = teamID[getTeamName(pTeam)] + 1
		else
			pTeam = 1
		end
		table.insert(playersOrderedByTeams[pTeam], player)
    end												
    for tID,playersInTeam in ipairs(playersOrderedByTeams) do
		if tID-1 >= 1 then
			if #getPlayersInTeam(teams[tID - 1]) >= 1 then
				table.insert(batmazscoreboard, {"team", teams[tID-1]})
			end
		end
		for id,player in ipairs(playersInTeam) do
			table.insert(batmazscoreboard, {PLAYER, player,getPlayerName(player)})
		end										
    end
end
verileriguncelle()
setTimer(verileriguncelle,2500,0)



--[[
local verileriguncelle = function()
	batmazscoreboard = {}
	table.insert(batmazscoreboard,{})
	oyuncular = getElementsByType("player")
	takimlar = getElementsByType("team")
    local teamID = {}

    local takimlaragoresira = {}
    for i = 1, #takimlar + 1 do
      takimlaragoresira[i] = {}
    end

    for id,player in ipairs(oyuncular) do
		oyuncutakim = 1
		table.insert(takimlaragoresira[oyuncutakim], player)
    end												
    for takimid,oyuncutakimi in ipairs(takimlaragoresira) do
		if takimid-1 >= 1 then
		end
		for id,player in ipairs(oyuncutakimi) do
			table.insert(batmazscoreboard, {PLAYER, player,getPlayerName(player)})
		end										
    end
end
verileriguncelle()
setTimer(verileriguncelle,2500,0)
--]]

--tasarım
function drawTabPanelBatmaz()
  if scoreboarddurum == true then
  showCursor(getKeyState("mouse2"))
  if durum == true and sefaflikpanel > 0 then
		sefaflikpanel = sefaflikpanel - 7.5
  end
  if not durum and sefaflikpanel ~= 210 then
		sefaflikpanel = sefaflikpanel + 7.5
  end
  if sefaflikpanel == 0 then
		scoreboarddurum = false
  end
  local oyuncusayisi = math.min(#batmazscoreboard, sira_sayisi-1)
  baslangic = math.min(#batmazscoreboard - oyuncusayisi, baslangic) 
  local x, y = sx / 2 - 320, sy / 2 - oyuncusayisi * 20 / 2

  dxDrawImage((sx-187)/2,y-120,187, 111,"dosyalar/logo.png",0,0,0,tocolor(255,255,255,sefaflikpanel))
  
  dxDrawRectangle(x,y,640,oyuncusayisi * 20+5,tocolor(31,31,31,sefaflikpanel))
  roundedBorder(x,y,640,oyuncusayisi * 20+5,tocolor(0,0,0,sefaflikpanel))

  local c = 0
  local cx, cy
  if isCursorShowing() then
    cx, cy = getCursorPosition()
    cx = cx * sx
    cy = cy * sy
  end


  --üst bar
  dxDrawRectangle(x,y,640,20,tocolor(41,41,41,sefaflikpanel))
  dxDrawRectangle(x,y+20,640,1,tocolor(135, 11, 11,sefaflikpanel))

  dxDrawText("AFK",x+10,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
  dxDrawText("PLAYER",x+75,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
  dxDrawText("TEMPO",x+230,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
  dxDrawText("CLAN",x+340,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
  dxDrawText("LEVEL",x+450,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
  dxDrawText("FPS",x+530,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
  dxDrawText("PING",x+605,y+20,x+640,y,tocolor(137, 137, 137,sefaflikpanel),0.9,font,"left","center")
 
   for id, element in ipairs(batmazscoreboard) do
    if id > baslangic and id <= baslangic + oyuncusayisi then
		 c = c + 1
		 if element[1] == PLAYER and isElement(element[2]) then
		  if isCursorShowing() and x <= cx and cx < x + 640 and cy >= y + (c - 1) * 20 and cy < y + c * 20 then
			dxDrawRectangle(x , y + (c - 1) * 20+1.7, 640, 20, tocolor(255, 255, 255, 50))
          end
		 local r, g, b = 255, 255, 255
		  if element[2] == localPlayer then
		  
		 end
		 if getElementData(element[2],"scoreboard:afkeklentisi") == true then
			dxDrawImage(x + 15, y + (c - 1) * 20+5, 14, 14,"dosyalar/deaktif.png",0,0,0,tocolor(255,255,255,sefaflikpanel))
		 else
		 	dxDrawImage(x + 15, y + (c - 1) * 20+5, 14, 14,"dosyalar/aktif.png",0,0,0,tocolor(255,255,255,sefaflikpanel))
	   end
	   dxDrawText(getPlayerName(element[2]),x + 75, y + (c - 1) * 20+5, x + 640, y + (c - 1) * 20+5,tocolor(255,255,255,sefaflikpanel),0.9,font,"left","top", false, false, false, true)
	   dxDrawText(getElementData(element[2],"TEMPO") or "0:0:0",x + 230, y + (c - 1) * 20+5, x + 640, y + (c - 1) * 20+5,tocolor(255,255,255,sefaflikpanel),0.9,font,"left","top", false, false, false, true)
	   dxDrawText(getElementData(element[2],"Clan") or "Nenhum",x + 340, y + (c - 1) * 20+5, x + 640, y + (c - 1) * 20+5,tocolor(255,255,255,sefaflikpanel),0.9,font,"left","top", false, false, false, true)
	   dxDrawText(getElementData(element[2],"Level") or "0",x + 450, y + (c - 1) * 20+5, x + 640, y + (c - 1) * 20+5,tocolor(255,255,255,sefaflikpanel),0.9,font,"left","top", false, false, false, true)
	   dxDrawText(getElementData(element[2],"scoreboard:fps") or "0",x + 530, y + (c - 1) * 20+5, x + 640, y + (c - 1) * 20+5,tocolor(255,255,255,sefaflikpanel),0.9,font,"left","top", false, false, false, true)
	   dxDrawText(getPlayerPing(element[2]) or "null",x + 605, y + (c - 1) * 20+5, x + 640, y + (c - 1) * 20+5,tocolor(255,255,255,sefaflikpanel),0.9,font,"left","top", false, false, false, true)
	 end
    end
  end 
  -- alt bar
  local ay =  getCurrentPlayers()
  local oyuncu_sayisi = (ay-1)
  local oyuncu_sayisi = oyuncu_sayisi / 5 * 5 + 2
  
  bar_olustur4(x+20,y + oyuncusayisi * 20 + 15,600,20,tocolor(43,43,43,sefaflikpanel),"JOGADORES ONLINE: "..#getElementsByType("player").." / ".."200",tocolor(97, 143, 17,sefaflikpanel),x+20,y + oyuncusayisi * 20 + 15,oyuncu_sayisi/1.15,20,tocolor(0,0,0,sefaflikpanel))
  
  if isCursorShowing() then
    if cx >= x + 641 - 30 and cx <= x + 641 + 6 * scrollbarWidth + 30 then
      scrollbarWidth = math.min(3, scrollbarWidth + 0.4)
    else
      scrollbarWidth = math.max(1, scrollbarWidth - 0.4)
    end
  else
    scrollbarWidth = math.max(1, scrollbarWidth - 0.4)
  end
  if oyuncusayisi < #batmazscoreboard then
    local h = oyuncusayisi * 20
    local size = oyuncusayisi / #batmazscoreboard
    local s = baslangic / #batmazscoreboard
    if attachScrollbarOffset then
      local newScrollBarTop = cy - attachScrollbarOffset
      newScrollBarTop = newScrollBarTop - y
      newScrollBarTop = math.min(math.max(newScrollBarTop, 0), h - size * h)
      baslangic = math.floor(newScrollBarTop / h * #batmazscoreboard)
      s = baslangic / #batmazscoreboard
      scrollbarWidth = 3
    end
	
    dxDrawRectangle(x + 642, y, 2 + 6 * scrollbarWidth, 20, tocolor(0,0,0,sefaflikpanel))
    dxDrawRectangle(x + 642, y, 2 + 6 * scrollbarWidth, h + 5, tocolor(0, 0, 0, sefaflikpanel))
    dxDrawRectangle(x + 643, y + s * h+20, 6 * scrollbarWidth, size * h - 15, tocolor(255, 255, 255, sefaflikpanel))
	roundedBorder(x + 642, y, 2 + 6 * scrollbarWidth, h + 5,tocolor(0,0,0,sefaflikpanel))
	end
   end 
end 
addEventHandler("onClientRender",root,drawTabPanelBatmaz)

function bar_olustur4(x,y,w,h,renk1,yazi,renk3,x1,y1,w1,h1,renk4)
	dxDrawRectangle(x,y,w,h,renk1)
	dxDrawRectangle(x1+0.5,y1,w1,h1,renk3)
	roundedBorder(x,y,w,h,renk4)
	dxDrawText(yazi,x,y,w+x,20+y,tocolor(200, 200, 200,sefaflikpanel),0.8,font,"center","center")
end

function dxDrawBorder(x,y,w,h,color, color2)
   if (x and y and w and h) then
		dxDrawRectangle(x, y, w, h, color, postGUI);
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, color, postGUI);
		dxDrawRectangle(x + 2, y + h, w - 4, 1, color, postGUI);
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, color, postGUI);
		dxDrawRectangle(x + w, y + 2, 1, h - 4, color, postGUI);
	end
end

function getCurrentPlayers()
	local counter = 0
	for k, v in pairs(getElementsByType("player")) do
		counter = counter + 1
	end 
	return counter
end

--olaylar
local fps = 0
local fpstick = nil
addEventHandler("onClientRender",root,
function()
	fps = fps + 1
	if not fpstick then
		fpstick = getTickCount()
	end
	fpscountertick = getTickCount()
	if fpscountertick - fpstick >= 1000 then
		setElementData(localPlayer,"scoreboard:fps",fps)
		fps = 0
		fpstick = false
	end
end)

addEventHandler("onClientMinimize", root, function()
  setElementData(localPlayer, "scoreboard:afkeklentisi", true)
end
)
addEventHandler("onClientRestore", root, function()
  setElementData(localPlayer, "scoreboard:afkeklentisi", false)
end
)

function panelac()
  verileriguncelle()
  slot = 120
  scoreboarddurum = true
  durum = false
end
bindKey("tab", "down", panelac)

function panelkapat()
  durum = true
end
bindKey("tab", "up", panelkapat)

function roundedBorder(x, y, w, h, borderColor)
	if (x and y and w and h) then
	dxDrawRectangle(x - 1, y + 1, 1, h - 2, borderColor); -- left
	dxDrawRectangle(x + w, y + 1, 1, h - 2, borderColor); -- right
	dxDrawRectangle(x + 1, y - 1, w - 2, 1, borderColor); -- top
	dxDrawRectangle(x + 1, y + h, w - 2, 1, borderColor); -- bottom

	dxDrawRectangle(x, y, 1, 1, borderColor);
	dxDrawRectangle(x + w - 1, y, 1, 1, borderColor);
	dxDrawRectangle(x, y + h - 1, 1, 1, borderColor);
	dxDrawRectangle(x + w - 1, y + h - 1, 1, 1, borderColor);
	end
end

function inBox(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(inBox(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end