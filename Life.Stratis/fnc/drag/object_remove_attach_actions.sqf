// A_drag_fnc_object_remove_attach_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {};

private["_actions"];
_actions = [_player, "attach_actions", []] call A_object_fnc_getVariable;
{
	_player removeAction _x;
} forEach _actions;
