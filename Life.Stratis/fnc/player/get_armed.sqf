// A_player_fnc_get_armed

#include "header.h"


ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {false};

private["_armed"];
_armed = [_player, "armed"] call A_object_fnc_getVariable;
_armed = if (UNDEFINED(_armed)) then { false } else { _armed};
_armed = if (typeName _armed != "BOOL") then {false} else {_armed};
_armed
