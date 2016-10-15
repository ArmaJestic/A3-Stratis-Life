// A_player_fnc_count_atm

#include "header.h"


ARGV(0,_player);
ARGV(1,_distance);

if (!([_player] call A_player_fnc_human)) exitWith { 0};
if (UNDEFINED(_distance)) exitWith {0};
if (typeName _distance != "SCALAR") exitWith {0};

private["_filter_function"];
_filter_function = {
	private["_target", "_object"];
	ARGV(0,_target);
	ARGV(1,_object);
	([_object] call A_object_fnc_atm)
};

private["_filtered"];
private["_near_objects"];
_near_objects = nearestobjects [_player, A_object_var_atm_classes, _distance];
_filtered = [[_player, _distance], _near_objects, _filter_function] call A_player_fnc_objects_filter;
((count _filtered) > 0)