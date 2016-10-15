// A_player_fnc_set_array_checked

#include "header.h"


diag_log format['A_player_fnc_set_array_checked %1: start',_this];


ARGV(0,_player);
ARGV(1,_variable_name);
ARGV(2,_variable_value);
ARGV(3,_check_change);

if (UNDEFINED(_player)) exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit1',_this]; null};
if (UNDEFINED(_variable_name)) exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit2',_this]; null};
    if (UNDEFINED(_variable_value)) exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit3',_this]; null};
if (UNDEFINED(_check_change)) exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit4',_this]; null};

if (typeName _variable_name != "STRING") exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit5',_this]; null};
if (typeName _variable_value != "ARRAY") exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit6',_this]; null};
if (typeName _check_change != "BOOL") exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit7',_this]; null};

if (_check_change) then {
	private["_current_value"];
	_current_value = [_player, _variable_name] call A_player_fnc_get_array;	
//	if (str(_current_value) == str(_variable_value)) exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit8',_this]; null};
	if (_current_value isEqualTo _variable_value) exitWith {diag_log format['A_player_fnc_set_array_checked %1: exit8',_this]; null};
};

[_player, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
[_player, _variable_name, _variable_value] call A_stats_fnc_player_save;


diag_log format['A_player_fnc_set_array_checked %1: end',_this];