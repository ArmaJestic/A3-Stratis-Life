// A_invokeJava_fnc_wipePlayerVariables

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_uid"];
	
_uid = _this select 0;
if (undefined(_uid)) exitWith{[]};
if (typeName _uid != "STRING") exitWith {[]};

private["_result"];
_result = ["wipePlayerVariables", _uid] call A_invokeJava_fnc_method;
([_result] call A_invokeJava_fnc_parseResult)
