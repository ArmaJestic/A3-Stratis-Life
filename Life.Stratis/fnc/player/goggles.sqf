// A_player_fnc_goggles

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {""};

(goggles player)
