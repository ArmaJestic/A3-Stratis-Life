// A_player_fnc_headgear

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {""};

(headgear _player)
