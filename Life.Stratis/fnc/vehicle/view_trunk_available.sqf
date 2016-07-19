// A_vehicle_fnc_view_trunk_available

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_vehicle);
if (not([_player] call A_player_fnc_exists)) exitWith {false};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};
if (not([_player] call A_player_fnc_blufor)) exitWith {false};
if (not(locked _vehicle < 2)) exitWith {false};
if (not(_vehicle isKindOf "Air" || { _vehicle isKindOf "Ship" || { _vehicle isKindOf "LandVehicle" }})) exitWith {false};
if (not([_vehicle] call A_vehicle_fnc_player_owned)) exitWith {false};
if ([_player, _vehicle] call A_vehicle_fnc_owner) exitWIth {false};

true
