// A_vehicle_fnc_player_owned

#include "header.h"


ARGV(0,_vehicle);
if (UNDEFINED(_vehicle)) exitWith {false};

private["_isPlayerVehicle"];
_isPlayerVehicle = [_vehicle, "isPlayerVehicle"] call A_object_fnc_getVariable;
if (UNDEFINED(_isPlayerVehicle)) exitWith { false };
if (typeName _isPlayerVehicle != "BOOL") exitWith { false };
_isPlayerVehicle
