// A_err_fnc_end
// used to end the mission, for failure in loading generally
// receives a string for a message to display

#include "..\..\includes\macro.h"

// may be bad to verify the arguments to the end call
// todo: make useless after a certain time period, abusable

// PARAM_EXIT(A_err_fnc_end, [["_str", null, [""], 1]])
// UNDEF_EXIT(A_err_fnc_end, _str)

if !(params [["_str", null, [""], 1]]) exitwith {LOGE_EP(A_err_fnc_end)};

if (missionNamespace getVariable[A_loading_var_active, false]) then {
	LOGE(A_err_fnc_end, loading active at call)
	[] call A_loading_fnc_stop;
};

format["A_err_fnc_end: %1", _str] call A_err_fnc_log;
endMission "LOSER";