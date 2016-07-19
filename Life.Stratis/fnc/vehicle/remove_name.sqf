// A_vehicle_fnc_remove_name

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_vehicle_name);

if (not([_player] call A_player_fnc_human)) exitWith {false};
if(undefined(_vehicle_name)) exitWith {false};
if (typeName _vehicle_name != "STRING") exitWith {false};


private["_vehicles_name_list"];
_vehicles_name_list = [_player, "vehicles_name_list"] call A_player_fnc_get_array;

if (not(_vehicle_name in _vehicles_name_list)) exitWith {false};

_vehicles_name_list = _vehicles_name_list - [_vehicle_name];
[_player, "vehicles_name_list", _vehicles_name_list, false] call A_player_fnc_set_array_checked;
true
