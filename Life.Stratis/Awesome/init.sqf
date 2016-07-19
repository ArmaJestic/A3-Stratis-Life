//_h = [] execVM "Awesome\Paint\Paint.sqf";
//waitUntil {scriptDone _h};
//[] spawn P_init;

//sleep 1;

[] execVM "Awesome\Functions\gear_functions.sqf";
[] execVM "Awesome\Functions\pos_functions.sqf";
[] execVM "Awesome\Functions\stun_functions.sqf";

[] execVM "Awesome\Effects\mortar_effects.sqf";

_h = [] execVM "Awesome\Scripts\white_black_list.sqf";
waitUntil {scriptDone _h};

_h = [] execVM "Awesome\Scripts\newactions.sqf"; 
waitUntil{scriptDone _h};

_h = [] execVM "Awesome\Retributions\functions.sqf"; 
waitUntil{scriptDone _h};

//_h = [] execVM "Awesome\Functions\A_armoredsuv_var_functions.sqf"; 
//waitUntil{scriptDone _h};

//_h = [] execVM "Awesome\Functions\halo_functions.sqf"; 
//waitUntil{scriptDone _h};

_h = [] execVM "Awesome\Functions\A_trunk_var_functions.sqf"; 
waitUntil{scriptDone _h};

if(isClient) then {
	[] execVM "Awesome\Scripts\communications.sqf";
	[] execVM "Awesome\Client\client_loop.sqf";
};
	


[player, "stunned", false] call A_player_fnc_set_bool;

//ins_area_1 setTriggerActivation ["VEHICLE", "PRESENT", true];
//opfor_area_1 setTriggerActivation ["VEHICLE", "PRESENT", true];
blufor_area_1 setTriggerActivation ["VEHICLE", "PRESENT", true];
jail setTriggerActivation ["VEHICLE", "PRESENT", true];

//ins_area_1 setTriggerStatements ["this", "", ""];
//opfor_area_1 setTriggerStatements ["this", "", ""];
blufor_area_1 setTriggerStatements ["this", "", ""];
//jail setTriggerStatements ["this", "", ""];

respawnButtonPressed = false;

M_smoke = "SmokeShell";
M_flare = "F_40mm_Yellow";
M_ill_style = "highest";
M_ill_lit = "TG";
M_ill_time = 60;
M_ill_decent = 0.0075;

pmc_shop_list = [pmccar, pmcair, pmcbox, "pmc_license_journeyman", "pmc_defense", "pmc_license_air"];





