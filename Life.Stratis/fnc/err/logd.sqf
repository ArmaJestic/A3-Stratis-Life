// A_err_fnc_logd
// call to log an error, parameter A_PARAM_LOGD dictates whether to log or not

#include "header.h"


#ifdef A_PARAM_LOGD
	params [["_str", null, [""]]];
	diag_log format['ALOG: %1', _str];
#endif