// A_vehicle_fnc_owner

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_vehicle);
if (not([_player] call A_player_fnc_human)) exitWith{false};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

private["_vehicles_name_list"];
_vehicles_name_list = [player] call A_vehicle_fnc_list;
(str(_vehicle) in _vehicles_name_list)
