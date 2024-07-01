addEvent("N3xT.useArmas", true)
addEvent("N3xT.useAmmo", true)

local mw = {}

for _, v in ipairs(config.markerarmas) do
    local m = createMarker(v[1], v[2], v[3] - 1, "cylinder", 1.2, 0,255,173, 30)
    createBlipAttachedTo(m, 6, _, _, _, _, _, _, 100)
    table.insert(mw, m)
end

addEventHandler("onPlayerMarkerHit", root,
    function(hitMarker, dimension)
        if (dimension) then
            if not isPedInVehicle(source) then
                if not isGuestAccount(getPlayerAccount(source)) then
                    for i = 1, #mw do
                        if (hitMarker == mw[i]) then
                            if (config.armasperm == true) then
                                for _, v in ipairs(config.armasacl) do
                                    if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                                        triggerClientEvent(source, "N3xT.onShopArmas", source)
                                        break
                                    end
                                end

                            elseif (config.armasperm == false) then
                                triggerClientEvent(source, "N3xT.onShopArmas", source)
                                break
                            end
                        end
                    end
                else
                    messageS(source, "Você precisa estar logado!", "error")
                end
            end
        end
    end
)

addEventHandler("N3xT.useArmas", root,
    function(nome)
        if not getElementData(source, "ArmaMao") then
            local id   = getWeaponByName(nome)
            local slot = getSlotFromWeapon(id)
            setElementData(source, "ArmaMao", nome)
            giveWeapon(source, id, 1)
            setPedWeaponSlot(source, slot)
            takeItem(source, nome, 1)
            messageS(source, "Você equipou a arma #00ff7f"..nome.." #ffffffcom sucesso.", "success")
        else
            messageS(source, "Você já tem uma arma equipada! para guardar #ff0000/garma#ffffff.", "error")
        end
    end
)

addEventHandler("N3xT.useAmmo", root,
    function(nome, quantia)
        local am = getElementData(source, "ArmaMao") or ""
        if isItemEquipped(source, am) then
            local mu = getAmmoByName(am)
            if (mu == nome) then
                local data = getElementData(source, nome)
                if tonumber(data) and (data >= quantia) then
                    local id   = getWeaponByName(am)
                    local slot = getSlotFromWeapon(id)
                    giveWeapon(source, id, quantia)
                    setPedWeaponSlot(source, slot)
                    reloadPedWeapon(source)
                    takeItem(source, nome, quantia)
                else
                    messageS(source, "Você não possuí essa quantidade!", "error")
                end
            else
                messageS(source, "Você não está equipado com a arma que necessita dessa munição!", "error")
            end
        else
            messageS(source, "Você não tem uma arma equipada!", "error")
        end
    end
)

addCommandHandler("garma",
    function(source)
        local am = getElementData(source, "ArmaMao") or ""
        if isItemEquipped(source, am) then
        	if (getSpaceMochila(source, am, 1) == true) then
            	local id    = getWeaponByName(am)
            	local peso  = getElementData(source, "Peso") or 0
            	local vpeso = findPesoByName(am)
            	local mu    = (getPedTotalAmmo(source, getSlotFromWeapon(id)) - 1)
            	local mu2   = getAmmoByName(am)
            	if (getSpaceMochila(source, mu2, mu) == true) then
            		giveItem(source, mu2, mu)
            		setElementData(source, am, 1)
            		setElementData(source, "Peso", peso + vpeso)
            		takeWeapon(source, id)
            		setElementData(source, "ArmaMao", nil)
                    triggerClientEvent(source, "destruirArma",resourceRoot,source,getSlotFromWeapon(id))
            		messageS(source, "A arma foi guardada com sucesso.", "success")
            	end
            end
        else
            messageS(source, "Você não tem uma arma equipada!", "error")
        end
    end
)

function wastedArmas()
    local am = getElementData(source, "ArmaMao") or ""
    if isItemEquipped(source, am) then
        local id = getWeaponByName(am)
        takeWeapon(source, id)
        setElementData(source, "ArmaMao", nil)
    end
end
addEventHandler("onPlayerWasted", root, wastedArmas)

function quitArmas()
    local am = getElementData(source, "ArmaMao") or ""
    if isItemEquipped(source, am) then
    	local id = getWeaponByName(am)
    	if (getSpaceMochila(source, am, 1) == true) then
        	local peso  = getElementData(source, "Peso") or 0
        	local vpeso = findPesoByName(am)
        	local mu    = (getPedTotalAmmo(source, getSlotFromWeapon(id)) - 1)
        	local mu2   = getAmmoByName(am)
        	if (getSpaceMochila(source, mu2, mu) == true) then
        		giveItem(source, mu2, mu)
        	end
        	setElementData(source, am, 1)
        	setElementData(source, "Peso", peso + vpeso)
        	setElementData(source, "ArmaMao", nil)
        end
        takeWeapon(source, id)
    end
end
addEventHandler("onPlayerQuit", root, quitArmas)