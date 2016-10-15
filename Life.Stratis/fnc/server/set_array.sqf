// A_server_fnc_set_array

#include "header.h"


//player groupChat format["A_server_fnc_set_array %1", _this];
diag_log format['A_server_fnc_set_array: %1', _this];

ARGV(0,_variable_name);
ARGV(1,_variable_value);

diag_log format['A_server_fnc_set_array: calling A_server_fnc_set_array_checked'];

[_variable_name, _variable_value, true] call A_server_fnc_set_array_checked;

diag_log format['A_server_fnc_set_array: complete'];
