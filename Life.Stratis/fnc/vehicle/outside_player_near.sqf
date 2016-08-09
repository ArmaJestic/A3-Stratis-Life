// A_vehicle_fnc_outside_player_near

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_distance);
if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_distance)) exitWith {null};

private["_target"];
_target = cursorTarget;

if (!(_target isKindOf "LandVehicle")) exitWith {null};
if ((_player distance _target) > _distance) exitWith {null};

_target
