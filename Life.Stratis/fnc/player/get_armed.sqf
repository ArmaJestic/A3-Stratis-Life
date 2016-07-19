// A_player_fnc_get_armed

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {false};

private["_armed"];
_armed = [_player, "armed"] call A_object_fnc_getVariable;
_armed = if (undefined(_armed)) then { false } else { _armed};
_armed = if (typeName _armed != "BOOL") then {false} else {_armed};
_armed
