// A_list_fnc_create

#include "..\..\includes\macro.h"


//player groupChat format["A_list_fnc_create %1", _this];
diag_log format['A_list_fnc_create: %1', _this];

ARGV(0,_list_id);
ARGV(1,_list_name);

diag_log format['A_list_fnc_create: Exit checks'];

if (undefined(_list_id)) exitWith {diag_log format['A_list_fnc_create: Exit1']; null};
if (typeName _list_id != "STRING") exitWith {diag_log format['A_list_fnc_create: Exit2']; null};
if (undefined(_list_name)) exitWith {diag_log format['A_list_fnc_create: Exit3']; null};
if (typeName _list_name != "STRING") exitWith {diag_log format['A_list_fnc_create: Exit4']; null};

if ([_list_id] call A_list_fnc_exists) exitWith {diag_log format['A_list_fnc_create: Exit5']; null};

diag_log format['A_list_fnc_create: Exits passed'];

private["_data"];
_data = [];
_data set [A_list_var_id, _A_list_var_id];
_data set [A_list_var_name, _A_list_var_name];
_data set [A_list_var_keys, []];
_data set [A_list_var_values, []];

diag_log format['A_list_fnc_create: calling A_server_fnc_set_array'];

[_list_id, _data] call A_server_fnc_set_array;

diag_log format['A_list_fnc_create: complete'];
