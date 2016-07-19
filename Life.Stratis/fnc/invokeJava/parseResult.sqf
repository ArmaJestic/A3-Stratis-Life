// A_invokeJava_fnc_parseResult

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h" 

diag_log format['A_invokeJava_fnc_parseResult: %1', _this];

private["_result"];
_result = _this select 0;
if (undefined(_result)) exitWith {diag_log format['A_invokeJava_fnc_parseResult: exit1']; -1};
if (typeName "_result" != "STRING") exitWith {diag_log format['A_invokeJava_fnc_parseResult: exit2']; -1};

_result = parseNumber(_result);
if (undefined(_result)) exitWith {diag_log format['A_invokeJava_fnc_parseResult: exit3']; -1};
if (typeName _result != "SCALAR") exitWith {diag_log format['A_invokeJava_fnc_parseResult: exit4']; -1};

diag_log format['A_invokeJava_fnc_parseResult: complete, returning result'];
_result
