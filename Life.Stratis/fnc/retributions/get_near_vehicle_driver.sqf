// A_retributions_fnc_get_near_vehicle_driver

#include "..\..\includes\macro.h"


private["_driver", "_near_vehicles"];
_driver = null;
_near_vehicles = nearestObjects [getpos player, ["LandVehicle"], 20];
//player groupChat format["Near VEHS: %1", _near_vehicles];
{
	if ((speed _x > 10) and (not(isNull(driver _x)))) exitWith {
		_driver	= driver _x;
	};
} forEach _near_vehicles;
_driver
