function copom ( thePlayer, _, ... )
    local message = table.concat ( { ... }, " " )
    local ID = getElementData ( thePlayer, "ID" ) or "N/C"
    if ( isPlayerCOPOM ( thePlayer ) ) then
        for _, player in ipairs ( getElementsByType ( "player" ) ) do
            if ( isPlayerCOPOM ( player ) ) then
                outputChatBox ( "* #fafafa「 @COPOM #969697 」 - ".. getPlayerName(thePlayer).." ("..ID..") ".. message, player, 255, 255, 255, true )
            end
        end
    end
end
addCommandHandler ( "c", copom )
 
function isPlayerCOPOM ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( policial ) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
            inGroup = true
            break
        end
    end
 
    return inGroup
end