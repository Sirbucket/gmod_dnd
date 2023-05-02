local stored_x_vectors = {}
local stored_y_vectors = {}
local stored_z_vectors = {}

function XVector(amount)
	if stored_x_vectors[amount] then
		return stored_x_vectors[amount]
	end

	local vector = Vector(amount, 0, 0)

	stored_x_vectors[amount] = vector
	return vector
end

function YVector(amount)
	if stored_y_vectors[amount] then
		return stored_y_vectors[amount]
	end

	local vector = Vector(0, amount, 0)

	stored_y_vectors[amount] = vector
	return vector
end

function ZVector(amount)
	if stored_z_vectors[amount] then
		return stored_z_vectors[amount]
	end

	local vector = Vector(0, 0, amount)

	stored_z_vectors[amount] = vector
	return vector
end