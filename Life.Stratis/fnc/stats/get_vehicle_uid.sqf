// A_stats_fnc_get_vehicle_uid

#include "header.h"


params["_object"];

if (UNDEFINED(_object)) exitWith {""};

private _uid = vehicleVarName _object;
if (UNDEFINED(_uid)) exitWith {""};
if (typeName _uid != "STRING") exitWith {null};

[_object, VAR_STATS_UID, _uid, true] call A_object_fnc_setVariable;
(_uid)