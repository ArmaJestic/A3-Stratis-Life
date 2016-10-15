// A_jip_fnc_init_pre
#include "header.h"

if (isServer) then {
	QVAR_PV_JIP_SET addPublicVariableEventHandler A_jip_fnc_pv_request;
}