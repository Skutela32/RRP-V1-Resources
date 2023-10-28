-- =============================================== --
-- San Andreas Mercenaries Update, added by Derass --
-- =============================================== --

local function ToggleEntitySet(interior, entitySet, toggle)
    if toggle then
        ActivateInteriorEntitySet(interior, entitySet, true)
    else
        DeactivateInteriorEntitySet(interior, entitySet, false)
    end
end

Citizen.CreateThread(function()

    local interiorid = GetInteriorAtCoords(-1876.62, 3750.0, -100.0)

    ToggleEntitySet(interiorid, "entity_set_lever", true)
    ToggleEntitySet(interiorid, "entity_set_light", true)
    ToggleEntitySet(interiorid, "entity_set_weapons", true)
    ToggleEntitySet(interiorid, "entity_set_create", true)

    RefreshInterior(interiorid)
end)