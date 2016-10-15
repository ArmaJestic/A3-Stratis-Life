// A_actions_fnc_clear_new_actions

#include "..\..\includes\macro.h"


if (UNDEFINED(new_actions) || typeName new_actions != "ARRAY") exitWith {null};

{
	_action_number = _x select 0;
	_target = _x select 1;
	_target removeAction _action_number;
} foreach new_actions;

new_actions = null;
