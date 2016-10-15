// A_convoy_fnc_units_exit

#include "header.h"



ARGV(0,_truck);
ARGV(1,_group);

_truck setVehicleLock "unlocked";
_group setBehaviour "COMBAT";
	
{ 
	if (alive _x) then {
		unassignVehicle _x;
		doGetOut _x;
		_x doWatch getPos _truck;
	};
} foreach (units _group);
