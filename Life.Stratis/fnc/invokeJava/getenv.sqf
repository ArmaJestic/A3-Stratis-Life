// A_invokeJava_fnc_getenv

#include "header.h"

private["_key"];
	
_key = _this select 0;
if (UNDEFINED(_key)) exitWith{[]};
if (typeName _key != "STRING") exitWith {[]};

private["_result"];
_result = ["getenv", _key] call A_invokeJava_fnc_method;
if (UNDEFINED(_result)) exitWith { "" };
if (typeName _result != "STRING") exitWith {""};
_result
