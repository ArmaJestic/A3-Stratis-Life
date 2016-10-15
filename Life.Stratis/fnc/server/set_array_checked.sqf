// A_server_fnc_set_array_checked

#include "header.h"


//player groupChat format["A_server_fnc_set_array_checked %1", _this];
diag_log format['A_server_fnc_set_array_checked: %1', _this];

ARGV(0,_variable_name);
ARGV(1,_variable_value);
ARGV(2,_check_change);

diag_log format['A_server_fnc_set_array_checked: exit checks'];

if (UNDEFINED(_variable_name)) exitWith {diag_log format['A_server_fnc_set_array_checked: exit1']; null};
    if (UNDEFINED(_variable_value)) exitWith {diag_log format['A_server_fnc_set_array_checked: exit2']; null};
if (UNDEFINED(_check_change)) exitWith {diag_log format['A_server_fnc_set_array_checked: exit3']; null};

if (typeName _variable_name != "STRING") exitWith {diag_log format['A_server_fnc_set_array_checked: exit4']; null};
if (typeName _variable_value != "ARRAY") exitWith {diag_log format['A_server_fnc_set_array_checked: exit5']; null};
if (typeName _check_change != "BOOL") exitWith {diag_log format['A_server_fnc_set_array_checked: exit6']; null};

diag_log format['A_server_fnc_set_array_checked: exits passed'];

private["_current_value"];

if (_check_change) then {
	_current_value = [_variable_name] call A_server_fnc_get_array;	
	if (str(_current_value) == str(_variable_value)) exitWith {null};
};

server setVariable[_variable_name, _variable_value, true];

diag_log format['A_server_fnc_set_array_checked: calling A_stats_fnc_server_save'];
[_variable_name, _variable_value] call A_stats_fnc_server_save;

diag_log format['A_server_fnc_set_array_checked: complete'];
