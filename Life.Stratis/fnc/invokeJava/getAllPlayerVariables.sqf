// A_invokeJava_fnc_getAllPlayerVariables

#include "header.h"


diag_log format['A_invokeJava_fnc_getAllPlayerVariables %1: start', _this];

private["_uid", "_result"];
_uid = _this select 0;
if (UNDEFINED(_uid)) exitWith{diag_log format['A_invokeJava_fnc_getAllPlayerVariables %1: exit1', _this]; []};
if (typeName _uid != "STRING") exitWith {diag_log format['A_invokeJava_fnc_getAllPlayerVariables %1: exit2', _this]; []};

private["_i", "_count"];
_count = [_uid] call A_invokeJava_fnc_getPlayerVariablesCount;
if (UNDEFINED(_count)) exitWith {diag_log format['A_invokeJava_fnc_getAllPlayerVariables %1: exit3', _this]; []};
if (_count <= 0) exitWith {diag_log format['A_invokeJava_fnc_getAllPlayerVariables %1: exit4', _this]; []};

_i = 0;
_result = [];
while {_i < _count} do {
	private["_variable_name", "_variable_value"];
	_variable_name = [_uid, _i] call A_invokeJava_fnc_getPlayerVariableNameByIndex;
	_variable_value = [_uid, _variable_name] call A_invokeJava_fnc_getPlayerVariable;
	_result set[count _result, [_variable_name, _variable_value]];
	_i = _i + 1;
};

diag_log format['A_invokeJava_fnc_getAllPlayerVariables %1: result,%2, end', _this, _result];

_result