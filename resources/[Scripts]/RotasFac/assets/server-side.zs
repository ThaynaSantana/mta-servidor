local markers = {}

for i, v in ipairs(settings["Routes Markers"]) do
    markers[i] = createMarker(v.position[1], v.position[2], v.position[3], "cylinder", v.size, unpack(v.color))
    addEventHandler("onMarkerHit", markers[i], function(player)
        if getElementType(player) == "player" and not isPedInVehicle(player) and not isGuestAccount(getPlayerAccount(player)) then
            local access = false
            for i, v in ipairs(v.acl) do
                if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(v)) then
                    access = true
                    break
                end
            end
            triggerClientEvent(player, getResourceName(getThisResource())..":openCloseRoute", player, i)
        end
    end)
    addEventHandler("onMarkerLeave", markers[i], function(player)
        if getElementType(player) == "player" then
            triggerClientEvent(player, getResourceName(getThisResource())..":openCloseRoute", player)
        end
    end)
end

createEventHandler(getResourceName(getThisResource())..":setAnimation", function(...)
    setPedAnimation(source, ...)
end)

createEventHandler(getResourceName(getThisResource())..":giveItem", function(item, amount)
    exports.MODinventario:GiveAndTakeAndGetItem("give", source, item, amount)
end)