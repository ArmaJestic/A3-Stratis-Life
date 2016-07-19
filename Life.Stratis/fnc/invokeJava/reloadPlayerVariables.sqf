// A_invokeJava_fnc_reloadPlayerVariables

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_uid"];
	
_uid = _this select 0;
if (undefined(_uid)) exitWith{[]};
if (typeName _uid != "STRING") exitWith {[]};

private["_result"];
_result = ["reloadPlayerVariables", _uid] call A_invokeJava_fnc_method;
([_result] call A_invokeJava_fnc_parseResult)
