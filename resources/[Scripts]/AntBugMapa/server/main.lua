--[[
    contatos;

    carlinloko#7691
    discord.gg/dScTbchXRp
]]

addEventHandler('onResourceStart', resourceRoot, function()
    setTimer(function()
        local state = getOcclusionsEnabled()
        if not state then
            return outputDebugString(getResourceName(getThisResource())..' - Your map is already corrected')
        end

        if setOcclusionsEnabled(false) then 
            outputDebugString(getResourceName(getThisResource())..' - Your map has been corrected successfully')
        else
            outputDebugString(getResourceName(getThisResource())..' - Could not fix your map', 2)
        end
    end, 150, 1)
end)

addEventHandler('onResourceStop', resourceRoot, function()
    local state = getOcclusionsEnabled()
    if state then 
        return false 
    end

    if setOcclusionsEnabled(true) then 
        outputDebugString(getResourceName(getThisResource())..' - Your map has been restored')
    end
end)