// A_mounted_fnc_vehicle_unlocked

#include "header.h"


ARGV(0,_vehicle);
if (UNDEFINED(_vehicle)) exitWith {false};
!((locked _vehicle) == 2)
