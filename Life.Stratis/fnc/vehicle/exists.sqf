// A_vehicle_fnc_exists

#include "header.h"


ARGV(0,_vehicle);
if (UNDEFINED(_vehicle)) exitWith {false};
if (typeName _vehicle != "OBJECT") exitWith {false};
if (isNull _vehicle) exitWith {false};
true
