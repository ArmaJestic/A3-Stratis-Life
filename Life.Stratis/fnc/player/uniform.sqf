// A_player_fnc_uniform

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {""};

(uniform _player)
