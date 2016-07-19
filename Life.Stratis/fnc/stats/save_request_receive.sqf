// A_stats_fnc_save_request_receive

#include "..\..\includes\macro.h"

diag_log format['A_stats_fnc_save_request_receive: %1', _this];

private["_variable", "_request"];
	
_variable = _this select 0;
_request = _this select 1;
	
if (undefined(_request)) exitWith {null};
if (typeName _request != "ARRAY") exitWith {null};

private["_uid", "_key", "_value"];
_uid = _request select A_stats_var_save_request_uid;
_key = _request select A_stats_var_save_request_key;
_value = _request select A_stats_var_save_request_value;

diag_log format['A_stats_fnc_save_request_receive: Exit checks'];

if (undefined(_uid)) exitWith {diag_log format['A_stats_fnc_save_request_receive: Exit1']; null};
if (undefined(_key)) exitWith {diag_log format['A_stats_fnc_save_request_receive: Exit2']; null};
if (undefined(_value)) exitWith {diag_log format['A_stats_fnc_save_request_receive: Exit3']; null};
if (typeName _uid != "STRING") exitWith {diag_log format['A_stats_fnc_save_request_receive: Exit4']; null};
if (typeName _key != "STRING") exitWith {diag_log format['A_stats_fnc_save_request_receive: Exit5']; null};

_value = [_value];
	
diag_log format['A_stats_fnc_save_request_receive: calling A_invokeJava_fnc_updatePlayerVariable'];
[_uid, _key, _value] call A_invokeJava_fnc_updatePlayerVariable;
	
diag_log format['A_stats_fnc_save_request_receive: complete'];
