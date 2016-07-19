// A_stats_fnc_copy_variables

#include "../../includes/macro.h"

private["_old_player", "_new_player"];
_old_player = _this select 0;
_new_player = _this select 1;

if (undefined(_old_player)) exitWith {null};
if (typeName _old_player != "OBJECT") exitWith {null};
if (undefined(_new_player)) exitWith {null};
if (typeName _new_player != "OBJECT") exitWith {null};

private["_variables_list"];
_variables_list = [_old_player] call A_stats_fnc_get_variables_list;

{
	private["_variable_name", "_variable_value"];
	_variable_name = _x;
	_variable_value = [_old_player, _variable_name] call A_object_fnc_getVariable;
	[_new_player, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
} forEach _variables_list;

[_new_player, _variables_list] call A_stats_fnc_set_variables_list;
