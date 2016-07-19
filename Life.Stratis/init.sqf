isClient = !isServer || (isServer && !isDedicated);
if (isClient) then {
	//player globalChat format["Waitin for player ..."];
	waitUntil {(not(isNull player) && {isPlayer player})};
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


// Everything before loading screen, setting up loading screen
fnc_includes = compile preprocessFileLineNumbers "includes\includes.h";
[] call fnc_includes;
fnc_includes_macro = compSQF("includes\macro.h")
fnc_includes_constants = compSQF("includes\constants.h")
[] call fnc_includes_macro;
[] call fnc_includes_constants;

// Not used anymore
//fnc_initRun = compSQF("fnc\initRun.sqf")

[] call A_parameters_fnc_init1;
[] call A_loading_fnc_init1;

[]	call A_loading_fnc_start;
["Pre-loading operations..."] call A_loading_fnc_update_title;
[(1/loading_stages_total)] call A_loading_fnc_update_progress;
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
[(2/loading_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

ExecSQFwait("fnc\init1.sqf")

//	Run init2
["Running init2..."] call A_loading_fnc_update_title;
[(3/loading_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

ExecSQFwait("fnc\init2.sqf")

//	Wait for server to finish
["Waiting for server to finish..."] call A_loading_fnc_update_title;
[(4/loading_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

// 	Load stats
["Starting stat loading..."] call A_loading_fnc_update_title;
[(5/loading_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;

[] call A_stats_fnc_init2;

// 	Run startup functions for whatevers needed
["Running final operations..."] call A_loading_fnc_update_title;
[(6/loading_stages_total)] call A_loading_fnc_update_progress;
uiSleep 1;



// 	Loading finished, mission a go
["Loading Complete"] call A_loading_fnc_update_title;
[1] call A_loading_fnc_update_progress;
uiSleep 1;
[] call A_loading_fnc_stop;











// Other shit to sort out


_h = [] execVM "Awesome\MyStats\functions.sqf";
waitUntil{scriptDone _h};

// Starts up Awesome scripts
_h = [] execVM "Awesome\init.sqf";
waitUntil{scriptDone _h};



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
	[] execVM "Awesome\Functions\holster.sqf";
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
	//player addEventHandler ["WeaponAssembled", {_this execVM "Awesome\EH\EH_weaponassembled.sqf"}];
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
