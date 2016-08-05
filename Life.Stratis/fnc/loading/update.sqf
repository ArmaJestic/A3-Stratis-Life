// A_loading_fnc_update
// updates title and progress
/*
	for calling, 
		0	title, if blank - will only update progress bar (a space can be used for a blank title)
		1	progress, percent (0-1) to set update bar to
*/

#include "..\..\includes\macro.h"

if (isServer) exitwith {
	[] call A_loading_fnc_stop;
	LOGE(A_loading_fnc_update, call on server)
};

if (!A_loading_var_active) exitwith {
	LOGE(A_loading_fnc_update, loading not active)
};


PARAM_EXIT(A_loading_fnc_update, [["_title", null, [""]], ["_progress", null, [0]]])
UNDEF_EXIT(A_loading_fnc_update, _title)
UNDEF_EXIT(A_loading_fnc_update, _progress)

if !(_title isEqualTo "") then {
	[_title] call A_loading_fnc_update_title;
};
[_progress] call A_loading_fnc_update_progress;