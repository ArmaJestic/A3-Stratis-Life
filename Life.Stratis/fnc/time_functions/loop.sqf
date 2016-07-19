// A_time_functions_fnc_loop

#include "..\..\includes\macro.h"


ARGV(0,_init);
ARGVD(1,_quiet,false);
if (_init) then {[_quiet] call A_time_functions_fnc_init;};

private ["_i"];
_i = 0;
while {true} do {
	[] call A_time_functions_fnc_update;

	sleep 1;
	_i = _i + 1;
	if (time_loop_exit) exitWith {null};
	if (_i > 7200) exitWith { [false] spawn A_time_functions_fnc_loop; };
};
