// A_loading_fnc_update_progress
// sets progress bar on loading screen

#include "..\..\includes\macro.h"


PARAM_EXIT(A_loading_fnc_update_progress, [["_progress", null, [0], 1]])
UNDEF_EXIT(A_loading_fnc_update_progress, _progress)

if ((_progress) < 0 || (_progress > 1)) exitWith {
	LOGE(A_loading_fnc_update_progress, invalid value)
};
format["A_loading_fnc_update_progress: %1", _progress] call A_err_fnc_logd;
	
A_loading_var_progress = _progress;
progressLoadingScreen _progress;