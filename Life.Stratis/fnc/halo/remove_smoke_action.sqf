// A_halo_fnc_remove_smoke_action

#include "..\..\includes\macro.h"


ARGV(0,_unit);
ARGV(1,_smoke_class);
_actions = [_unit, "halo_smoke_actions"] call A_object_fnc_getVariable;
if (undefined(_actions)) exitWith {null};
if (typeName _actions != "ARRAY") exitWith {null};

{
	_smoke_struct = _x;
	_smoke_action = _x select 0;
	_smoke_cclass = _x select 1;
	if (_smoke_class == _smoke_cclass) exitWith {
		_unit removeAction _smoke_action;
	};
} foreach _actions;
