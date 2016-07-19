// A_player_fnc_reset_gear

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

[_player] call A_player_fnc_reset_weapons;
[_player] call A_player_fnc_reset_items;
