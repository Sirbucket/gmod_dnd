function GM:Move(pl, move)
	local speed = pl:GetModifierValue("speed") * 10
	move:SetMaxClientSpeed(speed)
	move:SetMaxSpeed(speed)
end