local mu = {}

for _, v in ipairs(config.markerutilitarios) do
    local m = createMarker(v[1], v[2], v[3] - 1, "cylinder", 1.2, 0,255,173, 30)
    createBlipAttachedTo(m, 48, _, _, _, _, _, _, 100)
    table.insert(mu, m)
end

addEventHandler("onPlayerMarkerHit", root,
    function(hitMarker, dimension)
        if (dimension) then
            if not isPedInVehicle(source) then
                if not isGuestAccount(getPlayerAccount(source)) then
                    for i = 1, #mu do
                        if (hitMarker == mu[i]) then
                            triggerClientEvent(source, "N3xT.onShopUtilitarios", source)
                            break
                        end
                    end
                else
                    messageS(source, "Você precisa estar logado!", "error")
                end
            end
        end
    end
)