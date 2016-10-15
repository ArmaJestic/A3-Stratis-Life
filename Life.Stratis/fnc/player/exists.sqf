// A_player_fnc_exists

#include "header.h"


params[["_player",objNull,[objNull,0]]];
if ((typeName _player) == "SCALAR") exitwith {false};
if (isNull _player) exitwith {false};
true