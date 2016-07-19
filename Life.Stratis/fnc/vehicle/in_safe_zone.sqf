// A_vehicle_fnc_in_safe_zone

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

private["_in_safe_zone"];
_in_safe_zone = false;

{
	private["_trigger"];
	_trigger = _x;
	if (_vehicle in (list _trigger)) exitWith {
		_in_safe_zone = true;
	};
} forEach INV_VehicleGaragen;

_in_safe_zone
