local function ToggleEntitySet(interior, entitySet, toggle)
    if toggle then
        ActivateInteriorEntitySet(interior, entitySet, true)
    else
        DeactivateInteriorEntitySet(interior, entitySet, false)
    end
end

Citizen.CreateThread(function()
    -- ============================================================== --
    --                   THE CONTRACT - MPSECURITY                    --
    -- ============================================================== --

    -- Big hangar door at the airport -1016.52, -2974.86, 13.95
    -- RequestIpl("sf_dlc_fixer_hanger_door")
    -- RequestIpl("sf_dlc_fixer_hanger_door_lod")

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --
	
	
	
	-- Agency Banners and Plaques Outside
    RequestIpl("sf_plaque_bh1_05")
    RequestIpl("sf_plaque_hw1_08")
    RequestIpl("sf_plaque_kt1_05")
    RequestIpl("sf_plaque_kt1_08")

    -- -1020.2860 -427.30180 62.861130
    -- ROCKFORD HILL AGENCY
    RequestIpl("sf_fixeroffice_bh1_05")
    EnableExteriorCullModelThisFrame("bh1_05_build1")
    EnableExteriorCullModelThisFrame("bh1_05_em")
    local interiorid = GetInteriorAtCoords(-1020.2860, -427.30180, 62.861130)
	
    -- #region entity sets
    -- Decorations and statues inside the office
    ToggleEntitySet(interiorid, "Entity_Set_Art_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_2", true)
    ToggleEntitySet(interiorid, "Entity_Set_Art_3", false)

    -- Walls style
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_3", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_4", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_5", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_6", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_7", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_8", true)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_9", false)

    -- Access to bedroom
    ToggleEntitySet(interiorid, "Entity_Set_Blocker", false)

    -- First room on the left upstairs
    ToggleEntitySet(interiorid, "Entity_Set_Standard_Office", true)
    ToggleEntitySet(interiorid, "Entity_Set_Armoury", false)

    -- Cardboards in the MP player office 
    ToggleEntitySet(interiorid, "Entity_Set_Moving", false)

    -- Block the access downstairs behind the statue
    ToggleEntitySet(interiorid, "Entity_Set_Tint_AG", true)
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 0) -- Charcoal
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 1) -- Sage
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 2) -- Green
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 3) -- Gray
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 4) -- Purple
    SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 5) -- Red
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 6) -- Brown
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 7) -- Ash
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 8) -- Moss

    -- Add one chair upstair next to one of the desktop
    ToggleEntitySet(interiorid, "Entity_Set_Spare_Seats", true)

    -- Two chairs in front of the desktop in the mp player office
    ToggleEntitySet(interiorid, "Entity_Set_Player_Seats", true)

    -- Two file on mp player desk 
    ToggleEntitySet(interiorid, "Entity_Set_Player_Desk", true)

    -- Golden disks on the mp player desk walls
    ToggleEntitySet(interiorid, "Entity_set_disc_01", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_02", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_03", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_04", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_05", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_06", true)

    -- Golf bag in a corner of the mp office
    ToggleEntitySet(interiorid, "Entity_Set_M_Golf_Intro", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Setup", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Nightclub", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Yacht", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Promoter", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Photo", false)

    -- Add a wallet on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Wallet", true)
    -- Add keys next to the wallet
    ToggleEntitySet(interiorid, "Entity_Set_M_The_Way", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Billionaire", false)

    -- Green toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Families", true)
    -- Purple toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Ballas", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Hood", false)

    -- Wood stick on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Fire_Booth", true)

    -- Trophy on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_50", true)

    -- Brand logo on the shelf behind the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Vehicles", true)
    -- Taxi on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Taxi", true)
    -- Annis Euros on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Tuner", true)
    -- Golf ball on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Gone_Golfing", true)
    -- Laptop with impact on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Hit_List", true)
    -- Stickybomb on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Motel", true)
    -- Cap on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Attack", true)
    -- Construction hat on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Construction", true)
    -- Weed neon on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_01", true)
    -- Weed plant on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_02", true)
    -- rumpo4 on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_03", true)
    -- #endregion entity sets
    RefreshInterior(interiorid)

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --

    -- 384.8140 -60.7270 102.3630
    -- HAWICK AGENCY
    RequestIpl("sf_fixeroffice_hw1_08")
    EnableExteriorCullModelThisFrame("HW1_08_hotplaz_rail")
    EnableExteriorCullModelThisFrame("hw1_08_emissive_c")
    local interiorid = GetInteriorAtCoords(384.8140, -60.7270, 102.3630)
    -- #region entity sets
    -- Decorations ans statues inside the office
    ToggleEntitySet(interiorid, "Entity_Set_Art_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_3", true)

    -- Walls style
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_3", true)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_4", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_5", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_6", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_7", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_8", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_9", false)

    -- Access to bedroom
    ToggleEntitySet(interiorid, "Entity_Set_Blocker", false)

    -- First room on the left upstairs
    ToggleEntitySet(interiorid, "Entity_Set_Standard_Office", true)
    ToggleEntitySet(interiorid, "Entity_Set_Armoury", false)

    -- Cardboards in the MP player office 
    ToggleEntitySet(interiorid, "Entity_Set_Moving", false)

    -- Block the access downstairs behind the statue
    ToggleEntitySet(interiorid, "Entity_Set_Tint_AG", true)
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 0) -- Charcoal
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 1) -- Sage
    SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 2) -- Green
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 3) -- Gray
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 4) -- Purple
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 5) -- Red
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 6) -- Brown
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 7) -- Ash
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 8) -- Moss

    -- Add one chair upstair next to one of the desktop
    ToggleEntitySet(interiorid, "Entity_Set_Spare_Seats", true)

    -- Two chairs in front of the desktop in the mp player office
    ToggleEntitySet(interiorid, "Entity_Set_Player_Seats", true)

    -- Two file on mp player desk 
    ToggleEntitySet(interiorid, "Entity_Set_Player_Desk", true)

    -- Golden disks on the mp player desk walls
    ToggleEntitySet(interiorid, "Entity_set_disc_01", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_02", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_03", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_04", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_05", true)
    ToggleEntitySet(interiorid, "Entity_set_disc_06", true)

    -- Golf bag in a corner of the mp office
    ToggleEntitySet(interiorid, "Entity_Set_M_Golf_Intro", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Setup", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Nightclub", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Yacht", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Promoter", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Photo", false)

    -- Add a wallet on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Wallet", true)
    -- Add keys next to the wallet
    ToggleEntitySet(interiorid, "Entity_Set_M_The_Way", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Billionaire", false)

    -- Green toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Families", true)
    -- Purple toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Ballas", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Hood", false)

    -- Wood stick on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Fire_Booth", true)

    -- Trophy on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_50", true)

    -- Brand logo on the shelf behind the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Vehicles", true)
    -- Taxi on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Taxi", true)
    -- Annis Euros on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Tuner", true)
    -- Golf ball on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Gone_Golfing", true)
    -- Laptop with impact on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Hit_List", true)
    -- Stickybomb on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Motel", true)
    -- Cap on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Attack", true)
    -- Construction hat on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Construction", true)
    -- Weed neon on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_01", true)
    -- Weed plant on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_02", true)
    -- rumpo4 on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_03", true)
    -- #endregion entity sets
    RefreshInterior(interiorid)

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --

    -- -1003.9110 -759.6040 60.894190
    -- VESPUCCI CANALS AGENCY
    RequestIpl("sf_fixeroffice_kt1_05")
    EnableExteriorCullModelThisFrame("kt1_05_glue_b")
    EnableExteriorCullModelThisFrame("kt1_05_kt_emissive_kt1_05")
    local interiorid = GetInteriorAtCoords(-1003.9110, -759.6040, 60.894190)
    -- #region entity sets
    -- Decorations ans statues inside the office
    ToggleEntitySet(interiorid, "Entity_Set_Art_1", true)
    ToggleEntitySet(interiorid, "Entity_Set_Art_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_3", false)

    -- Walls style
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_1", true)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_3", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_4", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_5", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_6", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_7", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_8", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_9", false)

    -- Access to bedroom
    ToggleEntitySet(interiorid, "Entity_Set_Blocker", false)

    -- First room on the left upstairs
    ToggleEntitySet(interiorid, "Entity_Set_Standard_Office", true)
    ToggleEntitySet(interiorid, "Entity_Set_Armoury", false)

    -- Cardboards in the MP player office 
    ToggleEntitySet(interiorid, "Entity_Set_Moving", false)

    -- Block the access downstairs behind the statue
    ToggleEntitySet(interiorid, "Entity_Set_Tint_AG", true)
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 0) -- Charcoal
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 1) -- Sage
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 2) -- Green
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 3) -- Gray
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 4) -- Purple
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 5) -- Red
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 6) -- Brown
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 7) -- Ash
    SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 8) -- Moss

    -- Add one chair upstair next to one of the desktop
    ToggleEntitySet(interiorid, "Entity_Set_Spare_Seats", true)

    -- Two chairs in front of the desktop in the mp player office
    ToggleEntitySet(interiorid, "Entity_Set_Player_Seats", true)

    -- Two file on mp player desk 
    ToggleEntitySet(interiorid, "Entity_Set_Player_Desk", true)

    -- Golden disks on the mp player desk walls
    ToggleEntitySet(interiorid, "Entity_set_disc_01", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_02", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_03", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_04", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_05", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_06", false)

    -- Golf bag in a corner of the mp office
    ToggleEntitySet(interiorid, "Entity_Set_M_Golf_Intro", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Setup", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Nightclub", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Yacht", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Promoter", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Photo", false)

    -- Add a wallet on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Wallet", true)
    -- Add keys next to the wallet
    ToggleEntitySet(interiorid, "Entity_Set_M_The_Way", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Billionaire", false)

    -- Green toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Families", true)
    -- Purple toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Ballas", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Hood", false)

    -- Wood stick on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Fire_Booth", true)

    -- Trophy on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_50", true)

    -- Brand logo on the shelf behind the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Vehicles", true)
    -- Taxi on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Taxi", true)
    -- Annis Euros on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Tuner", true)
    -- Golf ball on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Gone_Golfing", true)
    -- Laptop with impact on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Hit_List", true)
    -- Stickybomb on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Motel", true)
    -- Cap on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Attack", true)
    -- Construction hat on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Construction", true)
    -- Weed neon on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_01", true)
    -- Weed plant on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_02", true)
    -- rumpo4 on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_03", true)
    -- #endregion entity sets
    RefreshInterior(interiorid)

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --

    -- -589.47570 -716.5260 112.00510
    -- LITTLE SEOUL AGENCY
    RequestIpl("sf_fixeroffice_kt1_08")
    EnableExteriorCullModelThisFrame("hei_kt1_08_buildingtop_a")
    EnableExteriorCullModelThisFrame("hei_kt1_08_kt1_emissive_ema")
    local interiorid = GetInteriorAtCoords(-589.47570, -716.5260, 112.00510)
    -- #region entity sets
    -- Decorations ans statues inside the office
    ToggleEntitySet(interiorid, "Entity_Set_Art_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_2", true)
    ToggleEntitySet(interiorid, "Entity_Set_Art_3", false)

    -- Walls style
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_3", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_4", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_5", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_6", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_7", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_8", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wpaper_9", true)

    -- Access to bedroom
    ToggleEntitySet(interiorid, "Entity_Set_Blocker", true)

    -- First room on the left upstairs
    ToggleEntitySet(interiorid, "Entity_Set_Standard_Office", true)
    ToggleEntitySet(interiorid, "Entity_Set_Armoury", false)

    -- Cardboards in the MP player office 
    ToggleEntitySet(interiorid, "Entity_Set_Moving", false)

    -- Block the access downstairs behind the statue
    ToggleEntitySet(interiorid, "Entity_Set_Tint_AG", true)
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 0) -- Charcoal
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 1) -- Sage
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 2) -- Green
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 3) -- Gray
    SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 4) -- Purple
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 5) -- Red
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 6) -- Brown
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 7) -- Ash
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tint_AG", 8) -- Moss

    -- Add one chair upstair next to one of the desktop
    ToggleEntitySet(interiorid, "Entity_Set_Spare_Seats", true)

    -- Two chairs in front of the desktop in the mp player office
    ToggleEntitySet(interiorid, "Entity_Set_Player_Seats", true)

    -- Two file on mp player desk 
    ToggleEntitySet(interiorid, "Entity_Set_Player_Desk", true)

    -- Golden disks on the mp player desk walls
    ToggleEntitySet(interiorid, "Entity_set_disc_01", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_02", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_03", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_04", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_05", false)
    ToggleEntitySet(interiorid, "Entity_set_disc_06", false)

    -- Golf bag in a corner of the mp office
    ToggleEntitySet(interiorid, "Entity_Set_M_Golf_Intro", true)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Setup", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Nightclub", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Yacht", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Promoter", false)
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Photo", false)

    -- Add a wallet on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Limo_Wallet", false)
    -- Add keys next to the wallet
    ToggleEntitySet(interiorid, "Entity_Set_M_The_Way", false)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Billionaire", false)

    -- Green toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Families", false)
    -- Purple toy on the mp player desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Ballas", false)

    -- ???
    ToggleEntitySet(interiorid, "Entity_Set_M_Hood", false)

    -- Wood stick on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Fire_Booth", true)

    -- Trophy on the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_50", false)

    -- Brand logo on the shelf behind the desk
    ToggleEntitySet(interiorid, "Entity_Set_M_Vehicles", false)
    -- Taxi on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Taxi", false)
    -- Annis Euros on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Tuner", false)
    -- Golf ball on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Gone_Golfing", false)
    -- Laptop with impact on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Hit_List", false)
    -- Stickybomb on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Motel", false)
    -- Cap on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Attack", false)
    -- Construction hat on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Construction", true)
    -- Weed neon on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_01", true)
    -- Weed plant on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_02", true)
    -- rumpo4 on the shelf
    ToggleEntitySet(interiorid, "Entity_Set_M_Trip_03", true)
    -- #endregion entity sets
    RefreshInterior(interiorid)

    -- Under the golf -1120.0 -70.0 -100.0
    -- RequestIpl("sf_int_placement_sec_interior_0_dlc_office_sec_milo_")

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --

    -- -1010.0 -70.0 -100.0
    RequestIpl("sf_int_placement_sec_interior_1_dlc_studio_sec_milo_")
    local interiorid = GetInteriorAtCoords(-1010.0, -70.0, -100.0)
    ToggleEntitySet(interiorid, "entity_set_default", false)
    ToggleEntitySet(interiorid, "Entity_Set_FIX_STU_EXT_P1", false)
    ToggleEntitySet(interiorid, "Entity_Set_FIX_STU_EXT_P3A1", false)
    ToggleEntitySet(interiorid, "Entity_Set_FIX_TRIP1_INT_P2", true)
    RefreshInterior(interiorid)

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --

    -- Garage
    -- -1070.0 -70.0 -100.0
    RequestIpl("sf_int_placement_sec_interior_2_dlc_garage_sec_milo_")
    local interiorid = GetInteriorAtCoords(-1070.0, -70.0, -100.0)
    -- Decorations on walls
    ToggleEntitySet(interiorid, "Entity_Set_Art_1", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_2", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_3", true)

    -- Walls style
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_01", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_02", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_03", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_04", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_05", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_06", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_07", true)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_08", false)
    ToggleEntitySet(interiorid, "Entity_Set_Wallpaper_09", false)

    -- Add a wall to block the workshop
    ToggleEntitySet(interiorid, "Entity_Set_Workshop_Wall", false)
    -- Decoration on the wall blocking the workshop
    ToggleEntitySet(interiorid, "Entity_Set_Art_1_NoMod", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_2_NoMod", false)
    ToggleEntitySet(interiorid, "Entity_Set_Art_3_NoMod", false)

    -- Change walls and lights colors
    ToggleEntitySet(interiorid, "Entity_Set_Tints", true)
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 0) -- Charcoal
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 1) -- Sage
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 2) -- Green
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 3) -- Gray
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 4) -- Purple
    SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 5) -- Red
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 6) -- Brown
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 7) -- Ash
    -- SetInteriorEntitySetColor(interiorid, "Entity_Set_Tints", 8) -- Moss

    -- Light in the workshop area
    ToggleEntitySet(interiorid, "Entity_Set_Workshop_Lights", true)
    RefreshInterior(interiorid)

    -- =================================================== --
    -- --------------------------------------------------- --
    -- =================================================== --

    -- Franklin's Mansion  13.01, 544.59, 175.95
    RequestIpl("sf_franklin")

    -- Weed warehouse 2920.0 4470.0 -100.0
    RequestIpl("sf_int_placement_sec_interior_7_dlc_warehouse_sec_milo_")

    -- On top of the recording studio
    RequestIpl("sf_musicrooftop")

    -- RequestIpl("sf_billboards") -- near tequilala

    -- RequestIpl("sf_mansionroof") -- tiny bits of dirt on the roof of the mansion

end)

