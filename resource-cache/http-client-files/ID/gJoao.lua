--##################################
--## Script feito por zJoaoFtw_   ##
--## Design feito por JC          ##
--##################################

config = {
    ["Mensagem Start"] = true, --Caso esteja false ele não irá aparecer a mensagem!
}

formatNumber = function(number)   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end 

notifyS = function(player, message, type)
    exports.FR_DxMessages:addBox(player, message, type)
end

notifyC = function(message, type)
    exports.FR_DxMessages:addBox(message, type)
end

function removeHex(message)
	if (type(message) == "string") then
		while (message ~= message:gsub("#%x%x%x%x%x%x", "")) do
			message = message:gsub("#%x%x%x%x%x%x", "")
		end
	end
	return message or false
end