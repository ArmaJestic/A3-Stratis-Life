// A_vehicle_fnc_add

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_vehicle);		
if (not([_player] call A_player_fnc_human)) exitWith {false};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

([_player, str(_vehicle)] call A_vehicle_fnc_add_name)
