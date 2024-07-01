
cacheMarker = {}
cacheVehicle = {}

addEventHandler('onResourceStart',resourceRoot,
function()
    for i,v in ipairs(settings.corporations) do
        cacheMarker[i] = createMarker(v.marker[1],v.marker[2],v.marker[3] -1, 'cylinder', 1.2, 255,255,255,50)
    end
end)

function markerId(source)
    for i,v in ipairs(cacheMarker) do
        if (v == source) then
            return i
        end
    end
    return false
end
addEventHandler('onMarkerHit',root,
function(thePlayer)
    if (isElement(thePlayer) and getElementType(thePlayer) == 'player' and not isPedInVehicle(thePlayer)) then
        for i,v in ipairs(getElementsByType('marker')) do
            if (isElementWithinMarker(thePlayer,cacheMarker[i])) then
                local markerAcl = markerId(source)
                triggerClientEvent('DrawingOnDisplay',thePlayer,settings.corporations,markerAcl)
           -- else
               -- return
            end
        end
    end
end)

function getPlayerAcl(thePlayer,acl) 
    local theAccount = getAccountName(getPlayerAccount(thePlayer))
    if (isObjectInACLGroup('user.'..theAccount,aclGetGroup(acl))) then
        return true
    end
    return false
end

function skin(thePlayer,selected,id)
    if (isElement(thePlayer) and getElementType(thePlayer) == 'player' and not isPedInVehicle(thePlayer)) then
        if (getPlayerAcl(thePlayer,settings.corporations[id].acl)) then
            setElementModel(thePlayer,selected)
            if (settings.infobox) then
                notify(thePlayer,settings.corporations[id].skin.text)
            else
                outputChatBox(settings.corporations[id].skin.text,thePlayer,255,255,255)
            end
        else
            print('you no part group')
        end
    end
end
addEvent('skin',true)
addEventHandler('skin',resourceRoot,skin)

function armor(thePlayer,selected,id)
    if (isElement(thePlayer) and getElementType(thePlayer) == 'player' and not isPedInVehicle(thePlayer)) then
        if (getPlayerAcl(thePlayer,settings.corporations[id].acl)) then
            giveWeapon(thePlayer,selected,90)
            if (settings.infobox) then
                notify(thePlayer,settings.corporations[id].armor.text)
            else
                outputChatBox(settings.corporations[id].armor.text,thePlayer,255,255,255)
            end
        end
    end
end
addEvent('armor',true)
addEventHandler('armor',resourceRoot,armor)

function vehicle(thePlayer,selected,id)
    if (isElement(thePlayer) and getElementType(thePlayer) == 'player' and not isPedInVehicle(thePlayer)) then
        if (getPlayerAcl(thePlayer,settings.corporations[id].acl)) then
            if cacheVehicle[thePlayer] then
                destroyElement(cacheVehicle[thePlayer])
            end
            cacheVehicle[thePlayer] = createVehicle(selected,settings.corporations[id].vehicle.zone[1],settings.corporations[id].vehicle.zone[2],settings.corporations[id].vehicle.zone[3])
            if (settings.infobox) then
                notify(thePlayer,settings.corporations[id].vehicle.text)
            else
                outputChatBox(settings.corporations[id].vehicle.text,thePlayer,255,255,255)
            end 
        end
    end
end
addEvent('vehicle',true)
addEventHandler('vehicle',resourceRoot,vehicle)


function notify(theElement,text)
    return triggerClientEvent(settings.event,theElement,text)
end