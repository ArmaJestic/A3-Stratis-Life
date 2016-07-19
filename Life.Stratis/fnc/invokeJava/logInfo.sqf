// A_invokeJava_fnc_logInfo

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_text"];
_text = _this select 0;
if (undefined(_text)) exitWith{[]};
if (typeName _text != "STRING") exitWith {[]};

_text = "INFO: " + _text + toString[13,10];
[_text] call A_invokeJava_fnc_logThis;
