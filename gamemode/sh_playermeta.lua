if not PlayerMetaService then
	PlayerMetaService = {}
end

function PlayerMetaService.HurtPlayer(player, attacker, inflictor, damage, type)
	if not player then
		error("no player in damage")
	end
	damage = math.floor(damage)

	local pos = player:GetPos() + VectorService.ZVector(32)
	local damageinfo = DamageInfo()
	damageinfo:SetAttacker(attacker)
	damageinfo:SetInflictor(inflictor)
	damageinfo:SetDamageType(type or DMG_GENERIC)
	damageinfo:SetDamagePosition(pos)
	damageinfo:SetDamage(math.floor(damage))

	player:TakeDamageInfo(damageinfo)
end

function PlayerMetaService.IsHurt(player, override)
	override = override or 1
	return player:Health() < player:GetMaxHealth() * override
end

function PlayerMetaService.IsArmorHurt(player, override)
	override = override or 1
	return player:Armor() < player:GetMaxArmor() * override
end

function PlayerMetaService.HasArmor(player)
	return player:Armor() > 0
end

function PlayerMetaService.IsPlayer(player)
	return player and player:IsValid() and player:IsPlayer()
end

function PlayerMetaService.IsLivingPlayer(player)
	return player and PlayerMetaService.IsPlayer(player) and player:Alive()
end
