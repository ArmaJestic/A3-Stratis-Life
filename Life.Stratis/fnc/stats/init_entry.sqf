// A_stats_fnc_init_entry

#include "../../includes/macro.h"

private["_object", "_variable", "_value"];

_object = _this select 0;
_variable = _this select 1;
_value = _this select 2;

if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};
if (undefined(_variable)) exitWith {null};
if (typeName _variable != "STRING") exitWith {null};


//check if it already has a value
if ((_object == player) || (_object == server)) then {
	private["_current_value"];
	_current_value = missionNameSpace getVariable _variable;
	if (not(undefined(_current_value))) exitWith {null};
	missionNamespace setVariable [_variable, _value];
	[_object, _variable, _value, true] call A_object_fnc_setVariable;
}
else {
	[_object, _variable, _value, true] call A_object_fnc_setVariable;
};

//diag_log format["%1, %2 = %3", _object, _variable, _value];
[_object, _variable] call A_stats_fnc_update_variables_list;
