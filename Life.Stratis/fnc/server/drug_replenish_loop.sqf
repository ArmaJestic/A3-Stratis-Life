// A_server_fnc_drug_replenish_loop

#include "..\..\includes\macro.h"

private ["_replenish_loop_i"];
_replenish_loop_i = 0; 

while {_replenish_loop_i < 5000} do {
	[] call drug_replenish;
	_replenish_loop_i = _replenish_loop_i + 1;
	sleep A_main_var_drugstockinc;
};

[] spawn A_server_fnc_drug_replenish_loop;
