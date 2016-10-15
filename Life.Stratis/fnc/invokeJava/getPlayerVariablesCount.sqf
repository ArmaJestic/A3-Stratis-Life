// A_invokeJava_fnc_getPlayerVariablesCount

#include "header.h"


private _uid = _this select 0;
if (UNDEFINED(_uid)) exitWith{diag_log format['A_invokeJava_fnc_getPlayerVariablesCount %1: exit1', _this]; -1};
	
private _result = ["getPlayerVariablesCount", _uid] call A_invokeJava_fnc_method;

([_result] call A_invokeJava_fnc_parseResult)