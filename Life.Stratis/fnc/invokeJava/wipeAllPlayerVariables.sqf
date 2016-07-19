// A_invokeJava_fnc_wipeAllPlayerVariables

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

private["_result"];
_result = ["wipeAllPlayerVariables"] call A_invokeJava_fnc_method;
([_result] call A_invokeJava_fnc_parseResult)
