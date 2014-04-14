#include "Awesome\Functions\macro.h"
#include "Awesome\Functions\constants.h"
setPlayerRespawnTime 9999;
0 fadeSound 0;
showGPS false;
showMap false;

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




enableSaving [false, false];


isClient = !isServer || (isServer && !isDedicated);

sleep 0.5;


WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 0];
EAST setFriend [WEST, 0];
EAST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [RESISTANCE, 0];


if (isClient) then {
	//player globalChat format["Waitin for player ..."];
	waitUntil {(not(isNull player) && {isPlayer player})};
	titleText ["", "BLACK OUT", 0.0001];
};
debug  = false;

_h = [] execVM "Awesome\MyStats\functions.sqf";
waitUntil{scriptDone _h};

// Starts up Awesome scripts
_h = [] execVM "Awesome\init.sqf";
waitUntil{scriptDone _h};


publicvariable "station1robbed";
publicvariable "station2robbed";
publicvariable "station3robbed";
publicvariable "station4robbed";
publicvariable "station5robbed";
publicvariable "station6robbed";
publicvariable "station7robbed";
publicvariable "station8robbed";
publicvariable "station9robbed";

if(isClient) then {
	server globalChat "Loading - Please Wait";
	[] execVM "Awesome\Functions\holster.sqf";
	[] execVM "clientloop.sqf";
	[] spawn gangs_loop;
	[] execVM "respawn.sqf";
	[] execVM "petrolactions.sqf";
	[] execVM "nametags.sqf";
	server globalChat "Loading - Complete";
	[] execVM "Awesome\Functions\markers.sqf";
	[] execVM "Awesome\Functions\salary.sqf";
	//[] execVM "motd.sqf";
	[] execVM "Awesome\Functions\mounted_functions.sqf";
	
	//["client"] execVM "bombs.sqf";
	
	server globalChat format["UID: %1", getPlayerUID player];

	player addEventHandler ["fired", {_this call player_handle_fired}];
	player addEventHandler ["HandleDamage", {_this call player_handle_damage}];
	//player addEventHandler ["WeaponAssembled", {_this execVM "Awesome\EH\EH_weaponassembled.sqf"}];
	[] execVM "onKeyPress.sqf";
	[] execVM "onMouse.sqf";
	[] ExecVM "Awesome\Functions\camera_functions.sqf";
	[] ExecVM "Awesome\Functions\list_menu_functions.sqf";

	if ((["cop_blacklist", (getPlayerUID player)] call list_contains_key) && ([player] call player_cop)) then {
		[] spawn {
			player groupChat format["WARNING: You have been blacklisted from the bluefor side."];
			sleep 5;
			endMission "LOSER";
		};
	};
};

if (isServer) then {
	[] execVM "druguse.sqf";
	[] execVM "drugreplenish.sqf";
	[] execVM "robpool.sqf";

//=======================rob gas station init and variables================
	station1money = 5000;
	[] execVM "stationrobloop.sqf";
	
	publicvariable "station1money";
//	station2money = 5000;
//	publicvariable "station2money";
//	station3money = 5000;
//	publicvariable "station3money";
//	station4money = 5000;
//	publicvariable "station4money";
//	station5money = 5000;
//	publicvariable "station5money";
//	station6money = 5000;
//	publicvariable "station6money";
//	station7money = 5000;
//	publicvariable "station7money";
//	station8money = 5000;
//	publicvariable "station8money";
//	station9money = 5000;
//	publicvariable "station9money";
};
