#include "macro.h"
if (not(undefined(vehicle_functions_defined))) exitWith {null};


//////// Custom Loadout //////// 
//Allowed methods: removeWeaponGlobal, addWeaponGlobal, addMagazineGlobal, removeMagazineGlobal
vehicle_loadout_entries = [
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




vehicle_loadout_entry_class = 0;
vehicle_loadout_entry_variants = 1;
vehicle_loadout_entry_variant_id = 0;
vehicle_loadout_entry_variant_mods = 1;
vehicle_loadout_entry_variant_mod_method = 0;
vehicle_loadout_entry_variant_mod_arguments = 1;
vehicle_loadout_entry_variant_mod_repeat = 2;


//////// Custom Textures ////////
vehicle_texture_entries = [
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


vehicle_texture_entry_class = 0;
vehicle_texture_entry_variants = 1;
vehicle_texture_entry_variant_id = 0;
vehicle_texture_entry_variant_selections = 1;
vehicle_texture_entry_variant_selection_index = 0;
vehicle_texture_entry_variant_selection_path = 1;

//////// Custom Animations ////////
vehicle_animation_entries = [
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

vehicle_animation_entry_class = 0;
vehicle_animation_entry_variants = 1;
vehicle_animation_entry_variant_id = 0;
vehicle_animation_entry_variant_animations = 1;
vehicle_animation_entry_variant_animation_name = 0;
vehicle_animation_entry_variant_animation_state = 1;

// --------- Set variable functions
vehicle_set_var = {
	ARGV(0,_vehicle);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	ARGV(3,_variable_type);
	
	[_vehicle, _variable_name, _variable_value, _variable_type, true] call vehicle_set_var_checked;
};

vehicle_set_var_checked = {
	ARGV(0,_vehicle);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	ARGV(3,_variable_type);
	ARGV(4,_checked);
	
	
	if (undefined(_vehicle)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
    if (undefined(_variable_value)) exitWith {null};
	if (undefined(_variable_type)) exitWith {null};
	if (undefined(_checked)) exitWith {null};
	
	if (typeName _variable_name != "STRING") exitWith {null};
	if (typeName _variable_type != "STRING") exitWith {null};
	if (typeName _variable_value != _variable_type) exitWith {null};
	if (typeName _checked != "BOOL") exitWith {null};
	
	private["_current_value"];
	_current_value = [_vehicle, _variable_name, _variable_type] call vehicle_get_var;
	if(_checked && (str(_current_value) == str(_variable_value))) exitWith {null};
	
	[_vehicle, _variable_name, _variable_value, true] call object_setVariable;
	[_vehicle, _variable_name, _variable_value] call stats_vehicle_save;
};

vehicle_set_string = {
	_this set [3, "STRING"];
	_this call vehicle_set_var;
};

vehicle_set_string_checked = {
	ARGV(3,_checked);
	_this set [3, "STRING"];
	_this set [4, _checked];
	_this call vehicle_set_var_checked;
};

vehicle_set_array = {
	_this set [3, "ARRAY"];
	_this call vehicle_set_var;
};

vehicle_set_array_checked = {
	private["_checked"];
	ARGV(3,_checked);
	_this set [3, "ARRAY"];
	_this set [4, _checked];
	_this call vehicle_set_var_checked;
};

vehicle_set_bool = {
	_this set [3, "BOOL"];
	_this call vehicle_set_var;
};

vehicle_set_scalar = {
	_this set [3, "SCALAR"];
	_this call vehicle_set_var;
};

// --- UPDATE functions 

vehicle_update_array = {
	_this set [3, "ARRAY"];
	_this call vehicle_set_var;
};

vehicle_update_bool = {
	_this set [3, "BOOL"];
	_this call vehicle_set_var;
};

vehicle_update_scalar = {
	_this set [3, "SCALAR"];
	_this call vehicle_set_var;
};

vehicle_update_string = {
	_this set [3, "STRING"];
	_this call vehicle_set_var;
};

// GET functions

vehicle_get_var = {
	private["_variable_value"];
	ARGV(0,_vehicle);
	ARGV(1,_variable_name);
	ARGV(2,_variable_type);
	
	if (undefined(_vehicle)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
	if (undefined(_variable_type)) exitWith {null};
	if ((typeName _variable_name) != "STRING") exitWith {null};
	if ((typeName _variable_type) != "STRING") exitWith {null};
	_variable_value = [_vehicle, _variable_name] call object_getVariable;
	_variable_value = if(undefined(_variable_value)) then { "" } else { _variable_value };
	_variable_value = if ((typeName _variable_value) != _variable_type) then { "" } else { _variable_value };
	_variable_value
};
vehicle_get_string = {
	_this set [2, "STRING"];
	(_this call vehicle_get_var)
};

vehicle_get_array = {
	_this set [2, "ARRAY"];
	(_this call vehicle_get_var)
};

vehicle_get_bool = {
	_this set [2, "BOOL"];
	(_this call vehicle_get_var)
};

vehicle_get_scalar = {
	_this set [2, "SCALAR"];
	(_this call vehicle_get_var)
};

vehicle_despawn = { _this spawn {
	if (not(isServer)) exitWith {null};
	private["_vehicle", "_delay"];
	
	//diag_log format["vehicle_despawn %1", _this];
	
	ARGV(0,_vehicle);
	ARGV(1,_delay);
	
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	
	if (undefined(_delay)) exitWith {null};
	if (typeName _delay != "SCALAR") exitWith {null};
	
	[_vehicle, "saved_driver_uid", ""] call vehicle_set_string;
	[_vehicle] call vehicle_stop_track;

	//diag_log format["vehicle_despawn %1, waiting", _this];
	[_delay] call isleep;
	//diag_log format["vehicle_despawn %1, deleting", _this];
	deleteVehicle _vehicle;	
};};

vehicle_unload_stats = {
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	
	private["_stats_uid"];
	_stats_uid = [_vehicle] call stats_get_uid;
	if (_stats_uid == "") exitWith {null};
	
	[_stats_uid] call unloadPlayerVariables;
};

vehicle_stop_track = {
	ARGV(0,_vehicle);
	
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	[_vehicle] call vehicle_save_stats;
	[_vehicle] call vehicle_unload_stats;
	[_vehicle, "track", false] call object_setVariable;
};

vehicle_track = {
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	
	private["_track"];
	_track = [_vehicle, "track"] call object_getVariable;
	if (undefined(_track)) exitWith {null};
	if (typeName _track != "BOOL") exitWith {null};
	if (not(_track)) exitWith {null};
	[_vehicle] call vehicle_save_stats;
};

vehicle_start_track = {
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	[_vehicle, "track", true, true] call object_setVariable; 
};



vehicle_GetIn_handler = {
	ARGV(0,_vehicle);
	ARGV(1,_position);
	ARGV(2,_player);
	
	if (_player != player) exitWith {null};
	
	if (_position == "driver") then {
		[_player] call player_save_side_vehicle;
		private["_entred_driver_uid"];
		_entred_driver_uid = ([_player] call stats_get_uid);
		[_vehicle, "active_driver_uid", _entred_driver_uid, true] call object_setVariable;
		
		private["_saved_driver_uid"];
		_saved_driver_uid = [_vehicle, "saved_driver_uid"] call vehicle_get_string;
		
		if (_saved_driver_uid == _entred_driver_uid) then {
			[_vehicle, "saved_driver_uid", ""] call vehicle_set_string;
			[_vehicle] call vehicle_stop_track;
		}
		else {
			[_vehicle] call vehicle_track;
		};
		
		
	};
};



vehicle_GetOut_handler = {
	ARGV(0,_vehicle);
	ARGV(1,_position);
	ARGV(2,_player);
	
	if (_player != player) exitWith {null};
	
	if (_position == "driver") then {
		[_player] call player_save_side_vehicle;
		[_vehicle, "active_driver_uid", "", true] call object_setVariable;
		
		private["_exited_driver_uid"];
		_exited_driver_uid = [_player] call stats_get_uid;
		
		private["_saved_driver_uid"];
		_saved_driver_uid = [_vehicle, "saved_driver_uid"] call vehicle_get_string;
		
		if ((_saved_driver_uid == _exited_driver_uid)) then {
			[_vehicle, "saved_driver_uid", ""] call vehicle_set_string;
			[_vehicle] call vehicle_stop_track;
		}
		else {
			[_vehicle] call vehicle_track;
		};
		
		
	};
};

vehicle_save_gear_request_receive = {
	/*
	private["_str"];
	_str = format["vehicle_save_gear_request_receive %1", _this];
	player groupChat _str;
	diag_log _str;
	*/

	ARGV(0,_variable);
	ARGV(1,_request);

	if (undefined(_request)) exitWith {null};
	if (typeName _request != "ARRAY") exitWith {null};

	private["_vehicle"];
	_vehicle = _request select 0;
	private["_gear", "_weapons", "_magazines"];
	//diag_log format["getting gear for %1", _vehicle];
	_gear = [_vehicle] call vehicle_get_gear;
	if (undefined(_gear)) exitWith {null};
	//diag_log format["saving %1, %2", _vehicle, _gear];
	_weapons = _gear select vehicle_gear_weapons_cargo;
	_magazines = _gear select vehicle_gear_magazines_cargo;
	[_vehicle, "weapons", _weapons] call vehicle_set_array;
	[_vehicle, "magazines", _magazines] call vehicle_set_array;
};


vehicle_save_gear_setup = {
	if (not(isServer)) exitWith {null};
	//player groupChat format["vehicle_save_gear_setup %1", _this];
	vehicle_side_gear_request_buffer =  " ";
	publicVariableServer "vehicle_side_gear_request_buffer";
	"vehicle_side_gear_request_buffer" addPublicVariableEventHandler { _this call vehicle_save_gear_request_receive;};
};


vehicle_save_gear = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {null};

	vehicle_side_gear_request_buffer = [_vehicle];
	if (isServer) then {
		["", vehicle_side_gear_request_buffer] call vehicle_save_gear_request_receive;
	}
	else {
		publicVariable "vehicle_side_gear_request_buffer";
	};
};

vehicle_save_stats = {
	/*
	private["_str"];
	_str = format["vehicle_save_stats %1, %2", _this, (driver(_this select 0))];
	diag_log _str;
	player groupChat _str;
	*/
	//diag_log format["item_name = %1", ([_vehicle, "item_name"] call vehicle_get_string)];
	ARGV(0,_vehicle);
	
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	if (_vehicle isKindOf "Man") exitWith {null};
	
	private["_dirver"];
	_driver = driver(_vehicle);
	
	private["_name", "_class", "_driver_uid", "_velocity", "_position_atl", "_vector_direction", "_vector_up", "_fuel", "_damage", "_engine_state", "_fuel"];
	
	_name = vehicleVarName _vehicle;
	_class = typeOf _vehicle;
	_velocity = velocity _vehicle;
	_position_atl = getPosATL _vehicle;
	_vector_direction = vectorDir _vehicle;
	_vector_up = vectorUp _vehicle;
	_fuel = fuel _vehicle;
	_damage = damage _vehicle;
	_engine_state = isEngineOn _vehicle;
	
	private["_driver_uid"];
	//_driver_uid = [_vehicle, "active_driver_uid"] call vehicle_get_string;
	_driver_uid = "";
	if ([_driver] call player_exists) then {
		_driver_uid = [_driver] call stats_get_uid;
	};
	
	/*
	private["_str"];
	_str = format[ "_driver_uid = %1, typeName _driver_uid = %2 ", _driver_uid,  (typeName _driver_uid)];
	diag_log _str;
	player groupChat _str;
	*/
	
	[_vehicle, "name", _name] call vehicle_set_string;
	[_vehicle, "saved_driver_uid", _driver_uid] call vehicle_set_string;
	[_vehicle, "class", _class] call vehicle_set_string;
	[_vehicle, "velocity", _velocity] call vehicle_set_array;
	[_vehicle, "position_atl", _position_atl] call vehicle_set_array;
	[_vehicle, "vector_direction", _vector_direction] call vehicle_set_array;
	[_vehicle, "vector_up", _vector_up] call vehicle_set_array;
	[_vehicle, "fuel", _fuel] call vehicle_set_scalar;
	[_vehicle, "damage", _damage] call vehicle_set_scalar;
	[_vehicle, "engine_state", _engine_state] call vehicle_set_bool;
	[_vehicle] call vehicle_save_gear;
	[_vehicle] call vehicle_save_storage;
	[_vehicle, "item_name", ([_vehicle, "item_name"] call vehicle_get_string), false] call vehicle_set_string_checked; 
};



vehicle_init_stats = {
	//player groupChat format["vehicle_init_stats %1", _this];
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {null};
	if (typeName _vehicle != "OBJECT") exitWith {null};
	
	private["_driver", "_velocity", "_position_atl", "_vector_direction", "_vector_up", "_fuel", "_damage", "_engine_state", "_weapons", "_magazines"];
	
	_velocity = [_vehicle, "velocity"] call vehicle_get_array;
	_position_atl = [_vehicle, "position_atl"] call vehicle_get_array;
				
	_vector_direction = [_vehicle, "vector_direction"] call vehicle_get_array;
	_vector_up =[_vehicle, "vector_up"] call vehicle_get_array;
	_fuel = [_vehicle, "fuel"] call vehicle_get_scalar;
	_damage = [_vehicle, "damage"] call vehicle_get_scalar;
	_engine_state = [_vehicle, "engine_state"] call vehicle_get_bool;
	_weapons = [_vehicle, "weapons"] call vehicle_get_array;
	_magazines= [_vehicle, "magazines"] call vehicle_get_array;
	
	private["_gear"];
	_gear = [];
	_gear set [vehicle_gear_weapons_cargo, _weapons];
	_gear set [vehicle_gear_magazines_cargo, _magazines];
	
	[_vehicle,_gear] call vehicle_set_gear;
	
	/*
	player groupChat format["_position_atl = %1", _position_atl];
	player groupChat format["_vector_direction = %1", _vector_direction];
	player groupChat format["_vector_up = %1", _vector_up];
	player groupChat format["_velocity = %1", _velocity];
	player groupChat format["_engine_state = %1", _engine_state];
	player groupChat format["_damage = %1", _damage];
	player groupChat format["_fuel = %1", _fuel];
	*/
	_vehicle enableSimulation false; //disable simulation so that the vehicle does not get damaged while being teleported

	//set the position
	if (typeName _position_atl == "ARRAY" && {count(_position_atl) == 3}) then {
		_vehicle setPosATL _position_atl;
	}
	else {
		player globalChat format["WARNING: Could not load vehicle stat: _position_atl"];
	};
	
	//set the velocity
	if (typeName _velocity == "SCALAR") then {
		_vehicle setVelocity _velocity;
	}
	else {
		player globalChat format["WARNING: Could not load vehicle stat: _velocity"];
	};
	
	//set the direction
	if (typeName _vector_direction == "ARRAY" && {typename _vector_up == "ARRAY"}) then {
		_vehicle setVectorDirAndUp [_vector_direction, _vector_up];
	}
	else {
		player globalChat format["WARNING: Could not load vehicle stat: _vector_direction, _vector_up"];
	};
	
	//set the engine state
	if (typeName _engine_state == "BOOL") then {
		_vehicle engineOn _engine_state;
	}
	else {
		player globalChat format["WARNING: Could not load vehicle stat: _damage"];
	};
	
	//set the fuel
	if (typeName _fuel == "SCALAR") then {
		_vehicle setFuel _fuel;
	}
	else {
		player globalChat format["WARNING: Could not load vehicle stat: _fuel"];
	};
	
	
	_vehicle enableSimulation true;
};


vehicle_modifications_init_handler_persistent = {
	diag_log format["vehicle_modifications_init_handler_persistent %1", _this];
	//player groupChat format["vehicle_modifications_init_handler_persistent %1", _this];
	ARGV(0,_vehicle);
	ARGV(1,_item);
	ARGV(2,_silent);
	
	
	if (undefined(_vehicle)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (undefined(_silent)) then { _silent = false; };
	
	if (typeName _vehicle != "OBJECT") exitWith {};
	if (isNull _vehicle) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typeName _silent != "BOOL") exitWith {};
	
	_vehicle setVariable ["item_name", _item, true];
	
	private["_class_name"];
	_class_name = toLower(typeOf _vehicle);
	
	//Apply hidden textures
	{
		private["_texture_entry", "_texture_entry_class", "_texture_entry_variants"];
		_texture_entry = _x;
		_texture_entry_class = _texture_entry select vehicle_texture_entry_class;
		_texture_entry_variants = _texture_entry select vehicle_texture_entry_variants;
		if (toLower(_texture_entry_class) == _class_name) exitWith {
			{
				private["_variant", "_variant_id", "_variant_selections"];
				_variant = _x;
				_variant_id = _variant select vehicle_texture_entry_variant_id;
				_variant_selections = _variant select vehicle_texture_entry_variant_selections;
				
				if ([_variant_id, _item] call BIS_fnc_inString) then {
					{
						private["_selection", "_selection_index", "_selection_path"];
						_selection = _x;
						_selection_index = _selection select vehicle_texture_entry_variant_selection_index;
						_selection_path = _selection select vehicle_texture_entry_variant_selection_path;
						_vehicle setObjectTexture [_selection_index, _selection_path];
					} forEach _variant_selections;
				};
				
			} forEach _texture_entry_variants;
		
		};
	} forEach vehicle_texture_entries;
	
	//Apply animations
	{
		private["_animation_entry", "_animation_entry_class", "_animation_entry_variants"];
		_animation_entry = _x;
		_animation_entry_class = _animation_entry select vehicle_animation_entry_class;
		_animation_entry_variants = _animation_entry select vehicle_animation_entry_variants;
		
		if (toLower(_animation_entry_class) == _class_name) exitWith {
			{
				private["_variant", "_variant_id", "_variant_animations"];
				_variant = _x;
				_variant_id = _variant select vehicle_animation_entry_variant_id;
				_variant_animations = _variant select vehicle_animation_entry_variant_animations;
				
				if ([_variant_id, _item] call BIS_fnc_inString) then {
					{
						private["_animation", "_animation_name", "_animation_state"];
						_animation = _x;
						_animation_name = _animation select vehicle_animation_entry_variant_animation_name;
						_animation_state = _animation select vehicle_animation_entry_variant_animation_state;
						_vehicle animate [_animation_name, _animation_state];
					} forEach _variant_animations;
				};
			} forEach _animation_entry_variants
		};
	} forEach vehicle_animation_entries;
};

vehicle_save_storage = {
	/*
	private["_str"];
	_str =  format["vehicle_save_storage %1", _this];
	player groupChat _str;
	diag_log _str;
	*/
	
	ARGV(0,_vehicle);
	
	private["_storage_name"];
	_storage_name = [_vehicle] call vehicle_storage_name;
	
	if (_storage_name == "") exitWith {null};
	private["_storage_variable"];
	_storage_variable = [_vehicle, _storage_name] call vehicle_get_array;
	
	/*
	private["_str"];
	_str =  format["vehicle_save_storage %1, %2, %3", _vehicle, _storage_name, _storage_variable];
	player groupChat _str;
	diag_log _str;
	*/
		
	[_vehicle, _storage_name, _storage_variable, false] call vehicle_set_array_checked;
};


vehicle_storage_name = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {""};
	private["_vehicle_name"];
	_vehicle_name = vehicleVarName _vehicle;
	(format["%1_storage", _vehicle_name])
};


vehicle_init_handler_persistent = {
	diag_log format["vehicle_init_handler_persistent %1", _this];
	ARGV(0,_vehicle);
	ARGV(1,_vehicle_name);
	
	if (undefined(_vehicle)) exitWith {};
	if (undefined(_vehicle_name)) exitWith {};
	if (typeName _vehicle != "OBJECT") exitWith {};
	if (isNull _vehicle) exitWIth {};
	if (typeName _vehicle_name != "STRING") exitWith {};
	
	
	_vehicle setVehicleVarname _vehicle_name;
	missionNamespace setVariable [_vehicle_name, _vehicle];
	if (undefined(mounted_add_actions)) then {
		mounted_actions_init = if (undefined(mounted_actions_init)) then { [] } else {mounted_actions_init};
		mounted_actions_init = mounted_actions_init + [_vehicle_name];
	}
	else {
		[_vehicle] call mounted_add_actions;
	};
	
	_vehicle addEventHandler ["GetIn", { _this spawn vehicle_GetIn_handler}];
	_vehicle addEventHandler ["GetOut", { _this spawn vehicle_GetOut_handler}];
};

vehicle_init_handler = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {};
	
	clearWeaponCargo _vehicle;
	clearMagazineCargo _vehicle;
	_vehicle lock true;
};

vehicle_set_init = { _this spawn {
	ARGV(0,_vehicle);
	ARGV(1,_vehicle_name);
	
	if (undefined(_vehicle)) exitWith {null};
	if (undefined(_vehicle_name)) exitWith {null};
	
	if (typeName _vehicle != "OBJECT") exitWith {null};
	if (typeName _vehicle_name != "STRING") exitWith {null};
	
	
	private["_flag"];
	_flag = "vehicle_init_flag";
	
	missionNamespace setVariable [_flag, false];
	//[[_vehicle, _vehicle_name], "vehicle_init_handler_persistent", true, true] spawn BIS_fnc_MP;
	[[_vehicle, _vehicle_name], "vehicle_init_handler_persistent", true, true] spawn jip_register;
	waitUntil { not(isNil _vehicle_name) };
	
	missionNamespace setVariable [_flag, false];
	[[_vehicle], "vehicle_init_handler", true, false] spawn BIS_fnc_MP;
	
	[_vehicle, "isPlayerVehicle", true, true] call object_setVariable;
	[player, _vehicle] call vehicle_add;
	[_vehicle] call vehicle_set_loadout;
	

};};

vehicle_set_loadout = {
	//player groupChat format["vehicle_set_loadout %1", _this];
	ARGV(0,_vehicle);
	
	if (not([_vehicle] call object_exists)) exitWith {};
	
	private["_item", "_class"];
	_class = typeOf _vehicle;
	_item = [_vehicle, "item_name", ""] call object_getVariable;
	
	if (_item == "") exitWith {};

	{
		private["_loadout_entry", "_loadout_entry_class"];
		_loadout_entry = _x;
		_loadout_entry_class = _loadout_entry select vehicle_loadout_entry_class;
		//player groupChat format["_loadout_entry_class = %1", _loadout_entry_class];
		
		if (toLower(_loadout_entry_class) == toLower(typeOf _vehicle)) then {
			private["_loadout_entry_variants"];
			_loadout_entry_variants = _loadout_entry select vehicle_loadout_entry_variants;

			{
				private["_variant", "_variant_id", "_variant_mods"];
				_variant = _x;
				_variant_id = _variant select vehicle_loadout_entry_variant_id;
				if ([_variant_id, _item] call BIS_fnc_inString) then {
					private["_variant_mods"];
					_variant_mods = _variant select vehicle_loadout_entry_variant_mods;
					{
						private["_mod", "_mod_method", "_mod_arguments", "_mod_repeat"];
						_mod = _x;
						_mod_method = _mod select vehicle_loadout_entry_variant_mod_method;
						_mod_arguments = _mod select vehicle_loadout_entry_variant_mod_arguments;
						_mod_repeat = _mod select vehicle_loadout_entry_variant_mod_repeat;
						//player groupChat format["_mod = %1", _mod];
						private["_i"];
						_i = 0;
						while {_i < _mod_repeat} do {
							_mod_method = toLower(_mod_method);
							switch (toLower(_mod_method)) do {
								case "removeweaponglobal": {
									_vehicle removeWeaponGlobal _mod_arguments;
								};
								case "addweaponglobal": {
									_vehicle addWeaponGlobal _mod_arguments;
								};
								case "removemagazineglobal": {
									_vehicle removeMagazineGlobal _mod_arguments;
								};
								case "addmagazineglobal": {
									_vehicle addMagazineGlobal _mod_arguments;
								};
							};
							_i = _i + 1;
						};
					} forEach _variant_mods;
				};
			} forEach _loadout_entry_variants;
		
		};
	} forEach vehicle_loadout_entries;
};

vehicle_generate_name = {
	private["_restart_count"];
	_restart_count = server getVariable "restart_count";
	_vehicle_name = format["vehicle_%1_%2_%3", player, _restart_count, round(time)];
	_vehicle_name
};


vehicle_handle_mpkilled = { _this spawn {
	ARGV(0,_unit);
	ARGV(1,_killer);
	[_unit, 60] call vehicle_despawn;
};};



vehicle_create = {
	//player groupChat format["vehicle_create %1", _this];
	ARGV(0,_class);
	ARGV(1,_position);
	ARGV(2,_exact);
	
	if (undefined(_class)) exitWith {null};
	if (undefined(_position)) exitWith {null};
	if (undefined(_exact)) exitWith {null};
	
	if (typeName _class != "STRING") exitWith {null};
	if (typeName _position != "ARRAY") exitWith {null};
	if (typeName _exact != "BOOL") exitWith {null};
	
	
	private["_vehicle"];
	_vehicle = createVehicle [_class, _position, [], 0, "NONE"];
	
	if (_exact) then {
		_vehicle setPosATL _position;
		[_vehicle] spawn {
			ARGV(0,_vehicle);
			sleep 1;
			_vehicle setDamage 0;
		};
	};
	
	
	if (_vehicle isKindOf "UAV_01_base_F") then {
		createVehicleCrew _vehicle;
	};
	
	_vehicle addEventHandler ["fired", {_this execVM "Awesome\EH\EH_fired_vehicle.sqf"}];
	_vehicle addMPEventhandler ["MPKilled", {_this call vehicle_handle_mpkilled}];
	
	_vehicle
};



vehicle_recreate = {
	//player groupChat format["vehicle_recreate %1", _this];
	ARGV(0,_name);
	ARGV(1,_class);
	
	if (undefined(_name)) exitWith {null};
	if (typeName _name != "STRING") exitWith {null};
	if (undefined(_class)) exitWith {null};
	if (typeName _class != "STRING") exitWith {null};
	
	private["_vehicle"];
	private["_vehicle"];
	_vehicle = missionNamespace getVariable _name;
	private["_vehicle_exists"];
	_vehicle_exists = false;
	if (not(undefined(_vehicle))) then {
		if (typeName _vehicle == "OBJECT") then {
			if (not(isNull _vehicle)) then {
				_vehicle_exists = true;
			};
		};
	};
	if (_vehicle_exists) exitWith {_vehicle};


	private["_data"];
	//player groupChat format["Recreating _name = %1", _name];
	_data = [_name] call stats_load_request_send;
	private["_safe_pos"];
	_safe_pos = [5086.96,6585.59,0.00146484]; //random on-land position
	_vehicle = [_class, _safe_pos, false] call vehicle_create; 
	[_vehicle, _name] call vehicle_set_init;	
	[_data, _vehicle] call stats_compile_sequential;
	[_vehicle, "position_atl", 5] call object_wait_stats;	
	[_vehicle] call vehicle_init_stats;
	private["_item_name"];
	_item_name = [_vehicle, "item_name"] call vehicle_get_string;
	//[[_vehicle, _item_name, true], "vehicle_modifications_init_handler_persistent", true, true] call BIS_fnc_MP;
	[[_vehicle, _item_name, true], "vehicle_modifications_init_handler_persistent", true, true, _vehicle] call jip_register;
	
	(_vehicle)
};


object_wait_stats = {
	ARGV(0,_object);
	ARGV(1,_variable_name);
	ARGV(2,_time_out);
	if (undefined(_object)) exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
	if (typeName _variable_name != "STRING") exitWith {null};
	if (undefined(_time_out)) exitWith {null};
	if (typeName _time_out != "SCALAR") exitWith {null};
	if (_time_out < 0) exitWith {null};


	private["_end_time"];
	_end_time = serverTime + _time_out;

	while {true} do {
		private["_variable_value"];
		_variable_value = [_object, _variable_name] call object_getVariable;
		if (not(undefined(_variable_value))) exitWith {null};
		if (_end_time < serverTime) exitWith {
			private["_message"];
			_message = format["WARNING: Time-out occurred while waiting for ""%1"" on ""%2""", _variable_name, _object];
			player groupChat _message;
			diag_log _message;
		};
	};
};


vehicle_create_shop_extended = {
	//player groupChat format["vehicle_create_shop_extended %1", _this];
	ARGV(0,_logic);
	ARGV(1,_class);
	ARGV(2,_item);
	ARGV(3,_exact);
	
	private["_vehicle_name", "_position"];
	_vehicle_name = call vehicle_generate_name;
	_position = getPosATL _logic;
	
	private["_vehicle"];
	_vehicle = [_class, _position, _exact] call vehicle_create;
	
	if (not(undefined(_vehicle))) then {
		_vehicle setDir (getDir _logic);
	};
	
	//player groupChat format["_vehicle_name = %1,  _vehicle = %2", _vehicle_name, _vehicle];
	[_vehicle, _vehicle_name] call vehicle_set_init;
	//[[_vehicle, _item, false], "vehicle_modifications_init_handler_persistent", true, true] call BIS_fnc_MP;
	[[_vehicle, _item, false], "vehicle_modifications_init_handler_persistent", true, _vehicle] call jip_register;
	
	(_vehicle)
};


vehicle_create_shop = {
	ARGV(0,_logic);
	ARGV(1,_class);
	ARGV(2,_item);
	
	([_logic, _class, _item, not(isPlayer _logic)] call vehicle_create_shop_extended)
};




vehicle_exists = {
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {false};
	if (typeName _vehicle != "OBJECT") exitWith {false};
	if (isNull _vehicle) exitWith {false};
	true
};


vehicle_gear_weapons_cargo = 0;
vehicle_gear_magazines_cargo = 1;

vehicle_get_gear = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	private["_weapons_cargo", "_magazines_cargo"];
	_weapons_cargo = getWeaponCargo _vehicle;
	_magazines_cargo = getMagazineCargo  _vehicle;

	private["_gear"];
	_gear = [];
	_gear set [vehicle_gear_weapons_cargo, _weapons_cargo];
	_gear set [vehicle_gear_magazines_cargo, _magazines_cargo];
	_gear
};


vehicle_set_gear = {
	//player groupChat format["vehicle_set_gear %1", _this];
	ARGV(0,_vehicle);
	ARGV(1,_gear);
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	if (undefined(_gear)) exitWith {null};
	if (typeName _gear != "ARRAY") exitWith {null};
	
	private["_weapons_cargo", "_magazines_cargo"];	
	
	_weapons_cargo = _gear select vehicle_gear_weapons_cargo;
	_magazines_cargo = _gear select vehicle_gear_magazines_cargo;
	
	if (undefined(_weapons_cargo)) exitWith {null};
	if (undefined(_magazines_cargo)) exitWith {null};

	if (typeName _weapons_cargo != "ARRAY") exitWith {null};
	if (typename _magazines_cargo != "ARRAY") exitWith {null};

	
	private["_cargo_weapons_class", "_cargo_weapons_count", "_cargo_magazines_class", "_cargo_magazines_count"];
	_cargo_weapons_class  = _weapons_cargo select 0;
	_cargo_weapons_count	= _weapons_cargo select 1;
	_cargo_magazines_class = _magazines_cargo select 0;
	_cargo_magazines_count= _magazines_cargo select 1;
		
	private["_i"];
	
	_i = 0;
	while { _i < (count _cargo_weapons_class) } do {
		private["_weapon_class", "_weapon_count"];
		_weapon_class = _cargo_weapons_class select _i;
		_weapon_count = _cargo_weapons_count select _i;
		_vehicle addWeaponCargoGlobal [_weapon_class, _weapon_count];
		_i = _i + 1;
	};
		
	_i = 0;
	while { _i < (count _cargo_magazines_class) } do { 
		private["_magazine_class", "_magazine_count"];
		_magazine_class = _cargo_magazines_class select _i;
		_magazine_count = _cargo_magazines_count select _i;
		_vehicle addMagazineCargoGlobal [_magazine_class, _magazine_count];
		_i = _i + 1;
	};
};

vehicle_reset_gear = {
	//player groupChat format["vehicle_reset_gear %1", _this];
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
};



vehicle_lockpick = {	
	private["_item"];
	ARGV(0,_item);	
	_incarpark = false;
	_vehicle  = [10] call INV_LocateClosestVehicle;
			
	if (undefined(_vehicle)) exitWith {
		player groupChat "No vehicle close enough";
	};
			
	if (([player, _vehicle] call vehicle_owner)) exitWith {	
		player groupChat "You already own this vehicle.";
	};
	player groupChat format["lockpicking %1", _vehicle];
	[player, _item, -1] call inventory_add_item;
	format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call broadcast;

	{
		if (_vehicle in (list _x)) then {
			_incarpark = true;
		};
	} forEach INV_VehicleGaragen;	

	private["_near_cops", "_near_civilians"];
	_near_cops = [player, 40] call player_near_cops;
	_near_civilians = [player, 40] call player_near_civilians;
		
	if ((random 100) < lockpickchance) then {
		[player, _vehicle] call vehicle_add;
		player groupChat localize "STRS_inventar_lockpick_success";		
		
		if ((_near_cops || _near_civilians || _incarpark) && not(iscop)) then {
			private["_message"];
			_message =  format["%1 was seen stealing a vehicle (registration plate: %2)!", player, _vehicle];
			format['hint (toString(%1));', toArray(_message)] call broadcast;
			[player, "vehicle theft", 10000] call player_update_warrants;
		};
	}
	else {																																						
		player groupChat localize "STRS_inventar_lockpick_noluck";
		
		if ((_near_cops || _near_civilians || _incarpark) && not(iscop)) then { 
			[player, "attempted vehicle theft", 2000] call player_update_warrants;
			private["_message"];
			_message = format["%1 was seen attempting to lockpick a vehicle (Registration plate: %2)", player, _vehicle];
			format['hint (toString(%1));', toArray(_message)] call broadcast;
		};			
	};
};

/*

0 - Unlocked
1 - Default
2 - Locked
3 - Locked for player
*/

vehicle_toggle_lock = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {null};

	private["_state"];
	_state = locked _vehicle;

	if (_state == 2) then {
		_state = 0;
	}
	else { if (_state == 0 || _state == 1) then {
		_state = 2;
	}
	else {
		_state = 0;
	};};
	
	_state = if (_state == 2) then {true} else {false};
	
	[_vehicle, "locked", _state, true] call object_setVariable;
	format["%1 lock %2", _vehicle, _state] call broadcast;
	_state
};

vehicle_owner = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	if (not([_player] call player_human)) exitWith{false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	
	private["_vehicles_name_list"];
	_vehicles_name_list = [player] call vehicle_list;
	(str(_vehicle) in _vehicles_name_list)
};



vehicle_load = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	["vehicles_name_list", []] call stats_init_variable;
};

vehicle_add = {
	ARGV(0,_player);
	ARGV(1,_vehicle);		
	if (not([_player] call player_human)) exitWith {false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	
	([_player, str(_vehicle)] call vehicle_add_name)
};

vehicle_add_name = {
	ARGV(0,_player);
	ARGV(1,_vehicle_name);

	if (not([_player] call player_human)) exitWith {false};
	if(undefined(_vehicle_name)) exitWith {false};
	if (typeName _vehicle_name != "STRING") exitWith {false};

	private["_vehicles_name_list"];
	_vehicles_name_list = [_player, "vehicles_name_list"] call player_get_array;
	
	if (_vehicle_name in _vehicles_name_list) exitWith {false};
	
	_vehicles_name_list set [count(_vehicles_name_list), _vehicle_name];
	
	[_player, "vehicles_name_list", _vehicles_name_list, false] call player_set_array_checked;
	true
};

vehicle_remove = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	if (not([_player] call player_human)) exitWith {false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	
	([_player, str(_vehicle)] call vehicle_remove_name)
};

vehicle_remove_name = {
	ARGV(0,_player);
	ARGV(1,_vehicle_name);
	
	if (not([_player] call player_human)) exitWith {false};
	if(undefined(_vehicle_name)) exitWith {false};
	if (typeName _vehicle_name != "STRING") exitWith {false};
	
	
	private["_vehicles_name_list"];
	_vehicles_name_list = [_player, "vehicles_name_list"] call player_get_array;
	
	if (not(_vehicle_name in _vehicles_name_list)) exitWith {false};
	
	_vehicles_name_list = _vehicles_name_list - [_vehicle_name];
	[_player, "vehicles_name_list", _vehicles_name_list, false] call player_set_array_checked;
	true
};


object_build_list = {
	ARGV(0,_list);
	if (undefined(_list)) exitWith {[]};
	if (typeName _list != "ARRAY") exitWith {[]};
	if (count(_list) == 0) exitWith {[]};
	
	private["_objects"];
	_objects = [];
	
	
	{ if (true) then {
		private["_object_name", "_object"];
		_object_name = _x;
		_object = missionNamespace getVariable [_vehicle_name, null];
		if (undefined(_object)) exitWith {null};
		if (typeName _object != "OBJECT") exitWith {null};
		if (isNull _object) exitWith {null};
		_objects set [count(_objects), _object];
	};} forEach _list;
	
	(_objects)
};

vehicle_list = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {[]};

	([_player, "vehicles_name_list"] call player_get_array)
};

vehicle_target = {
	//player groupChat format["vehicle_target %1", _this];
	ARGV(0,_player);
	ARGV(1,_distance);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_distance)) exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	
	private["_target"];
	_target = cursorTarget;
	
	if (not(_target isKindOf "Air" || 
			_target isKindOf "Ship" || 
			_target isKindOF "LandVehicle") ||
		_target isKindOf "Man") exitWith {null};
	
	if (not([getpos _player, getdir _player, 45, getpos _target] call angle_sector)) then {
		null
	};

	if (not((_player distance _target) < _distance)) exitWith {
		null
	};

	_target 
};

vehicle_empty_cargo_slots = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {0};
	private["_slots"];
	_slots = ((_vehicle emptyPositions "Commander") + (_vehicle emptyPositions "Cargo"));
	_slots
};



vehicle_outside_player_near = {
	ARGV(0,_player);
	ARGV(1,_distance);
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_distance)) exitWith {null};
	
	private["_target"];
	_target = cursorTarget;
	
	if (not(_target isKindOf "LandVehicle")) exitWith {null};
	if ((_player distance _target) > _distance) exitWith {null};

	_target
};


vehicle_outside_actions = [];
vehicle_outside_remove_actions = {
	if (count vehicle_outside_actions == 0) exitWith {};
	//player groupChat format["vehicle_outside_remove_actions %1", _this];
	
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach vehicle_outside_actions;
	vehicle_outside_actions = [];
};




vehicle_outside_add_actions = {
	if (count vehicle_outside_actions > 0) exitWith {};
	//player groupChat format["vehicle_outside_add_actions %1", _this];
	ARGV(0,_player);
	ARGV(1,_vehicle);

	if (not([_player] call player_human)) exitWith {};
	if (not([_vehicle] call vehicle_exists)) exitWith {};
	
	//Add crew actions
	private["_crew"];
	_crew = crew _vehicle;
	{if (true) then {
		private["_member"];
		_member = _x;
		if (not([_member, "restrained", false] call object_getVariable)) exitWith {};
		player grouPChat format["Adding action for %1",  _member];
		private["_action_id"];
		_action_id = player addaction [format["Pull %1 from vehicle", _member], "action.sqf", [[_player, _vehicle, _member], "vehicle_pull_player"],10,false,false,"",
			format["([%1, %2, %3] call vehicle_pull_player_available)", _player, _vehicle, _member]];
		vehicle_outside_actions = vehicle_outside_actions + [_action_id];
		
	};} forEach _crew;
	
	
	//Add unfliping action
	_action_id = player addaction ["Unflip this vehicle", "action.sqf", [[_player, _vehicle], "interact_vehicle_unflip"],10,false,false,"",
		format["([%1] call vehicle_flipped)",_vehicle]];
	vehicle_outside_actions = vehicle_outside_actions + [_action_id];
	
	//Add impound action
	if ([_player] call player_cop) then {
		_action_id = player addaction ["Vehicle impound", "action.sqf", [[_player, _vehicle], "interact_impound_vehicle_seize"],10,false,false,"",
			format["([%1, %2] call vehicle_seize_available)", _player, _vehicle]];
		vehicle_outside_actions = vehicle_outside_actions + [_action_id];
	};

	//Add view vehicle information action
	_action_id = player addaction ["Vehicle information", "action.sqf", [[_player, _vehicle], "interact_vehicle_information"],10,false,false,"",
		format["([%1, %2] call vehicle_seize_available)", _player, _vehicle]];
	vehicle_outside_actions = vehicle_outside_actions + [_action_id];
	
	//Add view vehicle trunk contents action
	_action_id = player addaction ["Vehicle trunk (view)", "action.sqf", [[_player, _vehicle], "interact_view_trunk"],10,false,false,"",
		format["([%1, %2] call vehicle_view_trunk_available)", _player, _vehicle]];
	vehicle_outside_actions = vehicle_outside_actions + [_action_id];
	
	//Add remove illegal items from vehicle action
	_action_id = player addaction ["Vehicle trunk (seize)", "action.sqf", [[_player, _vehicle], "vehicle_seize_trunk"],10,false,false,"",
		format["([%1, %2] call vehicle_view_trunk_available)", _player, _vehicle]];
	vehicle_outside_actions = vehicle_outside_actions + [_action_id];
};


vehicle_pull_player_available = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_target);
	
	if (not([_player] call player_exists)) exitWith {false};
	if (not([_target] call player_exists)) exitWith {false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	
	if (cursorTarget != _vehicle) exitWith {false};
	if (not(locked _vehicle < 2)) exitWith {false};
	if (not([_target, _vehicle] call mounted_player_inside)) exitWith {false};
	
	true
};

vehicle_pull_player = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_target);
	player groupChat format["vehicle_pull_player %1", _this];
	
	if (not([_player, _vehicle, _target] call vehicle_pull_player_available)) exitWith {};
	[_target, _vehicle, false] call player_exit_vehicle;
};

vehicle_flipped = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {};
	
	private["_pos"];
	_pos = getPos _vehicle;
	
	private["_snormal", "_vnormal"];
	_snormal = surfaceNormal _pos;
	_vnormal = vectorUp _vehicle;
	
	private["_angle"];
	_angle = [_snormal, _vnormal] call vector_angle;
	
	//player groupChat format["_angle = %1", _angle];
	(_angle > 15)
};


vehicle_in_safe_zone = {
	ARGV(0,_vehicle);
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	
	private["_in_safe_zone"];
	_in_safe_zone = false;
	
	{
		private["_trigger"];
		_trigger = _x;
		if (_vehicle in (list _trigger)) exitWith {
			_in_safe_zone = true;
		};
	} forEach INV_VehicleGaragen;
	
	_in_safe_zone
};


vehicle_seize_available = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player] call player_human)) exitWith {false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	
	if (_vehicle isKindOf "Air") exitWith {false};
	if (not(alive _vehicle)) exitWith {false};
	if ([_vehicle] call vehicle_in_safe_zone) exitWith {false};
	
	true
};

vehicle_player_owned = {
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {false};
	
	private["_isPlayerVehicle"];
	_isPlayerVehicle = [_vehicle, "isPlayerVehicle"] call object_getVariable;
	if (undefined(_isPlayerVehicle)) exitWith { false };
	if (typeName _isPlayerVehicle != "BOOL") exitWith { false };
	_isPlayerVehicle
};



vehicle_seize_trunk = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player, _vehicle] call vehicle_view_trunk_available)) exitWith {};
	
	private["_storage_name"];
	_storage_name = ([_vehicle] call vehicle_storage_name);
	[_vehicle, _storage_name] call inventory_storage_remove_illegal;	
};

vehicle_view_trunk_available = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	if (not([_player] call player_exists)) exitWith {false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	if (not([_player] call player_cop)) exitWith {false};
	if (not(locked _vehicle < 2)) exitWith {false};
	if (not(_vehicle isKindOf "Air" || { _vehicle isKindOf "Ship" || { _vehicle isKindOf "LandVehicle" }})) exitWith {false};
	if (not([_vehicle] call vehicle_player_owned)) exitWith {false};
	if ([_player, _vehicle] call vehicle_owner) exitWIth {false};
	
	true
};

interact_view_trunk = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player, _vehicle] call vehicle_view_trunk_available)) exitWith {};
	
	private["_storage_name"];
	_storage_name = ([_vehicle] call vehicle_storage_name);
	
	private["_title", "_list"];
	_title = format["Vehicle Trunk Storage", (name _player)];
	_list = [_title, 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	
	lbClear (ctrlIDC _list);
	
	player groupChat format["_storage_name = %1", _storage_name];
	private["_i","_inventory"];
	_inventory = [_vehicle, _storage_name] call object_getVariable;
	player groupChat format["_inventory = %1", _inventory];
	_i = 0;
	while {_i < (count _inventory)} do {
		private["_object", "_object_name", "_amount"];
		_object = ((_inventory select _i) select 0);
		_object_name = (MASTER_ARRAY_ITEM_NAME(_object));
		_amount = [((_inventory select _i) select 1)] call decode_number;
		if (_amount > 0) then {
			if (_object == "money") then {
				_list lbAdd format ["%1: $%2", _object_name, strM(_amount)];
			 }
			 else {
				_list lbAdd format ["%1: %2", _object_name, _amount];
			 };
		};
		_i = _i + 1;
	};
};



vehicle_information_available = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player] call player_exists)) exitWith {false};
	if (not([_vehicle] call vehicle_exists)) exitWith {false};
	if (not(_vehicle isKindOf "Air" || { _vehicle isKindOf "Ship" || { _vehicle isKindOf "LandVehicle" }})) exitWith {false};
	if (not([_vehicle] call vehicle_player_owned)) exitWith {false};
	true
};

interact_vehicle_information = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player, _vehicle] call vehicle_information_available)) exitWith {};

	private["_class", "_driver", "_picture", "_name", "_tag"];
	_class = typeOf _vehicle;
	_driver = driver _vehicle;
	_driver = if (isNull _driver) then {"None"} else {format["%1-%2", _driver, (name _driver)]};
	_picture = [_class] call generic_picture_path;
	_name = [_class] call generic_display_name;
	private["_max_name_len"];
	_max_name_len = 17;
	_tag = str(_vehicle);
	_tag = if (([_tag] call strlen) > _max_name_len) then { ([_tag, 0, _max_name_len] call substr) + "..."} else {_tag};
	
	private["_text"];
	_text = "";
	{
		private["_entry", "_label", "_value"];
		_entry = _x;
		_label = _entry select 0;
		_value = _entry  select 1;
		_text = _text + "<t align='left' font='PuristaMedium' size='1'>" + _label + "</t><t align='left' font='PuristaMedium'>" + _value + "</t><br />";
	}
	forEach(
		[["    Name:      ", _tag],
		 ["    Direction:   ", str(round(getdir _vehicle)) + " degrees"],
		 ["    Altitude:    ", str(round(getposASL _vehicle select 2)) + " meter(s) ASL"],
		 ["    Driver:      ", _driver],
		 ["    Seats:      ", str((_vehicle emptyPositions "cargo")+(_vehicle emptyPositions "driver")) + " seat(s)"],
		 ["    Size:       ", str(round((sizeOf _class)*10)/10) + " meter(s)"]
		]);
	
	_text = format["<t align='center' font='PuristaMedium' size='1.4' >Vehicle Information</t><br /><img image='%1' size='2.8'   /><br /><t  align='center'>(%2)</t>", _picture, _name] + "<br /><br />" + _text;
	hint parseText _text;
};


vehicle_tuning_handler = {
	if (not(W_KEY_DOWN || S_KEY_DOWN)) exitWith {};

	private["_vehicle", "_player"];
	_player = player;
	_vehicle = (vehicle _player);
	if (_player == _vehicle) exitWith {};

	private["_angle"];
	_angle = [(velocity _vehicle), (vectorDir _vehicle)] call vector_angle;
	if (_angle > 3) exitWith {};

	private["_altitude"];
	_altitude = (visiblePosition _vehicle) select 2;
	//player groupChat format["_altitude = %1", _altitude];
	if (_altitude > 0.2) exitWith {};
	
	private["_tuning", "_nitro"];
	_tuning = _vehicle getVariable ["tuning", 0];
	_nitro = _vehicle getVariable ["nitro", 0];
	
	

	private["_velocity", "_direction", "_magnitude", "_speed"];
	_velocity = velocity _vehicle;
	_direction = (vectorDir _vehicle);
	_speed = (speed _vehicle);
	
	if (_speed < 1) exitWith {};
	
	if (_nitro > 0 && LSHIFT_DOWN) then {
		_vehicle setFuel ((fuel _vehicle) - 0.0001);
		_nitro = if (_speed < 250) then {0.08} else {0.01};
		_tuning = _tuning +_nitro;

	};
	
	//player groupChat format["_tuning = %1", _tuning];
	
	if (_tuning == 0) exitWith {};
	

	if (not(S_KEY_DOWN)) then {
		private["_added"];
		_added = [_velocity, _tuning] call vector_resize;
		_added set [2,0];
		_velocity = [_velocity,_added] call BIS_fnc_vectorAdd;
	}
	else {
		//player groupChat format["Braking!"];
		private["_added"];
		_added = [_velocity, 0.4] call vector_resize;
		_velocity = [_velocity, _added] call BIS_fnc_vectorDiff;
	};
	
	
	_magnitude = [_velocity] call vector_magnitude;
	if (_speed < 350) then {
		private["_new_velocity"];
		_new_velocity = [_direction, _magnitude] call vector_resize;
		_vehicle setVelocity _new_velocity;
	};
};


call vehicle_save_gear_setup;
vehicle_functions_defined = true;