// A_err_fnc_log
// call to log an error
// will always log
// use of A_err_fnc_logd will check if logging (A_PARAM_DEBUG) is enabled

#include "..\..\includes\macro.h"

private _err = params[["_str", null, [""], 1]];

if (!_err) exitwith {diag_log "A_err_fnc_log, error: params";};
if (undefined(_str)) exitwith {diag_log "A_err_fnc_log, error: undefined received";};

// TODO: check string length, A3 has a limit w/ diag_log

diag_log format["A log: %1", _str];