// A_mounted_fnc_vehicle_unlocked

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {false};
not((locked _vehicle) == 2)
