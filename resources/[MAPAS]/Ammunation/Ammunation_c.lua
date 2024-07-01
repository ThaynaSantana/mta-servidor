setTimer(function()
local ammo1 = getPedTotalAmmo(localPlayer,5) or "brak"
local ammo2 = getPedTotalAmmo(localPlayer,4) or "brak"
local ammo3 = getPedTotalAmmo(localPlayer,6) or "brak"
local ammo4 = getPedTotalAmmo(localPlayer,2) or "brak"
local ammo5 = getPedTotalAmmo(localPlayer,3) or "brak"
local ammo6 = getPedTotalAmmo(localPlayer,8) or "brak"
guiSetText(anw1l,"M4\nMunição: "..ammo1.."")
guiSetText(anw2l,"AK-47\nMunição: "..ammo1.."")
guiSetText(anw3l,"MP5\nMunição: "..ammo2.."")
guiSetText(anw4l,"Sniper rifle\nMunição: "..ammo3.."")
guiSetText(anw5l,"Country rifle\nMunição: "..ammo3.."")
guiSetText(anw6l,"TEC-9\nMunição: "..ammo2.."")
guiSetText(anw7l,"UZI\nMunição: "..ammo2.."")
guiSetText(anw8l,"Desert Eagle\nMunição: "..ammo4.."")
guiSetText(anw9l,"Silenced pistol\nMunição: "..ammo4.."")
guiSetText(anw10l,"Pistol\nMunição: "..ammo4.."")
guiSetText(anw11l,"Sawed-off\nMunição: "..ammo5.."")
guiSetText(anw12l,"Shotgun\nMunição: "..ammo5.."")
guiSetText(anw13l,"Combat shotgun\nMunição: "..ammo5.."")
guiSetText(anw14l,"Granada\nMunição: "..ammo6.."")
guiSetText(anw15l,"Dispositivo de explosão\nMunição: "..ammo6.."")
guiSetText(anw16l,"Cocktail molotov\nMunição: "..ammo6.."")
guiSetText(anw17l,"Gás lacrimogêneo\nMunição: "..ammo6.."")
if (getPedWeapon(localPlayer,11)== 46) then
guiSetText(anw18l,"Paraquedas \n (Disponível)")
else
guiSetText(anw18l,"Paraquedas \n (Não disponível)")
end
end,100,0)
		anbg = guiCreateStaticImage(0.00, 0.66, 1.00, 0.34, "bg.png", true)
        guiSetProperty(anbg, "ImageColours", "tl:FF000000 tr:FF000000 bl:FF000000 br:FF000000")

        anbg2 = guiCreateStaticImage(0.01, 0.04, 0.98, 0.92, "bg.png", true, anbg)
        guiSetProperty(anbg2, "ImageColours", "tl:FF1E1E1E tr:FF1E1E1E bl:FF1E1E1E br:FF1E1E1E")

        anw1 = guiCreateStaticImage(0.01, 0.04, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw1, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw1l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "M4", true, anw1)
        guiSetFont(anw1l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw1l, "center", false)
        guiLabelSetVerticalAlign(anw1l, "center")

        anw2 = guiCreateStaticImage(0.19, 0.04, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw2, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw2l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "AK-47", true, anw2)
        guiSetFont(anw2l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw2l, "center", false)
        guiLabelSetVerticalAlign(anw2l, "center")

        anw3 = guiCreateStaticImage(0.37, 0.04, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw3, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw3l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "MP5", true, anw3)
        guiSetFont(anw3l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw3l, "center", false)
        guiLabelSetVerticalAlign(anw3l, "center")

        anw4 = guiCreateStaticImage(0.55, 0.04, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw4, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw4l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Sniper Rifle", true, anw4)
        guiSetFont(anw4l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw4l, "center", false)
        guiLabelSetVerticalAlign(anw4l, "center")

        anw5 = guiCreateStaticImage(0.73, 0.04, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw5, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw5l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Country Rifle", true, anw5)
        guiSetFont(anw5l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw5l, "center", false)
        guiLabelSetVerticalAlign(anw5l, "center")

        anw6 = guiCreateStaticImage(0.01, 0.26, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw6, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw6l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "TEC-9", true, anw6)
        guiSetFont(anw6l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw6l, "center", false)
        guiLabelSetVerticalAlign(anw6l, "center")

        anw7 = guiCreateStaticImage(0.19, 0.26, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw7, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw7l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "UZI", true, anw7)
        guiSetFont(anw7l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw7l, "center", false)
        guiLabelSetVerticalAlign(anw7l, "center")

        anw8 = guiCreateStaticImage(0.37, 0.26, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw8, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw8l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Desert Eagle", true, anw8)
        guiSetFont(anw8l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw8l, "center", false)
        guiLabelSetVerticalAlign(anw8l, "center")

        anw9 = guiCreateStaticImage(0.55, 0.26, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw9, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw9l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Silenced Pistol", true, anw9)
        guiSetFont(anw9l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw9l, "center", false)
        guiLabelSetVerticalAlign(anw9l, "center")

        anw10 = guiCreateStaticImage(0.73, 0.26, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw10, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw10l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Pistol", true, anw10)
        guiSetFont(anw10l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw10l, "center", false)
        guiLabelSetVerticalAlign(anw10l, "center")

        anw11 = guiCreateStaticImage(0.01, 0.47, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw11, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw11l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Sawed-off", true, anw11)
        guiSetFont(anw11l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw11l, "center", false)
        guiLabelSetVerticalAlign(anw11l, "center")

        anw12 = guiCreateStaticImage(0.19, 0.47, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw12, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw12l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Shotgun", true, anw12)
        guiSetFont(anw12l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw12l, "center", false)
        guiLabelSetVerticalAlign(anw12l, "center")

        anw13 = guiCreateStaticImage(0.37, 0.47, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw13, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw13l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Combat shotgun", true, anw13)
        guiSetFont(anw13l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw13l, "center", false)
        guiLabelSetVerticalAlign(anw13l, "center")

        anw14 = guiCreateStaticImage(0.55, 0.47, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw14, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw14l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Granada", true, anw14)
        guiSetFont(anw14l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw14l, "center", false)
        guiLabelSetVerticalAlign(anw14l, "center")

        anw15 = guiCreateStaticImage(0.73, 0.47, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw15, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw15l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Dispositivo de explosão", true, anw15)
        guiSetFont(anw15l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw15l, "center", false)
        guiLabelSetVerticalAlign(anw15l, "center")

        anw16 = guiCreateStaticImage(0.01, 0.69, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw16, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw16l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Cocktail molotov", true, anw16)
        guiSetFont(anw16l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw16l, "center", false)
        guiLabelSetVerticalAlign(anw16l, "center")

        anw17 = guiCreateStaticImage(0.19, 0.69, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw17, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw17l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Gás lacrimogêneo", true, anw17)
        guiSetFont(anw17l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw17l, "center", false)
        guiLabelSetVerticalAlign(anw17l, "center")

        anw18 = guiCreateStaticImage(0.37, 0.69, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw18, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw18l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Pára-quedas", true, anw18)
        guiSetFont(anw18l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw18l, "center", false)
        guiLabelSetVerticalAlign(anw18l, "center")

        anw19 = guiCreateStaticImage(0.55, 0.69, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw19, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw19l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Flamethrower \n (indisponivel)", true, anw19)
        guiSetFont(anw19l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw19l, "center", false)
        guiLabelSetVerticalAlign(anw19l, "center")

        anw20 = guiCreateStaticImage(0.73, 0.69, 0.17, 0.18, "bg.png", true, anbg2)
        guiSetProperty(anw20, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anw20l = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Colete balistico", true, anw20)
        guiSetFont(anw20l, "default-bold-small")
        guiLabelSetHorizontalAlign(anw20l, "center", false)
        guiLabelSetVerticalAlign(anw20l, "center")

        anbglogo = guiCreateStaticImage(0.91, 0.04, 0.08, 0.80, "bg.png", true, anbg2)
        guiSetProperty(anbglogo, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")
		
        anwext = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Sair", true, anbglogo)
        guiSetFont(anwext, "default-bold-small")
        guiLabelSetHorizontalAlign(anwext, "center", false)
        guiLabelSetVerticalAlign(anwext, "center")

		
        anlbbg = guiCreateStaticImage(0.01, 0.91, 0.98, 0.05, "bg.png", true, anbg2)
        guiSetProperty(anlbbg, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")

        anlbbglb = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "Preço:     0$", true, anlbbg)
        guiSetFont(anlbbglb, "default-small")
        guiLabelSetHorizontalAlign(anlbbglb, "center", false)
		guiSetVisible(anbg,false)



addEvent("ADANshopshow",true)
addEventHandler("ADANshopshow",localPlayer,
function()
guiSetVisible(anbg,true)
showCursor(true)
showChat(false)
showPlayerHudComponentVisible("all",false)
end)

anweapon = nil

addEventHandler("onClientMouseEnter",getRootElement(),
function()
	if source==anw1l then
		guiSetProperty(anw1, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")
        addEventHandler( "onClientGUIClick", anw1l, anwfunction1, false )
		drawweaponprice(48000)
		anweapon = createObject(356,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw2l then
		guiSetProperty(anw2, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw2l, anwfunction2, false )
		drawweaponprice(42500)
		anweapon = createObject(355,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw3l then
		guiSetProperty(anw3, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw3l, anwfunction3, false )
		drawweaponprice(30000)
		anweapon = createObject(353,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw4l then
		guiSetProperty(anw4, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw4l, anwfunction4, false )
		drawweaponprice(49000)
		anweapon = createObject(358,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw5l then
		guiSetProperty(anw5, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw5l, anwfunction5, false )
		drawweaponprice(35000)
		anweapon = createObject(357,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw6l then
		guiSetProperty(anw6, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw6l, anwfunction6, false )
		drawweaponprice(28000)
		anweapon = createObject(372,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw7l then
		guiSetProperty(anw7, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw7l, anwfunction7, false )
		drawweaponprice(28000)
		anweapon = createObject(352,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw8l then
		guiSetProperty(anw8, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw8l, anwfunction8, false )
		drawweaponprice(25000)
		anweapon = createObject(348,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw9l then
		guiSetProperty(anw9, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw9l, anwfunction9, false )
		drawweaponprice(18000)
		anweapon = createObject(347,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw10l then
		guiSetProperty(anw10, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw10l, anwfunction10, false )
		drawweaponprice(10000)
		anweapon = createObject(346,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw11l then
		guiSetProperty(anw11, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw11l, anwfunction11, false )
		drawweaponprice(8000)
		anweapon = createObject(350,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw12l then
		guiSetProperty(anw12, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw12l, anwfunction12, false )
		drawweaponprice(10000)
		anweapon = createObject(349,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw13l then
		guiSetProperty(anw13, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw13l, anwfunction13, false )
		drawweaponprice(30000)
		anweapon = createObject(351,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw14l then
		guiSetProperty(anw14, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw14l, anwfunction14, false )
		drawweaponprice(7500)
		anweapon = createObject(342,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw15l then
		guiSetProperty(anw15, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw15l, anwfunction15, false )
		drawweaponprice(15000)
		anweapon = createObject(363,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw16l then
		guiSetProperty(anw16, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw16l, anwfunction16, false )
		drawweaponprice(1000)
		anweapon = createObject(344,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw17l then
		guiSetProperty(anw17, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw17l, anwfunction17, false )
		drawweaponprice(1500)
		anweapon = createObject(343,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw18l then
		guiSetProperty(anw18, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw18l, anwfunction18, false )
		drawweaponprice(5000)
		anweapon = createObject(371,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anw19l then
		guiSetProperty(anw19, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw19l, anwfunction19, false )
		drawweaponprice(0)
		anweapon = createObject(356,303.29998779297,-79.199996948242,1002.5)
	elseif source==anw20l then
		guiSetProperty(anw20, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anw20l, anwfunction20, false )
		drawweaponprice(5000)
		anweapon = createObject(1242,303.29998779297,-79.199996948242,1002.5)
		setElementDimension(anweapon,201)
		setElementInterior(anweapon,4)
		setElementRotation(anweapon,0,0,90)
	elseif source==anwext then
		guiSetProperty(anbglogo, "ImageColours", "tl:FF030303 tr:FF030303 bl:FF030303 br:FF030303")	
        addEventHandler( "onClientGUIClick", anwext, anwexitshop, false )
	end
end)
addEventHandler("onClientMouseLeave",getRootElement(),
function()
	if source==anw1l then
		guiSetProperty(anw1, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")
        removeEventHandler( "onClientGUIClick", anw1l, anwfunction1 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw2l then
		guiSetProperty(anw2, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw2l, anwfunction2 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw3l then
		guiSetProperty(anw3, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw3l, anwfunction3 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw4l then
		guiSetProperty(anw4, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw4l, anwfunction4 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw5l then
		guiSetProperty(anw5, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw5l, anwfunction5 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw6l then
		guiSetProperty(anw6, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw6l, anwfunction6 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw7l then
		guiSetProperty(anw7, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw7l, anwfunction7 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw8l then
		guiSetProperty(anw8, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw8l, anwfunction8 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw9l then
		guiSetProperty(anw9, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw9l, anwfunction9 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw10l then
		guiSetProperty(anw10, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw10l, anwfunction10 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw11l then
		guiSetProperty(anw11, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw11l, anwfunction11 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw12l then
		guiSetProperty(anw12, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw12l, anwfunction12 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw13l then
		guiSetProperty(anw13, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw13l, anwfunction13 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw14l then
		guiSetProperty(anw14, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw14l, anwfunction14 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw15l then
		guiSetProperty(anw15, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw15l, anwfunction15 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw16l then
		guiSetProperty(anw16, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw16l, anwfunction16 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw17l then
		guiSetProperty(anw17, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw17l, anwfunction17 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw18l then
		guiSetProperty(anw18, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw18l, anwfunction18 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw19l then
		guiSetProperty(anw19, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw19l, anwfunction19 )
--		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anw20l then
		guiSetProperty(anw20, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anw20l, anwfunction20 )
		destroyElement(anweapon)
		drawweaponprice(0)
	elseif source==anwext then
		guiSetProperty(anbglogo, "ImageColours", "tl:FF0F0F0F tr:FF0F0F0F bl:FF0F0F0F br:FF0F0F0F")	
        removeEventHandler( "onClientGUIClick", anwext, anwexitshop )
	end
end)
local plr = getLocalPlayer()
function anwfunction1()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"m4")
end
function anwfunction2()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"ak47")
end
function anwfunction3()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"mp5")
end
function anwfunction4()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"sniper")
end
function anwfunction5()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"country")
end
function anwfunction6()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"tec")
end
function anwfunction7()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"uzi")
end
function anwfunction8()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"deagle")
end
function anwfunction9()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"silenced")
end
function anwfunction10()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"colt")
end
function anwfunction11()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"obrzyn")
end
function anwfunction12()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"shotgun")
end
function anwfunction13()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"spaz")
end
function anwfunction14()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"granat")
end
function anwfunction15()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"c4")
end
function anwfunction16()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"molotov")
end
function anwfunction17()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"teargas")
end
function anwfunction18()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"parachute")
end
function anwfunction19()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"miotacz")
end
function anwfunction20()
triggerServerEvent("ADANbuyweapon",resourceRoot,plr,"kamizelka")
end

function drawweaponprice(cena)
guiSetText(anlbbglb,"Preço:     "..cena.."$")
end

function anwexitshop()
guiSetVisible(anbg,false)
showChat(true)
setCameraTarget(localPlayer)
showPlayerHudComponent("all",true)
showCursor(false)
end

local msgADbox = guiCreateStaticImage(0.36, 0.15, 0.28, 0.05, "bg.png", true)
guiSetProperty(msgADbox, "ImageColours", "tl:A9000000 tr:A9000000 bl:A9000000 br:A9000000")
local msglabel = guiCreateLabel(0.00, 0.00, 1.00, 1.00, "", true, msgADbox)
guiSetFont(msglabel, "default-bold-small")
guiLabelSetHorizontalAlign(msglabel, "center", false)
guiLabelSetVerticalAlign(msglabel, "center")
guiSetVisible(msgADbox,false)
function addNewPlayerMSGAD(msg)
guiSetVisible(msgADbox,true)
guiSetText(msglabel,""..msg.."")
setTimer(guiSetVisible,6000,1,msgADbox,false)
setTimer(guiSetText,6000,1,msglabel,"")
end
addEvent("ADaddPlayerMSG",true)
addEventHandler("ADaddPlayerMSG",getRootElement(),addNewPlayerMSGAD)