local invName = 'default'

local resStates = {
	started = true,
	starting = true,
	stopped = true,
	stopping = true,
	uninitialized = true,
	missing = false,
	unknown = false
}

local resNames = {
	'mf-inventory',
	'ox_inventory',
	'qs-inventory'
}

for _,resName in ipairs(resNames) do
	if resStates[GetResourceState(resName)] then
		invName = resName
		break
	end
end

return exports['es_extended']:getSharedObject(),invName