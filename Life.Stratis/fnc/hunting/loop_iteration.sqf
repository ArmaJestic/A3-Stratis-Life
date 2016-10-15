// A_hunting_fnc_loop_iteration

#include "header.h"


params["_startTime"];
private _timer = round(diag_tickTime - _startTime);
{
	private _hunting_area = _x;
	[_hunting_area, _timer] call A_hunting_fnc_loop_iteration_area;
} forEach A_hunting_var_areas;