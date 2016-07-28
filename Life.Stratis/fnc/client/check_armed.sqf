// A_client_fnc_check_armed

#include "..\..\includes\macro.h"


ARGV(0,_player);

if (undefined(_player)) exitWith { false };
if (not(alive _player)) exitWith {false};

private["_armed_vehicle", "_armed_player"];
_armed_vehicle = ([_player] call A_client_fnc_check_armed_vehicle);
_armed_player =  ([_player] call A_client_fnc_check_armed_player);
_was_stunning = ([_player] call A_client_fnc_check_armed_stunning);

//player groupChat format["_armed_vehicle = %1, _armed_player = %2, _was_stunning = %3", _armed_vehicle, _armed_player, _was_stunning];

private["_armed"];
_armed = _armed_vehicle || _armed_player || _was_stunning;
[_player, _armed] call A_player_fnc_update_armed;
[_player, "armed", _armed] call A_object_fnc_setVariable;
_armed
