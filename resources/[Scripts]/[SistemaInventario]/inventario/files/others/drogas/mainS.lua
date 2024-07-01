addEvent("N3xT.DrogasItem", true)
addEvent("N3xT.useDrogas", true)

local dg = createMarker(config.dg[1], config.dg[2], config.dg[3] - 1, "cylinder", 1.2, 0,255,173, 30)
createBlipAttachedTo(dg, 62, _, _, _, _, _, _, 100)

addEventHandler("onPlayerMarkerHit", root,
    function(hitMarker, dimension)
        if (dimension) then
            if (hitMarker == dg) then
                if not isPedInVehicle(source) then
                    triggerClientEvent(source, "N3xT.onPontoDrogas", source)
                end
            end
        end
    end
)

addEventHandler("N3xT.DrogasItem", root,
    function(lado)
        if (lado == 1) then
            takeItem(source, "Fertilizante", 1)
            takeItem(source, "Semente Maconha", 1)
        elseif (lado == 2) then
            giveItem(source, "Maconha", 1)
        end
    end
)

addEventHandler("N3xT.useDrogas", root,
    function(name)
        if not getElementData(source, "UsandoDroga") then
            if (name == "Maconha") then
                local fome   = getElementData(source, config.fomesede[1]) or 0
                local health = getElementHealth(source)
                triggerClientEvent(source, "N3xT.EffectDroga", source, 1)
                setPedAnimation(source, "GANGS", "smkcig_prtl", -1, false, false, false, false)
                setPedWalkingStyle(source, 137)
                setElementData(source, "UsandoDroga", true)
                setTimer(setPedWalkingStyle, 60000*config.efeitotime, 1, source, 0)
                setTimer(setElementData, 60000*config.efeitotime, 1, source, "UsandoDroga", nil)
                takeItem(source, name, 1)

                if tonumber(fome) then
                	if ((fome - 10) >= 0) then
                		setElementData(source, config.fomesede[1], fome - 10)
                	else
                		setElementData(source, config.fomesede[1], 0)
                	end
                end

                if (health <= 80) then
                    setElementHealth(source, health + 20)
                else
                    local soma = (100 - health)
                    setElementHealth(source, health + soma)
                end

            elseif (name == "Cocaína") then
                local fome   = getElementData(source, config.fomesede[1]) or 0
                local health = getElementHealth(source)
                setElementHealth(source, health - 10)
                triggerClientEvent(source, "N3xT.EffectDroga", source, 2)
                setPedAnimation(source, "GANGS", "smkcig_prtl", -1, false, false, false, false)
                setPedWalkingStyle(source, 137)
                setElementData(source, "UsandoDroga", true)
                setTimer(setPedWalkingStyle, 60000*config.efeitotime, 1, source, 0)
                setTimer(setElementData, 60000*config.efeitotime, 1, source, "UsandoDroga", nil)
                takeItem(source, name, 1)

                if tonumber(fome) then
                	if ((fome + 20) <= 100) then 
                    	setElementData(source, config.fomesede[1], fome + 20)
                    else
                    	setElementData(source, config.fomesede[1], 100)
                    end
                end
            end
        else
            messageS(source, "Você já está drogado!", "error")
        end
    end
)