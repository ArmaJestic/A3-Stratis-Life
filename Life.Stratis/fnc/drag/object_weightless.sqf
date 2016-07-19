// A_drag_fnc_object_weightless

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
if (undefined(_object)) exitWith {false};

private["_weightless"];
_weightless = false;
{
	if (_object isKindOf _x) exitWith {
		_weightless = true;
	};
} forEach A_drag_var_weightless_classes;
_weightless
