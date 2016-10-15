// A_stats_fnc_init_entry

#include "header.h"


params[["_object",objNull,[objNull]],["_variable",null,[""]],"_value"];

if (isNull _object) exitWith {};
if (UNDEFINED(_variable)) exitWith {};

//check if it already has a value
if ((_object == player) || (_object == server)) then {
	private _current_value = missionNameSpace getVariable _variable;
	if (DEFINED(_current_value)) exitWith {};
	missionNamespace setVariable[_variable, _value];
};
[_object,_variable,_value,true] call A_object_fnc_setVariable;

[_object,_variable] call A_stats_fnc_update_variables_list;