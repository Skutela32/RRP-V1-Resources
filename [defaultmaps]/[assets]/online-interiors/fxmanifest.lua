fx_version "cerulean"
game "gta5"

author "TayMcKenzieNZ"
description "A FiveM resource adding IPL / map edits, entitysets, teleports, and blips to the map for FiveM."
repository "https://github.com/TayMcKenzieNZ/online-interiors"

dependencies {"bob74_ipl"}


    data_file 'DLC_ITYP_REQUEST' 'stream/Casino Penthouse\vw_vwdlc_int_02.ytyp'


client_scripts {
    "client/*.lua",
    "client/maps/after_hours/nightclub/*.lua",
    "client/maps/after_hours/nightclub_exteriors/*.lua",
    "client/maps/bikers/businesses/cocaine/*.lua",
    "client/maps/bikers/businesses/counterfeit_cash/*.lua",
    "client/maps/bikers/businesses/document_forgery/*.lua",
    "client/maps/bikers/businesses/meth/*.lua",
    "client/maps/bikers/businesses/weed/*.lua",
    "client/maps/bikers/clubhouses/clubhouse_1/*.lua",
    "client/maps/bikers/clubhouses/clubhouse_2/*.lua",
    "client/maps/bikers/gang/*.lua",
    "client/maps/doomsday/facility/*.lua",
    "client/maps/finance_felony/offices/arcadius_business_centre/*.lua",
    "client/maps/finance_felony/offices/lom_bank/*.lua",
    "client/maps/finance_felony/offices/maze_bank/*.lua",
    "client/maps/finance_felony/offices/maze_bank_west/*.lua",
    "client/maps/finance_felony/organization/*.lua",
	"client/maps/fib_fountain/*lua",
    "client/maps/gunrunning/bunker/*.lua",
    "client/maps/gunrunning/yacht/*.lua",
    "client/maps/heists/yacht/*.lua",
    "client/maps/import_export/garages/arcadius_business_centre/*.lua",
    "client/maps/import_export/garages/lom_bank/*.lua",
    "client/maps/import_export/garages/maze_bank/*.lua",
    "client/maps/import_export/garages/maze_bank_west/*.lua",
    "client/maps/import_export/vehicle_warehouse/*.lua",
    "client/maps/smugglers/hanger/*.lua",
     "client/maps/cpyacht/*.lua",

-- These will not work unless the gamebuild is forced to a higher dlc level than FiveM's default Arena Wars level.


	"client/maps/casino/*.lua",      -- DLC Tuners (Requires forced gamebuild 2060 or higher)
	"client/maps/arcade/*.lua",      -- DLC Casino Heist (Requires forced gamebuild 2189 or higher)
	"client/maps/mptuners/*.lua",    -- DLC Tuners (Requires forced gamebuild 2189 or higher)
	"client/maps/mpsecurity/*.lua",  -- DLC Contracts (Requires forced gamebuild 2545 or higher)
	"client/maps/drug_wars/*.lua",    -- DLC Los Santos Drug Wars (Requires forced gamebuild 2802 or higher)
	"client/maps/mercenary/*.lua"    -- DLC San Andreas Mercenaries  (Requires forced gamebuild 2944 or higher)
	
}


data_file 'DLC_ITYP_REQUEST' 'stream/hollywood_metadata_012_strm.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/m23_1_dlc_int_03_m23_1.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/h4_dlc_int_02_h4.ytyp'

data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_light_stage.ytyp'

