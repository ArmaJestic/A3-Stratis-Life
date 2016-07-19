// A_drag_fnc_remove_action

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {};

private["_active_actions"];
_active_action = [_player, "active_action", -1] call A_object_fnc_getVariable;
if (_active_action < 0) exitWith {};

_player removeAction _active_action;

[_player, "active_target", nil] call A_object_fnc_setVariable;
[_player, "active_action", nil] call A_object_fnc_setVariable;

//player groupChat format["REMOVED: _action_id = %1", _active_action];
