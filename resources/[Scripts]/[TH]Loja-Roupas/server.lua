local cooldown = {}
local skin_list ={
	10,
	12,
	13,
	14,
}

local function on_enter_hit(element, samedim)
	if not samedim or getElementType(element) ~= "player" then
		return
	end

	local tick = getTickCount()

	if cooldown[element] and tick - cooldown[element] < 2000 then
		return
	end

	cooldown[element] = tick

	setElementInterior(
		element, --- Player
		15,
		207.7,
		-111.25,
		1005
		)	
end

local function on_exit_hit(element, samedim)
	if not samedim or getElementType(element) ~= "player" then
		return
	end

	setElementInterior(
		element,
		0,
		2244.5,
		-1665,
		15.5)
end

local function on_selling_hit(element, samedim)
	if not samedim or getElementType(element) ~= "player" then
		return
	end

	setElementModel(
		element,
		11
		)
end

local function setup()
	local enter = createMarker(
		2244.5,
		2244.5,
		16.3,
		"arrow",
		1.5,
		255, 255, 0) -- cor do marker

	local exit = createMarker(
		207.7,
		-111.25,
		1006,
		"arrow",
		1.5,
		255, 0, 0) -- cor do marker

	local selling = createMarker(
		207.5849609375,
		-100.705078125,
		1004.3,
		"cylinder",
		1,
		0,0,255) -- cor do marker

	local seller = createPed(
		83, -- skin
		207.5849609375,
		-98.705078125,
		1005.2578125,
		180)

	setElementInterior(exit, 15)
	setElementInterior(selling, 15)
	setElementInterior(seller, 15)

	addEventHandler("onMarkerHit", enter, on_enter_hit)
	addEventHandler("onMarkerHit", exit, on_exit_hit)
	addEventHandler("onMarkerHit", selling, on_selling_hit)
end

addEventHandler("onResourceStart", resourceRoot, setup)