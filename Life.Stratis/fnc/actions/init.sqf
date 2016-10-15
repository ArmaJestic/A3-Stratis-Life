// A_actions_fnc_init

#include "..\..\includes\macro.h"


if (isServer) then {
	{_x setFuelCargo 0} foreach (nearestobjects [getpos copbase1, ["Land_FuelStation_Feed_F"], 6000]);
}else{
	A_actions_var_a_running = false;
	[] spawn A_actions_fnc_actions_loop;
};