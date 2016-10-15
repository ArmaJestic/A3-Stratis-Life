// A_drag_fnc_object_active

#include "header.h"


params["_player"];

private _held_target = [_player, "held_target", objNull] call A_object_fnc_getVariable;
if (isNull _held_target) exitWith {false};

private _last_holder = [_held_target, "last_holder", objNull] call A_object_fnc_getVariable;
(_last_holder == _player)