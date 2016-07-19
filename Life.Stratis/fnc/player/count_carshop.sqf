// A_player_fnc_count_carshop

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_distance);

if (not([_player] call A_player_fnc_human)) exitWith { 0};
if (undefined(_distance)) exitWith {0};
if (typeName _distance != "SCALAR") exitWith {0};

private["_carshops"];

private["_filter_function"];
_filter_function = {
	private["_target", "_object", "_player", "_distance"];
	ARGV(0,_target);
	ARGV(1,_object);
	
	_player = _target select 0;
	_distance = _target select 1;
	((_player distance _object) <= _distance)
};

private["_filtered"];
_filtered = [[_player, _distance], carshoparray, _filter_function] call A_player_fnc_objects_filter;
((count _filtered) > 0)
