local meta = FindMetaTable("player")

local function HurtPlayer(player, damage, type, attacker, inflictor)
	if not player then
		error("no player in damage")
		return
	end
	damage = math.floor(damage)

	local pos = player:GetPos() + ZVector(32)
	local damageinfo = DamageInfo()
	damageinfo:SetAttacker(attacker)
	damageinfo:SetInflictor(inflictor)
	damageinfo:SetDamageType(type or DMG_GENERIC)
	damageinfo:SetDamagePosition(pos)
	damageinfo:SetDamage(math.floor(damage))

	player:TakeDamageInfo(damageinfo)

	return damage
end
meta.HurtPlayer = HurtPlayer