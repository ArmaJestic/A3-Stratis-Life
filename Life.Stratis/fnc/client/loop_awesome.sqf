// A_client_fnc_loop_awesome

#include "..\..\includes\macro.h"


private _group_loop_i = 0;
while {true} do {	
	if (((group player) == (group server))) then {
		[player] joinSilent grpNull;
	};
	sleep 10;
	_group_loop_i =_group_loop_i + 1;
	if (_group_loop_i >= 5000) exitwith {[] spawn A_client_fnc_loop_awesome;};
};