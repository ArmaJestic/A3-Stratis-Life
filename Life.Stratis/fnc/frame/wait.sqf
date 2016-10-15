// A_frame_fnc_wait
// execute given code w/ args after delay
// arguments [time delay, arguments, run code]
// no return

#include "header.h"


params[["_delay",0,[0]],["_args",[],[]],["_code",{},[{}]]];

A_frame_var_arr_wait pushBack [(diag_tickTime + _delay),_args,_code];