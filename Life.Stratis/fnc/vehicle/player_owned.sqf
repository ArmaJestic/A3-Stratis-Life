// A_vehicle_fnc_player_owned

#include "../../includes/macro.h"


ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {false};

private["_isPlayerVehicle"];
_isPlayerVehicle = [_vehicle, "isPlayerVehicle"] call A_object_fnc_getVariable;
if (undefined(_isPlayerVehicle)) exitWith { false };
if (typeName _isPlayerVehicle != "BOOL") exitWith { false };
_isPlayerVehicle
