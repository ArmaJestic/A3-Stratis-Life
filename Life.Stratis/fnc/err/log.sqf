// A_err_fnc_log
// call to log an error
// will always log
// use of A_err_fnc_logd will check if logging (A_PARAM_DEBUG) is enabled

#include "header.h"


params [["_str", null, [""]]];

// TODO: check string length, A3 has a limit w/ diag_log

diag_log format['ALOG: %1', _str];