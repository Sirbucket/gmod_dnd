local meta = FindMetaTable("player")

function meta:IsHurt(override)
	override = override or 1
	return self:Health() < self:GetMaxHealth() * override
end

function meta:IsArmorHurt(override)
	override = override or 1
	return self:Armor() < self:GetMaxArmor() * override
end

function meta:HasArmor()
	return self:Armor() > 0
end

function meta:IsValidPlayer()
	return self and self:IsValid() and self:IsPlayer()
end

function meta:IsLivingPlayer()
	return self and self:IsValidPlayer() and self:Alive()
end