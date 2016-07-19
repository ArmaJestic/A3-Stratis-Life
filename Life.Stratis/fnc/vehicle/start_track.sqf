// A_vehicle_fnc_start_track

#include "../../includes/macro.h"


ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};
[_vehicle, "track", true, true] call A_object_fnc_setVariable; 
