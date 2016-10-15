// A_player_fnc_near_side_count

#include "header.h"


ARGV(0,_player);
ARGV(1,_side);
ARGV(2,_distance);

(count ([_player, _side, _distance] call A_player_fnc_near_side))
