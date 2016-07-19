// A_player_fnc_teleport_spawn

#include "../../includes/macro.h"


ARGV(0,_player);
private["_respawn_marker"];
_respawn_marker = [([_player] call A_player_fnc_side)] call A_player_fnc_side_spawn_marker;
_player setVelocity [0,0,0];
_player setPos (getMarkerPos _respawn_marker);
