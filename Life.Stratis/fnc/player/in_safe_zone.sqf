// A_player_fnc_in_safe_zone

#include "header.h"


params[["_unit",null,[objNull]]];
if (UNDEFINED(_unit)) exitwith {false};
// todo: verify if unit is a 'human' object?
// todo: check added bases spawns

if (_unit distance (getmarkerpos "respawn_civilian") < 130) exitwith {true};
if (_unit distance (getmarkerpos "respawn_west") < 100) exitwith {true};
if (_unit distance (getmarkerpos "respawn_east") < 100) exitwith {true};
if (_unit distance (getmarkerpos "respawn_guerrila") < 100) exitwith {true};

false