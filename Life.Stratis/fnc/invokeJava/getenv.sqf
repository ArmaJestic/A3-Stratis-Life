// A_invokeJava_fnc_getenv

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h" 

private["_key"];
	
_key = _this select 0;
if (undefined(_key)) exitWith{[]};
if (typeName _key != "STRING") exitWith {[]};

private["_result"];
_result = ["getenv", _key] call A_invokeJava_fnc_method;
if (undefined(_result)) exitWith { "" };
if (typeName _result != "STRING") exitWith {""};
_result
