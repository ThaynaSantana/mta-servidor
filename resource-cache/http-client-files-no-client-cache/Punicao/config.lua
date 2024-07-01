config = {
    ["open"] = {
        ["command"] = "punir";
        ["command-unpunish"] = "despunir";
        ["permissions"] = {"Console", "STAFF"};
    };

    ["positions"] = { -- // {pos = (x, y, z) dim, int}
        ["prison"] = {1543.14734, -1353.29407, 329.47400, 999, 0};
        ["prison-exit"] = {1579.22180, -1331.79199, 16.48438, 0, 0};
    };

    ["logs"] = {
        ["web-hook"] = "https://discordapp.com/api/webhooks/1159620776673157220/HTNDRG2Eh5O3b56gKq32qzNXkfFku5SuCkNk6Gc7fHFzEgO61ECmT5OUelEcz0NVAtF-";
    };
}

function sendMessage(action, element, message, type)
    if action == 'server' then
        exports['FR_DxMessages']:addBox(element, message, type)
    elseif action == 'client' then 
        exports['FR_DxMessages']:addBox(message, type)
    end
end