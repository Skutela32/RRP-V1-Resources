local QBCore = select(2, ...)
local module = {}

function module.getNameFromHash(hash)
    local unsigned = hash % 0x100000000
    local signed   = hash - 0x100000000
    
    for name in pairs(QBCore.Shared.Weapons) do
        local weaponHash = GetHashKey(name)
        
        if weaponHash == hash or weaponHash == unsigned or weaponHash == signed then
            return name
        end
    end

    return "UNKNOWN"
end

return module