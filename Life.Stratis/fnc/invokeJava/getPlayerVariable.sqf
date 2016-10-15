// A_invokeJava_fnc_getPlayerVariable

#include "header.h"

private["_uid", "_variable_name"];
	
_uid = _this select 0;
_variable_name = _this select 1;

if (UNDEFINED(_uid)) exitWith{""};
if (UNDEFINED(_variable_name)) exitWith {""};
if (typeName _uid != "STRING") exitWith {""};
if (typeName _variable_name != "STRING") exitWith {""};

private["_result"];
_result = ["getPlayerVariable", _uid, _variable_name] call A_invokeJava_fnc_method;
_result
