// A_player_fnc_exists

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {false};
if (typeName _player != "OBJECT") exitWith {false};
if (isNull _player) exitWith {false};
true
