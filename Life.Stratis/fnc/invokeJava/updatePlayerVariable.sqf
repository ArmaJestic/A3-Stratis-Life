// A_invokeJava_fnc_updatePlayerVariable

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h" 

diag_log format['A_invokeJava_fnc_updatePlayerVariable: %1', _this];

private["_uid", "_variable_name", "_variable_value"];

_uid = _this select 0;
_variable_name = _this select 1;
_variable_value = _this select 2;
	
diag_log format['A_invokeJava_fnc_updatePlayerVariable: exit checks'];

if (undefined(_uid)) exitWith {diag_log format['A_invokeJava_fnc_updatePlayerVariable: exit1']; null};
if (undefined(_variable_name)) exitWith {diag_log format['A_invokeJava_fnc_updatePlayerVariable: exit2']; null};
if (undefined(_variable_value)) exitWith {diag_log format['A_invokeJava_fnc_updatePlayerVariable: exit3']; null};

if (typeName _uid != "STRING") exitWith {diag_log format['A_invokeJava_fnc_updatePlayerVariable: exit4']; null};
if (typeName _variable_name != "STRING") exitWith {diag_log format['A_invokeJava_fnc_updatePlayerVariable: exit5']; null};

diag_log format['A_invokeJava_fnc_updatePlayerVariable: exits passed'];

_variable_value = if (typeName _variable_value != "STRING") then {format["%1", _variable_value]} else {_variable_value};

private["_result"];

diag_log format['A_invokeJava_fnc_updatePlayerVariable: calling A_invokeJava_fnc_method'];
_result = ["updatePlayerVariable", _uid, _variable_name, _variable_value] call A_invokeJava_fnc_method;

diag_log format['A_invokeJava_fnc_updatePlayerVariable: returning call to A_invokeJava_fnc_parseResult'];
([_result] call A_invokeJava_fnc_parseResult)
