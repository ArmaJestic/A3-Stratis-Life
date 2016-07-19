// A_underwater_base_fnc_under_base_set_day

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


time_loop_exit = false;
//[true] call A_time_functions_fnc_init;
[true, true] spawn A_time_functions_fnc_loop;
