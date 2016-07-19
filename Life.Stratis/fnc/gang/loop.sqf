// A_gang_fnc_loop

#include "..\..\includes\macro.h"


private ["_gangs_loop_i"];
_gangs_loop_i = 0; 

while {_gangs_loop_i < 5000} do {
	[] call A_gang_fnc_loop_iteration;
	_gangs_loop_i = _gangs_loop_i + 1;
};

[] spawn A_gang_fnc_loop;
