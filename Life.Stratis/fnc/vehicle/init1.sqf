// A_vehicle_fnc_init1

#include "..\..\includes\macro.h"


A_vehicle_var_loadout_entries = [
	["O_Heli_Light_02_F",
		[
			["_nodagr", [["removeWeaponGlobal","missiles_DAGR",1]]]
		]
	],
	["B_Heli_Attack_01_F",
		[
			["_nodagr", [["removeWeaponGlobal","missiles_DAGR",1]]],
			["_noasraam", [["removeWeaponGlobal","missiles_ASRAAM",1]]]
		]
	],
	["O_Heli_Attack_02_F",
		[
			["_noscalpel", [["removeWeaponGlobal","missiles_SCALPEL",1]]],
			["_noskyfire", [["removeWeaponGlobal","rockets_Skyfire",1]]]
		]
	],
	["O_Heli_Attack_02_black_F",
		[
			["_noscalpel", [["removeWeaponGlobal","missiles_SCALPEL",1]]],
			["_noskyfire", [["removeWeaponGlobal","rockets_Skyfire",1]]]
		]
	],
	["O_Heli_Attack_02_black_F",
		[
			["_nozephyr", [["removeWeaponGlobal","missiles_Zephyr",1]]],
			["_noasraam", [["removeWeaponGlobal","missiles_ASRAAM",1]]]
		]
	]
];

A_vehicle_var_loadout_entry_class = 0;
A_vehicle_var_loadout_entry_variants = 1;

A_vehicle_var_loadout_entry_variant_id = 0;
A_vehicle_var_loadout_entry_variant_mods = 1;

A_vehicle_var_loadout_entry_variant_mod_method = 0;
A_vehicle_var_loadout_entry_variant_mod_arguments = 1;
A_vehicle_var_loadout_entry_variant_mod_repeat = 2;

A_vehicle_var_texture_entries = [
	["C_Offroad_01_F",
		[
			["_red", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_co.paa"]]],
			["_white", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_base02_co.paa"]]],
			["_tan", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_base01_co.paa"]]],
			["_bur", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_base04_co.paa"]]],
			["_rider", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_base05_co.paa"]]],
			["_sky_blue", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_nohq.paa"]]],
			["_dark_blue", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_base03_co.paa"]]],
			["_hot_pink", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_smdi.paa"]]],
			["_black", [[0,"\A3\soft_f\Offroad_01\Data\offroad_01_ext_ti_ca.paa"]]]
		]
	],
	["C_Hatchback_01_F",
		[
			["_light_tan", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"]]],
			["_dark_tan", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base05_co.paa"]]],
			["_light_gray", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"]]],
			["_dark_gray", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"]]],
			["_light_blue", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"]]],
			["_dark_blue", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"]]],
			["_light_green", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"]]],
			["_light_yellow", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"]]],
			["_black", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"]]],
			["_white", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_co.paa"]]]
		]
	],
	["C_Hatchback_01_sport_F",
		[
			["_red", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"]]],
			["_blue", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"]]],
			["_orange", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"]]],
			["_white", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"]]],
			["_light_gray", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"]]],
			["_dark_green", [[0,"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"]]]
		]
	],
	["C_SUV_01_F",
		[
			["_red", [[0,"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"]]],
			["_black", [[0,"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"]]],
			["_gray", [[0,"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"]]],
			["_orange", [[0,"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"]]]
		]
	],
	//F - (front), B - (back)
	["C_Van_01_transport_F",
		[
			["_fwhite", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"]]],
			["_bwhite", [[1,"\a3\soft_f_gamma\Van_01\Data\van_01_adds_co.paa"]]],
			["_fred", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"]]],
			["_bred", [[1,"\a3\soft_f_gamma\Van_01\Data\van_01_adds_co.paa"]]],
			["_fcamo", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa"]]],
			["_bcamo", [[1,"\a3\soft_f_gamma\Van_01\Data\van_01_adds_ig_co.paa"]]]
		]
	],
	//F - (front), B - (back)
	["C_Van_01_fuel_F",
		[
			["_fwhite", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"]]],
			["_bwhite", [[1,"\a3\soft_f_gamma\Van_01\Data\van_01_tank_co.paa"]]],
			["_fred", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"]]],
			["_bred", [[1,"\a3\soft_f_gamma\Van_01\Data\van_01_tank_red_co.paa"]]],
			["_fcamo", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa"]]],
			["_bcamo", [[1,"\a3\soft_f_gamma\Van_01\Data\van_01_tank_ig_co.paa"]]]
		]
	],
	//F - (front)
	["C_Van_01_box_F",
		[
			["_fwhite", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"]]],
			["_fred", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"]]],
			["_fcamo", [[0,"\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa"]]]
		]
	],
	//Speedboat
	["C_Boat_Civil_01_F",
		[
			["_icamo", [[0,"\a3\boat_f_beta\Boat_Armed_01\Data\boat_armed_01_ext_indp_co.paa"]]]
		]
	],
	//Hummingbird
	["B_Heli_Light_01_F",
		[
			["_blueline", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"]]],
			["_digital", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"]]],
			["_elliptical", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["_furious", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"]]],
			["_graywatcher", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["_jeans", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"]]],
			["_shadow", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"]]],
			["_sheriff", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["_speedy", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"]]],
			["_sunset", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"]]],
			["_vrana", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"]]],
			["_wasp", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"]]],
			["_wave", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"]]]
			
		]
	],
	//Armed Hummingbird
	["B_Heli_Light_01_armed_F",
		[
			["_blueline", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"]]],
			["_digital", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"]]],
			["_elliptical", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["_furious", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"]]],
			["_graywatcher", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["_jeans", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"]]],
			["_shadow", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"]]],
			["_sheriff", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["_speedy", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"]]],
			["_sunset", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"]]],
			["_vrana", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"]]],
			["_wasp", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"]]],
			["_wave", [[0,"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	//Armed ORCA
	["O_Heli_Light_02_F",
		[
			["_ind", [[0,"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"]]],
			["_civ", [[0,"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"]]]
		]
	],
	//Unarmed ORCA
	["O_Heli_Light_02_unarmed_F",
		[
			["_ind", [[0,"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"]]],
			["_civ", [[0,"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"]]]
		]
	],
	//Mohawk
	["I_Heli_Transport_02_F",
		[
			["_dahoman",[
				[0,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa"],
				[1,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa"],
				[2,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"]]],
			["_ion",[
				[0,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa"],
				[1,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa"],
				[2,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"]]]
		]
	]
];

A_vehicle_var_texture_entry_class = 0;

A_vehicle_var_texture_entry_variants = 1;

A_vehicle_var_texture_entry_variant_id = 0;

A_vehicle_var_texture_entry_variant_selections = 1;

A_vehicle_var_texture_entry_variant_selection_index = 0;

A_vehicle_var_texture_entry_variant_selection_path = 1;

A_vehicle_var_animation_entries = [
	["C_Offroad_01_F",
		[
			["_police", [["HidePolice", 0]]],
			["_services", [["HideServices", 0]]],
			["_bumper1", [["HideBumper1", 0]]],
			["_bumper2", [["HideBumper2", 0]]],
			["_backpacks", [["HideBackpacks", 0]]],
			["_door1", [["HideDoor1", 0]]],
			["_door2", [["HideDoor2", 0]]],
			["_door3", [["HideDoor3", 0]]],
			["_construction", [["HideConstruction", 0]]]
		]
	],
	["B_Heli_Light_01_F",
		[
			["_nobenches", [["addBenches", 0]]],
			["_nothread", [["addTread", 0]]],
			["_nobseats", [["addBackseats", 0]]],
			["_adddoors", [["addDoors", 0]]]
		]
	]
];

A_vehicle_var_animation_entry_class = 0;
A_vehicle_var_animation_entry_variants = 1;

A_vehicle_var_animation_entry_variant_id = 0;
A_vehicle_var_animation_entry_variant_animations = 1;

A_vehicle_var_animation_entry_variant_animation_name = 0;
A_vehicle_var_animation_entry_variant_animation_state = 1;

A_vehicle_var_gear_weapons_cargo = 0;
A_vehicle_var_gear_magazines_cargo = 1;

A_vehicle_var_outside_actions = [];

