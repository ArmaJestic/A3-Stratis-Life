// A_player_fnc_set_array

#include "header.h"


diag_log format['A_player_fnc_set_array %1: start',_this];

params["_player","_variable_name","_variable_value"];

[_player, _variable_name, _variable_value, true] call A_player_fnc_set_array_checked;

diag_log format['A_player_fnc_set_array %1: end',_this];