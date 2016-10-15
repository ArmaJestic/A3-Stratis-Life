// A_mounted_fnc_keysForActions

#include "header.h"


ARGV(0,_actions);
if (UNDEFINED(_actions)) exitWith {[]};
if (typeName _actions != "ARRAY") exitWith {[]};

private["_keys"];
_keys = [];
{
	private["_action"];
	_action = _x;
	if (true) then {
		if (UNDEFINED(_action)) exitWith {null};
		if (typeName "_action" != "STRING") exitWith {null};
		_keys = _keys + (actionKeys _action);
	};
} foreach _blocked_actions;
_keys
