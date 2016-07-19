// A_player_fnc_near_cops

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_distance);
(([_player, west, _distance] call A_player_fnc_near_side_count) > 0)
