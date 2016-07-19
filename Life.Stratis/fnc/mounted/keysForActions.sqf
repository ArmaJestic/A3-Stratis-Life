// A_mounted_fnc_keysForActions

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_actions);
if (undefined(_actions)) exitWith {[]};
if (typeName _actions != "ARRAY") exitWith {[]};

private["_keys"];
_keys = [];
{
	private["_action"];
	_action = _x;
	if (true) then {
		if (undefined(_action)) exitWith {null};
		if (typeName "_action" != "STRING") exitWith {null};
		_keys = _keys + (actionKeys _action);
	};
} foreach _blocked_actions;
_keys
