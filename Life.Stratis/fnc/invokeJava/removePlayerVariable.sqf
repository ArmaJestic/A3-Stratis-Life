// A_invokeJava_fnc_removePlayerVariable

#include "header.h"


private["_uid", "_variable_name"];
	
_uid = _this select 0;
_variable_name = _this select 1;

if (UNDEFINED(_uid)) exitWith{-1};
if (UNDEFINED(_variable_name)) exitWith {-1};
if (typeName _uid != "STRING") exitWith {-1};
if (typeName _variable_name != "STRING") exitWith {-1};

private["_result"];
_result = ["removePlayerVariable", _uid, _variable_name] call A_invokeJava_fnc_method;
([_result] call A_invokeJava_fnc_parseResult)
