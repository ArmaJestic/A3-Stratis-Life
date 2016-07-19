// A_stats_fnc_get_uid

#include "..\..\includes\macro.h"

private["_object"];
_object = _this select 0;

_uid = [_object, "stats_uid"] call A_object_fnc_getVariable;
if (not(undefined(_uid))) exitWith {_uid};

if (not(_object isKindOf "Man")) exitWith {
	([_object] call A_stats_fnc_get_vehicle_uid)
};

([_object] call A_stats_fnc_get_player_uid)
