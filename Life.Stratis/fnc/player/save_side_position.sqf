// A_player_fnc_save_side_position

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_position_atl", "_direction"];
_position_atl = getPosATL _player;
_direction = getDir _player;

diag_log format["A_player_fnc_save_side_position %1 %2", _position_atl, _direction];
[_player, format["position_atl_%1", _side], _position_atl] call A_player_fnc_set_array;
[_player, format["direction_%1", _side], _direction] call A_player_fnc_set_scalar;
