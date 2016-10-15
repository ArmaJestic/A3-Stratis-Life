// A_frame_fnc_perFrame
// adds code to execute everyframe
// arguments [code, delay, args]
// code, code/function to call
// delay, time in seconds between calls (<= 0 for everyframe) (optional)
// args, to pass to code (optional)
// no return

#include "header.h"


params[["_code",null,[{}]],["_delay",null,[0]],["_args",null,[]]];

if UNDEFINED(_code) exitwith {
	diag_log format["A_frame_fnc_perFrame: _code null, exit - %1", _this];
};


private _undef_a = UNDEFINED(args);
private _undef_d = UNDEFINED(_delay) || {_delay <= 0};

diag_log format['A_frame_fnc_perFrame: adding, undefa-%1(2), undefd-%3(%4)',_undef_a,_args,_undef_d,_delay];

if (_undef_a && {_undef_d}) exitwith {
	A_frame_var_arr_perFrame pushBack [_code]
};
if (_undef_a) exitwith {
	A_frame_var_arr_perFrame_delay pushBack [(diag_tickTime + _delay), _delay, _code]
};
if (_undef_d) exitwith {
	A_frame_var_arr_perFrame_arg pushBack [_args, _code]
};
A_frame_var_arr_perFrame_arg_delay pushBack [(diag_tickTime + _delay), _delay, _args, _code]