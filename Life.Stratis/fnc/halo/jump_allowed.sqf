// A_halo_fnc_jump_allowed

#include "../../includes/macro.h"


ARGV(0,_vehicle);
_is_in_vehicle = (_vehicle == vehicle(player));
if (!_is_in_vehicle) exitWith { false };

_is_air_vehicle = (_vehicle isKindOf "Air");
if (!_is_air_vehicle) exitWith { false };

_vehicle_position = getPosATL _vehicle;
_is_above_100m = ((_vehicle_position select 2) > 100);
if (!_is_above_100m) exitWith { false };
if ((locked _vehicle) == 2) exitwith { false };

true
