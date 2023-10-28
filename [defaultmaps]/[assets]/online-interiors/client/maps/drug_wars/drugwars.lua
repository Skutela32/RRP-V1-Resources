-- ==============-----------------== --
-- Drug wars Update, added by AvaN0x --
-- ===============-----------------= --

local function ToggleEntitySet(interior, entitySet, toggle)
    if toggle then
        ActivateInteriorEntitySet(interior, entitySet, true)
    else
        DeactivateInteriorEntitySet(interior, entitySet, false)
    end
end


Citizen.CreateThread(function()

	RequestIpl("xm3_int_placement_xm3_interior_0_dlc_int_01_xm3_milo_")
	RequestIpl("xm3_int_placement_xm3_interior_1_dlc_int_02_xm3_milo_")
	RequestIpl("xm3_int_placement_xm3_interior_2_dlc_int_03_xm3_milo_")
	RequestIpl("xm3_int_placement_xm3_interior_3_dlc_int_04_xm3_milo_")
	RequestIpl("xm3_collision_fixes")
	RequestIpl("xm3_cutscene_doors")
	RequestIpl("xm3_doc_sign")
	RequestIpl("xm3_garage_fix")
	RequestIpl("xm3_security_fix")
	RequestIpl("xm3_stash_cams")
	RequestIpl("xm3_sum2_fix")
	RequestIpl("xm3_sum2_fix")
	-- RequestIpl("xm3_train_crash")
	RequestIpl("xm3_warehouse")
	RequestIpl("xm3_warehouse_lod")
	RequestIpl("xm3_warehouse_grnd")
	
	


-- RV VAN

    local interiorid = GetInteriorAtCoords(485.0, -2626.0, -50.0)
	
	RequestIpl("xm3_dlc_int_01_xm3")
	
-- ENTITYSETS FOR RV VAN

    ToggleEntitySet(interiorid, "set_equipment_upgrade", true)
    ToggleEntitySet(interiorid, "set_product_01", true)
    ToggleEntitySet(interiorid, "set_product_02", true)
    ToggleEntitySet(interiorid, "set_product_03", true)
    ToggleEntitySet(interiorid, "set_product_04", true)
    ToggleEntitySet(interiorid, "set_product_05", true)
    ToggleEntitySet(interiorid, "set_supplies_01", true)
    ToggleEntitySet(interiorid, "set_supplies_02", true)
    ToggleEntitySet(interiorid, "set_supplies_03", true)
    ToggleEntitySet(interiorid, "set_supplies_04", true)
    ToggleEntitySet(interiorid, "set_supplies_05", true)
	
    RefreshInterior(interiorid)


-- NEW GARAGE. Change colours by changing the number 8 (red) in the 'SetInteriorEntitySetColor(intId, "entity_set_tint_01", 8)' field. Numbers I've tried are 5, 6, 7, 8, 9

 RequestIpl("xm3_int_placement_xm3_interior_1_dlc_int_01_xm3_milo_")
CreateThread(function()
    intId = GetInteriorAtCoords(vec(520, -2625, -50))
    ActivateInteriorEntitySet(intId, "entity_set_shell_03")
    ActivateInteriorEntitySet(intId, "entity_set_tint_01")
    ActivateInteriorEntitySet(intId, "entity_set_numbers_01")
    SetInteriorEntitySetColor(intId, "entity_set_tint_01", 8)
    RefreshInterior(intId)
end)



-- FREAKSHOW GANG HIDEOUT

local interiorid = GetInteriorAtCoords(570.0, -415.0, -70.0)

    ToggleEntitySet(interiorid, "entity_set_roller_door_closed", true)
    ToggleEntitySet(interiorid, "entity_set_roller_door_open", false)
	
    RefreshInterior(interiorid)
	
	
	
-- NEW MORGUE

local interiorid = GetInteriorAtCoords(495.0, -2560.0, -50.0)

	 RequestIpl("xm3_dlc_int_03_xm3")
	 
	RefreshInterior(interiorid)


end)
