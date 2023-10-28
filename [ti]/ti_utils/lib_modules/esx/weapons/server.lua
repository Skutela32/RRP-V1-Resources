local ESX = select(2, ...)
local module = {}

function module.getNameFromHash(hash)
    local unsigned = hash % 0x100000000
    local signed   = hash - 0x100000000
    local weapon   = ESX.GetWeaponFromHash(hash) or ESX.GetWeaponFromHash(unsigned) or ESX.GetWeaponFromHash(signed)
    return weapon and weapon.name or "UNKNOWN"
end

return module