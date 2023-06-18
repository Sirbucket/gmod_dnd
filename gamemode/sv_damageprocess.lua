local meta = FindMetaTable("Player")

function meta:ProcessDamage(dmginfo)
	local damage_type_raw = dmginfo:GetDamageType()
	local types = self.DamageTypes
	local damage_type = types[damage_type_raw]

	local is_immune = self:GetModifierValue(damage_type.."_immunity") or 0
	if is_immune > 0 then return end

	local resistance = self:GetModifierValue(damage_type.."_resistance") or 0
	if resistance > 0 then dmginfo:ScaleDamage(0.5) end

	local taken_value = self:GetModifierValue(damage_type.."_damage_taken") or 1
	if taken_value ~= 1 then dmginfo:SetDamage(dmginfo:GetDamage() * taken_value) end

	local attacker = dmginfo:GetAttacker()
	local inflictor = dmginfo:GetInflictor()
end