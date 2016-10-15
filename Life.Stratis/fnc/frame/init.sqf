// A_frame_fnc_init

#include "header.h"


// setup arrays

// execute every frame
// format [code]
A_frame_var_arr_perFrame = [];

// execute every frame, w/ arguments
// format [args, code]
A_frame_var_arr_perFrame_arg = [];

// execute every time period
// format [delay, code]
A_frame_var_arr_perFrame_delay = [];

// execute every frame, w/ delay & arguments
// format [delay, args, code]
A_frame_var_arr_perFrame_arg_delay = [];

// execute while condition is true, remove once false
// format[delay, args, condition code, execute code]
A_frame_var_arr_while = [];

// execute/remove after time
// format[delay, args, execute code]
A_frame_var_arr_wait = [];

// execute/remove once condition is true
// format[args, condition code, execute code]
A_frame_var_arr_waitUntil = [];


// set onEachFrame
onEachFrame A_frame_fnc_onEachFrame;