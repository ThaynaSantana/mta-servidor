local gate = createObject(16775,1496.9000244141,-699.79998779297,97.699996948242, 0, 0, 0) 
local marker = createMarker(1496.9000244141,-699.79998779297,97.699996948242, "cylinder", 8, 0, 0, 0, 0) 

function moveGate(thePlayer) 
	if getElementType (thePlayer) == "player" then		
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("CV")) then 
			moveObject(gate, 500, 1496.9000244141,-699.79998779297,103.30000305176)
		end
	end
end 
addEventHandler("onMarkerHit", marker, moveGate) 
  
function move_back_gate() 
     moveObject(gate, 500, 1496.9000244141,-699.79998779297,97.699996948242) 
end 
addEventHandler("onMarkerLeave", marker, move_back_gate) 