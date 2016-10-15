// A_halo_fnc_remove_all_smoke_actions

#include "..\..\includes\macro.h"


ARGV(0,_unit);
_actions = [_unit, "halo_smoke_actions"] call A_object_fnc_getVariable;
if (UNDEFINED(_actions)) exitWith {null};
if (typeName _actions != "ARRAY") exitWith {null};

{
	_smoke_struct = _x;
	_smoke_action = _x select 0;
	_smoke_class = _x select 1;
	_unit removeAction _smoke_action;
} foreach _actions;
