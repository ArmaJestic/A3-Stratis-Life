// A_invokeJava_fnc_getPlayerVariable

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_uid", "_variable_name"];
	
_uid = _this select 0;
_variable_name = _this select 1;

if (undefined(_uid)) exitWith{""};
if (undefined(_variable_name)) exitWith {""};
if (typeName _uid != "STRING") exitWith {""};
if (typeName _variable_name != "STRING") exitWith {""};

private["_result"];
_result = ["getPlayerVariable", _uid, _variable_name] call A_invokeJava_fnc_method;
_result
