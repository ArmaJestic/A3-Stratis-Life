// A_vehicle_fnc_stop_track

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);

if (undefined(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};
[_vehicle] call A_vehicle_fnc_save_stats;
[_vehicle] call A_vehicle_fnc_unload_stats;
[_vehicle, "track", false] call A_object_fnc_setVariable;
