// A_wbl_fnc_init_s

#include "..\..\includes\macro.h"


{
	private _pv_c = _x select 4;
	_x call A_wbl_fnc_load_s;
	_pv_c addPublicVariableEventHandler {_this call A_wbl_fnc_r;};
} forEach A_wbl_var_lists;

[A_wbl_fnc_refresh_s,3] call A_frame_fnc_perFrame;