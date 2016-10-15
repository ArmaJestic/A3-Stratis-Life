// A_player_fnc_set_armed

#include "header.h"


ARGV(0,_player);
ARGV(1,_armed);
if (UNDEFINED(_player)) exitWith {false};
if (UNDEFINED(_armed)) exitWith {false};
if (typeName _armed != "BOOL") exitWith {false};

[_player, "armed", _armed, true] call A_object_fnc_setVariable;
