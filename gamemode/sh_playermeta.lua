local meta = FindMetaTable("player")

local function IsHurt(player, override)
	override = override or 1
	return player:Health() < player:GetMaxHealth() * override
end
meta.IsHurt = IsHurt

local function IsArmorHurt(player, override)
	override = override or 1
	return player:Armor() < player:GetMaxArmor() * override
end
meta.IsArmorHurt = IsArmorHurt

local function HasArmor(player)
	return player:Armor() > 0
end
meta.HasArmor = HasArmor

local function IsValidPlayer(player)
	return player and player:IsValid() and player:IsPlayer()
end
meta.IsValidPlayer = IsValidPlayer

local function IsLivingPlayer(player)
	return player and PlayerMetaService.IsPlayer(player) and player:Alive()
end
meta.IsLivingPlayer = IsLivingPlayer