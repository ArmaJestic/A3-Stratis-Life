// A_player_fnc_near_side_spawn

#include "header.h"


ARGV(0,_player);
ARGV(1,_side);
ARGV(2,_distance);

if (UNDEFINED(_distance)) exitWith {false};
if (typeName _distance != "SCALAR") exitWith {false};

private["_cdistance"];
_cdistance = [_player, _side] call A_player_fnc_distance_side_spawn;
if (_cdistance < 0) exitWith {false};
(_cdistance <= _distance)
