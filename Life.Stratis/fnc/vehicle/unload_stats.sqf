// A_vehicle_fnc_unload_stats

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};

private["_stats_uid"];
_stats_uid = [_vehicle] call A_stats_fnc_get_uid;
if (_stats_uid == "") exitWith {null};

[_stats_uid] call A_invokeJava_fnc_unloadPlayerVariables;
