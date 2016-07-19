// A_stats_fnc_server_save

//Method intended to be run on server-side, it is used for saving SERVER specific variables (can be run on client side as well)
//Arguments are [key,value]

#include "../../includes/macro.h"

diag_log format['A_stats_fnc_save: %1', _this];

private["_variable", "_value"];
	
_variable = _this select 0;
_value = _this select 1;

diag_log format['A_stats_fnc_server_save: exit checks'];
	
if (undefined(_variable)) exitWith {diag_log format['A_stats_fnc_server_save: exit1']; null};
if (undefined(_value)) exitWith {diag_log format['A_stats_fnc_server_save: exit2']; null};
if (typeName _variable != "STRING") exitWith {diag_log format['A_stats_fnc_server_save: exit3']; null};
	
diag_log format['A_stats_fnc_server_save: exits passed'];
	
diag_log format['A_stats_fnc_server_save: calling A_stats_fnc_save'];
private["_uid"];
[A_stats_var_server_uid, _variable, _value] call A_stats_fnc_save;
	
diag_log format['A_stats_fnc_server_save: complete'];
