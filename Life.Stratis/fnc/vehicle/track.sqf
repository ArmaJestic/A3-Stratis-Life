// A_vehicle_fnc_track

#include "header.h"


ARGV(0,_vehicle);
if (UNDEFINED(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};

private["_track"];
_track = [_vehicle, "track"] call A_object_fnc_getVariable;
if (UNDEFINED(_track)) exitWith {null};
if (typeName _track != "BOOL") exitWith {null};
if (!(_track)) exitWith {null};
[_vehicle] call A_vehicle_fnc_save_stats;
