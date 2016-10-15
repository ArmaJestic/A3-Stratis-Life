// A_drag_fnc_object_remove_attach_actions

#include "header.h"


params["_player"];
if (UNDEFINED(_player)) exitWith {};

private _actions = [_player, "attach_actions", []] call A_object_fnc_getVariable;
{
	_player removeAction _x;
} forEach _actions;