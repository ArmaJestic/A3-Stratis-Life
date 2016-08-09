/* refer to
https://community.bistudio.com/wiki/Initialization_Order
https://community.bistudio.com/wiki/Event_Scripts

setup initServer/initPlayerServer/InitPlayerLocal/ect
parameters passed to files
	initServer			None								runs on server on start
	initPlayerServer	[player (object), JIP (bool)]		runs on server on player start (start/jip)
	initPlayerLocal		[player (object), JIP (bool)]		runs on player on mission start (start/jip)
*/

// work in progress, still a lot of moving around needed


// Includes
#include "includes\macro.h"

// todo: rename to follow prefixs like all other variables/functions?
// required for function params
null = 0xe0ffffef;
null__ = {
	private _variable_value = _this;
	if ((typeName _variable_value) != "SCALAR") exitwith {false};
	if (_variable_value != null) exitWith {false};
	true
};
// todo: look into uses/if correct/easier method?
// should be moved somewhere else, own function file
MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};


// loadup parameters
RIB(param)
// loading err stuff
RIB(err)
// setup loading stuff
RIB(loading)


// todo: create/setup loading queue
[]	call A_loading_fnc_start;
["checking client/server setup", 0] call A_loading_fnc_update;

LOGED(A INIT: starting)


// Variable for identifying client
// useless since only dedicated servers are allowed (just use !isServer)
isClient = !(isServer);

// todo: move specific blocks to functions (A_init_fnc_x)
// Pre checks
if (isMultiplayer) then {
	if (isDedicated) then {
		if (isServer) then {
			// Is dedicated server
			"A INIT: is dedicated server" call A_err_fnc_logd;
		}else{
			if (hasInterface) then {
				// is player
				"A INIT: is player" call A_err_fnc_logd;
				
				// wait until player object is all setup?
				// look into if this is necessary, remnant of old mission file
				waitUntil {(!(isNull player) && {isPlayer player})};
				titleText ["", "BLACK OUT", 0.0001];
				
			}else{
				// is headless client
				"A INIT: is headless client" call A_err_fnc_logd;
			};
		};
	}else{
		"A INIT ERROR: GAME NOT DEDICATED" call A_err_fnc_end;
	};
}else{
	"A INIT ERROR: NOT RUNNING IN MULTIPLAYER" call A_err_fnc_end;
};


["running pre-init operations", 0] call A_loading_fnc_update;

// verify if each is needed/useful, from old file mainly
0 fadeSound 0;
showGPS false;
showMap false;

enableSaving [false, false];
enableEngineArtillery false;
setPlayerRespawnTime 30;

// setup side relations
// little/no AI, so shouldn't be an issue
// https://community.bistudio.com/wiki/setFriend
// https://community.bistudio.com/wiki/Side_relations
WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 0];
EAST setFriend [WEST, 0];
EAST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
CIVILIAN setFriend [WEST, 1];
CIVILIAN setFriend [EAST, 1];
CIVILIAN setFriend [RESISTANCE, 1];


// call fnc/init1
["running init1 set", 0] call A_loading_fnc_update;
RI1(fnc)

["waiting for server setup complete", 0] call A_loading_fnc_update;
waitUntil A_loading_fnc_check_server_complete;

// call fnc/init2
["running init2 set", 0] call A_loading_fnc_update;
RI2(fnc)

if (!isServer) then {
	player addEventHandler ["fired", {_this call A_player_fnc_handle_fired}];
	player addEventHandler ["HandleDamage", {_this call A_player_fnc_handle_damage}];
//	[] execVM "onKeyPress.sqf";
//	[] execVM "onMouse.sqf";

	if ((["cop_blacklist", (getPlayerUID player)] call list_contains_key) && ([player] call player_cop)) then {
		[] spawn {
			player groupChat format["WARNING: You have been blacklisted from the bluefor side."];
			sleep 5;
			endMission "LOSER";
		};
	};
};


["ending", 1] call A_loading_fnc_update;

[] call A_loading_fnc_stop;

LOGED(A INIT: ending)

// end of init