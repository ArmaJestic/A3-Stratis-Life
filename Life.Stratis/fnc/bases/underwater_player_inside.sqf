// A_bases_fnc_underwater_player_inside

#include "header.h"


params["_player"];
private _position = _player modelToWorld [0,0,0];
//we can assume player is in underwater base if Y axis is very low
(((_position select 1) < 100) && {(_position select 0) > 8000})