// A_player_fnc_distance_side_spawn

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_side);
if (!([_player] call A_player_fnc_exists)) exitWith {-1};
if (undefined(_side)) exitWith {-1};
if (typeName _side != "SIDE") exitWith {-1};

private["_respawn_marker"];
_respawn_marker = [_side] call A_player_fnc_side_spawn_marker;
(_player distance (getMarkerPos _respawn_marker))
