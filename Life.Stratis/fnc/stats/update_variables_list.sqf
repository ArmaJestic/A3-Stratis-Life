// A_stats_fnc_update_variables_list

#include "header.h"


params[["_object",objNull,[objNull]], ["_variable_name",null,[""]]];

if (isNull _object) exitWith {null};
if (UNDEFINED(_variable_name)) exitWith {null};

private _variables_list = [_object] call A_stats_fnc_get_variables_list;

_variable_name = toLower(_variable_name);
if ((_variables_list pushBackUnique _variable_name) > -1) then {
	[_object, _variables_list] call A_stats_fnc_set_variables_list;
};