function GM:PlayerSpawn(player)
    player:SetGravity(1)
    player:SetMaxHealth(100)
	player:SetMaxArmor(50)
	player:SetArmor(50)
    player:SetRunSpeed(500)
    player:SetWalkSpeed(250)
    player:Give("weapon_physcannon")
    player:Give("weapon_physgun")
end