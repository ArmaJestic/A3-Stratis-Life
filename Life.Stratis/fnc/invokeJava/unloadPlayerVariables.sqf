// A_invokeJava_fnc_unloadPlayerVariables

#include "header.h"


private["_uid"];
	
_uid = _this select 0;
if (UNDEFINED(_uid)) exitWith{[]};
if (typeName _uid != "STRING") exitWith {[]};

private["_result"];
_result = ["unloadPlayerVariables", _uid] call A_invokeJava_fnc_method;
([_result] call A_invokeJava_fnc_parseResult)
