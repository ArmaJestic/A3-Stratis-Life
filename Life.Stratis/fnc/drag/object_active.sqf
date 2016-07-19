// A_drag_fnc_object_active

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);

private["_held_target"];
_held_target = [_player, "held_target", objNull] call A_object_fnc_getVariable;
if (isNull _held_target) exitWith {false};


private["_last_holder"];
_last_holder = [_held_target, "last_holder", objNull] call A_object_fnc_getVariable;
(_last_holder == _player)
