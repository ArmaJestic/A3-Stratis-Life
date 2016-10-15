// A_player_fnc_set_string

#include "header.h"


diag_log format['A_player_fnc_set_string %1: start',_this];

params["_player","_variable_name","_variable_value"];

if (UNDEFINED(_player)) exitWith {diag_log format['A_player_fnc_set_string %1: exit1',_this];};
if (UNDEFINED(_variable_name)) exitWith {diag_log format['A_player_fnc_set_string %1: exit2',_this];};
if (UNDEFINED(_variable_value)) exitWith {diag_log format['A_player_fnc_set_string %1: exit3',_this];};

if (typeName _variable_name != "STRING") exitWith {diag_log format['A_player_fnc_set_string %1: exit4',_this];};
if (typeName _variable_value != "STRING") exitWith {diag_log format['A_player_fnc_set_string %1: exit5',_this];};

private _current_value = [_player, _variable_name] call A_player_fnc_get_string;
if (str(_current_value) == str(_variable_value)) exitWith {diag_log format['A_player_fnc_set_string %1: exit6',_this];};

[_player, _variable_name, _variable_value, true] call A_object_fnc_setVariable;
[_player, _variable_name, _variable_value] call A_stats_fnc_player_save;

diag_log format['A_player_fnc_set_string %1: end',_this];