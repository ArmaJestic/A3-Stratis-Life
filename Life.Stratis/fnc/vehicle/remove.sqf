// A_vehicle_fnc_remove

#include "header.h"


ARGV(0,_player);
ARGV(1,_vehicle);
if (!([_player] call A_player_fnc_human)) exitWith {false};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

([_player, str(_vehicle)] call A_vehicle_fnc_remove_name)
