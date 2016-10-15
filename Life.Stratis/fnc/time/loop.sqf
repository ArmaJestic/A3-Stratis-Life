// A_time_fnc_loop

#include "header.h"


params[["_init",false,[true]]];
if (_init) then {call A_time_fnc_start;};

// wait 1 second to make sure the previous loop is gone
A_time_var_loop_exit = true;
[1,[],{
	A_time_var_loop_exit = false;
	[1,[],{!A_time_var_loop_exit},A_time_fnc_update] call A_frame_fnc_perFrame;
}] call A_frame_fnc_wait;

