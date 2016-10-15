// A_drag_fnc_object_weightless

#include "header.h"


params["_object"];
if (UNDEFINED(_object)) exitWith {false};

private _weightless = false;
{
	if (_object isKindOf _x) exitWith {
		_weightless = true;
	};
} forEach A_drag_var_weightless_classes;
_weightless