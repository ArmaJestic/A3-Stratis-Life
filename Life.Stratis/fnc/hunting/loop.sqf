// A_hunting_fnc_loop

#include "..\..\includes\macro.h"


//player groupChat format["A_hunting_fnc_loop %1", _this];
if (!(isServer)) exitWith {null};

private["_hunting_loop_i", "_sleep", "_timer"];
_hunting_loop_i = 0;
_sleep = 1;

while {_hunting_loop_i < 5000 } do {
	[_hunting_loop_i] call A_hunting_fnc_loop_iteration;
	_hunting_loop_i = _hunting_loop_i + 1; 
	sleep _sleep;
};

[] spawn A_hunting_fnc_loop;
