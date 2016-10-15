// A_drag_fnc_remove_action

#include "header.h"


params["_player"];
if (UNDEFINED(_player)) exitWith {};

private _active_action = [_player, "active_action", -1] call A_object_fnc_getVariable;
if (_active_action < 0) exitWith {};

_player removeAction _active_action;

[_player, "active_target", nil] call A_object_fnc_setVariable;
[_player, "active_action", nil] call A_object_fnc_setVariable;