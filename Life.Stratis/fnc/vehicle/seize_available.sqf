// A_vehicle_fnc_seize_available

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_vehicle);

if (not([_player] call A_player_fnc_human)) exitWith {false};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

if (_vehicle isKindOf "Air") exitWith {false};
if (not(alive _vehicle)) exitWith {false};
if ([_vehicle] call A_vehicle_fnc_in_safe_zone) exitWith {false};

true
