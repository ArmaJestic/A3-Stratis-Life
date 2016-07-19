// A_invokeJava_fnc_logThis

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_text"];
_text = _this select 0;
if (undefined(_text)) exitWith{[]};
if (typeName _text != "STRING") exitWith {[]};

logThis_request_buffer = [_text];
if (isServer) then {
	["", logThis_request_buffer] call A_invokeJava_fnc_logThis_request_receive;
} else {
	publicVariableServer "logThis_request_buffer";
};
