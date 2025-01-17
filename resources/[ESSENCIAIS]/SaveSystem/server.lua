function playerLogin (thePreviousAccount, theCurrentAccount, autoLogin)
  if  not (isGuestAccount (getPlayerAccount (source))) then
    local accountData = getAccountData (theCurrentAccount, "funmodev2-money")
    if (accountData) then
      local playerMoney = getAccountData (theCurrentAccount, "funmodev2-money")
      local playerSkin = getAccountData (theCurrentAccount, "funmodev2-skin")
      local playerHealth = getAccountData (theCurrentAccount, "funmodev2-health")
      local playerArmor = getAccountData (theCurrentAccount, "funmodev2-armor")
      local R = getAccountData (theCurrentAccount, "funmodev2-R")
      local G = getAccountData (theCurrentAccount, "funmodev2-G")
      local B = getAccountData (theCurrentAccount, "funmodev2-B")
      local playerX = getAccountData (theCurrentAccount, "funmodev2-x")
      local playerY = getAccountData (theCurrentAccount, "funmodev2-y")
      local playerZ = getAccountData (theCurrentAccount, "funmodev2-z")
      local playerInt = getAccountData (theCurrentAccount, "funmodev2-int")
      local playerDim = getAccountData (theCurrentAccount, "funmodev2-dim")
      local playerWanted = getAccountData (theCurrentAccount, "funmodev2-wantedlevel")
     local playerTeam = getAccountData (theCurrentAccount, "funmodev2-Team")
      local playerWeaponID0 = getAccountData (theCurrentAccount, "funmodev2-weaponID0")
      local playerWeaponID1 = getAccountData (theCurrentAccount, "funmodev2-weaponID1")
      local playerWeaponID2 = getAccountData (theCurrentAccount, "funmodev2-weaponID2")
      local playerWeaponID3 = getAccountData (theCurrentAccount, "funmodev2-weaponID3")
      local playerWeaponID4 = getAccountData (theCurrentAccount, "funmodev2-weaponID4")
      local playerWeaponID5 = getAccountData (theCurrentAccount, "funmodev2-weaponID5")
      local playerWeaponID6 = getAccountData (theCurrentAccount, "funmodev2-weaponID6")
      local playerWeaponID7 = getAccountData (theCurrentAccount, "funmodev2-weaponID7")
      local playerWeaponID8 = getAccountData (theCurrentAccount, "funmodev2-weaponID8")
      local playerWeaponID9 = getAccountData (theCurrentAccount, "funmodev2-weaponID9")
      local playerWeaponID10 = getAccountData (theCurrentAccount, "funmodev2-weaponID10")
      local playerWeaponID11 = getAccountData (theCurrentAccount, "funmodev2-weaponID11")
      local playerWeaponID12 = getAccountData (theCurrentAccount, "funmodev2-weaponID12")
      local playerWeaponAmmo0 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo0")
      local playerWeaponAmmo1 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo1")
      local playerWeaponAmmo2 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo2")
      local playerWeaponAmmo3 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo3")
      local playerWeaponAmmo4 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo4")
      local playerWeaponAmmo5 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo5")
      local playerWeaponAmmo6 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo6")
      local playerWeaponAmmo7 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo7")
      local playerWeaponAmmo8 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo8")
      local playerWeaponAmmo9 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo9")
      local playerWeaponAmmo10 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo10")
      local playerWeaponAmmo11 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo11")
      local playerWeaponAmmo12 = getAccountData (theCurrentAccount, "funmodev2-weaponAmmo12")
      spawnPlayer (source, playerX, playerY, playerZ +1, 0, playerSkin, playerInt, playerDim)
      setPlayerMoney (source, playerMoney)
      setTimer (setElementHealth, 50, 1, source, playerHealth)
      setTimer (setPedArmor, 50, 1, source, playerArmor)
      setTimer (setPlayerWantedLevel, 50, 1, source, playerWanted)
      giveWeapon(source, playerWeaponID0, playerWeaponAmmo0, true)
      giveWeapon(source, playerWeaponID1, playerWeaponAmmo1, false)
      giveWeapon(source, playerWeaponID2, playerWeaponAmmo2, false)
      giveWeapon(source, playerWeaponID3, playerWeaponAmmo3, false)
      giveWeapon(source, playerWeaponID4, playerWeaponAmmo4, false)
      giveWeapon(source, playerWeaponID5, playerWeaponAmmo5, false)
      giveWeapon(source, playerWeaponID6, playerWeaponAmmo6, false)
      giveWeapon(source, playerWeaponID7, playerWeaponAmmo7, false)
      giveWeapon(source, playerWeaponID8, playerWeaponAmmo8, false)
      giveWeapon(source, playerWeaponID9, playerWeaponAmmo9, false)
      giveWeapon(source, playerWeaponID10, playerWeaponAmmo10, false)
      giveWeapon(source, playerWeaponID11, playerWeaponAmmo11, false)
      giveWeapon(source, playerWeaponID12, playerWeaponAmmo12, false)
      setCameraTarget (source, source)
      fadeCamera(source, true, 2.0)
      setPlayerNametagColor (source, R, G, B) 
    else
      spawnPlayer (source, 1481.0855712891, -1771.2996826172, 18.795753479004, 0,0, 0, 0)
      setPlayerMoney (source, 9000)
      setCameraTarget (source, source)
      fadeCamera(source, true, 2.0)  
      setPlayerNametagColor (source, 255, 255, 255) 
    end   
  end
end
addEventHandler ("onPlayerLogin", getRootElement(), playerLogin)

function onLogout ()
	kickPlayer (source, nil, "Logging out is disallowed.")
end
addEventHandler ("onPlayerLogout", getRootElement(), onLogout)

function onQuit (quitType, reason, responsibleElement)
  if not (isGuestAccount (getPlayerAccount (source))) then
    account = getPlayerAccount (source)
    if (account) then
      local x,y,z = getElementPosition (source)
      local r,g,b = getPlayerNametagColor (source)
      setAccountData (account, "funmodev2-money", tostring (getPlayerMoney (source)))
      setAccountData (account, "funmodev2-skin", tostring (getPedSkin (source)))
      setAccountData (account, "funmodev2-health", tostring (getElementHealth (source)))
      setAccountData (account, "funmodev2-armor", tostring (getPedArmor (source)))
      setAccountData (account, "funmodev2-R", r)
      setAccountData (account, "funmodev2-G", g)
      setAccountData (account, "funmodev2-B", b)
      setAccountData (account, "funmodev2-x", x)
      setAccountData (account, "funmodev2-y", y)
      setAccountData (account, "funmodev2-z", z)
      setAccountData (account, "funmodev2-int", getElementInterior (source))
      setAccountData (account, "funmodev2-dim", getElementDimension (source))
      setAccountData (account, "funmodev2-wantedlevel", getPlayerWantedLevel (source))
      setAccountData (account, "funmodev2-weaponID0", getPedWeapon (source, 0))
      setAccountData (account, "funmodev2-weaponID1", getPedWeapon (source, 1))
      setAccountData (account, "funmodev2-weaponID2", getPedWeapon (source, 2))
      setAccountData (account, "funmodev2-weaponID3", getPedWeapon (source, 3))
      setAccountData (account, "funmodev2-weaponID4", getPedWeapon (source, 4))
      setAccountData (account, "funmodev2-weaponID5", getPedWeapon (source, 5))
      setAccountData (account, "funmodev2-weaponID6", getPedWeapon (source, 6))
      setAccountData (account, "funmodev2-weaponID7", getPedWeapon (source, 7))
      setAccountData (account, "funmodev2-weaponID8", getPedWeapon (source, 8))
      setAccountData (account, "funmodev2-weaponID9", getPedWeapon (source, 9))
      setAccountData (account, "funmodev2-weaponID10", getPedWeapon (source, 10))
      setAccountData (account, "funmodev2-weaponID11", getPedWeapon (source, 11))
      setAccountData (account, "funmodev2-weaponID12", getPedWeapon (source, 12))
      setAccountData (account, "funmodev2-weaponAmmo0", getPedTotalAmmo (source, 0))
      setAccountData (account, "funmodev2-weaponAmmo1", getPedTotalAmmo (source, 1))
      setAccountData (account, "funmodev2-weaponAmmo2", getPedTotalAmmo (source, 2))
      setAccountData (account, "funmodev2-weaponAmmo3", getPedTotalAmmo (source, 3))
      setAccountData (account, "funmodev2-weaponAmmo4", getPedTotalAmmo (source, 4))
      setAccountData (account, "funmodev2-weaponAmmo5", getPedTotalAmmo (source, 5))
      setAccountData (account, "funmodev2-weaponAmmo6", getPedTotalAmmo (source, 6))
      setAccountData (account, "funmodev2-weaponAmmo7", getPedTotalAmmo (source, 7))
      setAccountData (account, "funmodev2-weaponAmmo8", getPedTotalAmmo (source, 8))
      setAccountData (account, "funmodev2-weaponAmmo9", getPedTotalAmmo (source, 9))
      setAccountData (account, "funmodev2-weaponAmmo10", getPedTotalAmmo (source, 10))
      setAccountData (account, "funmodev2-weaponAmmo11", getPedTotalAmmo (source, 11))
      setAccountData (account, "funmodev2-weaponAmmo12", getPedTotalAmmo (source, 12))
    end
  end
end
addEventHandler ("onPlayerQuit", getRootElement(), onQuit)

function setTeam()
local account = getPlayerAccount(source) -- gets players account
local team = getAccountData (account, "team") -- gets players team
if (team) and getTeamFromName(team) then
      setPlayerTeam(source, getTeamFromName(team)) -- sets players team
     end
end
addEventHandler("onPlayerLogin",root,setTeam) -- sets players team on login
 
function save()
 local team = getPlayerTeam(source) -- Gets the players team
local account = getPlayerAccount(source)
if (team) and not isGuestAccount(account) then -- Checks to see if the player is a guest or not
setAccountData(account, "team", getTeamName(team)) --saves team
 end
    end
addEventHandler("onPlayerQuit", getRootElement(), save) -- saves team on quit
