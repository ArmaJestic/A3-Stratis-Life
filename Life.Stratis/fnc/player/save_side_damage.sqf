// A_player_fnc_save_side_damage

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_damage"];
_damage = damage _player;
//diag_log format["Saving damage %1", _damage];
diag_log format["A_player_fnc_save_side_damage = %1", _damage];
[_player, format["damage_%1", _side], _damage] call A_player_fnc_set_scalar;
