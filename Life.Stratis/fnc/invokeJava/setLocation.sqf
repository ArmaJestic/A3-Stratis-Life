// A_invokeJava_fnc_setLocation

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_location"];
	
_location = _this select 0;
if (undefined(_location)) exitWith{[]};
if (typeName _location != "STRING") exitWith {[]};

private["_result"];
_result = ["setLocation", _location] call A_invokeJava_fnc_method;
if (undefined(_result)) exitWith { "" };
if (typeName _result != "STRING") exitWith {""};
_result
