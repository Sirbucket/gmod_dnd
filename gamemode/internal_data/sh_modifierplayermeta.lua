local meta = FindMetaTable("Player")

function meta:GetModifierValue(id)
	return GAMEMODE:GetModifierValue(self, id)
end