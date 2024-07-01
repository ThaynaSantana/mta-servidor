--##################################--
--# criado por RF Mapper >>Rafa Mapper<<|#--
--##################################--
                               ------------PORTÃO ENTRADA-------------

local pentrada = createObject(971, 1542.982421875, -1627.6953125, 16.003000259399, 0, 0, 270 ) 

local ponto = createMarker(1542.4343261719,-1627.6304931641,13.382809638977,"cylinder",9,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Everyone")) then 
moveObject(pentrada, 2500, 1542.9820556641, -1627.6949462891,7.603000164032, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Everyone")) then
moveObject(pentrada, 2500, 1542.982421875, -1627.6953125, 16.003000259399, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )

--------------------------------------------------------------------------------------------------------------------------------

                                      --------------------PORTÃO GARAGEM--------------------
									  
local garagemen = createObject(3037, 1589.3896484375, -1637.984375, 14.506999969482, 0, 0, 270 ) 

local ponto = createMarker(1589.3896484375, -1637.984375, 14.506999969482,"cylinder",9,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then 
moveObject(garagemen, 2500, 1589.3900146484, -1637.9840087891,10.107000350952, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then
moveObject(garagemen, 2500, 1589.3896484375, -1637.984375, 14.506999969482, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )	

-----------------------------------------------------------------------------------------------------------------------------
                                  -----------------PORTA DP-----------------------------

local pentdp = createObject(3089, 1555.8129882813, -1677.0760498047, 16.520999908447, 0, 0, 90 ) 

local ponto = createMarker(1555.4301757813,-1675.5487060547,16.195308685303,"cylinder",3,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Everyone")) then 
moveObject(pentdp, 2500, 1555.8129882813, -1678.3010253906,16.520999908447, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Everyone")) then
moveObject(pentdp, 2500, 1555.8129882813, -1677.0760498047, 16.520999908447, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )

-------------------------------------------------------------------

local pentdp2 = createObject(3089, 1555.8120117188, -1674.1009521484, 16.520999908447, 0, 0, 270 ) 

local ponto = createMarker(1555.4301757813,-1675.5487060547,16.195308685303,"cylinder",3,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Everyone")) then 
moveObject(pentdp2, 2500, 1555.8120117188, -1672.8260498047,16.520999908447, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Everyone")) then
moveObject(pentdp2, 2500, 1555.8120117188, -1674.1009521484, 16.520999908447, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )

-----------------------------------------------------------------------------------------------------------

                                         -------------CELAS-----------

local cela1 = createObject(2930, 1581.2430419922, -1695.0529785156, 15.152000427246, 0, 0, 270 ) 


function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then 
moveObject(cela1, 2500, 1582.6929931641, -1695.0529785156,15.152000427246, 0, 0, 0) 
outputChatBox ( "Abrindo cela 1", p, 0,255,0 ) 
end
end

addCommandHandler( "abrircela1", Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then
moveObject(cela1, 2500, 1581.2430419922, -1695.0529785156, 15.152000427246, 0, 0, 0)
outputChatBox ( "Fechando cela 1", p, 255,0,0 )  
end
end

addCommandHandler( "fecharcela1", Fechado )

--------------------------------------------------------------------

local cela2 = createObject(2930, 1576.6429443359, -1695.0030517578, 15.152000427246, 0, 0, 270 ) 


function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then 
moveObject(cela2, 2500, 1578.1929931641, -1695.0030517578,15.152000427246, 0, 0, 0) 
outputChatBox ( "Abrindo cela 2", p, 0,255,0 ) 
end
end

addCommandHandler( "abrircela2", Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then
moveObject(cela2, 2500, 1576.6429443359, -1695.0030517578, 15.152000427246, 0, 0, 0)
outputChatBox ( "Fechando cela 2", p, 255,0,0 )  
end
end

addCommandHandler( "fecharcela2", Fechado )	

---------------------------------------------------------------------------------------------------------

local cela3 = createObject(2930, 1571.5179443359, -1695.0030517578, 15.152000427246, 0, 0, 270 ) 


function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then 
moveObject(cela3, 2500, 1573.1429443359, -1695.0030517578,15.152000427246, 0, 0, 0) 
outputChatBox ( "Abrindo cela 3", p, 0,255,0 ) 
end
end

addCommandHandler( "abrircela3", Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then
moveObject(cela3, 2500, 1571.5179443359, -1695.0030517578, 15.152000427246, 0, 0, 0)
outputChatBox ( "Fechando cela 3", p, 255,0,0 )  
end
end

addCommandHandler( "fecharcela3", Fechado )

-------------------------------------------------------------------------------------------------------------------------
 
                                      --------PORTA PARA AS CELAS----------

local ptcl = createObject(5302, 1566.4840087891, -1675.1330566406, 17.514999389648, 0, 0, 0 ) 

local ponto = createMarker(1566.0618896484,-1675.2296142578,16.191499710083,"cylinder",2,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then 
moveObject(ptcl, 2500, 1566.4840087891, -1675.1330566406,19.864999771118, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("pm")) then
moveObject(ptcl, 2500, 1566.4840087891, -1675.1330566406, 17.514999389648, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )									  