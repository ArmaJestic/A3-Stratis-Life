// A_jip_fnc_register
#include "header.h"


diag_log format['A_jip_fnc_register(%1): called',_this];
if (isServer) exitwith {
	[QVAR_PV_JIP_SET,_this] call A_jip_fnc_pv_request;
};
// executes on client
missionNamespace setVariable[QVAR_PV_JIP_SET,_this];
publicVariableServer QVAR_PV_JIP_SET;