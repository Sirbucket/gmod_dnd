GM.Modifiers = {}
GM.PlayerModifiers = {}

function GM:CreateNewModifier(id, data_table)
	self.Modifiers[id] = {}
	self.Modifiers[id].Value = 1
	self.Modifiers[id].IsPositive = true
	self.Modifiers[id].Index = #self.Modifiers[id] + 1
	if data_table then
		for k, v in pairs(data_table) do
			self.Modifiers[id][k] = v
		end
	end
end

function GM:AddPlayerModifier(pl, id)
	self.PlayerModifiers[pl][id] = self.Modifiers[id]
end

function GM:GiveModifierValuesToPlayer(pl)
	for k, v in pairs(self.Modifiers) do
		self.PlayerModifiers[pl][k] = v
	end
end

function GM:AddModifierValue(pl, id, value)
	self.PlayerModifiers[pl][id].Value = self.PlayerModifiers[pl][id].Value + value
end

function GM:GetModifierValue(pl, id)
	return self.PlayerModifiers[pl][id].Value
end

--Base stats
GAMEMODE:CreateNewModifier("max_health", {Value = 100})
GAMEMODE:CreateNewModifier("health_regen_rate", {Value = 2, IsPositive = false})

GAMEMODE:CreateNewModifier("speed", {Value = 25}) --every 10 is 1 foot

GAMEMODE:CreateNewModifier("max_level", {Value = 20})
GAMEMODE:CreateNewModifier("level", {Value = 1})

GAMEMODE:CreateNewModifier("strength", {Value = 10})
GAMEMODE:CreateNewModifier("dexterity", {Value = 10})
GAMEMODE:CreateNewModifier("constitution", {Value = 10})
GAMEMODE:CreateNewModifier("intelligence", {Value = 10})
GAMEMODE:CreateNewModifier("wisdom", {Value = 10})
GAMEMODE:CreateNewModifier("charisma", {Value = 10})
GAMEMODE:CreateNewModifier("proficiency", {Value = 2})
GAMEMODE:CreateNewModifier("armor_class", {Value = 10})

--Damage taken multiplicative
GAMEMODE:CreateNewModifier("bludgeoning_damage_taken")
GAMEMODE:CreateNewModifier("slashing_damage_taken")
GAMEMODE:CreateNewModifier("piercing_damage_taken")
GAMEMODE:CreateNewModifier("magic_damage_taken")
GAMEMODE:CreateNewModifier("fire_damage_taken")
GAMEMODE:CreateNewModifier("cold_damage_taken")
GAMEMODE:CreateNewModifier("poison_damage_taken")
GAMEMODE:CreateNewModifier("force_damage_taken")
GAMEMODE:CreateNewModifier("radiant_damage_taken")
GAMEMODE:CreateNewModifier("necrotic_damage_taken")
GAMEMODE:CreateNewModifier("acid_damage_taken")
GAMEMODE:CreateNewModifier("lightning_damage_taken")
GAMEMODE:CreateNewModifier("thunder_damage_taken")
GAMEMODE:CreateNewModifier("psychic_damage_taken")

--Static dnd resistance
GAMEMODE:CreateNewModifier("bludgeoning_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("slashing_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("piercing_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("magic_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("fire_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("cold_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("poison_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("force_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("radiant_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("necrotic_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("acid_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("lightning_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("thunder_resistance", {Value = 0})
GAMEMODE:CreateNewModifier("psychic_resistance", {Value = 0})

--Immunities
GAMEMODE:CreateNewModifier("bludgeoning_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("slashing_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("piercing_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("magic_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("fire_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("cold_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("poison_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("force_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("radiant_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("necrotic_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("acid_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("lightning_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("thunder_immunity", {Value = 0})
GAMEMODE:CreateNewModifier("psychic_immunity", {Value = 0})

GAMEMODE:CreateNewModifier("max_magic_items", {Value = 3})
GAMEMODE:CreateNewModifier("attuned_magic_items", {Value = 0})

--Class specific
GAMEMODE:CreateNewModifier("max_mana", {Value = 0})
GAMEMODE:CreateNewModifier("mana_regen_rate", {Value = 2, IsPositive = false})
GAMEMODE:CreateNewModifier("mana_regen_delay", {Value = 5, IsPositive = false})

--Weapon specific