------------------[[CHAT CV]]---------------------------

function chatcv ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayercv ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayercv ( player ) ) then
                outputChatBox ( "* #FF0000「 @CV 」 - ".. getPlayerName(thePlayer).." ["..ID.."] ".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "cv", chatcv )
 
function isPlayercv ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( cv ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end

------------------[[CHAT PCC]]---------------------------

function chatpcc ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerpcc ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerpcc ( player ) ) then
                outputChatBox ( "* #969697「 @PCC 」 ".. getPlayerName(thePlayer).."["..ID.."] ".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "pcc", chatpcc )
 
function isPlayerpcc ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( pcc ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end
------------------[[CHAT GROTA]]---------------------------

function chatgrota ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayergrota ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayergrota ( player ) ) then
                outputChatBox ( "* #00FF00「 @GROTA 」 - ".. getPlayerName(thePlayer).." ["..ID.."] ".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "grota", chatgrota )
 
function isPlayergrota ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( grota ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end