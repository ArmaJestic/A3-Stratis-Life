// A_vehicle_fnc_view_trunk_available

#include "header.h"


ARGV(0,_player);
ARGV(1,_vehicle);
if (!([_player] call A_player_fnc_exists)) exitWith {false};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};
if (!([_player] call A_player_fnc_blufor)) exitWith {false};
if (!(locked _vehicle < 2)) exitWith {false};
if (!(_vehicle isKindOf "Air" || { _vehicle isKindOf "Ship" || { _vehicle isKindOf "LandVehicle" }})) exitWith {false};
if (!([_vehicle] call A_vehicle_fnc_player_owned)) exitWith {false};
if ([_player, _vehicle] call A_vehicle_fnc_owner) exitWIth {false};

true
