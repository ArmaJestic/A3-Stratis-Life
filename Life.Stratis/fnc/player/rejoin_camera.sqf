// A_player_fnc_rejoin_camera

#include "../../includes/macro.h"


player groupChat format["A_player_fnc_rejoin_camera %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {};


private["_delay"];
_delay = [_player] call A_player_fnc_dead_wait_time;

private["_end_time"];

private["_jailtimeleft", "_min_dead_time"];
_min_dead_time = call A_player_fnc_minimum_dead_time;
_jailtimeleft = [_player, "jailtimeleft"] call A_player_fnc_get_scalar;
if (_jailtimeleft > _min_dead_time) then { 
	_jailtimeleft = _jailtimeleft - _min_dead_time;
	[_player, "jailtimeleft", _jailtimeleft] call A_player_fnc_set_scalar;
	player groupChat format["Your prison sentence has been reduced by %1 second/s", _min_dead_time];
	_delay  = _min_dead_time;
};

_delay = 30;
_end_time = time + _delay;
setPlayerRespawnTime 30;
[_end_time, 5] spawn A_player_fnc_rejoin_camera_choice;
[_end_time, 6] spawn A_player_fnc_rejoin_camera_text;
[] call A_player_fnc_rejoin_camera_movement;
