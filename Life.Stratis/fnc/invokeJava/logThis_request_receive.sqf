// A_invokeJava_fnc_logThis_request_receive

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h" 

diag_log format["A_invokeJava_fnc_logThis_request_receive %1", _this];
private["_variable", "_request"];
_variable = _this select 0;
_request = _this select 1;

if (undefined(_request)) exitWith {null};
if (typeName _request != "ARRAY") exitWith {null};

private["_text"];
_text = _request select 0;
if (undefined(_text)) exitWith {null};
if (typeName _text != "STRING") exitWith {null};

private["_result"];
_result = ["logThis", _text] call A_invokeJava_fnc_method;
if (undefined(_result)) exitWith { "" };
if (typeName _result != "STRING") exitWith {""};
_result
