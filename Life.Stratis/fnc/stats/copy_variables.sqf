// A_stats_fnc_copy_variables

#include "header.h"


params[["_old_player",null,[objNull]], ["_new_player",null,[objNull]]];

if (UNDEFINED(_old_player)) exitWith {null};
if (UNDEFINED(_new_player)) exitWith {null};

private _variables_list = [_old_player] call A_stats_fnc_get_variables_list;
{
	private _variable_name = _x;
	private _variable_value = [_old_player, _variable_name] call A_object_fnc_getVariable;
	[_new_player, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
} forEach _variables_list;

[_new_player, _variables_list] call A_stats_fnc_set_variables_list;
