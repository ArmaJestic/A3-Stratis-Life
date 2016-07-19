// A_drag_fnc_take_object

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_target);
if (undefined(_player)) exitWith {};
if (undefined(_target)) exitWith {};

[_player] call A_drag_fnc_remove_action;
[_player, _target] call A_drag_fnc_object_attach;
