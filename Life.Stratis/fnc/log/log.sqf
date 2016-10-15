// A_log_fnc_log

#include "header.h"
 

params[["_text",null,[""]]];
if (UNDEFINED(_text)) exitWith{};

if (isServer) then {
	["", [_text]] call A_log_fnc_pv_request;
}else{
	VAR_PV_REQ_BUF = [_text];
	publicVariableServer QVAR_PV_REQ_BUF;
};