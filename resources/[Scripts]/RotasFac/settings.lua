settings = {
    ["Main"] = {
        ["Routes Marker"] = {size = 1.2, color = {0, 200, 0, 60}},
        ["Dirty Money Value"] = {10000, 20000}
    },
    ["Routes Markers"] = {
        [1] = {position = {-2407.2819824219, -608.11798095703, 132.73460388184 - 1}, size = 1.5, color = {0, 200, 0, 60}, acl = {"Admin"}}
    },
    ["Routes Items"] = {
        [1] = {
            {item = "alcool", give_amount = {5, 20}, name = "ALCOOL1", route = 1},
            {item = "alcool", give_amount = {5, 20}, name = "ALCOOL2", route = 1},
            {item = "alcool", give_amount = {5, 20}, name = "ALCOOL3", route = 2},
            {item = "alcool", give_amount = {5, 20}, name = "ALCOOL4", route = 2}
        }
    },
    ["Routes"] = {
        [1] = {
            {position = {-2397.4406738281, -602.29467773438, 132.6484375 - 1}},
            {position = {-2400.0974121094, -597.65600585938, 132.6484375 - 1}},
            {position = {-2402.650390625, -593.40686035156, 132.6484375 - 1}}
        },
        [2] = {
            {position = {-2409.634765625, -588.92694091797, 132.6484375 - 1}},
            {position = {-2414.03515625, -592.22052001953, 132.6484375 - 1}}
        }
    }
}

function addInfoboxC(message, type)
    exports["rjrp_infobox"]:addIncInfobox(message, type)
end

function addInfoboxS(player, message, type)
    exports["rjrp_infobox"]:addInsInfobox(player, message, type)
end

function createEventHandler(eventName, func)
    if eventName and func then
        addEvent(eventName, true)
        addEventHandler(eventName, root, func)
    end
end