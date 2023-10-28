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

    local interiorid = GetInteriorAtCoords(1200.0, -3250.0, -50.0)

    ToggleEntitySet(interiorid, "showroom", true)       -- expo zone
    ToggleEntitySet(interiorid, "extra_light", false)   -- extra light
    ToggleEntitySet(interiorid, "showroom_wall", true)  -- wall vinewood car club on expo zone
    ToggleEntitySet(interiorid, "extra_door", true)     -- extra door
    ToggleEntitySet(interiorid, "wall_sign", true)      -- sign on the wall

    RefreshInterior(interiorid)
end)