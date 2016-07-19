// A_gang_fnc_flag_setup

#include "..\..\includes\macro.h"


ARGV(0,_anchor);
private ["_banner"];
_banner = [_anchor, "banner"] call A_object_fnc_getVariable;

[_anchor, 0,0] call A_misc_fnc_setPitchBank;

if (undefined(_banner)) then {
	private["_pole_data"];
	_pole_data = [format["%1_pole", str(_anchor)], (getPos _anchor)] call A_flag_pole_fnc_create;
	[_anchor, "banner", _pole_data, true] call A_object_fnc_setVariable;
};
