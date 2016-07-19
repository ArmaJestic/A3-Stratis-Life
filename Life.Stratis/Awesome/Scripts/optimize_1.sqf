#include "..\..\includes\macro.h"

if (not(undefined(optimize_1_functions_defined))) exitWith {};

A_SCRIPT_LISTS =
[
	"settings",
	"bombs",
	"pullout"
];

{
	private["_name", "_string"];
	_name = _x;
	_string = format["A_SCRIPT_%1", toUpper(_name)];
	missionNamespace setVariable[_string, compile (preprocessfileLineNumbers format["%1.sqf", _name])];	
} forEach A_SCRIPT_LISTS;

optimize_1_functions_defined = true;
