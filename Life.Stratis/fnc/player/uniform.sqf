// A_player_fnc_uniform

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {""};

(uniform _player)
