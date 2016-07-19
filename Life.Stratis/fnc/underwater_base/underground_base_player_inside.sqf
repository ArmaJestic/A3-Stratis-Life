// A_underwater_base_fnc_underground_base_player_inside

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
private["_position"];
_position = _player modelToWorld [0,0,0];
//we can assume the player is inside a bunker if the height value is large
((_position select 2) > 7500)
