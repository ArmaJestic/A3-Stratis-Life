// A_vehicle_fnc_pull_player_available

#include "header.h"


ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_target);

if (!([_player] call A_player_fnc_exists)) exitWith {false};
if (!([_target] call A_player_fnc_exists)) exitWith {false};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

if (cursorTarget != _vehicle) exitWith {false};
if (!(locked _vehicle < 2)) exitWith {false};
if (!([_target, _vehicle] call A_mounted_fnc_player_inside)) exitWith {false};

true
