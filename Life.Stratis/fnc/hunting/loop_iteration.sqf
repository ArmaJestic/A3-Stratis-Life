// A_hunting_fnc_loop_iteration

#include "../../includes/macro.h"


ARGV(0,_timer);
{
	private["_hunting_area"];
	_hunting_area = _x;
	[_hunting_area, _timer] call A_hunting_fnc_loop_iteration_area;
} forEach hunting_areas;
