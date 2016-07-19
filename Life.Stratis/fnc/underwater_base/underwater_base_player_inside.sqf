// A_underwater_base_fnc_underwater_base_player_inside

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
private["_position"];
_position = _player modelToWorld [0,0,0];
//we can assume player is in underwater base if Y axis is very low
(((_position select 1) < 100) && ((_position select 0) > 8000))
