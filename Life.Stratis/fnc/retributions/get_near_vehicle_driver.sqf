// A_retributions_fnc_get_near_vehicle_driver

#include "header.h"


private["_driver", "_near_vehicles"];
_driver = null;
_near_vehicles = nearestObjects [getpos player, ["LandVehicle"], 20];
//player groupChat format["Near VEHS: %1", _near_vehicles];
{
	if ((speed _x > 10) and (!(isNull(driver _x)))) exitWith {
		_driver	= driver _x;
	};
} forEach _near_vehicles;
_driver
