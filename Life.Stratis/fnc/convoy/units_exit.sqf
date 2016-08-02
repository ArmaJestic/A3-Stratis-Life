// A_convoy_fnc_units_exit

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


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
