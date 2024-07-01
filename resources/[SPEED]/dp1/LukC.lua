if fileExists("LukC.lua") then
	fileDelete("LukC.lua")
end
if fileExists("Luk.luac") then
	fileDelete("Luk.luac")
end


addEventHandler("onClientResourceStart", root, function()
engineSetAsynchronousLoading ( true, true )
setOcclusionsEnabled(false)
end)


local dir = "models"
function loadMod(f, m, isLod)
	local txdFile = dir.."/"..f..".txd"
	local dffFile = dir.."/"..f..".dff"
	local colFile = dir.."/"..f..".col"
	if fileExists(txdFile) then
		local txd = EngineTXD(txdFile)
		if txd then
			txd:import(m)
		end
	end
	if fileExists(dffFile) then
		local dff = EngineDFF(dffFile,m)
		if dff then
			dff:replace(m)
		end
	end
	if not isLod then
		if fileExists(colFile) then
			local col = EngineCOL(colFile)
			if col then
				col:replace(m)
			end
		end
	end
end



addEventHandler("onClientResourceStart", resourceRoot, function()

	loadMod("DP", 3976)
	loadMod("DP2", 14846)
	
	loadMod("Luk_Esta",3975)


end)

removeWorldModel(5681,10000,0,0,0)
removeWorldModel(1676,10000,0,0,0)


