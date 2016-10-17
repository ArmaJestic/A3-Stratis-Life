// A_player_fnc_rejoin_camera

#include "header.h"


params["_player"];
if (!([_player] call A_player_fnc_exists)) exitWith {};


private _delay = [_player] call A_player_fnc_dead_wait_time;

private _min_dead_time = call A_player_fnc_minimum_dead_time;
private _jailtimeleft = [_player, "jailtimeleft"] call A_player_fnc_get_scalar;
if (_jailtimeleft > _min_dead_time) then { 
	_jailtimeleft = _jailtimeleft - _min_dead_time;
	[_player, "jailtimeleft", _jailtimeleft] call A_player_fnc_set_scalar;
	player groupChat format["Your prison sentence has been reduced by %1 second/s", _min_dead_time];
	_delay  = _min_dead_time;
};

private _delay = 30;
private _end_time = time + _delay;
setPlayerRespawnTime _delay;
[_end_time, 5] spawn A_player_fnc_rejoin_camera_choice;
[_end_time, 6] spawn A_player_fnc_rejoin_camera_text;
[] call A_player_fnc_rejoin_camera_movement;