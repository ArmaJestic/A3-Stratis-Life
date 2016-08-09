// A_underwater_base_fnc_under_base_check_effects

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_underwater_base_fnc_under_base_check_effects %1", time];
private["_player"];
_player = player;


private["_underwater_base", "_underground_base", "_respawning"];
_underwater_base = [_player] call A_underwater_base_fnc_underwater_base_player_inside;
_underground_base = ([_player] call A_underwater_base_fnc_underground_base_player_inside);
_respawning = (playerRespawnTime > 0) && !(alive _player);
//player grouPChat format["_respawning = %1", _respawning];

private["_under"];
_under = _underground_base || _underwater_base;

if (_under && !(_respawning)) then {
	showGPS false;
	showMap false;
	enableEnvironment false;
}else{
	showGPS true;
	showMap true;
	enableEnvironment true;
};

if (_underwater_base) exitWith {};

//player groupChat format["_inside_base = %1", _inside_base];
if (_under && !(time_loop_exit)) then {
	call A_underwater_base_fnc_under_base_set_night;
};

if (!(_under) && time_loop_exit) then {
	call A_underwater_base_fnc_under_base_set_day;
};
