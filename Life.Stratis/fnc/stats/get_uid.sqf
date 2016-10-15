// A_stats_fnc_get_uid

#include "header.h"


params["_object"];

private _uid = [_object, VAR_STATS_UID] call A_object_fnc_getVariable;
if (DEFINED(_uid)) exitWith {_uid};

if (!(_object isKindOf "Man")) exitWith {
	([_object] call A_stats_fnc_get_vehicle_uid)
};

([_object] call A_stats_fnc_get_player_uid)