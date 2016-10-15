// A_log_fnc_pv_request

#include "header.h"


params["_variable", ["_request",null,[[]]]];
if UNDEFINED(_request) exitWith {};

_request params[["_text",null,[""]]];
if UNDEFINED(_text) exitWith {};

private _result = ["logThis", _text] call A_invokeJava_fnc_method;
if UNDEFINED(_result) exitWith { "" };
if (typeName _result != "STRING") exitWith {""};
_result