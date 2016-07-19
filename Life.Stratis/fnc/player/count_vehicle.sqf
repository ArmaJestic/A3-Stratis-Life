// A_player_fnc_count_vehicle

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_distance);
ARGV(2,_locked);
ARGV(3,_mobile);

if (not([_player] call A_player_fnc_human)) exitWith {0};
if (undefined(_distance)) exitWith {0};
if (undefined(_locked)) exitWith {0};
if (undefined(_mobile)) exitWith {0};
if (typeName _distance != "SCALAR") exitWith {0};
if (typeName _locked != "BOOL") exitWith {0};
if (typeName _mobile != "BOOL") exitWith {0};

private["_near_vehicles"];
//_near_vehicles =  nearestObjects  [_player, ["Car", "Motorcycle", "Tank", "Helicopter", "Plane"], _distance];

_near_vehicles = nearestObjects [_player, ["Car","Tank", "Motorcycle", "Helicopter", "Plane"], _distance];


private["_filter_function"];
_filter_function = {
	private["_target", "_object", "_player", "_locked", "_mobile"];
	ARGV(0,_target);
	ARGV(1,_object);
	
	_player = _target select 0;
	_locked = _target select 1;
	_mobile = _target select 2;
	
	private["_canMove", "_isLocked"];
	_canMove = canMove _object;
	_isLocked = (locked _object) == 2;
	
	_mobile = if (_mobile) then {_canMove} else {not(_canMove)};
	_locked = if (_locked) then {_isLocked} else { not(_isLocked)};
	(_mobile && _locked)
};

private["_filtered"];
_filtered = [[_player, _locked, _mobile], _near_vehicles, _filter_function] call A_player_fnc_objects_filter;
((count _filtered) > 0)
