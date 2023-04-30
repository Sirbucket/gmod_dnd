if not PlayerMetaService then
	PlayerMetaService = {}
end

function PlayerMetaService.HurtPlayer(player, attacker, inflictor, damage, type)
	local pos = player:GetPos() + VectorService.ZVector(32)
	local damageinfo = DamageInfo()
	damageinfo:SetAttacker(attacker)
	damageinfo:SetInflictor(inflictor)
	damageinfo:SetDamageType(type)
	damageinfo:SetDamagePosition(pos)
	damageinfo:SetDamage(damage)
end

function PlayerMetaService.IsHurt(player, override)
	override = override or 1
	return player:Health() < player:GetMaxHealth() * override
end