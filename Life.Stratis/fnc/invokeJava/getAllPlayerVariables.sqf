// A_invokeJava_fnc_getAllPlayerVariables

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h" 

private["_uid", "_result"];
	
_uid = _this select 0;
if (undefined(_uid)) exitWith{[]};
if (typeName _uid != "STRING") exitWith {[]};

private["_i", "_count"];
_count = [_uid] call A_invokeJava_fnc_getPlayerVariablesCount;
if (_count <= 0) exitWith {[]};
_i = 0;
_result = [];
while {_i < _count } do {
	private["_variable_name", "_variable_value"];
	_variable_name = [_uid, _i] call A_invokeJava_fnc_getPlayerVariableNameByIndex;
	_variable_value = [_uid, _variable_name] call A_invokeJava_fnc_getPlayerVariable;
	_result set[count _result, [_variable_name, _variable_value]];
	_i = _i + 1;
};
_result
