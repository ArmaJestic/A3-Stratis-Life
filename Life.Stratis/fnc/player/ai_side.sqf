// A_player_fnc_ai_side

#include "header.h"


ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {sideUnknown};
if (typeName _player != "OBJECT") exitWith {sideUnknown};
if (isNull _player) exitWith {sideUnknown};

(side _player)