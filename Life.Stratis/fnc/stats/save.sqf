// A_stats_fnc_save

//generic method for saving variables, can be called either from server or client
//Arguments are [uid,key,value]

#include "..\..\includes\macro.h"

diag_log format['A_stats_fnc_save: %1', _this];
_this call A_stats_fnc_save_request_send;
diag_log format['A_stats_fnc_save: complete'];
