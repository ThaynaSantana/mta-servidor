addEvent("N3xT.giveMoneyDinheiroSujo", true)

local ds = createMarker(config.ds[1], config.ds[2], config.ds[3] - 1, "cylinder", 1.2, 0,255,173, 30)
createBlipAttachedTo(ds, 60, _, _, _, _, _, _, 100)

addEventHandler("onPlayerMarkerHit", root,
    function(markerHit, dimension)
        if (dimension) then
            if (markerHit == ds) then
                if not isPedInVehicle(source) then
                    triggerClientEvent(source, "N3xT.onDinheiroSujo", source)
                end
            end
        end
    end
)

addEventHandler("N3xT.giveMoneyDinheiroSujo", root,
	function(soma)
		givePlayerMoney(source, soma)
	end
)