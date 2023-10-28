local ESX = select(2,...)

local locale = ESX.GetConfig().locale or "en"
local locales = {}

local module = {}

function module.set(t)
    if not t[locale] then
        return
    end

    for k,v in pairs(t[locale]) do
        locales[k] = v
    end
end

function module.get(k)
    if not k then
        return locales
    end
    
    return locales[k] or ("UNK_LOCALE (" .. k .. ")")
end

return module