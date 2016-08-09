// A_err_fnc_logd
// call to log an error, bool "A_err_var_logd" will dictate whether to log or not
// calls A_err_fnc_log, which always log

#include "..\..\includes\macro.h"


// private _err = params[["_str", null, [""], 1]];
// EXT_ERR(_err, A_err_fnc_logd)

//PARAM_EXIT(A_err_fnc_logd, [["_str", null, [""], 1]])
//UNDEF_EXIT(A_err_fnc_logd, _str)

if !(params [["_str", null, [""], 1]]) exitwith {LOGE_EP(A_err_fnc_logd)};

if (A_err_var_logd) then {
	[_str] call A_err_fnc_log;
};