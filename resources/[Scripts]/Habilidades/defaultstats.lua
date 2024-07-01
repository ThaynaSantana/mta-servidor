local stats = {
	[69] = 500,
	[70] = 999,
	[71] = 999,
	[72] = 999,
	[73] = 500,
	[74] = 999,
	[75] = 500,
	[76] = 999,
	[77] = 999,
	[78] = 999,
	[79] = 999,
	[160] = 999,
	[229] = 999,
	[230] = 999
}

local function applyStatsForPlayer(player)
	for stat, value in pairs(stats) do
		player:setStat(stat, value)
	end
end

local function applyStatsForEveryone()
	for _, player in pairs(Element.getAllByType "player") do
		applyStatsForPlayer(player)
	end
end
addEventHandler("onResourceStart", resourceRoot, applyStatsForEveryone)
addEventHandler("onGamemodeMapStart", root, applyStatsForEveryone)

local function applyStatsForSource()
	applyStatsForPlayer(source)
end
addEventHandler("onPlayerJoin", root, applyStatsForSource)
addEventHandler("onPlayerSpawn", root, applyStatsForSource)