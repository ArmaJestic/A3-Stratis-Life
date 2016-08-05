// A_err_fnc_log
// call to log an error
// will always log
// use of A_err_fnc_logd will check if logging (A_PARAM_DEBUG) is enabled

#include "..\..\includes\macro.h"


// wont use "PARAM_EXIT" macro because it comes back to here
if (!(params[["_str", null, [""], 1]])) exitwith {diag_log "A_err_fnc_log, error: params";};
if (undefined(_str)) exitwith {diag_log "A_err_fnc_log, error: undefined received";};



// TODO: check string length, A3 has a limit w/ diag_log

diag_log format["A_err_fnc_log: %1", _str];