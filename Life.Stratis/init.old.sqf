isClient = !isServer || (isServer && !isDedicated);
if (isClient) then {
	//player globalChat format["Waitin for player ..."];
	waitUntil {(!(isNull player) && {isPlayer player})};
	titleText ["", "BLACK OUT", 0.0001];
};

null = 0xe0ffffef;
null__ = {
	private["_variable_value"];
	_variable_value = _this;
	if (typeName _variable_value == "SCALAR" && {_variable_value == null}) exitWith {true};
	false
};

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};


[] call A_param_fnc_init1;
[] call A_loading_fnc_init1;


[]	call A_loading_fnc_start;
["Pre-loading operations..."] call A_loading_fnc_update_title;
[(1/A_loading_var_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

0 fadeSound 0;
showGPS false;
showMap false;

enableSaving [false, false];
enableEngineArtillery false;
setPlayerRespawnTime 30;

WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 0];
EAST setFriend [WEST, 0];
EAST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [RESISTANCE, 0];

// 	Run init1
["Running init1..."] call A_loading_fnc_update_title;
[(2/A_loading_var_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

ExecSQFwait("fnc\init1.sqf")

//	Run init2
["Running init2..."] call A_loading_fnc_update_title;
[(3/A_loading_var_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

ExecSQFwait("fnc\init2.sqf")

//	Wait for server to finish
["Waiting for server to finish..."] call A_loading_fnc_update_title;
[(4/A_loading_var_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

// 	Load stats
["Starting stat loading..."] call A_loading_fnc_update_title;
[(5/A_loading_var_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

[] call A_stats_fnc_init2;

// 	Run startup functions for whatevers needed
["Running final operations..."] call A_loading_fnc_update_title;
[(6/A_loading_var_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;



// 	Loading finished, mission a go
["Loading Complete"] call A_loading_fnc_update_title;
[1] call A_loading_fnc_update_progress;
[] call A_loading_fnc_stop;











// Other shit to sort out


_h = [] execVM "Awesome\MyStats\functions.sqf";
waitUntil{scriptDone _h};

// Starts up Awesome scripts
_h = [] execVM "Awesome\init.sqf";
waitUntil{scriptDone _h};

/*
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
		[] execVM "Awesome\Scripts\A_other_fnc_communications.sqf";
		[] execVM "Awesome\Client\A_client_fnc_loop.sqf";
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
*/



publicvariable "station1robbed";
if (isServer) then {
	[] execVM "druguse.sqf";
	[] execVM "drugreplenish.sqf";
	[] execVM "robpool.sqf";

	//=======================rob gas station init and variables================
	station1money = 5000;
	[] execVM "stationrobloop.sqf";
	
	publicvariable "station1money";
};
if(isClient) then {
	server globalChat "Loading - Please Wait";
	[] execVM "Awesome\Functions\A_other_fnc_holster.sqf";
	[] execVM "clientloop.sqf";
	[] spawn A_gang_fnc_loop;
	[] execVM "respawn.sqf";
	[] execVM "petrolactions.sqf";
	[] execVM "nametags.sqf";
	server globalChat "Loading - Complete";
	[] execVM "Awesome\Functions\markers.sqf";
	[] execVM "Awesome\Functions\salary.sqf";
	[] execVM "Awesome\Functions\mounted_functions.sqf";
	
	server globalChat format["UID: %1", getPlayerUID player];

	player addEventHandler ["fired", {_this call A_player_fnc_handle_fired}];
	player addEventHandler ["HandleDamage", {_this call A_player_fnc_handle_damage}];
	//player addEventHandler ["WeaponAssembled", {_this execVM "Awesome\EH\A_eh_fnc_weaponassembled.sqf"}];
	[] execVM "onKeyPress.sqf";
	[] execVM "onMouse.sqf";
	[] ExecVM "Awesome\Functions\camera_functions.sqf";
	[] ExecVM "Awesome\Functions\list_menu_functions.sqf";

	if ((["cop_blacklist", (getPlayerUID player)] call A_list_fnc_contains_key) && ([player] call A_player_fnc_blufor)) then {
		[] spawn {
			player groupChat format["WARNING: You have been blacklisted from the bluefor side."];
			sleep 5;
			endMission "LOSER";
		};
	};
};
