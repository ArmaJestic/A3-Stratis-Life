// A_player_fnc_near_civilians

#include "header.h"


ARGV(0,_player);
ARGV(1,_distance);
(([_player, civilian, _distance] call A_player_fnc_near_side_count) > 0)
