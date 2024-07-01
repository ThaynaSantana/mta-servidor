

local function playGunfireSound(weaponID)
    local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(source)
    local px, py, pz = getElementPosition ( source )

       if weaponID == 22 then --colt45
        	local sound = playSound3D("sounds/weap/Colt45.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 100)
	elseif weaponID == 23 then --teaser
	        local sound = playSound3D("sounds/weap/Silenced.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 100)
	elseif weaponID == 24 then--deagle
	        local sound = playSound3D("sounds/weap/Deagle.mp3", muzzleX, muzzleY, muzzleZ, false)
       	setSoundMaxDistance(sound, 100)
	elseif weaponID == 25 then--shotgun
	        local sound = playSound3D("sounds/weap/Shotgun.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 100)
	elseif weaponID == 26 then--sawn-off
	        local sound = playSound3D("sounds/weap/Sawed-Off.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 100)
	elseif weaponID == 31 then--m4
	        local sound = playSound3D("sounds/weap/M4.wav", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 100)
	elseif weaponID == 34 then--sniper
	        local sound = playSound3D("sounds/weap/Sniper.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 100)
    end
end
addEventHandler("onClientPlayerWeaponFire", root, playGunfireSound)

