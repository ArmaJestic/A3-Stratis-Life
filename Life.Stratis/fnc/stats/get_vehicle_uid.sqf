// A_stats_fnc_get_vehicle_uid

#include "..\..\includes\macro.h"

private["_object"];
	
_object = _this select 0;
if (undefined(_object)) exitWith {""};
	
private["_uid"];
_uid = vehicleVarName _object;
if (undefined(_uid)) exitWith {""};
if (typeName _uid != "STRING") exitWith {null};

[_object, "stats_uid", _uid, true] call A_object_fnc_setVariable;
(_uid)
