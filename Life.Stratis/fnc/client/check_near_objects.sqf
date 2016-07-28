// A_client_fnc_check_near_objects

#include "..\..\includes\macro.h"


private["_player"];
_player = player;
{
	_player reveal _x;
} forEach(nearestObjects [player, ["AllVehicles", "Static"], 3]);	
