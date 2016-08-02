// A_actions_fnc_actions_loop

#include "..\..\includes\macro.h"


{_x setFuelCargo 0} foreach (nearestobjects [getpos copbase1, ["Land_FuelStation_Feed_F"], 6000]);
_count = count A_bank_var_gasstationarray;
while {true} do {
	[] call A_actions_fnc_check_actions;
	sleep 3;
};
