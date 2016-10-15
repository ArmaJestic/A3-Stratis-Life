// A_bases_fnc_underground_player_inside

#include "header.h"


params["_player"];
private _position = _player modelToWorld [0,0,0];
//we can assume the player is inside a bunker if the height value is large
((_position select 2) > 7500)