// A_stats_fnc_update_variables_list

#include "../../includes/macro.h"

private["_object", "_variable_name"];
_object = _this select 0;
_variable_name = _this select 1;

if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};
if (undefined(_variable_name)) exitWith {null};
if (typeName _variable_name != "STRING") exitWith {null};

private["_variables_list"];
_variables_list = [_object] call A_stats_fnc_get_variables_list;

if (not(_variable_name in _variables_list)) then {
	_variables_list = _variables_list + [_variable_name];
	[_object, _variables_list] call A_stats_fnc_set_variables_list;
};
