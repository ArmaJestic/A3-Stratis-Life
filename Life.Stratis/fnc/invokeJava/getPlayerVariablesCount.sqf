// A_invokeJava_fnc_getPlayerVariableCount

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_uid"];
	
_uid = _this select 0;
if (undefined(_uid)) exitWith{-1};
	
private["_result"];
_result = ["getPlayerVariablesCount", _uid] call A_invokeJava_fnc_method;
([_result] call A_invokeJava_fnc_parseResult)
