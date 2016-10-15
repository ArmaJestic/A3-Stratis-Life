// A_invokeJava_fnc_setLocation

#include "header.h"


private["_location"];
	
_location = _this select 0;
if (UNDEFINED(_location)) exitWith{[]};
if (typeName _location != "STRING") exitWith {[]};

private["_result"];
_result = ["setLocation", _location] call A_invokeJava_fnc_method;
if (UNDEFINED(_result)) exitWith { "" };
if (typeName _result != "STRING") exitWith {""};
_result
