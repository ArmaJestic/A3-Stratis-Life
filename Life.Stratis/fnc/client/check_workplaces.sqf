// A_client_fnc_check_workplaces

#include "..\..\includes\macro.h"


{
	private["_workplace", "_object", "_radius"];
	_workplace = _x;
	_object = _workplace select A_main_var_workplace_object;
	_radius = _workplace select A_main_var_workplace_radius;
	if ((player distance _object) < _radius) then {
		A_main_var_A_main_var_timeinworkplace = A_main_var_A_main_var_timeinworkplace + 1;
	};
} forEach A_main_var_workplacearray;
