// A_vehicle_fnc_exists

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {false};
if (typeName _vehicle != "OBJECT") exitWith {false};
if (isNull _vehicle) exitWith {false};
true
