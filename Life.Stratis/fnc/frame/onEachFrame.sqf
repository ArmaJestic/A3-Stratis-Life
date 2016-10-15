// A_frame_fnc_onEachFrame
// function for frame

#include "header.h"


// execute every frame
// format [code]
// A_frame_var_arr_perFrame
{call (_x select 0); false} count A_frame_var_arr_perFrame;

// execute every frame, w/ arguments
// format [args, code]
// A_frame_var_arr_perFrame_arg
{(_x select 0) call (_x select 1); false} count A_frame_var_arr_perFrame_arg;

// execute every frame w/ delay
// format [time, delay, code]
// A_frame_var_arr_perFrame_delay
{
	if (diag_tickTime >= (_x select 0)) then {
		call (_x select 2);
		_x set[0, (diag_tickTime + (_x select 1))];
	};
} count A_frame_var_arr_perFrame_delay;

// execute every frame, w/ delay & arguments
// format [time, delay, args, code]
// A_frame_var_arr_perFrame_arg_delay
{
	if (diag_tickTime >= (_x select 0)) then {
		(_x select 2) call (_x select 3);
		_x set[0, (diag_tickTime + (_x select 1))];
	};
} count A_frame_var_arr_perFrame_arg_delay;


// used for arrays that may need removal
private _del = false;

// execute while condition is true, remove once false
// format[args, condition code, execute code, exit code]
// A_frame_var_arr_while
{
	if (diag_tickTime >= (_x select 0)) then {
		if ((_x select 2) call (_x select 3)) then {
			(_x select 2) call (_x select 4);
			_x set[0,(diag_tickTime + (_x select 1))];
		}else{
			(_x select 2) call (_x select 5);
			_del = true;
			A_frame_var_arr_while set[_forEachIndex, null];
		};
	};
} forEach A_frame_var_arr_while;
if (_del) then {
	_del = false;
	A_frame_var_arr_while = A_frame_var_arr_while - [null];
};


// execute/remove after time
// format[time, args, execute code]
// A_frame_var_arr_wait
{
	if (diag_tickTime >= (_x select 0)) then {
		(_x select 1) call (_x select 2);
		
		_del = true;
		A_frame_var_arr_wait set[_forEachIndex, null];
	};
} forEach A_frame_var_arr_wait;
if (_del) then {
	_del = false;
	A_frame_var_arr_wait = A_frame_var_arr_wait - [null];
};


// execute/remove once condition is true
// format[args, condition code, execute code]
// A_frame_var_arr_waitUntil
{
	if ((_x select 0) call (_x select 1)) then {
		(_x select 0) call (_x select 2);
		
		_del = true;
		A_frame_var_arr_waitUntil set[_forEachIndex, null];
	};
} forEach A_frame_var_arr_waitUntil;
if (_del) then {
	A_frame_var_arr_waitUntil = A_frame_var_arr_waitUntil - [null];
};

