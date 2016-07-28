// A_wbl_fnc_init_c

#include "..\..\includes\macro.h"


private["_pv_s"];

{
	_pv_s	= _x select 3;
	_pv_s addPublicVariableEventHandler {_this call A_wbl_fnc_refresh_r;};
} forEach A_wbl_var_lists;
