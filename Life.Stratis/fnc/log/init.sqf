// A_log_fnc_init_pre
// called from preinit (A_init_fnc_pre)

#include "header.h"
 

if (isServer) then {
	QVAR_PV_REQ_BUF addPublicVariableEventHandler A_log_fnc_pv_request;
};