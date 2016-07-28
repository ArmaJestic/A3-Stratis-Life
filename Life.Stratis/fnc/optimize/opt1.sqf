// A_optimize_fnc_opt1

#include "..\..\includes\macro.h"


{
	private["_name", "_string"];
	_name = _x;
	_string = format["A_SCRIPT_%1", toUpper(_name)];
	missionNamespace setVariable[_string, compile (preprocessfileLineNumbers format["%1.sqf", _name])];	
} forEach A_optimize_var_a_script_lists;
