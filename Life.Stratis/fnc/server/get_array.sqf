// A_server_fnc_get_array

#include "header.h"


params[["_variable_name",null]];

diag_log format['A_server_fnc_get_array (%1): start', _this];

if (UNDEFINED(_variable_name)) exitWith {[]};

private _variable_value = server getVariable [_variable_name,null];

diag_log format['A_server_fnc_get_array(%1): %2',_this,_variable_value];

if (UNDEFINED(_variable_value) || {(typeName _variable_value) != "ARRAY"}) then {
	[]
}else{
	_variable_value
}